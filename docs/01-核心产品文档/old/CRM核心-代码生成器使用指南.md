# CRM核心-代码生成器使用指南

> **版本**: v1.0（数据库实测版）  
> **日期**: 2026-04-22  
> **目标**: 零错误生成CRM所有68张业务表代码，正确处理主从表关系、模块映射、字段配置  
> **依据**: 实际数据库表结构（2026-04-22实测）+ CRM核心-完整数据库表结构与模块映射 + CRM核心-开发任务执行清单  
> **数据库**: PostgreSQL 17 - 68张CRM业务表（排除系统基础25张表）

---

## ⚠️ 重要更新提示（2026-04-25）

**本文档已有补充文档，请结合使用**:
- 📄 **补充文档**: [CRM核心文档-遗漏模块补充指南_v2.0.md](./CRM核心文档-遗漏模块补充指南_v2.0.md)
- 📊 **深度分析**: [CRM核心文档深度分析与任务清单补充方案.md](./CRM核心文档深度分析与任务清单补充方案.md)

**补充内容**:
1. ✅ 工作流引擎模块（5张表）- 本文档未涉及
2. ✅ 自定义界面开发指南（8个P0级界面）- 本文档缺少
3. ✅ 订单生产跟踪详细流程 - 本文档示例4需补充
4. ✅ 数据权限过滤器实现 - 所有业务表必须实现

**使用建议**: 先阅读本文档了解代码生成器使用方法，然后参考补充文档了解遗漏模块的开发细节。

---

## 第一部分：生成前准备

### 一、数据库表检查清单

#### 1.1 68张CRM业务表清单

> ✅ 执行以下SQL验证所有表是否存在：

```sql
SELECT table_name, obj_description(oid) AS comment 
FROM information_schema.tables t 
JOIN pg_class c ON t.table_name = c.relname 
WHERE table_schema = 'public' 
  AND table_name LIKE 'crm_%' 
  AND table_name NOT LIKE 'crm_test%' 
ORDER BY table_name;
```

**期望结果**: 68张表（不含crm_test_monitor_report测试表）

#### 1.2 表注释检查

> ⚠️ 所有表必须有注释，否则代码生成器无法正确生成模型描述

```sql
-- 检查缺少注释的表
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_name LIKE 'crm_%' 
  AND table_name NOT LIKE 'crm_test%'
  AND obj_description(oid) IS NULL;
```

**修复方法**:
```sql
COMMENT ON TABLE crm_xxx IS '表功能说明';
```

#### 1.3 字段注释检查

> ⚠️ 所有字段必须有注释，否则代码生成器无法生成字段描述

```sql
-- 检查指定表缺少注释的字段
SELECT column_name, col_description(c.oid, a.attnum) AS comment
FROM information_schema.columns c
JOIN pg_class c2 ON c.table_name = c2.relname
JOIN pg_attribute a ON a.attrelid = c2.oid AND a.attname = c.column_name
WHERE c.table_schema = 'public' 
  AND c.table_name = 'crm_xxx'
  AND col_description(c.oid, a.attnum) IS NULL;
```

**修复方法**:
```sql
COMMENT ON COLUMN crm_xxx.field_name IS '字段说明';
```

#### 1.4 物理外键检查

> ⚠️ FastApiAdmin代码生成器不支持物理外键，必须使用COMMENT说明逻辑外键

```sql
-- 检查是否存在物理外键（应该删除）
SELECT 
    tc.table_name, 
    kcu.column_name, 
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name 
FROM information_schema.table_constraints AS tc 
JOIN information_schema.key_column_usage AS kcu
  ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
  ON ccu.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_name LIKE 'crm_%';
```

**处理方法**:
1. 删除物理外键约束
2. 在字段注释中添加逻辑外键说明：`外键→crm_xxx.id`

---

### 二、数据字典创建清单

> ✅ 在生成代码前，必须先创建以下30+个数据字典

#### 2.1 客户管理相关字典

| 字典类型 | 字典值 | 说明 |
|---------|--------|------|
| customer_type | enterprise, individual, government | 客户类型 |
| customer_source | referral, marketing, online, offline | 客户来源 |
| customer_industry | manufacturing, retail, finance, tech | 客户行业 |
| customer_level | A, B, C, D | 客户等级 |
| customer_status | active, inactive, frozen, churned | 客户状态 |
| contact_role | decision_maker, influencer, user, buyer | 联系人角色 |
| contact_gender | male, female, unknown | 联系人性别 |
| tag_type | customer_tag, lead_tag, product_tag | 标签类型 |

