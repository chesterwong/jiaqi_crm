# CRM业务表与FastapiAdmin系统表关联方案

> **版本**: v1.0  
> **日期**: 2026-04-26  
> **数据库**: PostgreSQL 16  
> **适用范围**: FastapiAdmin框架 + CRM客户管理系统

---

## 📋 目录

1. [系统核心25张表清单](#一系统核心25张表清单)
2. [CRM业务表分类统计](#二crm业务表分类统计)
3. [关联关系分析](#三关联关系分析)
4. [正确的关联策略](#四正确的关联策略)
5. [错误的关联及修正](#五错误的关联及修正)
6. [实施建议](#六实施建议)

---

## 一、系统核心25张表清单

### 1.1 系统管理模块（sys_前缀）

| 序号 | 表名 | 说明 | 用途 |
|------|------|------|------|
| 1 | sys_user | 用户表 | 系统用户账号 |
| 2 | sys_role | 角色表 | RBAC权限角色 |
| 3 | sys_menu | 菜单表 | 前端路由菜单 |
| 4 | sys_dept | 部门表 | 组织架构部门 |
| 5 | sys_position | 岗位表 | 用户岗位信息 |
| 6 | sys_dict_type | 字典类型表 | 数据字典分类 |
| 7 | sys_dict_data | 字典数据表 | 数据字典项 |
| 8 | sys_config | 配置表 | 系统参数配置 |
| 9 | sys_notice | 通知公告表 | 系统通知 |
| 10 | sys_log | 操作日志表 | 用户操作记录 |
| 11 | sys_tenant | 租户表 | 多租户支持 |
| 12 | sys_user_roles | 用户角色关联表 | 用户-角色多对多 |
| 13 | sys_role_menus | 角色菜单关联表 | 角色-菜单多对多 |
| 14 | sys_role_depts | 角色部门关联表 | 角色-部门多对多 |
| 15 | sys_user_positions | 用户岗位关联表 | 用户-岗位多对多 |

### 1.2 应用模块（app_前缀）

| 序号 | 表名 | 说明 | 用途 |
|------|------|------|------|
| 16 | app_portal | 门户应用表 | 应用入口配置 |

### 1.3 任务调度模块（apscheduler_前缀）

| 序号 | 表名 | 说明 | 用途 |
|------|------|------|------|
| 17 | apscheduler_jobs | APScheduler任务表 | 定时任务存储 |

### 1.4 代码生成模块（gen_前缀）

| 序号 | 表名 | 说明 | 用途 |
|------|------|------|------|
| 18 | gen_table | 代码生成表配置 | 生成器元数据 |
| 19 | gen_table_column | 代码生成字段配置 | 生成器字段元数据 |
| 20 | gen_demo | 演示表1 | 示例表 |
| 21 | gen_demo01 | 演示表2 | 示例表 |

### 1.5 任务工作流模块（task_前缀）

| 序号 | 表名 | 说明 | 用途 |
|------|------|------|------|
| 22 | task_workflow | 工作流定义表 | 工作流模板 |
| 23 | task_node | 工作流节点表 | 流程节点 |
| 24 | task_workflow_node_type | 节点类型表 | 节点类型定义 |

### 1.6 其他系统表

| 序号 | 表名 | 说明 | 用途 |
|------|------|------|------|
| 25 | （预留） | - | 未来扩展 |

---

## 二、CRM业务表分类统计

### 2.1 CRM核心业务表（共68张）

#### A. 客户管理（15张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_customers | 客户主表 | sys_user(owner_id, created_id, updated_id, deleted_id), sys_dept(department_id) |
| crm_contacts | 联系人表 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id) |
| crm_customer_addresses | 客户地址表 | sys_user(created_id), crm_customers(customer_id) |
| crm_customer_attachments | 客户附件表 | sys_user(created_id, updated_id, deleted_id, uploader_id), crm_customers(customer_id) |
| crm_customer_profiles | 客户画像表 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id) |
| crm_customer_tags | 客户标签关联表 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id), crm_tag_definitions(tag_id) |
| crm_customer_timeline | 客户时间线 | sys_user(created_id, updated_id, deleted_id, operator_id), crm_customers(customer_id) |
| crm_customer_activities | 客户活动记录 | sys_user(created_id, updated_id, deleted_id, operator_id), crm_customers(customer_id) |
| crm_customer_change_logs | 客户变更日志 | sys_user(created_id, updated_id, deleted_id, operator_id), crm_customers(customer_id) |
| crm_customer_pool_logs | 客户公海池日志 | sys_user(created_id, updated_id, deleted_id, operator_id), crm_customers(customer_id) |
| crm_customer_health | 客户健康度 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id) |
| crm_customer_health_scores | 健康度评分历史 | sys_user(created_id, deleted_id), crm_customers(customer_id) |
| crm_customer_satisfaction_surveys | 满意度调查 | sys_user(created_id, updated_id, deleted_id, follow_up_by), crm_customers(customer_id), crm_contacts(contact_id), crm_orders(order_id) |
| crm_customer_duplicate_logs | 客户查重日志 | sys_user(created_id, updated_id, deleted_id, handled_by) |
| crm_contact_relations | 联系人关系表 | sys_user(created_id, updated_id, deleted_id), crm_contacts(contact_id) |
| crm_contact_visits | 联系人拜访记录 | sys_user(created_id, updated_id, deleted_id, visitor_id), crm_customers(customer_id), crm_contacts(contact_id) |
| crm_contact_change_logs | 联系人变更日志 | sys_user(created_id, updated_id, deleted_id, operator_id), crm_customers(customer_id), crm_contacts(contact_id) |

#### B. 销售机会（8张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_opportunities | 销售机会表 | sys_user(owner_id, created_id, updated_id, deleted_id), crm_customers(customer_id) |
| crm_opportunity_stages | 机会阶段定义 | sys_user(created_id, updated_id, deleted_id) |
| crm_opportunity_products | 机会产品关联表 | sys_user(created_id, updated_id, deleted_id), crm_opportunities(opportunity_id), crm_products(product_id) |
| crm_followups | 跟进记录表 | sys_user(created_id, deleted_id), crm_customers(customer_id), crm_contacts(contact_id) |
| crm_follow_records | 跟进详情表 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id), crm_contacts(contact_id), crm_opportunities(opportunity_id) |
| crm_sales_activities | 销售活动表 | sys_user(created_id, deleted_id), crm_customers(customer_id), crm_contacts(contact_id), crm_opportunities(opportunity_id) |
| crm_joint_followups | 联合跟进表 | sys_user(assigned_by, created_id, updated_id, deleted_id), crm_opportunities(opportunity_id) |
| crm_call_records | 通话记录表 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id), crm_contacts(contact_id) |

