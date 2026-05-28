#!/bin/bash
# ============================================================
# FastApiAdmin 一键启动 — 本地开发模式
# 用法: bash dev.sh            # 启动全部
#       bash dev.sh stop       # 停止全部
#       bash dev.sh status     # 查看状态
# ============================================================
# 自动检测项目根目录,适配 Git Bash / WSL2 / Linux
# 不依赖硬编码路径,放到哪都能跑
# ============================================================

set -o pipefail

# ── 颜色 ──
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

# ── uv 数据目录指向 D 盘（跨盘拷贝模式） ──
export UV_STATE_DIR="/d/Program Files/uv"
export UV_LINK_MODE="copy"

# ── 自动定位项目根目录 (脚本所在目录) ──
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKEND_DIR="$SCRIPT_DIR/backend"
FRONTEND_DIR="$SCRIPT_DIR/frontend"
PID_DIR="$SCRIPT_DIR/.pids"

mkdir -p "$PID_DIR"

# ── 端口配置 ──
BACKEND_PORT=8001
FRONTEND_PORT=5180
DB_PORT=5432
REDIS_PORT=6379

# ══════════════════════════════════════════════════════════
# 工具函数
# ══════════════════════════════════════════════════════════

log_info()  { echo -e "${GREEN}[INFO]${NC}  $1"; }
log_warn()  { echo -e "${YELLOW}[WARN]${NC}  $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_step()  { echo -e "${CYAN}[>>]${NC}   $1"; }

# 检查端口是否被占用 (Python 兜底,兼容所有环境)
port_in_use() {
    local port=$1
    python -c "import socket; s=socket.socket(); s.settimeout(1); r=s.connect_ex(('127.0.0.1',${port})); s.close(); exit(0 if r==0 else 1)" 2>/dev/null
}

# 安全终止进程
kill_pid_file() {
    local name=$1
    local pid_file="$PID_DIR/$name.pid"
    if [ -f "$pid_file" ]; then
        local pid=$(cat "$pid_file")
        if kill -0 "$pid" 2>/dev/null; then
            kill "$pid" 2>/dev/null
            sleep 1
            if kill -0 "$pid" 2>/dev/null; then
                kill -9 "$pid" 2>/dev/null
            fi
            log_info "已停止 $name (PID: $pid)"
        fi
        rm -f "$pid_file"
    fi
}

# HTTP 健康检查
health_check() {
    local url=$1
    local max_retries=${2:-30}
    local count=0
    while [ $count -lt $max_retries ]; do
        if python -c "import urllib.request; urllib.request.urlopen('$url', timeout=2)" 2>/dev/null; then
            return 0
        fi
        sleep 1
        count=$((count + 1))
        if [ $((count % 5)) -eq 0 ]; then
            echo -n "."
        fi
    done
    return 1
}

# ══════════════════════════════════════════════════════════
# 停止服务
# ══════════════════════════════════════════════════════════

do_stop() {
    echo ""
    echo "=========================================="
    echo "  停止 FastApiAdmin 开发服务"
    echo "=========================================="
    echo ""

    kill_pid_file "backend"
    kill_pid_file "frontend"

    # 清理残留的 python/uvicorn 进程(仅限本项目的)
    log_info "清理残留进程..."
    # 只杀 FastApiAdmin 相关的 uvicorn,不误杀其他 python 进程
    ps aux 2>/dev/null | grep -i "uvicorn.*main.*8001" | grep -v grep | awk '{print $2}' | xargs -r kill 2>/dev/null
    ps aux 2>/dev/null | grep -i "vite.*5180" | grep -v grep | awk '{print $2}' | xargs -r kill 2>/dev/null

    log_info "Docker 服务保持运行 (postgres + redis)"
    log_info "如需停止 Docker: docker compose down"
    echo ""
    echo "✅ 开发服务已停止"
}

# ══════════════════════════════════════════════════════════
# 查看状态
# ══════════════════════════════════════════════════════════

do_status() {
    echo ""
    echo "=========================================="
    echo "  FastApiAdmin 开发服务状态"
    echo "=========================================="
    echo ""

    # Docker 服务
    if docker ps --format '{{.Names}}' 2>/dev/null | grep -q "postgres"; then
        echo -e "  postgres   ${GREEN}● 运行中${NC}   :5432"
    else
        echo -e "  postgres   ${RED}● 未运行${NC}"
    fi

    if docker ps --format '{{.Names}}' 2>/dev/null | grep -q "redis"; then
        echo -e "  redis      ${GREEN}● 运行中${NC}   :6379"
    else
        echo -e "  redis      ${RED}● 未运行${NC}"
    fi

    # 后端
    if port_in_use $BACKEND_PORT; then
        echo -e "  后端 API   ${GREEN}● 运行中${NC}   http://localhost:$BACKEND_PORT"
    else
        echo -e "  后端 API   ${RED}● 未运行${NC}"
    fi

    # 前端
    if port_in_use $FRONTEND_PORT; then
        echo -e "  前端页面   ${GREEN}● 运行中${NC}   http://localhost:$FRONTEND_PORT"
    else
        echo -e "  前端页面   ${RED}● 未运行${NC}"
    fi

    echo ""
}

# ══════════════════════════════════════════════════════════
# 启动服务
# ══════════════════════════════════════════════════════════

do_start() {
    echo ""
    echo "=========================================="
    echo "  FastApiAdmin 一键启动 — 本地开发模式"
    echo "=========================================="
    echo ""

    # ── 前置检查 ──
    log_step "环境检测..."
    if ! command -v docker &>/dev/null; then
        log_error "Docker 未安装或不在 PATH 中"
        exit 1
    fi
    if ! command -v uv &>/dev/null; then
        log_error "uv 未安装,请先安装: pip install uv"
        exit 1
    fi
    if ! command -v pnpm &>/dev/null; then
        log_error "pnpm 未安装,请先安装: npm install -g pnpm"
        exit 1
    fi
    if [ ! -d "$BACKEND_DIR" ]; then
        log_error "后端目录不存在: $BACKEND_DIR"
        exit 1
    fi
    if [ ! -d "$FRONTEND_DIR" ]; then
        log_error "前端目录不存在: $FRONTEND_DIR"
        exit 1
    fi
    log_info "环境检测通过"

    # ── 步骤1: 启动数据库 (Docker) ──
    echo ""
    log_step "[1/4] 启动数据库服务 (Docker)..."

    cd "$SCRIPT_DIR"

    # 检查是否已在运行
    if docker ps --format '{{.Names}}' 2>/dev/null | grep -qE "^(postgres|redis)$"; then
        log_info "postgres + redis 已在运行,跳过"
    else
        docker compose up -d postgres redis 2>&1
        if [ $? -ne 0 ]; then
            log_error "Docker 启动失败,请检查 Docker Desktop 是否运行"
            exit 1
        fi
        log_info "postgres + redis 已启动"
    fi

    # 等待健康检查
    log_info "等待数据库就绪..."
    for i in $(seq 1 15); do
        if docker inspect postgres --format '{{.State.Health.Status}}' 2>/dev/null | grep -q "healthy"; then
            break
        fi
        sleep 1
    done
    log_info "数据库就绪"

    # ── 步骤2: 后端依赖 ──
    echo ""
    log_step "[2/4] 检查后端依赖..."
    cd "$BACKEND_DIR"

    if [ ! -d ".venv" ]; then
        log_warn "虚拟环境不存在,正在创建..."
        uv venv --python 3.12
    fi

    # 快速依赖同步 (已有 .venv 则很快)
    uv sync --quiet 2>&1 | tail -1
    log_info "后端依赖就绪"

    # ── 步骤3: 启动后端 ──
    echo ""
    log_step "[3/4] 启动后端服务 (端口: $BACKEND_PORT)..."

    if port_in_use $BACKEND_PORT; then
        log_warn "端口 $BACKEND_PORT 已被占用,跳过"
    else
        # 关键: ENVIRONMENT=dev 加载 .env.dev (Redis密码)
        # PYTHONUTF8=1 + PYTHONIOENCODING=utf-8 防止后台重定向时GBK编码崩溃
        export ENVIRONMENT=dev
        export PYTHONUTF8=1
        export PYTHONIOENCODING=utf-8
        uv run main.py run --env=dev \
            > "$PID_DIR/backend.log" 2>&1 &

        BACKEND_PID=$!
        echo $BACKEND_PID > "$PID_DIR/backend.pid"

        echo -n "  等待后端启动"
        if health_check "http://localhost:$BACKEND_PORT/api/v1/docs" 60; then
            echo ""
            log_info "后端启动成功 (PID: $BACKEND_PID)"
        else
            echo ""
            log_error "后端启动超时,查看日志: tail -f $PID_DIR/backend.log"
        fi
    fi

    # ── 步骤4: 启动前端 ──
    echo ""
    log_step "[4/4] 启动前端服务 (端口: $FRONTEND_PORT)..."

    if port_in_use $FRONTEND_PORT; then
        log_warn "端口 $FRONTEND_PORT 已被占用,跳过"
    else
        cd "$FRONTEND_DIR"

        pnpm run dev > "$PID_DIR/frontend.log" 2>&1 &
        FRONTEND_PID=$!
        echo $FRONTEND_PID > "$PID_DIR/frontend.pid"

        echo -n "  等待前端启动"
        if health_check "http://localhost:$FRONTEND_PORT" 90; then
            echo ""
            log_info "前端启动成功 (PID: $FRONTEND_PID)"
        else
            echo ""
            log_warn "前端启动较慢 (HDD),仍在初始化中..."
            log_info "可手动验证: 浏览器打开 http://localhost:$FRONTEND_PORT"
        fi
    fi

    # ── 完成 ──
    echo ""
    echo "=========================================="
    echo -e "  ${GREEN}✅ FastApiAdmin 开发环境启动完成${NC}"
    echo "=========================================="
    echo ""
    echo "  📌 访问地址:"
    echo "     前端页面:    http://localhost:$FRONTEND_PORT"
    echo "     后端 API:    http://localhost:$BACKEND_PORT"
    echo "     Swagger:    http://localhost:$BACKEND_PORT/api/v1/docs"
    echo "     ReDoc:      http://localhost:$BACKEND_PORT/api/v1/redoc"
    echo ""
    echo "  🔥 热更新: 修改代码自动重载"
    echo "  📊 后端日志: tail -f $PID_DIR/backend.log"
    echo "  📊 前端日志: tail -f $PID_DIR/frontend.log"
    echo "  🛑 停止服务: bash dev.sh stop"
    echo "  📋 查看状态: bash dev.sh status"
    echo ""
}

# ══════════════════════════════════════════════════════════
# 主入口
# ══════════════════════════════════════════════════════════

case "${1:-start}" in
    stop)
        do_stop
        ;;
    status)
        do_status
        ;;
    start|*)
        do_start
        ;;
esac
