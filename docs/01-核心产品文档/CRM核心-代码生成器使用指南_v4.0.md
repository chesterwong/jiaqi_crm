# CRM核心-代码生成器使用指南 v4.0（74表·完整版）

> **版本**: v4.0（74表合并版）  
> **日期**: 2026-04-25  
> **目标**: 零错误生成CRM所有74张业务表代码，正确处理主从表关系、模块映射、菜单层级、字典配置  
> **依据**: 实际数据库表结构（2026-04-25实测）+ v1.0操作指南 + v3.0补充  
> **数据库**: PostgreSQL 17 - 74张CRM业务表（排除系统基础25张表）  
> **合并说明**: 本文档合并了v1.0（68表·操作指南）和v3.0补充（6张P0表），升级为74表完整版

---

## ⚠️ 使用前必读

**本文档定位**: 代码生成器**操作手册**，告诉你每一步怎么配、怎么点、怎么排错。

**与核心文档的关系**:
| 文档 | 定位 | 使用时机 |
|------|------|---------|
| **本文档（代码生成器指南）** | 操作手册 | 打开代码生成器界面时对照使用 |
| [00-业务逻辑补充方案](00-CRM功能模块业务逻辑补充方案.md) | 后端代码/SQL参考 | 生成完CRUD后写业务逻辑时参考 |
| [01-产品核心功能清单](01-CRM产品核心功能清单.md) | 功能需求 | 确认功能点和交互设计时参考 |
| [02-核心功能模块任务清单](02-CRM核心功能模块任务清单.md) | 任务排期 | 安排开发计划和批次时参考 |
| [表结构与模块映射_v3.0](CRM核心-完整数据库表结构与模块映射_v3.0.md) | 表归属查询 | 确认表属于哪个模块/菜单时对照 |

---

## 第一部分：生成前准备

### 一、数据库表检查清单

#### 1.1 74张CRM业务表清单

```sql
SELECT table_name, obj_description(oid) AS comment 
FROM information_schema.tables t 
JOIN pg_class c ON t.table_name = c.relname 
WHERE table_schema = 'public' 
  AND table_name LIKE 'crm_%' 
  AND table_name NOT LIKE 'crm_test%' 
ORDER BY table_name;
```

**期望结果**: 74张表（不含crm_test_monitor_report测试表）

#### 1.2 表注释检查

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

#### 1.4 物理外键检查

> ⚠️ FastApiAdmin代码生成器不支持物理外键，必须使用COMMENT说明逻辑外键

```sql
-- 检查是否存在物理外键（应该全部删除）
SELECT 
    tc.table_name, 
    kcu.column_name, 
    ccu.table_name AS foreign_table_name
FROM information_schema.table_constraints AS tc 
JOIN information_schema.key_column_usage AS kcu
  ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
  ON ccu.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_name LIKE 'crm_%';
```

---

## 第二部分：11批次生成顺序

> ✅ 严格按照以下顺序生成，避免依赖问题

