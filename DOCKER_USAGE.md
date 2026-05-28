# Docker 配置使用说明

## 📁 配置文件位置

### ✅ 唯一标准配置（推荐使用）
```
项目根目录/docker-compose.yml
```

**用途**：本地开发环境的数据库服务（PostgreSQL + Redis）

**启动命令**：
```bash
cd D:\HBuilderProjects\FastapiAdmin
docker-compose up -d
```

### ⚠️ 官方示例（仅供参考）
```
项目根目录/docker-compose_example.yaml
```

**用途**：完整的生产环境部署示例（包含 MySQL + Backend + Nginx）

**注意**：
- ❌ 不要直接使用此文件
- ❌ 不要修改此文件
- ✅ 仅作为参考学习

### ❌ 已删除的文件
```
backend/docker-compose.yml  ← 已删除（避免混淆）
```

## 🎯 为什么只保留一个 docker-compose.yml？

### 问题
之前存在两个相同的 `docker-compose.yml` 文件：
- `docker-compose.yml`（根目录）
- `backend/docker-compose.yml`（backend 目录）

这会导致：
1. **混淆**：不知道应该使用哪个文件
2. **维护困难**：修改时需要同步两个文件
3. **路径问题**：在不同目录执行命令可能出错

### 解决方案
**统一使用项目根目录的 `docker-compose.yml`**

优势：
- ✅ 符合 Docker 最佳实践
- ✅ 路径清晰，不易出错
- ✅ 便于团队协作
- ✅ 易于维护和更新

## 📋 标准化操作流程

### 启动数据库服务
```bash
# 始终在项目根目录执行
cd D:\HBuilderProjects\FastapiAdmin
docker-compose up -d
```

### 查看容器状态
```bash
# 在项目根目录执行
docker-compose ps
```

### 停止数据库服务
```bash
# 在项目根目录执行
docker-compose down
```

### 查看日志
```bash
# 查看所有容器日志
docker-compose logs -f

# 查看特定容器日志
docker-compose logs -f postgres
docker-compose logs -f redis
```

### 重启服务
```bash
# 重启所有容器
docker-compose restart

# 重启特定容器
docker-compose restart postgres
```

## 🔧 高级用法

### 本地覆盖配置（可选）

如果您需要自定义配置而不影响标准配置，可以创建：

```
docker-compose.override.yml
```

**示例**：
```yaml
version: '3.8'

services:
  postgres:
    environment:
      POSTGRES_PASSWORD: "MyCustomPassword"
  
  redis:
    command: >
      redis-server 
      --requirepass MyCustomPassword
      --appendonly yes
```

Docker Compose 会自动合并这两个文件。

**注意**：`docker-compose.override.yml` 已在 `.gitignore` 中，不会被提交到版本控制。

## 📝 配置文件对比

| 文件 | 用途 | 是否使用 | 是否提交 |
|------|------|---------|---------|
| `docker-compose.yml` | 标准开发配置 | ✅ 是 | ✅ 是 |
| `docker-compose_example.yaml` | 官方生产示例 | ❌ 否 | ✅ 是（参考） |
| `docker-compose.override.yml` | 本地自定义配置 | ⚠️ 可选 | ❌ 否 |
| `backend/docker-compose.yml` | 旧配置（已删除） | ❌ 否 | ❌ 否 |

## 💡 常见问题

### Q1: 我应该在哪里执行 docker-compose 命令？
**答**：始终在**项目根目录**执行。

```bash
# ✅ 正确
cd D:\HBuilderProjects\FastapiAdmin
docker-compose up -d

# ❌ 错误
cd D:\HBuilderProjects\FastapiAdmin\backend
docker-compose up -d
```

### Q2: 如果我想修改配置怎么办？
**答**：有两种方式：

1. **直接修改** `docker-compose.yml`（如果团队都需要同样的修改）
2. **创建** `docker-compose.override.yml`（仅个人使用，不提交）

### Q3: 为什么保留了 `docker-compose_example.yaml`？
**答**：这是官方提供的完整生产部署示例，包含：
- MySQL 数据库
- Backend 容器化
- Nginx 反向代理
- 完整的前后端部署方案

可以作为学习参考，但**不要直接使用**。

### Q4: 我可以切换回 MySQL 吗？
**答**：可以，但需要：
1. 修改 `docker-compose.yml` 使用 MySQL 镜像
2. 修改 `backend/env/.env.dev` 中的 `DATABASE_TYPE` 为 `mysql`
3. 重新初始化数据库

但**不建议**，因为项目已经针对 PostgreSQL 进行了优化。

## 🚀 快速开始

### 首次启动
```bash
# 1. 进入项目根目录
cd D:\HBuilderProjects\FastapiAdmin

# 2. 启动数据库服务
docker-compose up -d

# 3. 等待数据库就绪（约 10 秒）
sleep 10

# 4. 验证服务
docker-compose ps
```

### 日常使用
```bash
# 启动数据库
docker-compose up -d

# 启动后端
cd backend
python main.py run --env=dev

# 启动前端（新终端）
cd frontend
pnpm dev
```

### 停止服务
```bash
# 停止数据库
docker-compose down

# 停止后端/前端
# 在对应终端按 Ctrl+C
```

## 📊 端口映射

| 服务 | 容器端口 | 主机端口 | 说明 |
|------|---------|---------|------|
| PostgreSQL | 5432 | 5432 | 固定不变 |
| Redis | 6379 | 6379 | 固定不变 |

**注意**：端口已固定，不要随意修改。

---

**最后更新**: 2026-04-26  
**维护者**: FastapiAdmin Team
