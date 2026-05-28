# 数据库配置说明

> **更新日期**: 2026-04-25  
> **数据库类型**: PostgreSQL（唯一）

---

## ⚠️ 重要提示

**本项目仅使用PostgreSQL，已禁用MySQL和SQLite！**

- ❌ **不使用MySQL**
- ❌ **不使用SQLite**
- ✅ **仅使用PostgreSQL 16**

---

## 数据库配置

### 配置文件位置

`crm-fastapi/backend/app/config/setting.py`

### 配置内容

```python
# PostgreSQL数据库连接（CRM项目唯一支持的数据库）
# ⚠️ 已禁用MySQL和SQLite，禁止修改为其他数据库类型
DATABASE_TYPE: Literal["mysql", "postgres", "sqlite"] = "postgres"  # 固定为postgres
DATABASE_HOST: str = "localhost"
DATABASE_PORT: int = 5432  # PostgreSQL默认端口
DATABASE_USER: str = "crm_user"
DATABASE_PASSWORD: str = "CrmUser@2026"
DATABASE_NAME: str = "crm"
```

---

## Docker配置

### docker-compose.yml

```yaml
services:
  postgres:
    container_name: postgres
    image: postgres:16-alpine
    restart: always
    environment:
      TZ: "Asia/Shanghai"
      POSTGRES_DB: "crm"
      POSTGRES_PASSWORD: "CrmUser@2026"
      POSTGRES_USER: "crm_user"
    ports:
      - "5432:5432"
    volumes:
      - ./devops/postgres/data:/var/lib/postgresql/data
```

### 启动命令

```bash
cd crm-fastapi
docker-compose up -d postgres
```

### 验证连接

```bash
# 检查容器状态
docker ps --filter "name=postgres"

# 测试连接
docker exec postgres psql -U crm_user -d crm -c "SELECT version();"
```

---

## 连接字符串

### 异步连接（生产环境）

```
postgresql+asyncpg://crm_user:CrmUser@2026@localhost:5432/crm
```

### 同步连接（迁移脚本）

```
postgresql+psycopg://crm_user:CrmUser@2026@localhost:5432/crm
```

### psql直接连接

```bash
docker exec postgres psql -U crm_user -d crm
```

---

## Alembic配置

### alembic.ini

```ini
sqlalchemy.url = postgresql+psycopg://crm_user:CrmUser@2026@localhost:5432/crm
```

### env.py

```python
# 使用PostgreSQL连接
config.set_main_option(
    "sqlalchemy.url",
    "postgresql+psycopg://crm_user:CrmUser@2026@localhost:5432/crm"
)
```

---

## 数据库管理

### 备份数据库

```bash
docker exec postgres pg_dump -U crm_user -d crm > backups/crm_backup_$(date +%Y%m%d_%H%M%S).sql
```

### 恢复数据库

```bash
docker exec -i postgres psql -U crm_user -d crm < backups/crm_backup_20260425.sql
```

### 查看数据库大小

```bash
docker exec postgres psql -U crm_user -d crm -c "SELECT pg_size_pretty(pg_database_size('crm'));"
```

---

## 常见问题

### Q1: 为什么不用MySQL？

**A**: PostgreSQL提供了以下优势：
- ✅ JSONB支持（原生JSON查询）
- ✅ 全文检索
- ✅ pgvector扩展（AI向量搜索）
- ✅ 更好的并发性能
- ✅ 更丰富的数据类型

### Q2: 可以切换到MySQL吗？

**A**: ❌ **不可以！**

本项目已深度依赖PostgreSQL特性：
- JSONB字段查询
- UUID生成（gen_random_uuid()）
- PostgreSQL特有函数
- 字段注解（COMMENT）

### Q3: 端口被占用怎么办？

**A**: 修改docker-compose.yml和setting.py中的端口：

```yaml
# docker-compose.yml
ports:
  - "5433:5432"  # 宿主机端口改为5433
```

```python
# setting.py
DATABASE_PORT: int = 5433  # 与docker-compose一致
```

---

## 历史配置（已废弃）

### ⛔ MySQL配置（已禁用）

```python
# 以下配置已废弃，不要再使用！
DATABASE_TYPE: str = "mysql"  # ❌ 已禁用
DATABASE_PORT: int = 3306     # ❌ MySQL端口
DATABASE_USER: str = "root"   # ❌ MySQL用户
DATABASE_PASSWORD: str = "ServBay.dev"  # ❌ MySQL密码
DATABASE_NAME: str = "fastapiadmin"     # ❌ MySQL数据库
```

### ⛔ SQLite配置（已禁用）

```python
# 以下配置已废弃，不要再使用！
DATABASE_TYPE: str = "sqlite"  # ❌ 已禁用
DATABASE_NAME: str = "crm.db"  # ❌ SQLite文件
```

---

## 验证清单

在开始开发前，请确认：

- [ ] `DATABASE_TYPE = "postgres"`（不是mysql或sqlite）
- [ ] `DATABASE_PORT = 5432`（不是3306）
- [ ] `DATABASE_USER = "crm_user"`（不是root）
- [ ] `DATABASE_PASSWORD = "CrmUser@2026"`（不是ServBay.dev）
- [ ] `DATABASE_NAME = "crm"`（不是fastapiadmin）
- [ ] Docker PostgreSQL容器正在运行
- [ ] 可以成功连接数据库

---

**文档版本**: v1.0  
**创建日期**: 2026-04-25  
**维护**: CRM项目组