#### 2.2 销售管理相关字典

| 字典类型 | 字典值 | 说明 |
|---------|--------|------|
| opportunity_stage | discovery, qualification, proposal, negotiation, closed_won, closed_lost | 商机阶段 |
| opportunity_source | inbound, outbound, referral, marketing | 商机来源 |
| opportunity_type | new_business, upsell, cross_sell, renewal | 商机类型 |
| followup_type | phone, email, meeting, visit, wechat | 跟进方式 |
| followup_status | pending, completed, cancelled | 跟进状态 |
| task_priority | low, medium, high, urgent | 任务优先级 |
| task_status | pending, in_progress, completed, cancelled | 任务状态 |

#### 2.3 产品管理相关字典

| 字典类型 | 字典值 | 说明 |
|---------|--------|------|
| product_status | active, inactive, discontinued | 产品状态 |
| product_unit | piece, set, kg, meter, box | 产品单位 |
| price_type | standard, wholesale, retail, promotional | 价格类型 |

#### 2.4 商务合同相关字典

| 字典类型 | 字典值 | 说明 |
|---------|--------|------|
| quotation_status | draft, pending_approval, approved, rejected, expired | 报价单状态 |
| contract_status | draft, pending_sign, active, expired, terminated | 合同状态 |
| contract_type | sales, purchase, service, partnership | 合同类型 |
| order_status | pending, confirmed, production, shipped, delivered, cancelled | 订单状态 |
| payment_status | unpaid, partial, paid, overdue, refunded | 付款状态 |
| payment_method | bank_transfer, credit_card, cash, check | 付款方式 |
| invoice_status | not_invoiced, invoiced, mailed, received, cancelled | 发票状态 |
| invoice_type | special_vat, normal_vat, receipt | 发票类型 |

#### 2.5 营销服务相关字典

| 字典类型 | 字典值 | 说明 |
|---------|--------|------|
| lead_status | new, contacted, qualified, converted, lost | 线索状态 |
| lead_source | website, referral, social, ad, event | 线索来源 |
| campaign_type | email, social, seminar, webinar, trade_show | 活动类型 |
| campaign_status | planning, active, paused, completed, cancelled | 活动状态 |
| channel_type | online, offline, partner, direct | 渠道类型 |

#### 2.6 客户成功相关字典

| 字典类型 | 字典值 | 说明 |
|---------|--------|------|
| health_level | excellent, good, fair, poor, critical | 健康等级 |
| renewal_status | not_renewed, renewing, renewed, lost | 续费状态 |
| satisfaction_level | very_satisfied, satisfied, neutral, dissatisfied | 满意度等级 |

#### 2.7 AI智能相关字典

| 字典类型 | 字典值 | 说明 |
|---------|--------|------|
| ai_recommendation_type | product, service, upsell, cross_sell | 推荐类型 |
| ai_confidence_level | high, medium, low | 置信度等级 |

**字典创建SQL示例**:
```sql
INSERT INTO data_dicts (dict_type, dict_code, dict_label, dict_value, sort_order, status)
VALUES 
  ('customer_type', 'enterprise', '企业客户', 'enterprise', 1, 1),
  ('customer_type', 'individual', '个人客户', 'individual', 2, 1),
  ('customer_type', 'government', '政府客户', 'government', 3, 1);
```

---

## 第二部分：模块映射与生成顺序

### 一、10批次生成顺序

> ✅ 严格按照以下顺序生成，避免依赖问题

```
第1批：系统基础（2张表）
  └── crm_data_dicts, crm_user_extensions

第2批：客户管理-主表（1张表）⭐核心
  └── crm_customers

第3批：客户管理-从表（15张表）
  └── crm_contacts, crm_customer_addresses, crm_customer_pool_logs, ...

第4批：销售管理（8张表）
  └── crm_opportunities, crm_opportunity_stages, crm_follow_records, ...

第5批：产品管理（9张表）
  └── crm_product_categories, crm_products, crm_product_skus, ...

第6批：营销服务（6张表）
  └── crm_leads, crm_marketing_campaigns, crm_marketing_channels, ...

第7批：客户成功（5张表）
  └── crm_customer_health, crm_renewals, crm_customer_satisfaction_surveys, ...

第8批：商务合同（9张表）⭐最复杂
  └── crm_quotations, crm_quotation_items, crm_contracts, crm_orders, ...

第9批：AI智能（4张表）
  └── crm_ai_customer_profiles, crm_ai_recommendations, ...

第10批：数据报表与集成（7张表）
  └── crm_report_templates, crm_api_integrations, crm_workflow_rules, ...
```