#### C. 合同订单（12张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_contracts | 合同表 | sys_user(owner_id, approved_by, created_id, updated_id, deleted_id), crm_customers(customer_id), crm_opportunities(opportunity_id), crm_quotations(quotation_id) |
| crm_contract_items | 合同明细表 | sys_user(created_id, updated_id, deleted_id), crm_contracts(contract_id), crm_products(product_id) |
| crm_contract_invoices | 合同发票表 | sys_user(created_id, updated_id, deleted_id, issued_by), crm_contracts(contract_id) |
| crm_quotations | 报价单表 | sys_user(approved_by, created_id, updated_id, deleted_id), crm_customers(customer_id), crm_opportunities(opportunity_id) |
| crm_quotation_items | 报价明细表 | sys_user(created_id, updated_id, deleted_id), crm_quotations(quotation_id), crm_products(product_id) |
| crm_orders | 订单表 | sys_user(owner_id, created_id, deleted_id), crm_customers(customer_id), crm_contracts(contract_id) |
| crm_order_items | 订单明细表 | sys_user(created_id, deleted_id), crm_orders(order_id), crm_products(product_id) |
| crm_invoices | 发票表 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id), crm_orders(order_id), crm_contracts(contract_id) |
| crm_payments | 收款记录表 | sys_user(confirmed_by, created_id, updated_id, deleted_id), crm_customers(customer_id), crm_orders(order_id), crm_contracts(contract_id), crm_invoices(invoice_id) |
| crm_deliveries | 发货记录表 | sys_user(created_id, updated_id, deleted_id), crm_orders(order_id) |
| crm_renewals | 续约管理表 | sys_user(owner_id, created_id, updated_id, deleted_id), crm_customers(customer_id) |
| crm_approval_records | 审批记录表 | sys_user(created_id, updated_id, deleted_id, approver_id) |

#### D. 线索营销（6张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_leads | 线索表 | sys_user(owner_id, created_id, updated_id, deleted_id), crm_campaigns(campaign_id) |
| crm_lead_scores | 线索评分表 | sys_user(created_id, updated_id, deleted_id), crm_leads(lead_id) |
| crm_campaigns | 营销活动表 | sys_user(owner_id, created_id, updated_id, deleted_id), sys_dept(department_id) |
| crm_campaign_leads | 活动线索关联表 | sys_user(created_id, updated_id, deleted_id), crm_campaigns(campaign_id), crm_leads(lead_id) |
| crm_marketing_campaigns | 市场推广活动 | sys_user(owner_id, created_id, updated_id, deleted_id) |
| crm_marketing_channels | 营销渠道表 | sys_user(created_id, updated_id, deleted_id) |

