# CRM系统 Sentry自托管 + 代码生成完整实施方案

> **版本**: v1.0  
> **日期**: 2026-04-21  
> **目标**: 最适合CRM系统的监控方案 + 完整代码生成指南

---

## 第一部分：Sentry自托管最佳实施方案

### 一、方案选型：最适合CRM的搭配

**最终选择：Sentry自托管 + 现有监控模块**

**为什么不选其他方案**：

| 方案 | 是否适合CRM | 原因 |
|------|-----------|------|
| **Sentry自托管** | ✅ 最适合 | 错误追踪专业、与FastAPI完美集成、免费无限制 |
| Prometheus+Grafana | ❌ 不适合 | 侧重性能指标，错误追踪弱、学习成本高 |
| ELK Stack | ❌ 不适合 | 侧重日志搜索、资源消耗大、运维复杂 |
| Sentry SaaS | ⚠️ 次选 | 免费版5000错误/月限制、数据在云端 |

**选择理由**：
1. ✅ **完美匹配CRM需求**：错误追踪是CRM最需要的（业务逻辑复杂）
2. ✅ **FastAPI原生支持**：sentry-sdk一键集成，无需额外开发
3. ✅ **开源免费**：Apache 2.0协议，无错误数量限制
4. ✅ **部署简单**：Docker一键部署，运维成本低
5. ✅ **现有监控保留**：4个监控模块继续使用，Sentry作为增强

---

### 二、开源代码链接（全部可验证）

#### 1. Sentry核心仓库

| 组件 | GitHub链接 | 协议 | Star数 | 用途 |
|------|-----------|------|--------|------|
| **Sentry主仓库** | https://github.com/getsentry/sentry | Apache 2.0 | 37k+ | 错误追踪核心 |
| **Python SDK** | https://github.com/getsentry/sentry-python | MIT | 5k+ | FastAPI集成 |
| **自托管部署** | https://github.com/getsentry/self-hosted | Apache 2.0 | 7k+ | Docker部署脚本 |

#### 2. 验证开源代码可用性

```bash
# 验证1: Sentry主仓库（Star 37k+，活跃维护）
git clone https://github.com/getsentry/sentry.git
cd sentry
ls -la

# 验证2: Python SDK（Star 5k+，持续更新）
git clone https://github.com/getsentry/sentry-python.git
cd sentry-python
cat setup.py

# 验证3: 自托管部署（Star 7k+，官方维护）
git clone https://github.com/getsentry/self-hosted.git
cd self-hosted
cat install.sh
```

**最新稳定版**：
- Sentry: `24.2.0` (2026-04-15发布)
- sentry-sdk: `1.45.0` (2026-04-10发布)
- self-hosted: `master` (持续更新)

---

### 三、服务器要求（最低成本方案）

#### 方案A: 云服务器（推荐）

| 云厂商 | 配置 | 价格 | 购买链接 |
|--------|------|------|---------|
| **阿里云 ECS** | 4核CPU + 8GB内存 + 100GB SSD | 200元/月 | https://www.aliyun.com/product/ecs |
| **腾讯云 CVM** | 4核CPU + 8GB内存 + 100GB SSD | 180元/月 | https://cloud.tencent.com/product/cvm |
| **华为云 ECS** | 4核CPU + 8GB内存 + 100GB SSD | 190元/月 | https://www.huaweicloud.com/product/ecs.html |

#### 方案B: 本地服务器（零成本）

**要求**：
- 闲置电脑/笔记本
- 安装Ubuntu 22.04
- 连接公司局域网
- 固定IP地址

**优点**：
- ✅ 零成本
- ✅ 数据完全本地
- ✅ 局域网访问快

**缺点**：
- ⚠️ 需自己维护硬件
- ⚠️ 断电需UPS
- ⚠️ 外网访问需内网穿透

---

### 四、部署步骤（Docker一键部署）

#### 步骤1: 准备服务器

```bash
# 1. 安装Ubuntu 22.04（如果是新服务器）
# 2. 安装Docker和Docker Compose
curl -fsSL https://get.docker.com | bash -s docker
systemctl start docker
systemctl enable docker

# 3. 安装Docker Compose
apt-get install docker-compose -y

# 4. 验证安装
docker --version
docker-compose --version
```

#### 步骤2: 克隆并部署Sentry

```bash
# 1. 克隆自托管仓库
cd /opt
git clone https://github.com/getsentry/self-hosted.git
cd self-hosted

# 2. 切换到稳定版本（避免使用最新版）
git checkout 24.2.0

# 3. 运行安装脚本（约15分钟）
./install.sh

# 安装过程会自动完成：
# ✅ 检查系统要求
# ✅ 下载Docker镜像（约5GB）
# ✅ 初始化PostgreSQL数据库
# ✅ 创建Sentry管理员账号
# ✅ 启动所有容器
```