```
第1批：系统基础（2张表）
  └── crm_data_dicts, crm_user_extensions

第2批：客户管理-主表（1张表）⭐核心
  └── crm_customers

第3批：客户管理-从表（15张表）
  └── crm_contacts, crm_customer_addresses, crm_customer_pool_logs, crm_pool_transfers,
      crm_customer_duplicate_logs, crm_customer_tags, crm_customer_timeline,
      crm_customer_activities, crm_customer_attachments, crm_customer_change_logs,
      crm_contact_relations, crm_contact_visits, crm_contact_change_logs,
      crm_tag_definitions, crm_tags

第4批：销售管理-主表（4张表）⭐调整
  ├── crm_opportunities
  ├── crm_tasks
  ├── crm_sales_activities
  └── crm_competitors ⭐v3.0新增

第5批：销售管理-从表（7张表）⭐调整
  ├── crm_opportunity_stages
  ├── crm_opportunity_products
  ├── crm_follow_records
  ├── crm_followups
  ├── crm_joint_followups
  ├── crm_call_records ⭐v3.0新增
  └── crm_visit_records ⭐v3.0新增

第6批：产品管理（9张表）
  └── crm_product_categories, crm_products, crm_product_skus, crm_product_prices,
      crm_price_tiers, crm_product_documents, crm_product_price_policies,
      crm_product_price_history, crm_import_records

第7批：营销服务（6张表）
  └── crm_leads, crm_lead_scores, crm_marketing_campaigns, crm_marketing_channels,
      crm_campaigns, crm_campaign_leads

第8批：客户成功（6张表）⭐调整
  ├── crm_customer_health, crm_customer_health_scores
  ├── crm_customer_satisfaction_surveys, crm_satisfaction_surveys
  ├── crm_renewals
  └── crm_service_tickets ⭐v3.0新增

第9批：商务合同（9张表）⭐最复杂
  └── crm_quotations, crm_quotation_items, crm_contracts, crm_contract_items,
      crm_contract_invoices, crm_orders, crm_order_items, crm_payments, crm_deliveries

第10批：审批与预警（2张表）⭐v3.0新增
  ├── crm_approval_records ⭐v3.0新增
  └── crm_alert_rules ⭐v3.0新增

第11批：AI智能与报表（7张表）
  └── crm_ai_customer_profiles, crm_ai_recommendations, crm_report_templates,
      crm_report_instances, crm_invoices, crm_invoice_payments, crm_sales_targets
```

---

## 第三部分：模块→菜单→表树状层级结构（代码生成器对照）

> ⚠️ 本文采用**树状结构**展示完整层级：模块（一级菜单）→ 二级菜单 → 主表 → 子表（含外键）
> 
> FastApiAdmin代码生成器**原生支持主子表关联**：
> - 生成主表时填写 `sub_table_name` + `sub_table_fk_name` 可**同时生成子表CRUD**
> - 子表通过 `sub: true` 标记，外键自动关联主表
> - 每个主表一次只能关联1个子表生成（多个子表需分批生成）

---

### 3.1 📦 客户管理（2个二级菜单 · 1主 + 14从）

```
📦 客户管理 (module: crm_customers)
│
├── 📁 客户档案 (/customers/list) ─── generate_menu: true
│   └── 📄 crm_customers [主表·独立菜单]
│       │  sub_table_name ── sub_table_fk_name
│       ├── crm_customer_addresses  ──  customer_id    [Tab:地址信息]
│       ├── crm_customer_pool_logs  ──  customer_id    [Tab:公海池日志]
│       ├── crm_pool_transfers      ──  customer_id    [Tab:转移记录]
│       ├── crm_customer_duplicate_logs ── customer_id [Tab:查重日志]
│       ├── crm_customer_tags       ──  customer_id    [Tab:客户标签]
│       ├── crm_customer_timeline   ──  customer_id    [Tab:动态时间线]
│       ├── crm_customer_activities ──  customer_id    [Tab:客户活动]
│       ├── crm_customer_attachments──  customer_id    [Tab:附件管理]
│       ├── crm_customer_change_logs──  customer_id    [Tab:变更日志]
│       ├── crm_customer_health_scores── customer_id    [Tab:健康评分]
│       ├── crm_call_records        ──  customer_id    [Tab:通话记录] ⭐v3.0
│       └── crm_customer_profiles   ──  customer_id    [Tab:旧版画像]
│
└── 📁 联系人管理 (/customers/contacts) ─── generate_menu: true
    └── 📄 crm_contacts [从表·独立菜单]
        │  FK: customer_id → crm_customers.id
        │  sub_table_name ── sub_table_fk_name
        ├── crm_contact_relations   ──  contact_id     [Tab:关系图谱]
        ├── crm_contact_visits      ──  contact_id     [Tab:拜访记录]
        └── crm_contact_change_logs ──  contact_id     [Tab:变更日志]
```

### 3.2 📦 销售管理（6个二级菜单 · 4主/独立 + 7从）