#### E. 产品管理（9张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_products | 产品表 | sys_user(created_id, updated_id, deleted_id), crm_product_categories(category_id) |
| crm_product_categories | 产品分类表 | sys_user(created_id, updated_id, deleted_id) |
| crm_product_skus | 产品SKU表 | sys_user(created_id, deleted_id), crm_products(product_id) |
| crm_product_prices | 产品价格表 | sys_user(approved_by, created_id, updated_id, deleted_id), crm_products(product_id), crm_customers(customer_id) |
| crm_product_price_history | 价格历史记录 | sys_user(approved_by, created_id, updated_id, deleted_id, operator_id), crm_products(product_id) |
| crm_product_price_policies | 价格政策表 | sys_user(created_id, deleted_id), crm_products(product_id), crm_customers(customer_id) |
| crm_product_documents | 产品文档表 | sys_user(created_id, updated_id, deleted_id), crm_products(product_id) |
| crm_price_tiers | 价格阶梯表 | sys_user(created_id, updated_id, deleted_id) |
| crm_competitors | 竞争对手表 | sys_user(created_id, updated_id, deleted_id) |

#### F. AI智能（4张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_ai_customer_profiles | AI客户画像 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id) |
| crm_ai_recommendations | AI推荐结果 | sys_user(created_id, updated_id, deleted_id) |
| crm_ai_tags | AI标签表 | sys_user(created_id, updated_id, deleted_id) |
| crm_alert_rules | 预警规则表 | sys_user(created_id, updated_id, deleted_id) |

#### G. 数据字典与标签（5张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_data_dicts | CRM数据字典 | sys_user(created_id, updated_id, deleted_id) |
| crm_tag_definitions | 标签定义表 | sys_user(created_id, updated_id, deleted_id) |
| crm_tags | 标签表 | sys_user(created_id, updated_id, deleted_id) |
| crm_import_records | 导入记录表 | sys_user(created_id, deleted_id) |
| crm_operation_logs | 操作日志表 | sys_user(created_id, updated_id, deleted_id) |

#### H. 报表与分析（4张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_report_templates | 报表模板表 | sys_user(owner_id, created_id, updated_id, deleted_id) |
| crm_report_instances | 报表示例表 | sys_user(generated_by, created_id, updated_id, deleted_id), crm_report_templates(template_id) |
| crm_sales_targets | 销售目标表 | sys_user(owner_id, created_id, deleted_id) |
| crm_notifications | 通知表 | sys_user(created_id, updated_id, deleted_id) |

#### I. 工作流与任务（5张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_tasks | 任务表 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id), crm_contacts(contact_id), crm_opportunities(opportunity_id), crm_contracts(contract_id) |
| crm_workflow_rules | 工作流规则表 | sys_user(created_id, updated_id, deleted_id) |
| crm_workflow_approvals | 工作流审批表 | sys_user(created_id, updated_id, deleted_id) |
| crm_workflow_logs | 工作流日志表 | sys_user(created_id, updated_id, deleted_id), crm_customers(customer_id), crm_opportunities(opportunity_id) |
| crm_pool_transfers | 公海转移表 | sys_user(operator_id, created_id, updated_id, deleted_id), crm_customers(customer_id) |

#### J. 其他（2张）

| 表名 | 说明 | 关联系统表 |
|------|------|-----------|
| crm_user_extensions | 用户扩展表 | sys_user(created_id, updated_id, deleted_id) |
| crm_test_monitor_report | 测试监控报告 | sys_user(created_id, updated_id, created_by, updated_by) |

---

## 三、关联关系分析

### 3.1 正确的关联模式

#### ✅ 模式1: 审计字段关联（必须）

**所有CRM业务表都必须包含以下字段并关联到sys_user表**：

```sql
-- 标准审计字段
created_id    INTEGER REFERENCES sys_user(id) ON DELETE SET NULL  -- 创建人
updated_id    INTEGER REFERENCES sys_user(id) ON DELETE SET NULL  -- 更新人
deleted_id    INTEGER REFERENCES sys_user(id) ON DELETE SET NULL  -- 删除人
```

**适用表**：所有68张CRM表

**示例**：
```sql
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_created_by" 
FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;

ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_updated_by" 
FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;

ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "crm_customers_deleted_id_fkey" 
FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;
```

---

#### ✅ 模式2: 负责人关联（常用）

**业务表需要指定负责人时，关联到sys_user表**：

```sql
owner_id      INTEGER REFERENCES sys_user(id) ON DELETE SET NULL  -- 负责人/所有者
```

**适用表**：
- crm_customers (客户负责人)
- crm_opportunities (机会负责人)
- crm_leads (线索负责人)
- crm_contracts (合同负责人)
- crm_orders (订单负责人)
- crm_campaigns (活动负责人)
- crm_renewals (续约负责人)
- crm_report_templates (报表负责人)
- crm_sales_targets (目标负责人)

**示例**：
```sql
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_owner" 
FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;
```

---

#### ✅ 模式3: 部门关联（可选）

**需要按部门过滤数据时，关联到sys_dept表**：

```sql
department_id INTEGER REFERENCES sys_dept(id) ON DELETE SET NULL  -- 所属部门
```

**适用表**：
- crm_customers (客户所属部门)
- crm_campaigns (活动所属部门)