---

### 二、主从表关系全景图

> ✅ 68张表分为6大主从关系组

#### 2.1 客户管理主从关系（1主13从）

```
crm_customers（客户主表）
├── crm_contacts（联系人）
│   ├── crm_contact_relations（联系人关系）
│   └── crm_contact_visits（联系人拜访）
├── crm_customer_addresses（客户地址）
├── crm_customer_pool_logs（客户池日志）
├── crm_pool_transfers（客户池转移）
├── crm_customer_duplicate_logs（查重日志）
├── crm_customer_tags（客户标签关联）
├── crm_customer_timeline（客户动态）
├── crm_customer_activities（客户活动）
├── crm_customer_attachments（客户附件）
├── crm_customer_change_logs（客户变更日志）
├── crm_customer_health（客户健康度）
├── crm_customer_health_scores（健康度评分）
└── crm_ai_customer_profiles（AI客户画像）
```

#### 2.2 销售管理主从关系（1主3从）

```
crm_opportunities（商机主表）
├── crm_opportunity_stages（商机阶段）
├── crm_opportunity_products（商机产品）
└── crm_joint_followups（联合跟进）
```

#### 2.3 产品管理主从关系（2主7从）

```
crm_product_categories（产品分类主表）
└── crm_products（产品）
    ├── crm_product_skus（产品SKU）
    ├── crm_product_prices（产品价格）
    │   └── crm_price_tiers（价格阶梯）
    ├── crm_product_images（产品图片）
    ├── crm_product_documents（产品文档）
    ├── crm_product_price_policies（价格策略）
    └── crm_product_price_history（价格历史）
```

#### 2.4 营销服务主从关系（2主3从）

```
crm_leads（线索主表）
└── crm_lead_scores（线索评分）

crm_marketing_campaigns（市场活动主表）
├── crm_marketing_channels（活动渠道）
└── crm_campaign_leads（活动线索）
```

#### 2.5 商务合同主从关系（3主6从）⭐最复杂

```
crm_quotations（报价单主表）
└── crm_quotation_items（报价明细）

crm_contracts（合同主表）
├── crm_contract_items（合同明细）
├── crm_contract_invoices（合同发票）
└── crm_payment_plans（付款计划）

crm_orders（订单主表）
├── crm_order_items（订单明细）
├── crm_payments（回款记录）
└── crm_deliveries（交付记录）
```

#### 2.6 客户成功主从关系（1主4从）

```
crm_customers（客户主表）
├── crm_renewals（续费管理）
├── crm_upsells（增购管理）
├── crm_churn_warnings（流失预警）
└── crm_customer_satisfaction_surveys（满意度调查）
```

---

## 第三部分：主从表关系配置详解

### 一、主从表识别规则

> ✅ 判断一个表是从表的3条规则：

**规则1**: 表中有`xxx_id`字段（如`customer_id`, `contact_id`）
**规则2**: 表名包含主表名（如`crm_contacts`从属于`crm_customers`）
**规则3**: 业务逻辑上从属于主表（如联系人从属于客户）

### 二、从表配置5个关键点

> ✅ 生成从表代码时，必须在代码生成器中配置以下5项：

#### 关键点1: 外键字段配置

```
字段名: customer_id
字段类型: Integer
字段标签: 客户ID
是否必填: 是
关联表: crm_customers
关联字段: id
```

#### 关键点2: relationship定义（后端）

```python
# models/crm_contact.py
from sqlmodel import Field, Relationship

class CrmContact(CrmContactBase, table=True):
    customer_id: int = Field(foreign_key="crm_customers.id")
    
    # 定义反向关联
    customer: "CrmCustomer" = Relationship(back_populates="contacts")
```

#### 关键点3: Schema配置

```python
# schemas/crm_contact.py
from pydantic import BaseModel

class CrmContactCreate(BaseModel):
    customer_id: int  # 必填
    name: str
    phone: str
    
class CrmContactRead(CrmContactBase):
    id: int
    customer_id: int
    customer: "CrmCustomerRead"  # 嵌套读取
```

#### 关键点4: 关联查询字段配置

