# Sentry 自托管错误追踪系统技术文档

## 📌 项目概述

Sentry 是一个开源的错误追踪和性能监控平台，采用 Apache 2.0 开源协议，支持自托管部署。

**官方资源**：
- GitHub仓库: https://github.com/getsentry/sentry
- Python SDK: https://github.com/getsentry/sentry-python
- 自托管部署: https://github.com/getsentry/self-hosted
- 官方文档: https://docs.sentry.io

---

## 🎯 技术定位

### 当前系统监控现状

**现有监控模块**：
- ✅ 前端页面完整（4个模块）
  - 缓存监控（Redis）
  - 在线用户管理
  - 资源监控（文件管理）
  - 服务器监控
- ❌ 后端API缺失
  - `backend/app/plugin/module_monitor/` 目录不存在
  - 前端调用接口404错误
- ❌ 日志系统局限
  - 仅Loguru文件日志
  - 需SSH查看，无Web界面
  - 无错误聚合统计
  - 无告警机制

### Sentry 自托管优势

**能力提升**：
```
当前能力:
  ❌ 错误散落在日志文件
  ❌ 手动查看，效率低
  ❌ 无统计和趋势分析
  ❌ 无实时告警

Sentry 集成后:
  ✅ Web界面集中查看
  ✅ 错误自动聚合分类
  ✅ 性能监控（APM）
  ✅ 实时告警通知
  ✅ 用户行为追踪
  ✅ Release版本关联
  ✅ 完全免费（无限制）
```

---

## 🏗️ 系统架构

### 部署架构

```
┌─────────────────────────────────────────────────┐
│              CRM系统服务器                        │
│                                                 │
│  ┌──────────────────────────────────────────┐   │
│  │  Sentry 自托管服务 (Docker)              │   │
│  │  - Sentry Web (前端界面)                 │   │
│  │  - Sentry Worker (异步任务)              │   │
│  │  - PostgreSQL (错误数据存储)             │   │
│  │  - Redis (缓存和队列)                    │   │
│  │  - Kafka (事件流)                        │   │
│  │  - ClickHouse (分析数据)                 │   │
│  └──────────────────────────────────────────┘   │
│                                                 │
│  ┌──────────────────────────────────────────┐   │
│  │  CRM FastAPI 应用                        │   │
│  │  - 集成 sentry-sdk                       │   │
│  │  - 自动上报错误和性能数据                 │   │
│  └──────────────────────────────────────────┘   │
│                                                 │
│  访问地址: http://服务器IP:9000                 │
└─────────────────────────────────────────────────┘
```

### 数据流

```
FastAPI应用发生错误
    ↓
sentry-sdk 自动捕获
    ↓
发送到 Sentry Server (HTTP API)
    ↓
Sentry 处理和分析
    ↓
存储到 PostgreSQL + ClickHouse
    ↓
Web界面展示
    ↓
管理员查看和告警
```

---

## 📦 部署方案

### 系统要求

**最低配置**：
- CPU: 4核
- 内存: 8GB
- 磁盘: 50GB
- Docker 20.10+
- Docker Compose 2.0+

**推荐配置**：
- CPU: 8核
- 内存: 16GB
- 磁盘: 200GB+ SSD
- 独立服务器或云服务器

### 部署步骤

#### 1. 克隆自托管仓库

```bash
cd /opt
git clone https://github.com/getsentry/self-hosted.git
cd self-hosted
```

#### 2. 运行安装脚本

```bash
# 自动化安装（约10-20分钟）
./install.sh

# 安装过程会：
# - 检查系统要求
# - 下载Docker镜像
# - 配置数据库
# - 初始化Sentry
```

#### 3. 启动服务

```bash
# 启动所有容器
docker-compose up -d

# 查看运行状态
docker-compose ps

# 查看日志
docker-compose logs -f web
```

#### 4. 访问Web界面

```
http://你的服务器IP:9000

首次访问需要：
1. 创建管理员账号
2. 创建第一个项目
3. 获取DSN（用于SDK集成）
```

### Docker Compose 配置

```yaml
# docker-compose.yml（自托管仓库自带）
services:
  web:
    image: sentry:latest
    ports:
      - "9000:9000"
    environment:
      SENTRY_SECRET_KEY: "your-secret-key"
      SENTRY_POSTGRES_HOST: postgres
      SENTRY_REDIS_HOST: redis
    depends_on:
      - postgres
      - redis
      - kafka
      - clickhouse
  
  worker:
    image: sentry:latest
    command: run worker
    depends_on:
      - web
  
  postgres:
    image: postgres:14
    volumes:
      - sentry-postgres:/var/lib/postgresql/data
  
  redis:
    image: redis:7
  
  kafka:
    image: confluentinc/cp-kafka:7.3.0
  
  clickhouse:
    image: clickhouse/clickhouse-server:23.8

volumes:
  sentry-postgres:
```

