#!/usr/bin/env node
/**
 * 本地无 Docker 时启动 PostgreSQL + Redis
 * 依赖: cd /tmp && npm install embedded-postgres redis-memory-server
 */
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const root = path.resolve(fileURLToPath(import.meta.url), '../..');
const modulesBase = '/private/tmp/node_modules';

const { default: EmbeddedPostgres } = await import(
  path.join(modulesBase, 'embedded-postgres/dist/index.js')
);
const { RedisMemoryServer } = await import(
  path.join(modulesBase, 'redis-memory-server/lib/index.js')
);

const PG_PORT = 5432;
const REDIS_PORT = 6379;
const PG_USER = 'postgres';
const PG_PASS = 'FastapiAdmin@2026';
const PG_DB = 'fastapiadmin';
const dataDir = path.join(root, 'devops/postgres/local-embedded');

const pg = new EmbeddedPostgres({
  databaseDir: dataDir,
  user: PG_USER,
  password: PG_PASS,
  port: PG_PORT,
  persistent: true,
  initdbFlags: ['--encoding=UTF8', '--locale=en_US.UTF-8'],
});

const redisServer = new RedisMemoryServer({
  instance: {
    port: REDIS_PORT,
    args: ['--requirepass', PG_PASS],
  },
});

async function main() {
  console.log('[db] 初始化 PostgreSQL...');
  await pg.initialise();
  await pg.start();
  try {
    await pg.createDatabase(PG_DB);
    console.log(`[db] 已创建数据库 ${PG_DB}`);
  } catch {
    console.log(`[db] 数据库 ${PG_DB} 已存在，跳过`);
  }

  console.log('[db] 启动 Redis（首次可能需编译，请耐心等待）...');
  const host = await redisServer.getHost();
  const port = await redisServer.getPort();
  console.log(`[db] PostgreSQL: localhost:${PG_PORT} user=${PG_USER} db=${PG_DB}`);
  console.log(`[db] Redis: ${host}:${port}`);
  console.log('[db] 运行中，按 Ctrl+C 停止');

  const stop = async () => {
    await redisServer.stop();
    await pg.stop();
    process.exit(0);
  };
  process.on('SIGINT', stop);
  process.on('SIGTERM', stop);
}

main().catch((err) => {
  console.error('[db] 启动失败:', err);
  process.exit(1);
});
