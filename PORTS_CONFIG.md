# FastapiAdmin 端口配置说明

## 📌 固定端口配置（不再变动）

### 🗄️ 数据库层
| 服务 | 端口 | 说明 |
|------|------|------|
| PostgreSQL | 5432 | 主数据库 |
| Redis | 6379 | 缓存服务 |

### 🔧 后端服务
| 服务 | 端口 | 说明 |
|------|------|------|
| FastAPI | 8001 | API 服务 |
| Swagger UI | 8001/docs | API 文档 |
| ReDoc | 8001/redoc | API 文档（备用） |
| LangJin | 8001/ljdoc | API 文档（AI） |

### 🎨 前端服务
| 服务 | 端口 | 说明 |
|------|------|------|
| Vite Dev | 5180 | 开发服务器 |
| 访问路径 | /web | 前端根路径 |

## 🔑 完整访问地址

### 本地开发环境
```
前端界面:    http://localhost:5180/web
后端 API:    http://localhost:8001
Swagger:     http://localhost:8001/docs
ReDoc:       http://localhost:8001/redoc
LangJin:     http://localhost:8001/ljdoc
```

### 网络访问（局域网）
```
前端界面:    http://192.168.88.3:5180/web
后端 API:    http://192.168.88.3:8001
```

## ⚙️ 配置文件位置

### Docker 配置
- **文件**: `docker-compose.yml`（项目根目录）
- **用途**: 启动 PostgreSQL 和 Redis 容器
- **端口映射**: 
  - 5432:5432 (PostgreSQL)
  - 6379:6379 (Redis)

### 后端配置
- **文件**: `backend/env/.env.dev`
- **关键配置**:
  ```ini
  SERVER_HOST = "localhost"
  SERVER_PORT = 8001
  
  DATABASE_TYPE = "postgres"
  DATABASE_HOST = "localhost"
  DATABASE_PORT = 5432
  
  REDIS_HOST = "localhost"
  REDIS_PORT = 6379
  ```

### 前端配置
- **文件**: `frontend/.env.development`
- **关键配置**:
  ```ini
  VITE_API_BASE_URL=http://127.0.0.1:8001
  VITE_APP_PORT=5180
  VITE_APP_WS_ENDPOINT=ws://127.0.0.1:8001
  ```

## 🚀 启动命令

### 1. 启动数据库服务
```bash
cd D:\HBuilderProjects\FastapiAdmin
docker-compose up -d
```

### 2. 启动后端服务
```bash
cd D:\HBuilderProjects\FastapiAdmin\backend
python main.py run --env=dev
```

### 3. 启动前端服务
```bash
cd D:\HBuilderProjects\FastapiAdmin\frontend
pnpm dev
```

## 🔐 默认账号密码

### 数据库
- **PostgreSQL**:
  - 用户名: `postgres`
  - 密码: `FastapiAdmin@2026`
  - 数据库: `fastapiadmin`

- **Redis**:
  - 密码: `FastapiAdmin@2026`

### 系统登录
- **用户名**: `admin`
- **密码**: `123456`（或查看初始化脚本确认）

## 📝 注意事项

1. **端口占用检查**
   ```bash
   # Windows 检查端口占用
   netstat -ano | findstr "5432"
   netstat -ano | findstr "6379"
   netstat -ano | findstr "8001"
   netstat -ano | findstr "5180"
   ```

2. **防火墙设置**
   - 确保防火墙允许上述端口通过
   - 如需外部访问，需配置端口转发

3. **数据持久化**
   - PostgreSQL 数据: `devops/postgres/data`
   - Redis 数据: `devops/redis/data`

4. **停止服务**
   ```bash
   # 停止 Docker 容器
   docker-compose down
   
   # 停止后端/前端
   # 在对应终端按 Ctrl+C
   ```

## 🔄 配置文件对比

### ✅ 标准配置（唯一使用）
- **文件**: `docker-compose.yml`（项目根目录）
- **数据库**: PostgreSQL ✅
- **用途**: 本地开发环境（仅数据库容器）
- **状态**: **正在使用**
- **执行目录**: 项目根目录

### ⚠️ 官方示例（仅供参考）
- **文件**: `docker-compose_example.yaml`（项目根目录）
- **数据库**: MySQL ❌
- **用途**: 完整生产部署示例（包含前后端容器化）
- **状态**: 仅作参考，**不要直接使用**

### ❌ 已删除的配置
- **文件**: `backend/docker-compose.yml`
- **原因**: 避免与根目录配置混淆
- **状态**: **已删除**

**重要提示**：
- ✅ **始终在项目根目录执行** `docker-compose` 命令
- ❌ **不要使用** `backend/docker-compose.yml`（已删除）
- ⚠️ **不要修改** `docker-compose_example.yaml`（仅供参考）

## 💡 常见问题

### Q1: 为什么有两个 docker-compose 文件？
**答**：实际上只有一个在使用：
- `docker-compose.yml`（根目录）：**唯一使用的配置文件** ✅
- `docker-compose_example.yaml`：官方示例，仅供参考 ⚠️
- `backend/docker-compose.yml`：**已删除**，避免混淆 ❌

**始终在项目根目录执行** `docker-compose` 命令。

### Q2: 可以切换回 MySQL 吗？
可以，但需要：
1. 修改 `.env.dev` 中的 `DATABASE_TYPE` 为 `mysql`
2. 修改 `docker-compose.yml` 使用 MySQL 镜像
3. 重新初始化数据库

### Q3: 端口可以修改吗？
理论上可以，但建议保持固定：
- 避免配置混乱
- 便于团队协作
- 减少排查问题的复杂度

如需修改，请同步更新：
1. `docker-compose.yml` 的端口映射
2. `backend/env/.env.dev` 的数据库端口
3. `frontend/.env.development` 的 API 地址

---

**最后更新**: 2026-04-26  
**维护者**: FastapiAdmin Team
