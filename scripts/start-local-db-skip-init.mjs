#!/usr/bin/env node
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.resolve(fileURLToPath(import.meta.url), '../..');
const modulesBase = '/private/tmp/node_modules';

const { default: EmbeddedPostgres } = await import(
  path.join(modulesBase, 'embedded-postgres/dist/index.js')
);
const { RedisMemoryServer } = await import(
  path.join(modulesBase, 'redis-memory-server/lib/index.js')
);

const PG_PASS = 'FastapiAdmin@2026';
const pg = new EmbeddedPostgres({
  databaseDir: path.join(root, 'devops/postgres/local-embedded'),
  user: 'postgres',
  password: PG_PASS,
  port: 5432,
  persistent: true,
});
const redisServer = new RedisMemoryServer({
  instance: { port: 6379, args: ['--requirepass', PG_PASS] },
});

await pg.start();
await redisServer.getPort();
console.log('[db] PostgreSQL + Redis ready');

const stop = async () => {
  await redisServer.stop();
  await pg.stop();
  process.exit(0);
};
process.on('SIGINT', stop);
process.on('SIGTERM', stop);