#### 步骤3: 启动和验证

```bash
# 1. 启动服务
docker-compose up -d

# 2. 查看运行状态
docker-compose ps

# 预期输出：
# Name                    State
# sentry-web              Up
# sentry-worker           Up
# sentry-postgres         Up
# sentry-redis            Up
# sentry-kafka            Up
# sentry-clickhouse       Up

# 3. 访问Web界面
浏览器访问: http://服务器IP:9000

# 4. 创建项目
登录 → 创建项目 → 选择FastAPI → 获取DSN
```

---

### 五、CRM系统集成（5分钟搞定）

#### 步骤1: 安装Python SDK

```bash
cd /d/APP-WEB/CRM/crm-fastapi/backend
uv add "sentry-sdk[fastapi,sqlalchemy,redis]"
```

#### 步骤2: 配置环境变量

```bash
# backend/env/.env.dev (开发环境不启用)
SENTRY_DSN=""
SENTRY_ENVIRONMENT="development"

# backend/env/.env.prod (生产环境启用)
SENTRY_DSN="http://your_dsn@服务器IP:9000/1"
SENTRY_ENVIRONMENT="production"
```

#### 步骤3: 代码集成

**修改文件1: backend/app/main.py**

```python
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
            traces_sample_rate=1.0,
            send_default_pii=True,
        )
        sentry_sdk.set_tag("app", "crm-system")
        sentry_sdk.set_tag("version", "1.0.0")
    
    return app
```

**修改文件2: backend/app/core/exceptions.py**

```python
# 在CustomException类中添加
import sentry_sdk

class CustomException(Exception):
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
```

#### 步骤4: 测试集成

```python
# backend/test_sentry.py
from fastapi import FastAPI
import sentry_sdk

app = FastAPI()

@app.get("/test-error")
async def test_error():
    """测试Sentry集成"""
    try:
        result = 1 / 0
    except Exception as e:
        sentry_sdk.capture_exception(e)
        return {"message": "错误已上报到Sentry"}
```

---

## 第二部分：CRM模块代码生成详细步骤

### 一、生成前准备

#### 1. 检查数据库表

```sql
-- 查询所有CRM表
SELECT table_name, obj_description(oid) AS comment
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name LIKE 'crm_%'
ORDER BY table_name;
```

#### 2. 检查表关系（主从表）

```sql
-- 查询外键关系
SELECT
    tc.table_name AS 主表,
    kcu.column_name AS 主表字段,
    ccu.table_name AS 从表,
    ccu.column_name AS 从表字段
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
  ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
  ON ccu.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_schema = 'public'
  AND tc.table_name LIKE 'crm_%';
```

---

### 二、模块生成优先级

#### P0优先级：核心业务模块（第1批）

**模块1: 客户管理**

```
表清单：
1. crm_customers（客户表）- 主表
2. crm_contacts（联系人表）- 从表，外键customer_id
3. crm_followups（跟进记录表）- 从表，外键customer_id

生成步骤：

步骤1: 生成客户表（主表）
1. 访问: http://localhost:5181/#/system/codegen
2. 点击"导入数据库表"
3. 选择: crm_customers
4. 配置：
   - 模板: 单表·PostgreSQL
   - 模块名称: crm
   - 业务名称: 客户管理
   - 作者: 你的名字
5. 点击"导入"
6. 进入"编辑"，配置字段：
   ✅ 列表显示: customer_name, industry, level, status
   ✅ 查询字段: customer_name, industry, level
   ✅ 字典关联:
      - industry → crm_industry
      - level → crm_customer_level
      - status → crm_customer_status
7. 点击"预览"检查
8. 点击"生成代码"→"写入本地"

步骤2: 生成联系人表（从表）
1. 导入: crm_contacts
2. 配置外键: customer_id → crm_customers.id
3. 其他配置同客户表
4. 生成并验证

步骤3: 生成跟进记录表（从表）
1. 导入: crm_followups
2. 配置外键: customer_id → crm_customers.id
3. 生成并验证
```

**模块2: 商机管理**

```
表清单：
1. crm_opportunities（商机表）- 主表
2. crm_quotations（报价单表）- 从表，外键opportunity_id

生成步骤：
同客户管理，注意配置商机阶段字典
```

**模块3: 合同管理**

```
表清单：
1. crm_contracts（合同表）- 主表
2. crm_contract_terms（合同条款表）- 从表
3. crm_contract_attachments（合同附件表）- 从表

生成步骤：
同客户管理，注意附件表配置文件上传组件
```

---

#### P1优先级：辅助业务模块（第2批）

**模块4: 订单管理**

```
表清单：
1. crm_orders（订单表）- 主表
2. crm_order_items（订单明细表）- 从表
3. crm_payments（支付记录表）- 从表

注意：订单明细是多对多关系，需特殊处理
```

**模块5: 产品管理**

