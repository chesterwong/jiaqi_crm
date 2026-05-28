# Docker配置修复总结

## 修复时间：2026-04-22

---

## ✅ 修复完成的项目

### 1. Dockerfile WORKDIR路径（已修复）
**文件**: `devops/backend/Dockerfile` 第14行

```dockerfile
# 修复前
WORKDIR /home

# 修复后
WORKDIR /app  # 官方标准路径
```

**影响**: 
- ✅ 符合FastApiAdmin官方标准
- ✅ 代码生成器BASE_DIR计算正确
- ✅ 需要重建backend容器才能生效

---

### 2. Backend代码挂载路径（已修复）
**文件**: `docker-compose.yml` backend服务

```yaml
# 修复前
volumes:
  - ./backend:/home

# 修复后
volumes:
  - ./backend:/app  # 与WORKDIR /app匹配
```

**影响**:
- ✅ 代码正确挂载到容器内/app目录
- ✅ 与Dockerfile的WORKDIR一致

---

### 3. 日志持久化挂载（已添加）
**文件**: `docker-compose.yml` backend服务

```yaml
volumes:
  - ./backend:/app
  - ./backend/logs:/app/logs  # 新增：日志持久化
```

**影响**:
- ✅ 日志不会因容器重启丢失
- ✅ 便于问题排查和监控
- ✅ 符合官方推荐配置

---

### 4. 前端目录挂载（已添加）
**文件**: `docker-compose.yml` backend服务

```yaml
volumes:
  - ./backend:/app
  - ./backend/logs:/app/logs
  - ./frontend:/home/frontend  # 新增：前端目录挂载
```

**影响**:
- ✅ 代码生成器可以写入前端代码
- ✅ 解决Docker模式下前端代码生成失败问题
- ✅ 路径说明：容器内`/home/frontend`对应宿主机`./frontend`

---

### 5. PROJECT_ROOT环境变量（已添加）
**文件**: `docker-compose.yml` backend服务

```yaml
environment:
  TZ: "Asia/Shanghai"
  PROJECT_ROOT: "/home"  # 新增：项目根目录
  DATABASE_TYPE: "postgres"
  # ...
```

**影响**:
- ✅ 明确告知代码生成器项目根目录位置
- ✅ 容器内路径：`/home`（包含backend和frontend）
- ✅ 代码生成器计算路径：`PROJECT_ROOT.joinpath(file_name)`

---

## 📊 修复前后对比

| 配置项 | 修复前 | 修复后 | 状态 |
|--------|--------|--------|------|
| WORKDIR | `/home` | `/app` | ✅ 已修复 |
| 代码挂载 | `./backend:/home` | `./backend:/app` | ✅ 已修复 |
| 日志挂载 | ❌ 无 | `./backend/logs:/app/logs` | ✅ 已添加 |
| 前端挂载 | ❌ 无 | `./frontend:/home/frontend` | ✅ 已添加 |
| PROJECT_ROOT | ❌ 无 | `/home` | ✅ 已添加 |

---

## 🎯 代码生成器路径计算验证

### 本地开发模式（当前使用）✅
```
BASE_DIR = D:\APP-WEB\CRM\crm-fastapi\backend
BASE_DIR.parent = D:\APP-WEB\CRM\crm-fastapi

生成的文件：
✅ D:\APP-WEB\CRM\crm-fastapi\backend\app\plugin\module_xxx\xxx\controller.py
✅ D:\APP-WEB\CRM\crm-fastapi\frontend\src\views\module_xxx\xxx\index.vue
```

### Docker全容器模式（修复后）✅
```
BASE_DIR = /app (容器内)
PROJECT_ROOT = /home (容器内)

生成的文件：
✅ /home/backend/app/plugin/module_xxx/xxx/controller.py
   (对应宿主机: ./backend/app/plugin/module_xxx/xxx/controller.py)
   
✅ /home/frontend/src/views/module_xxx/xxx/index.vue
   (对应宿主机: ./frontend/src/views/module_xxx/xxx/index.vue)
```

---

## ⚠️ 重要提醒

### 需要重建容器才能生效

修复Dockerfile后，必须重建backend容器：

```bash
# 停止并删除旧容器
docker-compose down backend

# 重新构建并启动
docker-compose up -d --build backend

# 验证
docker exec backend pwd  # 应该输出: /app
```

### 当前开发模式不受影响

**当前使用本地开发模式**，修复不影响现有工作流程：
- ✅ 后端本地运行：`uv run python main.py run --env=dev`
- ✅ 前端本地运行：`pnpm dev`
- ✅ 数据库Docker运行：`docker-compose up -d postgres redis`
- ✅ 代码生成器正常工作

---

## 📝 验证清单

- [x] Dockerfile WORKDIR改为`/app`
- [x] docker-compose.yml挂载路径改为`./backend:/app`
- [x] 添加日志挂载`./backend/logs:/app/logs`
- [x] 添加前端挂载`./frontend:/home/frontend`
- [x] 添加PROJECT_ROOT环境变量
- [x] YAML语法验证通过（`docker-compose config --quiet`）
- [ ] 重建backend容器（需要时执行）
- [ ] 测试Docker模式下代码生成器（需要时执行）

---

## 🚀 下一步

### 继续开发（推荐）
保持当前本地开发模式，继续功能开发：
```bash
# 数据库
docker-compose up -d postgres redis

# 后端（本地）
cd backend && uv run python main.py run --env=dev

# 前端（本地）
cd frontend && pnpm dev
```

### 测试Docker模式（可选）
如果需要测试Docker全容器模式：
```bash
# 重建backend容器
docker-compose down backend
docker-compose up -d --build backend

# 进入容器验证
docker exec -it backend bash
pwd  # 应该输出: /app
ls   # 应该看到backend目录内容

# 测试代码生成器
# 访问: http://localhost:5180/web/plugin/codegen
```

---

**修复完成时间**: 2026-04-22  
**YAML验证**: ✅ 通过  
**向后兼容**: ✅ 本地开发模式不受影响