**示例**：
```sql
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_dept" 
FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept" ("id") 
ON DELETE SET NULL;
```

---

#### ✅ 模式4: 租户关联（多租户场景）

**如果启用多租户，关联到sys_tenant表**：

```sql
tenant_id     INTEGER REFERENCES sys_tenant(id) ON DELETE RESTRICT  -- 租户ID
```

**当前状态**：❌ **CRM表中未使用租户关联**

**原因**：
- 当前项目为单租户（100人公司内部使用）
- 不需要多租户隔离
- 避免过度设计

**建议**：保持现状，不添加租户关联

---

#### ✅ 模式5: CRM内部业务关联

**CRM业务表之间的关联（不涉及系统表）**：

```sql
-- 客户相关
customer_id   INTEGER REFERENCES crm_customers(id) ON DELETE SET NULL

-- 联系人相关
contact_id    INTEGER REFERENCES crm_contacts(id) ON DELETE SET NULL

-- 机会相关
opportunity_id INTEGER REFERENCES crm_opportunities(id) ON DELETE SET NULL

-- 合同相关
contract_id   INTEGER REFERENCES crm_contracts(id) ON DELETE SET NULL

-- 订单相关
order_id      INTEGER REFERENCES crm_orders(id) ON DELETE SET NULL

-- 产品相关
product_id    INTEGER REFERENCES crm_products(id) ON DELETE SET NULL

-- 报价相关
quotation_id  INTEGER REFERENCES crm_quotations(id) ON DELETE SET NULL

-- 发票相关
invoice_id    INTEGER REFERENCES crm_invoices(id) ON DELETE SET NULL

-- 线索相关
lead_id       INTEGER REFERENCES crm_leads(id) ON DELETE SET NULL

-- 活动相关
campaign_id   INTEGER REFERENCES crm_campaigns(id) ON DELETE SET NULL

-- 标签相关
tag_id        INTEGER REFERENCES crm_tag_definitions(id) ON DELETE SET NULL

-- 模板相关
template_id   INTEGER REFERENCES crm_report_templates(id) ON DELETE SET NULL
```

---

### 3.2 关联统计汇总

| 关联类型 | 关联系统表 | 涉及CRM表数量 | 外键数量 |
|---------|-----------|--------------|---------|
| 审计字段 | sys_user | 68张 | 204个 (created_id, updated_id, deleted_id) |
| 负责人 | sys_user | 9张 | 9个 (owner_id) |
| 部门 | sys_dept | 2张 | 2个 (department_id) |
| 租户 | sys_tenant | 0张 | 0个 |
| 其他系统表 | - | 0张 | 0个 |
| **总计** | **2张系统表** | **68张CRM表** | **215个外键** |

---

## 四、正确的关联策略

### 4.1 核心原则

#### ✅ 原则1: 最小化系统表依赖

**只关联必要的系统表**：
- ✅ sys_user (用户表) - 必须
- ✅ sys_dept (部门表) - 可选
- ❌ sys_role (角色表) - 不直接关联，通过RBAC权限控制
- ❌ sys_menu (菜单表) - 不关联，菜单独立管理
- ❌ sys_dict_type/sys_dict_data - 不关联，使用字符串枚举
- ❌ 其他系统表 - 不关联

**理由**：
1. 降低耦合度，便于系统表独立升级
2. 避免循环依赖
3. 简化数据迁移
4. 提高查询性能

---

#### ✅ 原则2: 审计字段标准化

**所有CRM表统一使用以下审计字段**：

```python
# Python Model定义示例
from sqlalchemy import Column, Integer, DateTime, Boolean, func
from app.core.base_model import Base

class Customer(Base):
    __tablename__ = "crm_customers"
    
    # === 业务字段 ===
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100), nullable=False)
    
    # === 审计字段 (必须) ===
    created_id = Column(Integer, ForeignKey("sys_user.id"), comment="创建人ID")
    updated_id = Column(Integer, ForeignKey("sys_user.id"), comment="更新人ID")
    deleted_id = Column(Integer, ForeignKey("sys_user.id"), comment="删除人ID")
    created_time = Column(DateTime, server_default=func.now(), comment="创建时间")
    updated_time = Column(DateTime, server_default=func.now(), onupdate=func.now(), comment="更新时间")
    is_deleted = Column(Boolean, default=False, comment="逻辑删除标记")
```

**SQL外键约束**：
```sql
-- 创建人
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_created_by" 
FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;

-- 更新人
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_updated_by" 
FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;

-- 删除人
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "crm_customers_deleted_id_fkey" 
FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;
```

---

#### ✅ 原则3: 负责人字段按需添加

**只在需要数据权限控制的表中添加owner_id**：

```python
# 需要owner_id的表
owner_id = Column(Integer, ForeignKey("sys_user.id"), comment="负责人ID")
```

**判断标准**：
- ✅ 需要行级数据权限控制（个人/部门/全公司）
- ✅ 需要分配给特定销售人员
- ✅ 需要统计个人业绩