```python
# schemas/crm_contact.py
class CrmContactRead(CrmContactBase):
    # 关联查询字段
    customer_name: str | None = None  # 从crm_customers.name获取
    customer_type: str | None = None  # 从crm_customers.type获取
```

#### 关键点5: API关联查询实现

```python
# api/crm_contact.py
@router.get("/crm-contacts/{contact_id}", response_model=CrmContactRead)
def read_contact(contact_id: int, db: Session = Depends(get_db)):
    contact = db.query(CrmContact).filter(CrmContact.id == contact_id).first()
    if contact and contact.customer:
        contact.customer_name = contact.customer.name
        contact.customer_type = contact.customer.type
    return contact
```

### 三、子表配置理解（不填！）

> ⚠️ 常见错误：在代码生成器中填写"子表配置"

**正确理解**:
- 生成主表时：**不填**子表配置（后续手动添加relationship）
- 生成从表时：**只填**外键字段配置（关联到主表）

**错误示例**:
```
生成 crm_customers 时：
  子表配置: crm_contacts  ← ❌ 错误！不要填
```

**正确示例**:
```
生成 crm_customers 时：
  子表配置: （留空）  ← ✅ 正确！

生成 crm_contacts 时：
  外键字段: customer_id  ← ✅ 正确！
  关联表: crm_customers
```

---

## 第四部分：详细生成步骤（核心表示例）

### 示例1: 客户主表（crm_customers）

#### Step 1: 检查表结构

```sql
\d crm_customers
```

**关键字段**:
- id (主键)
- customer_name (客户名称)
- customer_type (客户类型)
- industry (行业)
- source (来源)
- owner_id (负责人ID)

#### Step 2: 代码生成器配置

```
表名: crm_customers
模块: 客户管理
基类: CRUDBase
分页: 是
软删除: 是
时间戳: 是
字段列表:
  - customer_name: String, 必填, 客户名称
  - customer_type: String, 必填, 客户类型（字典：customer_type）
  - industry: String, 可选, 行业（字典：customer_industry）
  - source: String, 可选, 来源（字典：customer_source）
  - owner_id: Integer, 必填, 负责人ID（外键→users.id）
```

#### Step 3: 生成代码

点击"生成代码"，获取以下文件：
- `models/crm_customer.py`
- `schemas/crm_customer.py`
- `api/crm_customer.py`
- `crud/crm_customer.py`

#### Step 4: 手动添加relationship

```python
# models/crm_customer.py
class CrmCustomer(CrmCustomerBase, table=True):
    # 添加反向关联
    contacts: List["CrmContact"] = Relationship(back_populates="customer")
    opportunities: List["CrmOpportunity"] = Relationship()
    quotations: List["CrmQuotation"] = Relationship()
    contracts: List["CrmContract"] = Relationship()
```

---

### 示例2: 联系人从表（crm_contacts）

#### Step 1: 检查表结构

```sql
\d crm_contacts
```

**关键字段**:
- id (主键)
- customer_id (外键→客户)
- name (联系人姓名)
- phone (联系电话)
- role (角色)

#### Step 2: 代码生成器配置

```
表名: crm_contacts
模块: 客户管理
基类: CRUDBase
分页: 是
软删除: 是
时间戳: 是
字段列表:
  - customer_id: Integer, 必填, 客户ID（外键→crm_customers.id）
  - name: String, 必填, 联系人姓名
  - phone: String, 必填, 联系电话
  - role: String, 可选, 角色（字典：contact_role）
```

#### Step 3: 生成代码

点击"生成代码"，获取以下文件：
- `models/crm_contact.py`
- `schemas/crm_contact.py`
- `api/crm_contact.py`
- `crud/crm_contact.py`

#### Step 4: 验证外键关联

```python
# models/crm_contact.py
class CrmContact(CrmContactBase, table=True):
    customer_id: int = Field(foreign_key="crm_customers.id")
    customer: "CrmCustomer" = Relationship(back_populates="contacts")
```

```python
# schemas/crm_contact.py
class CrmContactRead(CrmContactBase):
    id: int
    customer_id: int
    customer: "CrmCustomerRead" | None = None
```

---

### 示例3: 报价单+明细（crm_quotations + crm_quotation_items）

#### Step 1: 生成报价单主表