---

## 🔧 CRM系统集成

### 1. 安装Python SDK

```bash
cd /d/APP-WEB/CRM/crm-fastapi/backend
uv add "sentry-sdk[fastapi,sqlalchemy,redis]"
```

### 2. 配置环境变量

```bash
# backend/env/.env.dev
SENTRY_DSN=""  # 开发环境不启用
SENTRY_ENVIRONMENT="development"

# backend/env/.env.prod
SENTRY_DSN="http://your_dsn@服务器IP:9000/1"
SENTRY_ENVIRONMENT="production"
```

### 3. 代码集成

```python
# backend/app/main.py
import sentry_sdk
from sentry_sdk.integrations.fastapi import FastApiIntegration
from sentry_sdk.integrations.sqlalchemy import SqlalchemyIntegration
from sentry_sdk.integrations.redis import RedisIntegration

from app.config.setting import settings

def create_app():
    """创建FastAPI应用"""
    app = FastAPI()
    
    # 条件启用Sentry（仅生产环境）
    if settings.ENVIRONMENT == "prod" and settings.SENTRY_DSN:
        sentry_sdk.init(
            dsn=settings.SENTRY_DSN,
            environment=settings.SENTRY_ENVIRONMENT,
            integrations=[
                FastApiIntegration(),
                SqlalchemyIntegration(),
                RedisIntegration(),
            ],
            traces_sample_rate=1.0,  # 性能监控采样率
            send_default_pii=True,   # 发送用户信息
        )
    
    # ... 其他初始化代码
    
    return app
```

### 4. 自定义错误上报

```python
# backend/app/core/exceptions.py
import sentry_sdk
from app.core.logger import log

class CustomException(Exception):
    """自定义异常"""
    
    def __init__(self, msg: str, code: int = 500, data: dict = None):
        super().__init__(msg)
        self.msg = msg
        self.code = code
        self.data = data
        
        # 上报到Sentry（仅生产环境）
        if settings.ENVIRONMENT == "prod":
            sentry_sdk.set_context("custom_error", {
                "code": code,
                "data": data,
            })
            sentry_sdk.capture_exception(self)

# 在异常处理器中使用
@app.exception_handler(CustomException)
async def CustomExceptionHandler(request: Request, exc: CustomException):
    log.error(f"[自定义异常] {request.method} {request.url.path} | {exc.msg}")
    # Sentry已自动上报，无需手动处理
    return ErrorResponse(msg=exc.msg, code=exc.code)
```

### 5. 性能监控

```python
# backend/app/core/middlewares.py
import sentry_sdk
from starlette.middleware.base import BaseHTTPMiddleware

class PerformanceMonitorMiddleware(BaseHTTPMiddleware):
    """性能监控中间件"""
    
    async def dispatch(self, request: Request, call_next):
        # 开启Sentry事务
        with sentry_sdk.start_transaction(
            op="http.server",
            name=f"{request.method} {request.url.path}",
        ):
            response = await call_next(request)
            
            # 添加自定义标签
            sentry_sdk.set_tag("route", request.url.path)
            sentry_sdk.set_tag("method", request.method)
            
            return response

# 在main.py中注册
app.add_middleware(PerformanceMonitorMiddleware)
```

---

## 🎨 前端集成（可选）

### Vue3集成

```bash
# 安装前端SDK
cd frontend
pnpm add @sentry/vue @sentry/tracing
```

```javascript
// frontend/src/main.ts
import * as Sentry from "@sentry/vue";
import { Integrations } from "@sentry/tracing";

Sentry.init({
  app,
  dsn: import.meta.env.VITE_SENTRY_DSN,
  integrations: [
    new Integrations.BrowserTracing({
      routingInstrumentation: Sentry.vueRouterInstrumentation(router),
    }),
  ],
  tracesSampleRate: 1.0,
});
```

---

## 📊 监控能力对比

### Sentry vs 当前监控模块