**不需要owner_id的表**：
- ❌ 基础配置表（crm_product_categories, crm_opportunity_stages等）
- ❌ 字典表（crm_data_dicts, crm_tag_definitions等）
- ❌ 日志表（crm_operation_logs, crm_customer_change_logs等）

---

#### ✅ 原则4: 部门字段谨慎使用

**只在需要部门级数据权限时添加department_id**：

```python
# 需要department_id的表
department_id = Column(Integer, ForeignKey("sys_dept.id"), comment="所属部门ID")
```

**当前使用情况**：
- ✅ crm_customers (客户可按部门分配)
- ✅ crm_campaigns (活动按部门组织)

**不建议使用的场景**：
- ❌ 联系人表（通过客户间接关联部门）
- ❌ 订单表（通过客户间接关联部门）
- ❌ 合同表（通过客户间接关联部门）

---

### 4.2 数据权限实现策略

#### 策略1: 基于owner_id的行级权限

```python
# Service层示例
async def get_customer_list(self, user: User, page: int, page_size: int):
    """根据用户角色过滤数据"""
    query = select(Customer).where(Customer.is_deleted == False)
    
    if user.data_scope == "personal":
        # 只能查看自己的客户
        query = query.where(Customer.owner_id == user.id)
    elif user.data_scope == "department":
        # 查看本部门的客户
        dept_ids = await get_subordinate_dept_ids(user.dept_id)
        query = query.where(Customer.department_id.in_(dept_ids))
    # else: 管理员查看全部
    
    return await self.db.execute(query)
```

#### 策略2: 基于department_id的部门权限

```python
# 获取子部门ID列表
async def get_subordinate_dept_ids(dept_id: int) -> List[int]:
    """递归获取子部门ID"""
    result = [dept_id]
    children = await db.execute(
        select(SysDept.id).where(SysDept.parent_id == dept_id)
    )
    for child_id in children.scalars():
        result.extend(await get_subordinate_dept_ids(child_id))
    return result
```

---

## 五、错误的关联及修正

### 5.1 发现的错误关联

#### ❌ 错误1: 不必要的租户关联

**当前SQL中的错误**：
```sql
-- app_portal表有租户关联（正确，因为它是系统表）
ALTER TABLE "public"."app_portal" 
ADD CONSTRAINT "app_portal_tenant_id_fkey" 
FOREIGN KEY ("tenant_id") REFERENCES "public"."sys_tenant" ("id");

-- ❌ 但CRM表中不应该有租户关联
-- 当前CRM表都没有租户关联（正确！）
```

**状态**：✅ **已正确处理**，CRM表未添加租户关联

---

#### ❌ 错误2: 缺少必要的外键约束

**发现的问题**：
部分CRM表缺少deleted_id的外键约束

**示例**：
```sql
-- ❌ 错误：只有created_id和updated_id，缺少deleted_id
ALTER TABLE "public"."crm_ai_recommendations" 
ADD CONSTRAINT "fk_crm_ai_recommendations_created_by" 
FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id");

ALTER TABLE "public"."crm_ai_recommendations" 
ADD CONSTRAINT "fk_crm_ai_recommendations_updated_by" 
FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id");

-- ✅ 应该补充
ALTER TABLE "public"."crm_ai_recommendations" 
ADD CONSTRAINT "crm_ai_recommendations_deleted_id_fkey" 
FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;
```

**影响表**：
- crm_ai_recommendations
- crm_ai_tags
- 其他部分AI和业务表

**修正方案**：
```sql
-- 批量补充deleted_id外键约束
DO $$
DECLARE
    table_name TEXT;
BEGIN
    FOR table_name IN 
        SELECT tablename 
        FROM pg_tables 
        WHERE schemaname = 'public' 
          AND tablename LIKE 'crm_%'
    LOOP
        EXECUTE format('
            ALTER TABLE public.%I 
            ADD CONSTRAINT IF NOT EXISTS %I_deleted_id_fkey 
            FOREIGN KEY (deleted_id) REFERENCES public.sys_user(id) 
            ON DELETE SET NULL',
            table_name,
            table_name
        );
    END LOOP;
END $$;
```

---

#### ❌ 错误3: 外键命名不规范

**当前命名**：
```sql
-- 不一致的命名
fk_crm_customers_created_by      -- ✅ 好
crm_customers_deleted_id_fkey    -- ✅ 好
fk_crm_customers_owner           -- ⚠️ 一般
fk_crm_contacts_customer         -- ⚠️ 不够清晰
```

**建议统一命名规范**：
```sql
-- 审计字段
{table}_created_id_fkey
{table}_updated_id_fkey
{table}_deleted_id_fkey

-- 业务字段
fk_{table}_{field}

-- 示例
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "crm_customers_created_id_fkey" 
FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id");

ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_owner_id" 
FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id");

ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_department_id" 
FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept" ("id");
```

---