```
表名: crm_quotations
字段:
  - quotation_no: String, 必填, 报价单号
  - customer_id: Integer, 必填, 客户ID（外键→crm_customers.id）
  - opportunity_id: Integer, 可选, 商机ID（外键→crm_opportunities.id）
  - total_amount: Decimal, 可选, 总金额
  - status: String, 必填, 状态（字典：quotation_status）
  - valid_until: DateTime, 可选, 有效期至
```

#### Step 2: 生成报价明细从表

```
表名: crm_quotation_items
字段:
  - quotation_id: Integer, 必填, 报价单ID（外键→crm_quotations.id）
  - product_id: Integer, 必填, 产品ID（外键→crm_products.id）
  - quantity: Integer, 必填, 数量
  - unit_price: Decimal, 必填, 单价
  - discount: Decimal, 可选, 折扣
  - subtotal: Decimal, 可选, 小计
```

#### Step 3: 手动添加关联

```python
# models/crm_quotation.py
class CrmQuotation(CrmQuotationBase, table=True):
    customer_id: int = Field(foreign_key="crm_customers.id")
    opportunity_id: int | None = Field(default=None, foreign_key="crm_opportunities.id")
    
    customer: "CrmCustomer" = Relationship()
    opportunity: "CrmOpportunity" | None = Relationship()
    items: List["CrmQuotationItem"] = Relationship(back_populates="quotation")
```

```python
# models/crm_quotation_item.py
class CrmQuotationItem(CrmQuotationItemBase, table=True):
    quotation_id: int = Field(foreign_key="crm_quotations.id")
    product_id: int = Field(foreign_key="crm_products.id")
    
    quotation: "CrmQuotation" = Relationship(back_populates="items")
    product: "CrmProduct" = Relationship()
```

#### Step 4: Schema嵌套配置

```python
# schemas/crm_quotation.py
class CrmQuotationItemRead(CrmQuotationItemBase):
    id: int
    quotation_id: int
    product: "CrmProductRead" | None = None

class CrmQuotationRead(CrmQuotationBase):
    id: int
    customer: "CrmCustomerRead" | None = None
    opportunity: "CrmOpportunityRead" | None = None
    items: List["CrmQuotationItemRead"] = []
```

---

### 示例4: 合同+付款+订单（复杂关系）

#### Step 1: 生成合同主表

```
表名: crm_contracts
字段:
  - contract_no: String, 必填, 合同编号
  - customer_id: Integer, 必填, 客户ID
  - quotation_id: Integer, 可选, 报价单ID
  - total_amount: Decimal, 必填, 合同总金额
  - status: String, 必填, 状态（字典：contract_status）
  - sign_date: Date, 可选, 签署日期
  - expire_date: Date, 可选, 到期日期
```

#### Step 2: 生成付款计划从表

```
表名: crm_payment_plans
字段:
  - contract_id: Integer, 必填, 合同ID
  - payment_phase: Integer, 必填, 付款期数
  - payment_amount: Decimal, 必填, 付款金额
  - payment_date: Date, 必填, 计划付款日期
  - status: String, 必填, 状态（字典：payment_status）
```

#### Step 3: 生成回款记录从表

```
表名: crm_payments
字段:
  - contract_id: Integer, 必填, 合同ID
  - payment_plan_id: Integer, 可选, 付款计划ID
  - payment_amount: Decimal, 必填, 实际付款金额
  - payment_date: Date, 必填, 实际付款日期
  - payment_method: String, 可选, 付款方式（字典：payment_method）
```

#### Step 4: 生成订单主表

```
表名: crm_orders
字段:
  - order_no: String, 必填, 订单编号
  - contract_id: Integer, 必填, 合同ID
  - customer_id: Integer, 必填, 客户ID
  - total_amount: Decimal, 必填, 订单总金额
  - status: String, 必填, 状态（字典：order_status）
  - delivery_date: Date, 可选, 交付日期
```

#### Step 5: 手动添加复杂关联

```python
# models/crm_contract.py
class CrmContract(CrmContractBase, table=True):
    customer_id: int = Field(foreign_key="crm_customers.id")
    quotation_id: int | None = Field(default=None, foreign_key="crm_quotations.id")
    
    customer: "CrmCustomer" = Relationship()
    quotation: "CrmQuotation" | None = Relationship()
    items: List["CrmContractItem"] = Relationship()
    payment_plans: List["CrmPaymentPlan"] = Relationship()
    payments: List["CrmPayment"] = Relationship()
    orders: List["CrmOrder"] = Relationship()
```