```
📦 销售管理 (module: crm_sales)
│
├── 📁 商机管理 (/sales/opportunities) ─── generate_menu: true
│   └── 📄 crm_opportunities [主表·独立菜单]
│       │  sub_table_name ── sub_table_fk_name
│       ├── crm_opportunity_stages  ──  opportunity_id [子表:阶段历史]
│       ├── crm_opportunity_products──  opportunity_id [Tab:关联产品]
│       ├── crm_follow_records      ──  opportunity_id [Tab:跟进记录]
│       ├── crm_followups           ──  opportunity_id [Tab:跟进(旧版)]
│       └── crm_joint_followups     ──  opportunity_id [Tab:联合跟进]
│
├── 📁 竞争对手管理 (/sales/competitors) ⭐v3.0 ─── generate_menu: true
│   └── 📄 crm_competitors [独立主表·无子表]
│
├── 📁 待办任务 (/sales/tasks) ─── generate_menu: true
│   └── 📄 crm_tasks [独立表·无子表]
│
├── 📁 销售活动 (/sales/activities) ─── generate_menu: true
│   └── 📄 crm_sales_activities [独立表·无子表]
│
├── 📁 拜访记录 (/sales/visits) ⭐v3.0 ─── generate_menu: true
│   └── 📄 crm_visit_records [从表·独立菜单]
│       FK: customer_id → crm_customers.id
│       FK: opportunity_id → crm_opportunities.id
│
└── 📁 销售目标 (/sales/targets) ─── generate_menu: true
    └── 📄 crm_sales_targets [独立表·无子表]
```

### 3.3 📦 产品管理（2个二级菜单 · 2主 + 7从）

```
📦 产品管理 (module: crm_products)
│
├── 📁 产品分类 (/products/categories) ─── generate_menu: true
│   └── 📄 crm_product_categories [主表·独立菜单]
│       └── crm_products (FK: category_id)  [从表·独立菜单→见下方]
│
└── 📁 产品管理 (/products/list) ─── generate_menu: true
    └── 📄 crm_products [从表·独立菜单]
        │  FK: category_id → crm_product_categories.id
        │  sub_table_name ── sub_table_fk_name
        ├── crm_product_skus          ──  product_id    [Tab:SKU管理]
        ├── crm_product_prices        ──  product_id    [Tab:价格管理]
        │   └── crm_price_tiers       ──  price_id      [子表:阶梯价格]
        ├── crm_product_documents     ──  product_id    [Tab:产品文档]
        ├── crm_product_price_policies──  product_id    [Tab:价格策略]
        └── crm_product_price_history ──  product_id    [Tab:价格历史]
```

### 3.4 📦 营销服务（3个二级菜单 · 3主 + 3从）

```
📦 营销服务 (module: crm_marketing)
│
├── 📁 线索管理 (/marketing/leads) ─── generate_menu: true
│   └── 📄 crm_leads [主表·独立菜单]
│       └── crm_lead_scores (FK: lead_id)  [Tab:评分历史]
│
├── 📁 市场活动 (/marketing/campaigns) ─── generate_menu: true
│   └── 📄 crm_marketing_campaigns [主表·独立菜单]
│       └── crm_marketing_channels (FK: campaign_id)  [Tab:活动渠道]
│
└── 📁 活动管理 (/marketing/campaigns-old) ─── generate_menu: true
    └── 📄 crm_campaigns [主表·独立菜单] (旧版)
        └── crm_campaign_leads (FK: campaign_id)  [Tab:关联线索]
```

### 3.5 📦 客户成功（4个二级菜单 · 2主/独立 + 4从）

```
📦 客户成功 (module: crm_success)
│
├── 📁 客户健康度 (/success/health) ─── generate_menu: true
│   └── 📄 crm_customer_health [从表·独立菜单]
│       FK: customer_id → crm_customers.id
│
├── 📁 服务工单 (/success/tickets) ⭐v3.0 ─── generate_menu: true
│   └── 📄 crm_service_tickets [独立主表·独立菜单]
│       FK: customer_id → crm_customers.id
│       FK: contact_id → crm_contacts.id
│       FK: contract_id → crm_contracts.id
│
├── 📁 续约管理 (/success/renewals) ─── generate_menu: true
│   └── 📄 crm_renewals [从表·独立菜单]
│       FK: customer_id → crm_customers.id
│
└── 📁 满意度调查 (/success/surveys) ─── generate_menu: true
    └── 📄 crm_customer_satisfaction_surveys [从表·独立菜单]
        │  FK: customer_id → crm_customers.id
        └── crm_satisfaction_surveys (FK: customer_id)  [子表:旧版数据]
```

