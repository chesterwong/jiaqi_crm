# FastapiAdmin 快速启动指南

## 🚀 三步启动项目

### 1️⃣ 启动数据库服务
```bash
cd D:\HBuilderProjects\FastapiAdmin
docker-compose up -d
```

### 2️⃣ 启动后端服务（新终端）
```bash
cd D:\HBuilderProjects\FastapiAdmin\backend
python main.py run --env=dev
```

### 3️⃣ 启动前端服务（新终端）
```bash
cd D:\HBuilderProjects\FastapiAdmin\frontend
pnpm dev
```

## 🌐 访问地址

| 服务 | 地址 |
|------|------|
| 前端界面 | http://localhost:5180/web |
| API 文档 | http://localhost:8001/docs |
| 后端 API | http://localhost:8001 |

## 🔑 默认账号

- **用户名**: `admin`
- **密码**: `123456`

## 📚 详细文档

- [端口配置说明](PORTS_CONFIG.md)
- [Docker 使用指南](DOCKER_USAGE.md)

## ⚙️ 固定端口

- PostgreSQL: **5432**
- Redis: **6379**
- Backend: **8001**
- Frontend: **5180**

## 💡 常用命令

```bash
# 查看容器状态
docker-compose ps

# 停止数据库
docker-compose down

# 重启数据库
docker-compose restart

# 查看日志
docker-compose logs -f
```

---

**注意**：所有 `docker-compose` 命令都在**项目根目录**执行。
