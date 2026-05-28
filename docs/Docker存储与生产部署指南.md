# Docker存储与生产部署完整指南

## 📦 Docker存储位置说明

### Windows Docker Desktop存储路径

```
Docker镜像和容器存储位置:
C:\Users\<用户名>\AppData\Local\Docker\wsl\data\ext4.vhdx
（WSL2后端虚拟磁盘文件）

Docker配置位置:
C:\Users\<用户名>\.docker\
```

### 重要说明

1. **Docker镜像存储**: 在WSL2虚拟磁盘中，不直接访问
2. **Docker容器数据**: 通过Bind Mount映射到项目目录
   - PostgreSQL: `./devops/postgres/data/`
   - Redis: `./devops/redis/data/`
3. **不建议直接操作Docker内部存储**，使用Docker命令管理

---

## 🗂️ 项目备份策略（精简版）

### ✅ 唯一必要的备份：PostgreSQL SQL导出

**备份位置**: `D:\APP-WEB\CRM\crm-fastapi\backend\sql\postgres\`

**为什么只需要SQL备份？**

| 备份类型 | 是否必要 | 原因 |
|---------|---------|------|
| **PostgreSQL SQL** | ✅ 必须 | 包含所有业务数据，可跨平台恢复 |
| Redis RDB快照 | ❌ 不需要 | 缓存数据，可重建，无持久化需求 |
| 本地数据目录 | ❌ 不需要 | SQL导出更可靠，体积小，易维护 |

**优势**：
- ✅ 文件小（3.2MB vs 76MB）
- ✅ 跨平台兼容（Linux/Windows/Mac）
- ✅ 可读性强（纯文本SQL）
- ✅ 易于版本控制（可提交到Git）
- ✅ 恢复简单（一条命令）

### 备份命令

```bash
# 执行备份
cd D:\APP-WEB\CRM\crm-fastapi
bash backup.sh

# 备份结果
backend/sql/postgres/crm_20260422_170524.sql  (3.2MB)
backend/sql/postgres/backup_20260422_170524.txt
```

### 恢复命令

```bash
# 恢复数据库
docker exec -i postgres psql -U crm_user -d crm < backend/sql/postgres/crm_20260422_170524.sql
```

---

## 🐳 Docker镜像导出（生产部署）

### 为什么需要导出镜像？

1. **云服务器无网络**: 某些内网环境无法拉取镜像
2. **加速部署**: 避免从Docker Hub下载（速度慢）
3. **版本锁定**: 确保生产环境和开发环境完全一致
4. **离线部署**: 一次导出，多次使用

### 导出脚本

**Linux/Mac**:
```bash
cd D:\APP-WEB\CRM\crm-fastapi
bash export-docker-images.sh
```

**Windows**:
```cmd
cd D:\APP-WEB\CRM\crm-fastapi
export-docker-images.bat
```

### 导出内容

```
D:\APP-WEB\CRM\docker-images\20260422_170524\
├── backend.tar      (后端服务 - Python FastAPI)
├── nginx.tar        (Nginx反向代理)
├── postgres.tar     (PostgreSQL 16数据库)
├── redis.tar        (Redis 7缓存)
└── README.txt       (部署说明)

总大小: 约500MB-800MB
```

---

## ☁️ 云服务器部署完整流程

### 步骤1: 准备服务器

**推荐配置**:
- CPU: 2核+
- 内存: 4GB+
- 硬盘: 50GB+
- 系统: Ubuntu 20.04+ 或 CentOS 8+

**安装Docker**:
```bash
# Ubuntu/Debian
curl -fsSL https://get.docker.com | bash -s docker
sudo systemctl start docker
sudo systemctl enable docker

# 验证安装
docker --version
docker-compose --version
```

### 步骤2: 传输镜像到服务器

**方式1: SCP传输**
```bash
# 从本地Windows传输到Linux服务器
scp -r D:\APP-WEB\CRM\docker-images\20260422_170524 user@your-server:/opt/crm-images/
```

**方式2: FTP/SFTP**
```bash
# 使用FileZilla等工具上传
# 上传到: /opt/crm-images/20260422_170524/
```

**方式3: U盘/移动硬盘**
```bash
# 复制到U盘，然后在服务器上挂载
cp -r /media/usb/docker-images /opt/crm-images/
```

### 步骤3: 导入Docker镜像

```bash
# SSH登录服务器
ssh user@your-server

# 进入镜像目录
cd /opt/crm-images/20260422_170524/

# 导入所有镜像
docker load -i backend.tar
docker load -i nginx.tar
docker load -i postgres.tar
docker load -i redis.tar

# 验证镜像
docker images | grep -E "backend|nginx|postgres|redis"
```

### 步骤4: 部署项目代码

```bash
# 方式1: Git克隆（推荐）
cd /opt
git clone https://gitee.com/your-org/crm-fastapi.git
cd crm-fastapi

# 方式2: 直接上传项目文件
# 使用SCP上传整个crm-fastapi目录
scp -r D:\APP-WEB\CRM\crm-fastapi user@your-server:/opt/
```

### 步骤5: 配置环境变量

```bash
cd /opt/crm-fastapi

# 创建生产环境配置
cat > backend/env/.env.prod << EOF
DATABASE_TYPE=postgres
DATABASE_HOST=postgres
DATABASE_PORT=5432
DATABASE_USER=crm_user
DATABASE_PASSWORD=YourStrongPassword123!
DATABASE_NAME=crm