### 3.6 📦 商务合同（7个二级菜单 · 5主/独立 + 8从）⭐最复杂

```
📦 商务合同 (module: crm_contract)
│
├── 📁 报价单管理 (/contract/quotations) ─── generate_menu: true
│   └── 📄 crm_quotations [主表·独立菜单]
│       │  FK: customer_id → crm_customers.id
│       │  FK: opportunity_id → crm_opportunities.id
│       └── crm_quotation_items (FK: quotation_id)  [Tab:报价明细]
│
├── 📁 合同管理 (/contract/contracts) ─── generate_menu: true
│   └── 📄 crm_contracts [主表·独立菜单]
│       │  FK: customer_id → crm_customers.id
│       │  FK: quotation_id → crm_quotations.id
│       │  sub_table_name ── sub_table_fk_name
│       ├── crm_contract_items   ──  contract_id   [Tab:合同明细]
│       └── crm_contract_invoices──  contract_id   [Tab:关联发票]
│
├── 📁 订单管理 (/contract/orders) ─── generate_menu: true
│   └── 📄 crm_orders [从表→独立菜单]
│       │  FK: contract_id → crm_contracts.id
│       │  FK: customer_id → crm_customers.id
│       │  sub_table_name ── sub_table_fk_name
│       ├── crm_order_items      ──  order_id      [Tab:订单明细]
│       └── crm_deliveries       ──  order_id      [Tab:交付记录]
│
├── 📁 回款管理 (/contract/payments) ─── generate_menu: true
│   └── 📄 crm_payments [从表·独立菜单]
│       FK: contract_id → crm_contracts.id
│
├── 📁 交付管理 (/contract/deliveries) ─── generate_menu: true
│   └── 📄 crm_deliveries [从表·独立菜单]
│       FK: order_id → crm_orders.id
│
├── 📁 发票管理 (/contract/invoices) ─── generate_menu: true
│   └── 📄 crm_invoices [独立主表·独立菜单]
│       └── crm_invoice_payments (FK: invoice_id)  [Tab:回款关联]
```

### 3.7 📦 AI智能（4个二级菜单 · 4独立 + 3从）

```
📦 AI智能 (module: crm_ai)
│
├── 📁 客户画像 (/ai/profiles) ─── generate_menu: true
│   └── 📄 crm_ai_customer_profiles [从表·独立菜单]
│       FK: customer_id → crm_customers.id
│
├── 📁 智能推荐 (/ai/recommendations) ─── generate_menu: true
│   └── 📄 crm_ai_recommendations [从表·独立菜单]
│       FK: customer_id → crm_customers.id
│
├── 📁 标签定义 (/ai/tags) ─── generate_menu: true
│   └── 📄 crm_tag_definitions [独立表·独立菜单]
│       └── crm_tags (FK: tag_id)  [子表:旧版标签]
│
└── 📁 AI标签定义 (/ai/ai-tags) ─── generate_menu: true
    └── 📄 crm_ai_tags [独立表·独立菜单]
```

### 3.8 📦 数据报表（1个二级菜单 · 1主 + 1从）

```
📦 数据报表 (module: crm_reports)
│
└── 📁 报表模板 (/reports/templates) ─── generate_menu: true
    └── 📄 crm_report_templates [独立表·独立菜单]
        └── crm_report_instances (FK: template_id)  [子表:报表实例]
```

### 3.9 📦 系统管理（7个二级菜单 · 7独立 + 5从）