#### ❌ 错误4: ON DELETE行为不一致

**当前情况**：
```sql
-- 有的是SET NULL
ON DELETE SET NULL

-- 有的是CASCADE
ON DELETE CASCADE

-- 有的是RESTRICT
ON DELETE RESTRICT
```

**建议统一策略**：

| 关联类型 | ON DELETE行为 | 理由 |
|---------|--------------|------|
| 审计字段 (created_id, updated_id, deleted_id) | SET NULL | 用户删除后保留历史记录 |
| 负责人 (owner_id) | SET NULL | 负责人离职后数据不丢失 |
| 部门 (department_id) | SET NULL | 部门撤销后数据不丢失 |
| CRM业务关联 (customer_id, contact_id等) | SET NULL | 主记录删除后从记录保留 |
| 级联删除场景 | CASCADE | 仅用于中间表（如sys_user_roles） |

**修正示例**：
```sql
-- ✅ 正确：审计字段使用SET NULL
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "crm_customers_created_id_fkey" 
FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;

-- ✅ 正确：负责人使用SET NULL
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_owner_id" 
FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;

-- ✅ 正确：部门使用SET NULL
ALTER TABLE "public"."crm_customers" 
ADD CONSTRAINT "fk_crm_customers_department_id" 
FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept" ("id") 
ON DELETE SET NULL;

-- ✅ 正确：CRM业务关联使用SET NULL
ALTER TABLE "public"."crm_contacts" 
ADD CONSTRAINT "fk_crm_contacts_customer_id" 
FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") 
ON DELETE SET NULL;
```

---

### 5.2 需要避免的关联

#### 🚫 禁止1: 不要关联sys_role表

**错误做法**：
```sql
-- ❌ 禁止：CRM表直接关联角色
role_id INTEGER REFERENCES sys_role(id)
```

**正确做法**：
```python
# ✅ 通过RBAC权限系统控制
@require_permission("customer:view")
async def get_customer_list():
    pass
```

**理由**：
- 角色是权限概念，不是业务属性
- 通过RBAC中间表（sys_user_roles）间接关联
- 避免硬编码角色ID

---

#### 🚫 禁止2: 不要关联sys_menu表

**错误做法**：
```sql
-- ❌ 禁止：CRM表关联菜单
menu_id INTEGER REFERENCES sys_menu(id)
```

**正确做法**：
```python
# ✅ 菜单独立管理，在sys_menu表中配置
{
  "path": "/crm/customer",
  "component": "crm/customer/index",
  "meta": {"title": "客户管理"}
}
```

**理由**：
- 菜单是前端路由配置
- 与后端业务数据无关
- 通过权限控制菜单可见性

---

#### 🚫 禁止3: 不要关联sys_dict表

**错误做法**：
```sql
-- ❌ 禁止：CRM表直接关联字典
status_id INTEGER REFERENCES sys_dict_data(id)
```

**正确做法**：
```python
# ✅ 使用字符串枚举或整数枚举
class CustomerStatus(str, Enum):
    ACTIVE = "active"
    INACTIVE = "inactive"
    POTENTIAL = "potential"

status = Column(String(20), default=CustomerStatus.ACTIVE)
```

**理由**：
- 字典是配置数据，频繁变化
- 外键约束会影响性能
- 使用枚举更灵活

---

#### 🚫 禁止4: 不要关联sys_config表

**错误做法**：
```sql
-- ❌ 禁止：CRM表关联系统配置
config_id INTEGER REFERENCES sys_config(id)
```

**正确做法**：
```python
# ✅ 通过配置服务读取
from app.config import settings

max_customer_count = settings.CRM_MAX_CUSTOMER_COUNT
```

**理由**：
- 配置是全局参数
- 不应作为业务数据的外键
- 通过环境变量或配置文件管理

---

## 六、实施建议

### 6.1 立即执行的修正

#### 步骤1: 补充缺失的外键约束

```sql
-- 执行脚本：fix_missing_foreign_keys.sql
-- 补充所有CRM表的deleted_id外键约束

DO $$
DECLARE
    table_record RECORD;
BEGIN
    FOR table_record IN 
        SELECT tablename 
        FROM pg_tables 
        WHERE schemaname = 'public' 
          AND tablename LIKE 'crm_%'
          AND tablename NOT IN (
              SELECT conrelid::regclass::text
              FROM pg_constraint
              WHERE contype = 'f'
                AND conname LIKE '%deleted_id%'
          )
    LOOP
        RAISE NOTICE 'Adding deleted_id FK for table: %', table_record.tablename;
        
        EXECUTE format('
            ALTER TABLE public.%I 
            ADD CONSTRAINT %I_deleted_id_fkey 
            FOREIGN KEY (deleted_id) REFERENCES public.sys_user(id) 
            ON DELETE SET NULL',
            table_record.tablename,
            table_record.tablename
        );
    END LOOP;
    
    RAISE NOTICE 'All missing deleted_id foreign keys added successfully';
END $$;
```