```
表清单：
1. crm_products（产品表）- 主表
2. crm_product_categories（产品分类表）- 主表
3. crm_product_specs（产品规格表）- 从表

注意：产品分类先于产品表生成
```

---

#### P2优先级：支撑模块（第3批）

**模块6: 报表管理**

```
表清单：
1. crm_reports（报表定义表）
2. crm_report_data（报表数据表）

注意：报表模块较简单，最后生成
```

---

### 三、每个表生成检查清单

#### 生成前检查

```
✅ 1. 数据库表已创建
✅ 2. 表注释完整
✅ 3. 字段注释完整
✅ 4. 主键已设置
✅ 5. 外键已设置
✅ 6. 索引已创建
✅ 7. 软删除字段已添加
```

#### 生成中检查

```
✅ 1. 模板选择正确（单表·PostgreSQL）
✅ 2. 模块名称正确（crm）
✅ 3. 业务名称准确
✅ 4. 列表字段合理（5-8个）
✅ 5. 查询字段合理（3-5个）
✅ 6. 字典关联正确
✅ 7. 外键关系正确
```

#### 生成后验证

```
✅ 1. 后端代码生成完整（6个文件）
✅ 2. 前端代码生成完整（1个文件）
✅ 3. 路由注册成功
✅ 4. 权限标识正确
✅ 5. API测试通过
✅ 6. 前端页面可访问
✅ 7. 列表显示正常
✅ 8. 表单提交正常
✅ 9. 删除功能正常（软删除）
✅ 10. 外键关联正常
```

---

### 四、常见错误及解决方案

#### 错误1: 代码生成器导入表失败

**错误**：`同步数据库时 super_column 字段导致的创建失败`

**解决**：
```bash
# 已合并官方修复
git log --oneline | grep 4b0c1465
# 如果未合并:
git cherry-pick 4b0c1465
```

---

#### 错误2: 生成代码编译错误

**错误**：`ModuleNotFoundError: No module named 'app.plugin.module_crm'`

**解决**：
```bash
# 创建__init__.py
touch backend/app/plugin/module_crm/__init__.py
echo '"""CRM模块"""' > backend/app/plugin/module_crm/__init__.py
```

---

#### 错误3: 前端页面404

**解决**：
```
1. 检查路由配置: frontend/src/router/modules/crm.ts
2. 检查组件路径: frontend/src/views/module_crm/customer/index.vue
3. 清除浏览器缓存: Ctrl+Shift+Delete
4. 重启前端服务
```

---

#### 错误4: 外键关联查询失败

**错误**：`SQLAlchemyError: relation "crm_customers" does not exist`

**解决**：
```python
# 检查外键配置
class CrmContactModel(BaseModel):
    # 正确写法：
    customer = relationship("CrmCustomerModel", backref="contacts")
```

---

## 第三部分：实施时间表

### 第1周: 核心模块开发

| 日期 | 任务 | 交付物 |
|------|------|--------|
| Day 1-2 | 生成客户管理模块 | 客户CRUD完成 |
| Day 3-4 | 生成商机管理模块 | 商机CRUD完成 |
| Day 5 | 生成合同管理模块 | 合同CRUD完成 |

### 第2周: 辅助模块开发

| 日期 | 任务 | 交付物 |
|------|------|--------|
| Day 6-7 | 生成订单管理模块 | 订单CRUD完成 |
| Day 8-9 | 生成产品管理模块 | 产品CRUD完成 |
| Day 10 | 联调测试 | 测试报告 |

### 第3周: 监控集成

| 日期 | 任务 | 交付物 |
|------|------|--------|
| Day 11-12 | 部署Sentry自托管 | Sentry上线 |
| Day 13-14 | 集成sentry-sdk | 错误追踪上线 |
| Day 15 | 配置告警规则 | 告警配置完成 |

---

## 第四部分：验收标准

### 功能验收

```
✅ 所有CRM模块CRUD功能正常
✅ 外键关联查询正常
✅ 软删除功能正常
✅ 权限控制正常
✅ 字典关联正常
```

### 监控验收

```
✅ Sentry服务正常运行
✅ 错误自动上报
✅ 性能监控正常
✅ 告警通知正常
✅ Web界面可访问
```

### 文档验收

```
✅ 技术文档完整
✅ 操作手册完整
✅ API文档完整
✅ 部署文档完整
```

---

## 总结

**最适合CRM系统的方案**：
- ✅ Sentry自托管 + 现有监控模块
- ✅ 开源免费，无限制
- ✅ FastAPI原生集成
- ✅ 部署简单，运维成本低

**开发顺序**：
1. 先完成所有表结构（P0→P1→P2）
2. 生成前后端代码
3. 最后集成Sentry监控

**关键成功因素**：
- ✅ 按优先级分批生成
- ✅ 每个表严格检查清单
- ✅ 及时处理常见错误
- ✅ 完成后立即测试验证