```python
# models/crm_order.py
class CrmOrder(CrmOrderBase, table=True):
    contract_id: int = Field(foreign_key="crm_contracts.id")
    customer_id: int = Field(foreign_key="crm_customers.id")
    
    contract: "CrmContract" = Relationship()
    customer: "CrmCustomer" = Relationship()
    items: List["CrmOrderItem"] = Relationship()
    payments: List["CrmPayment"] = Relationship()
    deliveries: List["CrmDelivery"] = Relationship()
```

---

## 第五部分：配置规则总结

### 一、主从表识别3条规则

| 规则 | 判断方法 | 示例 |
|------|---------|------|
| 规则1 | 表中有`xxx_id`字段 | `customer_id` → 从属于`crm_customers` |
| 规则2 | 表名包含主表名 | `crm_contacts` → 从属于`crm_customers` |
| 规则3 | 业务逻辑从属 | 联系人从属于客户 |

### 二、从表配置5个关键点

| 关键点 | 配置位置 | 必填项 | 说明 |
|--------|---------|--------|------|
| 1.外键字段 | 代码生成器 | 是 | `customer_id: Integer` |
| 2.relationship | models文件 | 是 | `Relationship(back_populates="xxx")` |
| 3.Schema嵌套 | schemas文件 | 是 | `customer: "CrmCustomerRead"` |
| 4.关联查询 | API文件 | 是 | `db.query().join()` |
| 5.关联字段 | Schema文件 | 可选 | `customer_name: str` |

### 三、子表配置理解（不填！）

> ⚠️ **重要**: 代码生成器中的"子表配置"字段**永远留空**！

**原因**:
1. FastApiAdmin代码生成器不支持自动生成子表关联
2. 子表关联需要手动添加relationship
3. 填写子表配置会导致生成错误代码

---

## 第六部分：常见错误与解决方案

### 错误1: 外键字段不生成

**现象**: 生成从表代码后，`customer_id`字段缺失

**原因**: 代码生成器配置时未勾选"必填"

**解决方案**:
```
重新生成 → 勾选customer_id的"必填" → 重新生成
```

### 错误2: relationship定义错误

**现象**: `AttributeError: 'CrmCustomer' object has no attribute 'contacts'`

**原因**: relationship的`back_populates`参数不匹配

**解决方案**:
```python
# 错误
class CrmCustomer:
    contacts: List["CrmContact"] = Relationship(back_populates="customer")

class CrmContact:
    customer: "CrmCustomer" = Relationship(back_populates="contacts_wrong")  # ❌

# 正确
class CrmContact:
    customer: "CrmCustomer" = Relationship(back_populates="contacts")  # ✅
```

### 错误3: Schema循环导入

**现象**: `ImportError: cannot import name 'CrmCustomerRead' from partially initialized module`

**原因**: schemas文件互相导入

**解决方案**:
```python
# 错误
from schemas.crm_customer import CrmCustomerRead
from schemas.crm_contact import CrmContactRead

# 正确
from __future__ import annotations  # 添加这行
# 使用字符串类型
class CrmContactRead:
    customer: "CrmCustomerRead" | None = None
```

### 错误4: API关联查询失败

**现象**: 返回的联系人数据中`customer`字段为`null`

**原因**: 未使用`joinedload`预加载关联数据

**解决方案**:
```python
# 错误
contact = db.query(CrmContact).filter(CrmContact.id == contact_id).first()

# 正确
from sqlmodel import select
from sqlmodel.sql.expression import SelectOfScalar

stmt = select(CrmContact).where(CrmContact.id == contact_id)
stmt = stmt.options(selectinload(CrmContact.customer))
contact = db.exec(stmt).first()
```

### 错误5: 字典字段无下拉选项

**现象**: 前端表单中字典字段显示为文本输入框，不是下拉选择

**原因**: 前端未配置字典映射

**解决方案**:
```vue
<!-- 错误 -->
<el-input v-model="form.customer_type" />

<!-- 正确 -->
<el-select v-model="form.customer_type">
  <el-option 
    v-for="item in dict.customer_type" 
    :key="item.dict_code" 
    :label="item.dict_label" 
    :value="item.dict_code" 
  />
</el-select>
```

### 错误6: 主从表数据不同步

**现象**: 删除客户后，联系人仍然存在

**原因**: 未配置级联删除