---

#### 步骤2: 统一外键命名

```sql
-- 执行脚本：rename_foreign_keys.sql
-- 重命名不规范的外键约束

-- 示例：重命名owner_id外键
ALTER TABLE "public"."crm_customers" 
DROP CONSTRAINT IF EXISTS "fk_crm_customers_owner",
ADD CONSTRAINT "fk_crm_customers_owner_id" 
FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") 
ON DELETE SET NULL;

-- 示例：重命名customer_id外键
ALTER TABLE "public"."crm_contacts" 
DROP CONSTRAINT IF EXISTS "fk_crm_contacts_customer",
ADD CONSTRAINT "fk_crm_contacts_customer_id" 
FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") 
ON DELETE SET NULL;
```

---

#### 步骤3: 验证外键完整性

```sql
-- 执行脚本：verify_foreign_keys.sql
-- 检查所有CRM表的外键是否完整

SELECT 
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name,
    rc.delete_rule
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
JOIN information_schema.referential_constraints AS rc
    ON rc.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_schema = 'public'
  AND tc.table_name LIKE 'crm_%'
ORDER BY tc.table_name, kcu.column_name;
```

---

### 6.2 SQLAlchemy Model规范

#### 规范1: 标准Model模板

```python
"""
CRM客户模型 - 标准模板
遵循FastapiAdmin插件化架构规范
"""
from sqlalchemy import Column, Integer, String, DateTime, Boolean, ForeignKey, func
from sqlalchemy.orm import relationship
from app.core.base_model import Base


class Customer(Base):
    """客户主表"""
    __tablename__ = "crm_customers"
    
    # === 主键 ===
    id = Column(Integer, primary_key=True, autoincrement=True, comment="客户ID")
    
    # === 业务字段 ===
    name = Column(String(100), nullable=False, comment="客户名称")
    phone = Column(String(20), comment="联系电话")
    email = Column(String(100), comment="邮箱")
    
    # === 负责人 ===
    owner_id = Column(
        Integer, 
        ForeignKey("sys_user.id", ondelete="SET NULL"),
        comment="负责人ID"
    )
    
    # === 部门 ===
    department_id = Column(
        Integer,
        ForeignKey("sys_dept.id", ondelete="SET NULL"),
        comment="所属部门ID"
    )
    
    # === 审计字段 (必须) ===
    created_id = Column(
        Integer,
        ForeignKey("sys_user.id", ondelete="SET NULL"),
        comment="创建人ID"
    )
    updated_id = Column(
        Integer,
        ForeignKey("sys_user.id", ondelete="SET NULL"),
        comment="更新人ID"
    )
    deleted_id = Column(
        Integer,
        ForeignKey("sys_user.id", ondelete="SET NULL"),
        comment="删除人ID"
    )
    created_time = Column(
        DateTime,
        server_default=func.now(),
        comment="创建时间"
    )
    updated_time = Column(
        DateTime,
        server_default=func.now(),
        onupdate=func.now(),
        comment="更新时间"
    )
    is_deleted = Column(
        Boolean,
        default=False,
        comment="逻辑删除标记"
    )
    
    # === 关系映射 ===
    owner = relationship("SysUser", foreign_keys=[owner_id])
    department = relationship("SysDept", foreign_keys=[department_id])
    creator = relationship("SysUser", foreign_keys=[created_id])
    updater = relationship("SysUser", foreign_keys=[updated_id])
    deleter = relationship("SysUser", foreign_keys=[deleted_id])
```

---

#### 规范2: Pydantic Schema模板

```python
"""
CRM客户Schema - 标准模板
"""
from pydantic import BaseModel, Field
from typing import Optional
from datetime import datetime


class CustomerBase(BaseModel):
    """客户基础Schema"""
    name: str = Field(..., max_length=100, description="客户名称")
    phone: Optional[str] = Field(None, max_length=20, description="联系电话")
    email: Optional[str] = Field(None, max_length=100, description="邮箱")


class CustomerCreate(CustomerBase):
    """创建客户Schema"""
    owner_id: Optional[int] = Field(None, description="负责人ID")
    department_id: Optional[int] = Field(None, description="部门ID")


class CustomerUpdate(BaseModel):
    """更新客户Schema"""
    name: Optional[str] = Field(None, max_length=100)
    phone: Optional[str] = Field(None, max_length=20)
    email: Optional[str] = Field(None, max_length=100)
    owner_id: Optional[int] = None
    department_id: Optional[int] = None


class CustomerResponse(CustomerBase):
    """客户响应Schema"""
    id: int
    owner_id: Optional[int]
    department_id: Optional[int]
    created_id: Optional[int]
    updated_id: Optional[int]
    deleted_id: Optional[int]
    created_time: datetime
    updated_time: datetime
    is_deleted: bool
    
    class Config:
        from_attributes = True
```

---

### 6.3 数据迁移建议