```
📦 系统管理 (module: crm_system)
│
├── 📁 数据字典 (/system/dicts) ─── generate_menu: true
│   └── 📄 crm_data_dicts [独立表·无子表]
│
├── 📁 用户扩展 (/system/users/ext) ─── generate_menu: true
│   └── 📄 crm_user_extensions [从表·独立菜单]
│       FK: user_id → sys_user.id
│
├── 📁 导入记录 (/system/imports) ─── generate_menu: true
│   └── 📄 crm_import_records [独立表·无子表]
│
├── 📁 工作流规则 (/system/workflow/rules) ─── generate_menu: true
│   └── 📄 crm_workflow_rules [独立表·独立菜单]
│       │  sub_table_name ── sub_table_fk_name
│       ├── crm_workflow_logs    ──  rule_id       [Tab:执行日志]
│       ├── crm_workflow_actions ──  rule_id       [Tab:动作配置]
│       └── crm_workflow_triggers──  rule_id       [Tab:触发器]
│
├── 📁 工作流审批 (/system/workflow/approvals) ─── generate_menu: true
│   └── 📄 crm_workflow_approvals [从表·独立菜单]
│       FK: rule_id → crm_workflow_rules.id
│
├── 📁 审批管理 (/system/approvals) ⭐v3.0 ─── generate_menu: true
│   └── 📄 crm_approval_records [独立主表·独立菜单]
│       FK: related_table → 动态关联(合同/报价/工作流)
│
└── 📁 预警规则 (/system/alerts) ⭐v3.0 ─── generate_menu: true
    └── 📄 crm_alert_rules [独立主表·独立菜单]
        (data_permission: false → 系统级配置)
```

### 3.10 📊 树状结构统计与代码生成器配置速查

| 模块(一级菜单) | 二级菜单数 | 主表/独立表 | 从表(嵌入Tab) | 总表数 |
|:---|:---:|:---:|:---:|:---:|
| 客户管理 | 2 | crm_customers(1) | 14 | 16 |
| 销售管理 | 6 | crm_opportunities, crm_competitors, crm_tasks, crm_sales_activities, crm_visit_records, crm_sales_targets(6) | 7 | 11 |
| 产品管理 | 2 | crm_product_categories, crm_products(2) | 7 | 9 |
| 营销服务 | 3 | crm_leads, crm_marketing_campaigns, crm_campaigns(3) | 3 | 6 |
| 客户成功 | 4 | crm_customer_health, crm_service_tickets, crm_renewals, crm_customer_satisfaction_surveys(4) | 4 | 6 |
| 商务合同 | 7 | crm_quotations, crm_contracts, crm_orders, crm_payments, crm_deliveries, crm_invoices(6) | 8 | 11 |
| AI智能 | 4 | crm_ai_customer_profiles, crm_ai_recommendations, crm_tag_definitions, crm_ai_tags(4) | 3 | 4 |
| 数据报表 | 1 | crm_report_templates(1) | 1 | 3 |
| 系统管理 | 7 | crm_data_dicts, crm_user_extensions, crm_import_records, crm_workflow_rules, crm_workflow_approvals, crm_approval_records, crm_alert_rules(7) | 5 | 7 |
| **合计** | **35** | **35** | **39** | **74** |

### 一、从表配置5个关键点

> ✅ 生成从表代码时，必须在代码生成器中配置以下5项：

**关键点1: 外键字段配置**
```
字段名: customer_id
字段类型: Integer
字段标签: 客户ID（关联crm_customers.id）
是否必填: 是
```

**关键点2: relationship定义（后端手动添加）**
```python
# models/crm_contact.py
class CrmContact(CrmContactBase, table=True):
    customer_id: int = Field(foreign_key="crm_customers.id")
    customer: "CrmCustomer" = Relationship(back_populates="contacts")
```

**关键点3: Schema嵌套配置**
```python
# schemas/crm_contact.py
class CrmContactRead(CrmContactBase):
    id: int
    customer_id: int
    customer_name: str | None = None  # 关联查询字段
    customer: "CrmCustomerRead" | None = None
```

**关键点4: API关联查询**
```python
# api/crm_contact.py
from sqlmodel import select
from sqlmodel.sql.expression import selectinload

stmt = select(CrmContact).where(CrmContact.id == contact_id)
stmt = stmt.options(selectinload(CrmContact.customer))
contact = db.exec(stmt).first()
```

**关键点5: generate_menu配置**
```
主表（独立菜单）: generate_menu = true
从表（独立菜单）: generate_menu = true  （如：拜访记录、回款管理等）
从表（嵌入父页）: generate_menu = false （如：订单明细、合同明细等）
```

### 二、子表配置理解（不填！）