**解决方案**:
```python
# 方案1: 数据库级联删除（推荐）
customer_id: int = Field(foreign_key="crm_customers.id", ondelete="CASCADE")

# 方案2: 代码级联删除
def delete_customer(customer_id: int, db: Session):
    # 先删除从表数据
    db.query(CrmContact).filter(CrmContact.customer_id == customer_id).delete()
    db.query(CrmCustomerAddress).filter(CrmCustomerAddress.customer_id == customer_id).delete()
    # 再删除主表数据
    db.query(CrmCustomer).filter(CrmCustomer.id == customer_id).delete()
    db.commit()
```

---

## 第七部分：快速检查清单

### 一、每个表生成后必查项

| 检查项 | 检查方法 | 标准 |
|--------|---------|------|
| 1.模型文件 | 检查models/crm_xxx.py | 包含table=True |
| 2.Schema文件 | 检查schemas/crm_xxx.py | 包含Create/Read/Update |
| 3.API文件 | 检查api/crm_xxx.py | 包含CRUD路由 |
| 4.CRUD文件 | 检查crud/crm_xxx.py | 包含增删改查方法 |
| 5.外键字段 | 检查models文件 | foreign_key配置正确 |
| 6.relationship | 检查models文件 | back_populates匹配 |
| 7.字典字段 | 检查Schema文件 | 使用字典类型 |
| 8.软删除 | 检查models文件 | delete_at字段存在 |

### 二、完整字典清单（30+个）

| 序号 | 字典类型 | 字典值数量 | 状态 |
|------|---------|-----------|------|
| 1 | customer_type | 3 | ✅ |
| 2 | customer_source | 4 | ✅ |
| 3 | customer_industry | 4 | ✅ |
| 4 | customer_level | 4 | ✅ |
| 5 | customer_status | 4 | ✅ |
| 6 | contact_role | 4 | ✅ |
| 7 | contact_gender | 3 | ✅ |
| 8 | tag_type | 3 | ✅ |
| 9 | opportunity_stage | 6 | ✅ |
| 10 | opportunity_source | 4 | ✅ |
| 11 | opportunity_type | 4 | ✅ |
| 12 | followup_type | 5 | ✅ |
| 13 | followup_status | 3 | ✅ |
| 14 | task_priority | 4 | ✅ |
| 15 | task_status | 4 | ✅ |
| 16 | product_status | 3 | ✅ |
| 17 | product_unit | 5 | ✅ |
| 18 | price_type | 4 | ✅ |
| 19 | quotation_status | 5 | ✅ |
| 20 | contract_status | 5 | ✅ |
| 21 | contract_type | 4 | ✅ |
| 22 | order_status | 6 | ✅ |
| 23 | payment_status | 5 | ✅ |
| 24 | payment_method | 4 | ✅ |
| 25 | invoice_status | 5 | ✅ |
| 26 | invoice_type | 3 | ✅ |
| 27 | lead_status | 5 | ✅ |
| 28 | lead_source | 5 | ✅ |
| 29 | campaign_type | 5 | ✅ |
| 30 | campaign_status | 5 | ✅ |
| 31 | health_level | 5 | ✅ |
| 32 | renewal_status | 4 | ✅ |
| 33 | ai_recommendation_type | 4 | ✅ |

---

## 第八部分：总结

### 一、核心原则

1. ✅ **严格按批次执行**：不跳过批次，确保依赖关系
2. ✅ **先主后从**：先生成主表代码，再生成从表代码
3. ✅ **字典先行**：生成代码前先创建所有字典
4. ✅ **手动补充**：代码生成器只生成基础代码，relationship需要手动添加
5. ✅ **测试伴随**：每个表生成后立即测试

### 二、关键成功因素

1. ✅ **表注释完整**：所有表和字段必须有注释
2. ✅ **字典值正确**：字典值必须与代码中的枚举值一致
3. ✅ **外键配置正确**：从表的外键字段必须正确关联到主表
4. ✅ **relationship匹配**：back_populates参数必须双向匹配
5. ✅ **Schema嵌套合理**：避免循环导入，使用字符串类型

### 三、下一步行动

1. 确认68张表全部存在
2. 创建30+个数据字典
3. 使用代码生成器生成第1批代码（系统基础）
4. 手动添加relationship和Schema嵌套
5. 测试API接口
6. 按批次持续推进

---

**文档维护**: 本指南应根据实际生成过程持续更新，确保与实际数据库和代码生成器版本保持一致。

**更新日期**: 2026-04-22  
**文档版本**: v1.0（数据库实测版）