| 功能 | 当前模块 | Sentry自托管 | 提升 |
|------|---------|-------------|------|
| **错误追踪** | ❌ 日志文件 | ✅ Web界面+聚合 | ⭐⭐⭐⭐⭐ |
| **错误统计** | ❌ 无 | ✅ 自动聚合分类 | ⭐⭐⭐⭐⭐ |
| **性能监控** | ❌ 无 | ✅ APM完整 | ⭐⭐⭐⭐⭐ |
| **实时告警** | ❌ 无 | ✅ 钉钉/邮件 | ⭐⭐⭐⭐⭐ |
| **用户追踪** | ❌ 无 | ✅ 关联用户ID | ⭐⭐⭐⭐ |
| **Release追踪** | ❌ 无 | ✅ 版本关联 | ⭐⭐⭐⭐ |
| **Source Maps** | ❌ 无 | ✅ 前端定位 | ⭐⭐⭐⭐ |
| **数据存储** | ⚠️ 本地文件 | ✅ PostgreSQL | ⭐⭐⭐⭐ |
| **多实例** | ❌ 分散 | ✅ 集中管理 | ⭐⭐⭐⭐⭐ |
| **团队协作** | ❌ 无 | ✅ 多用户 | ⭐⭐⭐⭐ |

### 监控维度

```
Sentry提供5层监控金字塔：

第5层: 业务监控
  - 用户转化率
  - 关键业务流程
  - 业务指标异常

第4层: 应用性能
  - 接口响应时间
  - 慢查询检测
  - 吞吐量监控

第3层: 错误追踪
  - 异常捕获和聚合
  - 堆栈追踪
  - 错误趋势分析

第2层: 系统监控
  - CPU/内存/磁盘
  - 数据库连接池
  - Redis缓存命中率

第1层: 日志管理
  - 结构化日志
  - 日志搜索过滤
  - 日志聚合分析
```

---

## 🔄 集成到当前监控模块

### 方案：保留现有模块 + 增强Sentry

**策略**：
```
保留现有4个监控模块：
  ✅ 缓存监控（Redis）- 已有前端
  ✅ 在线用户 - 已有前后端
  ✅ 资源监控 - 已有前端
  ✅ 服务器监控 - 已有前端

新增Sentry集成：
  ✅ 错误追踪（核心）
  ✅ 性能监控（APM）
  ✅ 告警通知
  ✅ 用户行为追踪
```

**前端菜单结构**：
```
监控管理
├── 错误追踪（Sentry）⭐新增
│   ├── 错误列表
│   ├── 错误趋势
│   ├── 性能分析
│   └── 告警设置
├── 缓存监控（现有）
├── 在线用户（现有）
├── 资源监控（现有）
└── 服务器监控（现有）
```

### 实现方式

**方式1: iframe嵌入（快速）**
```vue
<!-- frontend/src/views/module_monitor/sentry/index.vue -->
<template>
  <div class="sentry-container">
    <iframe 
      src="http://sentry-server:9000" 
      width="100%" 
      height="100%"
      frameborder="0"
    />
  </div>
</template>
```

**方式2: API对接（推荐）**
```python
# backend/app/plugin/module_monitor/sentry/controller.py
from fastapi import APIRouter
import requests

router = APIRouter(prefix="/monitor/sentry", tags=["监控管理-Sentry"])

@router.get("/projects")
async def get_projects():
    """获取Sentry项目列表"""
    sentry_api = "http://sentry-server:9000/api/0/projects/"
    headers = {"Authorization": f"Bearer {settings.SENTRY_AUTH_TOKEN}"}
    response = requests.get(sentry_api, headers=headers)
    return response.json()

@router.get("/errors")
async def get_errors(project_id: str):
    """获取错误列表"""
    sentry_api = f"http://sentry-server:9000/api/0/projects/{project_id}/events/"
    headers = {"Authorization": f"Bearer {settings.SENTRY_AUTH_TOKEN}"}
    response = requests.get(sentry_api, headers=headers)
    return response.json()
```

---

## 📈 后续提升路径

### 阶段1: 基础集成（1-2周）

**目标**：
- ✅ 部署Sentry自托管
- ✅ FastAPI集成sentry-sdk
- ✅ 错误自动上报
- ✅ Web界面查看错误

**交付物**：
- Sentry Docker部署完成
- CRM系统错误追踪上线
- 开发团队可访问Sentry

---

### 阶段2: 性能监控（2-3周）

**目标**：
- ✅ APM性能监控
- ✅ 接口响应时间统计
- ✅ 慢查询检测
- ✅ 性能趋势分析

**交付物**：
- 性能监控仪表盘
- 慢查询优化报告
- 性能瓶颈分析

