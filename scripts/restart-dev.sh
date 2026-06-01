#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PID_DIR="$ROOT/.pids"
mkdir -p "$PID_DIR"

stop_port() {
  local port=$1
  local pids
  pids=$(lsof -ti "tcp:$port" 2>/dev/null || true)
  [ -n "$pids" ] && kill -9 $pids 2>/dev/null || true
}

echo "[stop] stopping services..."
for port in 5180 8001 6379 5432; do stop_port "$port"; done
pgrep -f 'redis-memory-server|embedded-postgres|main.py run' | xargs kill -9 2>/dev/null || true
sleep 2

echo "[db] starting PostgreSQL + Redis..."
nohup node "$ROOT/scripts/start-local-db-skip-init.mjs" > "$PID_DIR/db.log" 2>&1 &
echo $! > "$PID_DIR/db.pid"

for i in $(seq 1 90); do
  if "$ROOT/backend/.venv/bin/python" -c "import asyncio; from redis.asyncio import Redis; asyncio.run(Redis(host='127.0.0.1',port=6379,password='FastapiAdmin@2026',db=1).ping())" 2>/dev/null \
    && nc -z localhost 5432 2>/dev/null; then
    echo "[db] ready"
    break
  fi
  sleep 1
done

echo "[backend] starting..."
cd "$ROOT/backend"
export ENVIRONMENT=dev PYTHONUTF8=1 PYTHONIOENCODING=utf-8
nohup .venv/bin/python main.py run --env=dev > "$PID_DIR/backend.log" 2>&1 &
echo $! > "$PID_DIR/backend.pid"

for i in $(seq 1 45); do
  if nc -z localhost 8001 2>/dev/null; then
    echo "[backend] ready"
    break
  fi
  sleep 1
done

echo "[frontend] starting..."
cd "$ROOT/frontend"
nohup pnpm run dev > "$PID_DIR/frontend.log" 2>&1 &
echo $! > "$PID_DIR/frontend.pid"

for i in $(seq 1 30); do
  if nc -z localhost 5180 2>/dev/null; then
    echo "[frontend] ready"
    break
  fi
  sleep 1
done

echo ""
echo "pg:      $(nc -z localhost 5432 && echo up || echo down)"
echo "redis:   $(nc -z localhost 6379 && echo up || echo down)"
echo "backend: $(nc -z localhost 8001 && echo up || echo down)"
echo "frontend:$(nc -z localhost 5180 && echo up || echo down)"
echo ""
echo "前端: http://localhost:5180/web"
echo "API:  http://localhost:8001/api/v1/docs"