> ⚠️ 代码生成器中的"子表配置"字段**永远留空**！
> 原因: FastApiAdmin代码生成器不支持自动生成子表关联，需手动添加relationship

---

## 第五部分：6张P0核心表代码生成配置（v3.0新增）

### 5.1 crm_competitors - 竞争对手管理

```json
{
  "table_name": "crm_competitors",
  "module": "销售管理",
  "menu_name": "竞争对手管理",
  "parent_menu": "销售管理",
  "table_type": "independent",
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "competitors",
  "sort_order": 4,
  "fields_config": {
    "list_fields": ["competitor_name", "competitor_code", "industry", "threat_level", "market_share", "status"],
    "form_fields": ["competitor_name", "competitor_code", "industry", "company_size", "headquarters", "website", "phone", "description", "strengths", "weaknesses", "market_share", "threat_level", "status"],
    "search_fields": ["competitor_name", "competitor_code", "industry", "threat_level"]
  }
}
```

### 5.2 crm_service_tickets - 服务工单管理

```json
{
  "table_name": "crm_service_tickets",
  "module": "客户成功",
  "menu_name": "服务工单",
  "parent_menu": "客户成功",
  "table_type": "independent",
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "ticket",
  "sort_order": 5,
  "fields_config": {
    "list_fields": ["ticket_no", "customer_id", "ticket_type", "priority", "status", "assignee_id", "created_time", "is_overdue"],
    "form_fields": ["ticket_no", "customer_id", "contact_id", "contract_id", "ticket_type", "priority", "title", "description", "source", "category", "expected_resolution_time", "sla_hours"],
    "search_fields": ["ticket_no", "customer_id", "ticket_type", "priority", "status", "assignee_id"],
    "readonly_fields": ["ticket_no", "resolution_notes", "actual_resolution_time", "customer_satisfaction"]
  }
}
```

### 5.3 crm_call_records - 通话记录（从表·嵌入客户详情页）

```json
{
  "table_name": "crm_call_records",
  "module": "销售管理",
  "menu_name": "通话记录",
  "parent_menu": "客户管理",
  "table_type": "child",
  "parent_table": "crm_customers",
  "foreign_key": "customer_id",
  "generate_menu": false,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "phone",
  "fields_config": {
    "list_fields": ["customer_id", "contact_id", "call_type", "direction", "duration_seconds", "call_time", "summary", "owner_id"],
    "form_fields": ["customer_id", "contact_id", "call_type", "direction", "phone_number", "duration_seconds", "call_time", "summary", "follow_up_action", "follow_up_time", "sentiment"],
    "search_fields": ["customer_id", "call_type", "direction", "call_time"]
  }
}
```

### 5.4 crm_visit_records - 拜访记录（从表·独立菜单+嵌入客户详情）

```json
{
  "table_name": "crm_visit_records",
  "module": "销售管理",
  "menu_name": "拜访记录",
  "parent_menu": "销售管理",
  "table_type": "child",
  "parent_table": "crm_customers",
  "foreign_key": "customer_id",
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "visit",
  "fields_config": {
    "list_fields": ["customer_id", "contact_id", "opportunity_id", "visit_type", "visit_date", "duration_minutes", "location", "is_successful", "owner_id"],
    "form_fields": ["customer_id", "contact_id", "opportunity_id", "visit_type", "visit_date", "start_time", "end_time", "location", "purpose", "participants", "summary", "outcome", "next_action", "next_visit_date", "expense_amount", "mileage", "transport_type", "rating"],
    "search_fields": ["customer_id", "visit_type", "visit_date", "owner_id"]
  }
}
```

### 5.5 crm_approval_records - 审批记录

```json
{
  "table_name": "crm_approval_records",
  "module": "系统管理",
  "menu_name": "审批管理",
  "parent_menu": "系统管理",
  "table_type": "independent",
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "approval",
  "sort_order": 10,
  "fields_config": {
    "list_fields": ["approval_no", "approval_type", "title", "applicant_id", "approval_status", "current_approver_id", "current_step", "total_steps", "deadline", "created_time"],
    "form_fields": ["approval_no", "approval_type", "related_table", "related_id", "title", "description", "priority", "deadline", "cc_users"],
    "search_fields": ["approval_no", "approval_type", "approval_status", "applicant_id", "current_approver_id"],
    "readonly_fields": ["approval_no", "approval_status", "current_approver_id", "current_step", "approved_time", "approval_notes", "rejection_reason"]
  }
}
```