#### 迁移1: 添加缺失的外键

```python
"""
Alembic迁移脚本 - 添加缺失的外键约束
"""
from alembic import op
import sqlalchemy as sa


def upgrade():
    """添加deleted_id外键约束"""
    
    # 示例：为crm_ai_recommendations添加deleted_id外键
    op.create_foreign_key(
        'crm_ai_recommendations_deleted_id_fkey',
        'crm_ai_recommendations',
        'sys_user',
        ['deleted_id'],
        ['id'],
        ondelete='SET NULL'
    )
    
    # 为其他表添加...


def downgrade():
    """回滚外键约束"""
    op.drop_constraint(
        'crm_ai_recommendations_deleted_id_fkey',
        'crm_ai_recommendations',
        type_='foreignkey'
    )
```

---

#### 迁移2: 重命名外键约束

```python
"""
Alembic迁移脚本 - 重命名外键约束
"""
from alembic import op


def upgrade():
    """重命名外键约束为规范格式"""
    
    # 示例：重命名owner_id外键
    op.drop_constraint(
        'fk_crm_customers_owner',
        'crm_customers',
        type_='foreignkey'
    )
    op.create_foreign_key(
        'fk_crm_customers_owner_id',
        'crm_customers',
        'sys_user',
        ['owner_id'],
        ['id'],
        ondelete='SET NULL'
    )


def downgrade():
    """回滚外键重命名"""
    op.drop_constraint(
        'fk_crm_customers_owner_id',
        'crm_customers',
        type_='foreignkey'
    )
    op.create_foreign_key(
        'fk_crm_customers_owner',
        'crm_customers',
        'sys_user',
        ['owner_id'],
        ['id'],
        ondelete='SET NULL'
    )
```

---

### 6.4 性能优化建议

#### 优化1: 索引策略

```sql
-- 为外键字段创建索引（提升JOIN性能）

-- 审计字段索引
CREATE INDEX idx_crm_customers_created_id ON crm_customers(created_id);
CREATE INDEX idx_crm_customers_updated_id ON crm_customers(updated_id);
CREATE INDEX idx_crm_customers_deleted_id ON crm_customers(deleted_id);

-- 负责人索引
CREATE INDEX idx_crm_customers_owner_id ON crm_customers(owner_id);

-- 部门索引
CREATE INDEX idx_crm_customers_department_id ON crm_customers(department_id);

-- 业务外键索引
CREATE INDEX idx_crm_contacts_customer_id ON crm_contacts(customer_id);
CREATE INDEX idx_crm_opportunities_customer_id ON crm_opportunities(customer_id);
CREATE INDEX idx_crm_contracts_customer_id ON crm_contracts(customer_id);
```

---

#### 优化2: 查询优化

```python
# Service层查询优化示例
async def get_customer_with_details(self, customer_id: int):
    """使用JOIN一次性加载关联数据"""
    from sqlalchemy.orm import joinedload
    
    result = await self.db.execute(
        select(Customer)
        .options(
            joinedload(Customer.owner),
            joinedload(Customer.department),
            joinedload(Customer.creator)
        )
        .where(
            and_(
                Customer.id == customer_id,
                Customer.is_deleted == False
            )
        )
    )
    return result.scalar_one_or_none()
```

---

## 七、总结

### 7.1 关键要点

✅ **正确的关联**：
1. 所有CRM表必须关联sys_user（审计字段）
2. 需要数据权限的表关联sys_user（owner_id）
3. 需要部门权限的表关联sys_dept（department_id）
4. CRM内部业务表相互关联

❌ **禁止的关联**：
1. 不关联sys_role（通过RBAC控制）
2. 不关联sys_menu（菜单独立管理）
3. 不关联sys_dict（使用枚举）
4. 不关联sys_config（使用配置服务）
5. 不关联sys_tenant（单租户场景）

### 7.2 实施优先级

| 优先级 | 任务 | 预计耗时 |
|--------|------|---------|
| P0 | 补充缺失的deleted_id外键 | 30分钟 |
| P1 | 统一外键命名规范 | 1小时 |
| P2 | 创建索引优化查询 | 30分钟 |
| P3 | 更新SQLAlchemy Model | 2小时 |
| P4 | 编写单元测试 | 4小时 |

### 7.3 后续维护

1. **新增CRM表时**：
   - 必须包含审计字段（created_id, updated_id, deleted_id）
   - 根据需要添加owner_id和department_id
   - 遵循外键命名规范

2. **定期审查**：
   - 每季度检查外键完整性
   - 监控慢查询，优化索引
   - 清理无效的外键约束

3. **文档更新**：
   - 每次修改外键后更新本文档
   - 记录变更原因和影响范围

---

**文档版本**: v1.0  
**创建日期**: 2026-04-26  
**最后更新**: 2026-04-26  
**维护者**: CRM开发团队  

---

© 2026 制造业CRM项目组 | CRM业务表与系统表关联方案