---

### 阶段3: 告警通知（1周）

**目标**：
- ✅ 钉钉/企业微信告警
- ✅ 邮件通知
- ✅ 告警规则配置
- ✅ 告警分级（P0/P1/P2）

**交付物**：
- 告警配置文档
- 告警响应流程
- 值班人员配置

---

### 阶段4: 高级功能（持续）

**目标**：
- ✅ Release追踪
- ✅ 用户行为分析
- ✅ Source Maps（前端）
- ✅ 自定义仪表盘
- ✅ 自动化修复建议

**交付物**：
- 完整监控体系
- 监控SOP文档
- 团队培训材料

---

## ⚠️ 注意事项

### 数据安全

**敏感信息过滤**：
```python
# 不要上报敏感数据
sentry_sdk.init(
    dsn=settings.SENTRY_DSN,
    before_send=lambda event, hint: filter_sensitive_data(event),
)

def filter_sensitive_data(event):
    """过滤敏感数据"""
    if "request" in event:
        # 移除密码、token等
        event["request"].pop("headers", None)
        event["request"].pop("data", None)
    return event
```

### 性能影响

**SDK性能**：
- ✅ 异步上报，不阻塞业务
- ✅ 采样率控制（1%~100%）
- ✅ 本地缓存，网络失败不丢失

**服务器资源**：
- Sentry自托管占用约4-6GB内存
- 建议独立服务器部署
- 定期清理旧数据（默认保留90天）

### 备份策略

**数据库备份**：
```bash
# PostgreSQL备份
docker exec sentry-postgres pg_dump -U postgres sentry > sentry_backup.sql

# 定期备份（crontab）
0 2 * * * docker exec sentry-postgres pg_dump -U postgres sentry | gzip > /backup/sentry_$(date +\%Y\%m\%d).sql.gz
```

---

## 📚 参考资料

- Sentry官方文档: https://docs.sentry.io
- Python SDK文档: https://docs.sentry.io/platforms/python/
- FastAPI集成指南: https://docs.sentry.io/platforms/python/guides/fastapi/
- 自托管部署文档: https://develop.sentry.dev/self-hosted/
- GitHub仓库: https://github.com/getsentry/sentry

---

##  实施建议

### 开发顺序建议

**推荐方案：先完成表结构 → 再生成前后端 → 最后集成Sentry**

**理由**：
1. ✅ 表结构是核心基础，优先级最高
2. ✅ 代码生成器可批量生成CRUD，效率高
3. ✅ Sentry是监控增强，可在功能完善后集成
4. ✅ 避免中途切换上下文，保持开发连贯性

**详细路线**：
```
阶段1: 表结构完善（1-2周）
  ✅ 使用代码生成器导入所有表
  ✅ 配置软删除字段
  ✅ 生成前后端代码
  
阶段2: 功能开发（2-3周）
  ✅ 业务逻辑实现
  ✅ 前后端联调
  ✅ 测试验证
  
阶段3: Sentry集成（3-5天）
  ✅ 部署自托管Sentry
  ✅ 集成sentry-sdk
  ✅ 配置告警规则
  
阶段4: 监控完善（持续）
  ✅ 性能监控
  ✅ 告警优化
  ✅ 监控SOP
```

### 是否可以完全集成到当前监控模块？

**答案：可以，且推荐！**

**集成方式**：
1. ✅ 保留现有4个监控模块（缓存、在线用户、资源、服务器）
2. ✅ 新增"Sentry错误追踪"模块
3. ✅ 统一菜单结构，统一风格
4. ✅ 可选择iframe嵌入或API对接

**优势**：
- ✅ 监控能力大幅提升（错误追踪+性能监控+告警）
- ✅ 统一的监控入口，用户体验更好
- ✅ 便于后续扩展（可继续添加Prometheus、Grafana等）
- ✅ 完全免费，无错误数量限制

---

## ✅ 总结

Sentry自托管是一个**强大的错误追踪和性能监控系统**，可以完全集成到当前CRM系统的监控模块中，并且：

1. **比当前监控更完善**：提供错误聚合、性能监控、告警通知等完整能力
2. **更强大**：企业级监控平台，支持大规模应用
3. **利于后续提升**：可扩展APM、用户行为分析、Release追踪等高级功能
4. **完全免费**：自托管无任何限制，数据完全私有

**建议：采用"先功能后监控"的开发顺序，在表结构和功能完成后集成Sentry，快速提升系统监控能力。**