### 5.6 crm_alert_rules - 预警规则配置

```json
{
  "table_name": "crm_alert_rules",
  "module": "系统管理",
  "menu_name": "预警规则",
  "parent_menu": "系统管理",
  "table_type": "independent",
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": false,
  "soft_delete": true,
  "icon": "alert",
  "sort_order": 11,
  "fields_config": {
    "list_fields": ["rule_name", "rule_code", "alert_type", "severity", "is_active", "trigger_frequency", "notify_channels", "sort_order"],
    "form_fields": ["rule_name", "rule_code", "alert_type", "trigger_condition", "trigger_frequency", "severity", "is_active", "notify_channels", "notify_users", "notify_roles", "template_id", "escalation_rule", "suppress_hours", "description"],
    "search_fields": ["rule_name", "rule_code", "alert_type", "severity", "is_active"],
    "special_fields": {
      "trigger_condition": {"type": "json_editor", "description": "触发条件（JSON格式）"},
      "notify_channels": {"type": "multi_select", "options": ["system_notification", "email", "sms", "wechat"]}
    }
  }
}
```

---

## 第六部分：数据字典清单（40+个·v3.0更新）

> ✅ 在生成代码前，必须先创建以下字典，否则前端下拉框无数据

### 6.1 客户管理（8个）

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

### 6.2 销售管理（10个·含v3.0新增3个）

| 字典类型 | 字典值 | 说明 |
|---------|--------|------|
| opportunity_stage | discovery, qualification, proposal, negotiation, closed_won, closed_lost | 商机阶段 |
| opportunity_source | inbound, outbound, referral, marketing | 商机来源 |
| opportunity_type | new_business, upsell, cross_sell, renewal | 商机类型 |
| followup_type | phone, email, meeting, visit, wechat | 跟进方式 |
| task_priority | low, medium, high, urgent | 任务优先级 |
| task_status | pending, in_progress, completed, cancelled | 任务状态 |
| **competitor_threat_level** | **high, medium, low** | **⭐v3.0新增** |
| **call_type** | **sales_followup, after_sales, negotiation, other** | **⭐v3.0新增** |
| **visit_type** | **first_visit, requirement, demo, negotiation, revisit, other** | **⭐v3.0新增** |

### 6.3-6.9 其余模块字典

（产品管理3个、商务合同7个、营销服务5个、客户成功6个含v3.0新增3个、AI智能2个、系统管理4个含v3.0新增4个）

> 完整字典SQL见 [00-业务逻辑补充方案 §十三](00-CRM功能模块业务逻辑补充方案.md)

---

## 第七部分：常见错误与解决方案

| 错误 | 现象 | 解决方案 |
|------|------|---------|
| 外键字段不生成 | 从表缺少customer_id | 勾选字段的"必填"选项 |
| relationship不匹配 | AttributeError | 确保back_populates双向一致 |
| Schema循环导入 | ImportError | 添加`from __future__ import annotations`，使用字符串类型 |
| 关联查询返回null | customer为null | 使用selectinload预加载 |
| 字典字段无下拉 | 显示为文本框 | 前端配置字典映射(dict.xxx) |
| 子表配置填写 | 生成错误代码 | **永远留空子表配置！** |
| 物理外键冲突 | 代码生成器报错 | 删除所有物理外键，改用COMMENT |

---

## 第八部分：验证清单

每个表生成后必查：models文件(table=True) → schemas文件(Create/Read/Update) → api文件(CRUD路由) → crud文件(增删改查) → 外键字段(foreign_key) → relationship(back_populates) → 字典字段(下拉) → 软删除(delete_at)

---

**文档版本**: v4.0（74表合并版）  
**创建日期**: 2026-04-22  
**更新日期**: 2026-04-25（合并v1.0+v3.0补充→74表完整版）  
**来源**: CRM核心-代码生成器使用指南.md(v1.0) + CRM核心-代码生成器使用指南_v3.0补充.md