REDIS_HOST=redis
REDIS_PASSWORD=YourRedisPassword123!
EOF

# 创建前端配置
cat > frontend/.env.production << EOF
VITE_APP_ENV=production
VITE_APP_TITLE=CRM客户管理系统
VITE_API_BASE_URL=http://your-server-ip:8001
VITE_APP_BASE_API=/api/v1
VITE_APP_PORT=80
EOF
```

### 步骤6: 启动服务

```bash
cd /opt/crm-fastapi

# 方式1: 使用docker-compose（推荐）
docker-compose up -d

# 方式2: 手动启动容器
# 启动PostgreSQL
docker run -d \
  --name postgres \
  -p 5432:5432 \
  -e POSTGRES_DB=crm \
  -e POSTGRES_USER=crm_user \
  -e POSTGRES_PASSWORD=YourStrongPassword123! \
  -v /opt/crm-data/postgres:/var/lib/postgresql/data \
  postgres:16-alpine

# 启动Redis
docker run -d \
  --name redis \
  -p 6379:6379 \
  -v /opt/crm-data/redis:/data \
  redis:7-alpine \
  redis-server --requirepass YourRedisPassword123!

# 启动Backend
docker run -d \
  --name backend \
  -p 8001:8001 \
  --link postgres \
  --link redis \
  -e DATABASE_TYPE=postgres \
  -e DATABASE_HOST=postgres \
  -e REDIS_HOST=redis \
  -e REDIS_PASSWORD=YourRedisPassword123! \
  -v /opt/crm-fastapi/backend:/app \
  backend:latest

# 启动Nginx
docker run -d \
  --name nginx \
  -p 80:80 \
  -p 443:443 \
  --link backend \
  -v /opt/crm-fastapi/devops/nginx/nginx.conf:/etc/nginx/nginx.conf \
  -v /opt/crm-fastapi/devops/nginx/frontend:/usr/share/nginx/html/frontend \
  nginx:alpine
```

### 步骤7: 初始化数据库

```bash
# 进入后端容器
docker exec -it backend bash

# 初始化数据库（创建表结构、初始数据）
python main.py init --env=prod

# 退出容器
exit
```

### 步骤8: 恢复数据（如有备份）

```bash
# 传输SQL备份到服务器
scp backend/sql/postgres/crm_20260422_170524.sql user@your-server:/tmp/

# 恢复数据库
docker exec -i postgres psql -U crm_user -d crm < /tmp/crm_20260422_170524.sql
```

### 步骤9: 验证部署

```bash
# 检查容器状态
docker-compose ps

# 查看日志
docker-compose logs -f backend

# 测试API
curl http://localhost:8001/api/v1/health

# 测试前端
curl http://localhost:80

# 浏览器访问
# http://your-server-ip
```

---

## 🔒 生产环境安全建议

### 1. 修改默认密码

```bash
# PostgreSQL密码
POSTGRES_PASSWORD=YourStrongPassword123!

# Redis密码
REDIS_PASSWORD=YourRedisPassword123!

# 建议: 使用密码生成器生成强密码
openssl rand -base64 32
```

### 2. 配置防火墙

```bash
# 仅开放必要端口
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS
sudo ufw enable

# 不要开放数据库端口到公网
# 5432和6379仅允许内网访问
```

### 3. 配置SSL证书（HTTPS）

```bash
# 使用Let's Encrypt免费证书
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d your-domain.com

# 自动续期
sudo crontab -e
# 添加: 0 0 1 * * certbot renew --quiet
```

### 4. 定期备份

```bash
# 设置每日备份（crontab）
crontab -e

# 添加: 每天凌晨2点备份
0 2 * * * cd /opt/crm-fastapi && bash backup.sh >> /var/log/crm-backup.log 2>&1

# 每周清理旧备份
0 3 * * 0 find /opt/crm-fastapi/backend/sql/postgres -name "crm_*.sql" -mtime +30 -delete
```

### 5. 监控日志

```bash
# 查看实时日志
docker-compose logs -f backend
docker-compose logs -f nginx

# 查看日志文件
tail -f /opt/crm-fastapi/backend/logs/app.log
```

---

## 📊 备份与镜像对比

| 项目 | 数据库备份 | Docker镜像 |
|------|-----------|-----------|
| **内容** | 业务数据（SQL） | 运行环境（程序） |
| **大小** | 3.2MB | 500-800MB |
| **频率** | 每日 | 版本更新时 |
| **位置** | `backend/sql/postgres/` | `docker-images/` |
| **用途** | 数据恢复 | 环境部署 |
| **必要性** | ✅ 必须 | ⚠️ 可选（有网络时） |

---

## 🎯 快速参考

### 日常开发
```bash
# 启动开发环境
cd D:\APP-WEB\CRM\crm-fastapi
docker-compose up -d postgres redis
cd backend && uv run python main.py run --env=dev
cd ../frontend && pnpm dev
```

### 每日备份
```bash
cd D:\APP-WEB\CRM\crm-fastapi
bash backup.sh
```

### 导出镜像（版本发布时）
```bash
cd D:\APP-WEB\CRM\crm-fastapi
bash export-docker-images.sh
```

### 生产部署
```bash
# 在服务器上
cd /opt/crm-images/日期
docker load -i *.tar
cd /opt/crm-fastapi
docker-compose up -d
docker exec -it backend python main.py init --env=prod
```

---

**文档更新时间**: 2026-04-22  
**备份策略**: 仅SQL备份（精简高效）  
**镜像导出**: 支持离线生产部署
