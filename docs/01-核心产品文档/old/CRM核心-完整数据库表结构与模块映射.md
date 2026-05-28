# CRM核心-完整数据库表结构与模块映射

> **版本**: v3.0（P0核心表补充版）  
> **日期**: 2026-04-25  
> **数据库**: PostgreSQL 17 - 总计99张表（系统25张 + CRM业务74张）  
> **依据**: 实际数据库表结构（2026-04-25实测）+ 6张P0核心表补充  
> **更新说明**: v3.0补充了6张P0核心业务表（竞争对手、服务工单、通话记录、拜访记录、审批记录、预警规则）

---

## ⚠️ 重要更新提示（2026-04-25）

**本文档已有补充文档，请结合使用**:
- 📄 **补充文档**: [CRM核心文档-遗漏模块补充指南_v2.0.md](./CRM核心文档-遗漏模块补充指南_v2.0.md)
- 📊 **深度分析**: [CRM核心文档深度分析与任务清单补充方案.md](./CRM核心文档深度分析与任务清单补充方案.md)

**v3.0补充内容（2026-04-25）**：
1. ✅ 模块3补充：销售管理（3张表）- crm_competitors, crm_call_records, crm_visit_records
2. ✅ 模块6补充：客户成功（1张表）- crm_service_tickets
3. ✅ 模块10补充：系统管理（2张表）- crm_approval_records, crm_alert_rules
4. ✅ 业务流向补充：竞争对手分析、服务工单、审批预警完整链路

**v2.0补充内容**：
1. ✅ 模块10：工作流引擎（5张表）- crm_workflow_rules, crm_workflow_approvals, crm_workflow_logs, crm_workflow_actions, crm_workflow_triggers
2. ✅ 模块7补充：发票管理（2张表）- crm_invoices, crm_invoice_payments
3. ✅ 业务流向补充：订单→交付→发票完整链路
4. ✅ 自定义界面模块清单（18个，8个P0级）

**表统计更新**:
- 原68张 → 71张 → **74张** CRM业务表
- 原93张 → 96张 → **99张** 总计
- 原10个模块 → 11个 → **11个** 模块（调整3个模块表数量）

---

## 一、总体架构

### 1.1 表统计总览

```
CRM系统数据库表总计：93张
├── 系统基础表（FastApiAdmin框架）: 25张
│   ├── 用户权限相关: 7张
│   ├── 系统配置相关: 5张
│   ├── 日志审计相关: 3张
│   └── 其他系统表: 10张
│
└── CRM业务表（自定义开发）: 68张
    ├── 模块1-系统基础与权限: 2张
    ├── 模块2-客户管理: 16张 ⭐核心模块
    ├── 模块3-销售管理: 8张
    ├── 模块4-产品管理: 9张
    ├── 模块5-营销服务: 6张
    ├── 模块6-客户成功: 5张
    ├── 模块7-商务合同: 9张 ⭐复杂模块
    ├── 模块8-AI智能: 4张
    ├── 模块9-数据报表: 3张
    ├── 模块10-系统管理与集成: 4张
    └── 其他模块: 2张
```

### 1.2 核心业务流向

```
线索(leads) ──转化──▶ 客户(customers) ──▶ 联系人(contacts)
                              │
                              ▼
                          商机(opportunities)
                              │
                              ▼
                         报价(quotations)
                              │
                              ▼
                          合同(contracts)
                              │
              ┌───────────────┼───────────────┐
              ▼               ▼               ▼
           订单            回款             发票
          (orders)        (payments)     (invoices)
              │                              
              ▼                              
        交付记录                             
       (deliveries)                          
```

---

## 二、系统基础表（25张）- FastApiAdmin框架

> ⚠️ 这些表由框架提供，不需要使用代码生成器生成

### 2.1 用户权限相关（7张）

| 表名 | 功能说明 | 模块归属 |
|------|---------|---------|
| users | 用户表 | 系统管理-用户管理 |
| roles | 角色表 | 系统管理-角色权限 |
| permissions | 权限菜单表 | 系统管理-角色权限 |
| departments | 部门表 | 系统管理-用户管理 |
| user_roles | 用户角色关联表 | 系统管理-角色权限 |
| role_permissions | 角色权限关联表 | 系统管理-角色权限 |
| role_departments | 角色部门关联表 | 系统管理-角色权限 |

### 2.2 系统配置相关（5张）

| 表名 | 功能说明 | 模块归属 |
|------|---------|---------|
| system_configs | 系统配置表 | 系统管理-系统配置 |
| data_dicts | 数据字典表 | 系统管理-数据字典 |
| dict_types | 字典类型表 | 系统管理-数据字典 |
| menus | 菜单表 | 系统管理-菜单管理 |
| attachments | 附件表 | 系统管理-文件管理 |

### 2.3 日志审计相关（3张）

| 表名 | 功能说明 | 模块归属 |
|------|---------|---------|
| operation_logs | 操作日志表 | 系统管理-操作日志 |
| login_logs | 登录日志表 | 系统管理-登录日志 |
| audit_logs | 审计日志表 | 系统管理-审计日志 |

### 2.4 其他系统表（10张）

| 表名 | 功能说明 | 模块归属 |
|------|---------|---------|
| notifications | 系统通知表 | 系统管理-通知管理 |
| files | 文件管理表 | 系统管理-文件管理 |
| jobs | 定时任务表 | 系统管理-定时任务 |
| job_logs | 任务执行日志表 | 系统管理-定时任务 |
| cache | 缓存表 | 系统基础 |
| sessions | 会话表 | 系统基础 |
| migrations | 迁移记录表 | 系统基础 |
| alembic_version | Alembic版本表 | 系统基础 |
| websocket_connections | WebSocket连接表 | 系统基础 |
| rate_limits | 限流配置表 | 系统基础 |

---

## 三、CRM业务表（68张）- 基于实际数据库

### 3.1 模块1：系统基础与权限（2张）

| 表名 | 功能说明 | 表类型 | 上级菜单 |
|------|---------|-------|---------|
| crm_data_dicts | 数据字典表 | 独立表 | 系统管理 |
| crm_user_extensions | 用户扩展表 | 从表→系统用户 | 系统管理 |

### 3.2 模块2：客户管理（16张）⭐核心模块

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_customers | 客户主表 | **核心主表** | 一级菜单 | - |
| crm_contacts | 联系人表 | 从表 | 客户管理 | crm_customers |
| crm_customer_addresses | 客户地址表 | 从表 | 客户管理 | crm_customers |
| crm_customer_pool_logs | 客户池日志表 | 从表 | 客户管理 | crm_customers |
| crm_pool_transfers | 客户池转移表 | 从表 | 客户管理 | crm_customers |
| crm_customer_duplicate_logs | 查重冲突日志表 | 从表 | 客户管理 | crm_customers |
| crm_customer_tags | 客户标签关联表 | 从表 | 客户管理 | crm_customers |
| crm_customer_timeline | 客户动态时间线表 | 从表 | 客户管理 | crm_customers |
| crm_customer_activities | 客户活动表 | 从表 | 客户管理 | crm_customers |
| crm_customer_attachments | 客户附件表 | 从表 | 客户管理 | crm_customers |
| crm_customer_change_logs | 客户变更日志表 | 从表 | 客户管理 | crm_customers |
| crm_contact_relations | 联系人关系图谱表 | 从表 | 联系人管理 | crm_contacts |
| crm_contact_visits | 联系人拜访记录表 | 从表 | 联系人管理 | crm_contacts |
| crm_contact_change_logs | 联系人变更日志表 | 从表 | 联系人管理 | crm_contacts |
| crm_tag_definitions | 标签定义表 | 独立表 | AI智能 | - |
| crm_tags | 标签表（旧版） | 独立表 | AI智能 | - |

### 3.3 模块3：销售管理（8张）

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_opportunities | 商机表 | **核心主表** | 一级菜单 | - |
| crm_opportunity_stages | 商机阶段表 | 从表 | 商机管理 | crm_opportunities |
| crm_opportunity_products | 商机产品关联表 | 从表 | 商机管理 | crm_opportunities |
| crm_follow_records | 跟进记录表 | 从表 | 商机管理 | crm_opportunities |
| crm_followups | 跟进记录表（旧版） | 从表 | 商机管理 | crm_opportunities |
| crm_joint_followups | 联合跟进表 | 从表 | 商机管理 | crm_opportunities |
| crm_tasks | 待办任务表 | 独立表 | 销售管理 | - |
| crm_sales_activities | 销售活动表 | 独立表 | 销售管理 | - |

### 3.4 模块4：产品管理（9张）

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_product_categories | 产品分类表 | **核心主表** | 一级菜单 | - |
| crm_products | 产品表 | 从表 | 产品管理 | crm_product_categories |
| crm_product_skus | 产品SKU表 | 从表 | 产品管理 | crm_products |
| crm_product_prices | 产品价格表 | 从表 | 产品管理 | crm_products |
| crm_price_tiers | 价格阶梯表 | 从表 | 产品管理 | crm_product_prices |
| crm_product_documents | 产品文档表 | 从表 | 产品管理 | crm_products |
| crm_product_price_policies | 产品价格策略表 | 从表 | 产品管理 | crm_products |
| crm_product_price_history | 产品价格历史表 | 从表 | 产品管理 | crm_products |
| crm_import_records | 导入记录表 | 独立表 | 系统管理 | - |

### 3.5 模块5：营销服务（6张）

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_marketing_campaigns | 市场活动表 | **核心主表** | 一级菜单 | - |
| crm_marketing_channels | 活动渠道表 | 从表 | 市场活动 | crm_marketing_campaigns |
| crm_campaigns | 活动表（旧版） | **核心主表** | 一级菜单 | - |
| crm_campaign_leads | 活动线索关联表 | 从表 | 市场活动 | crm_campaigns |
| crm_leads | 线索表 | **核心主表** | 一级菜单 | - |
| crm_lead_scores | 线索评分表 | 从表 | 线索管理 | crm_leads |

### 3.6 模块6：客户成功（5张）

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_customer_health | 客户健康度表 | 从表 | 客户成功 | crm_customers |
| crm_customer_health_scores | 客户健康度评分表 | 从表 | 客户成功 | crm_customers |
| crm_customer_satisfaction_surveys | 客户满意度调查表 | 从表 | 客户成功 | crm_customers |
| crm_satisfaction_surveys | 满意度调查表（旧版） | 从表 | 客户成功 | crm_customers |
| crm_renewals | 续约管理表 | 从表 | 客户成功 | crm_customers |

### 3.7 模块7：商务合同（11张表）⭐复杂模块

> ⚠️ v2.0更新：补充发票表（crm_invoices），原9张表调整为11张表

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_quotations | 报价单表 | **核心主表** | 一级菜单 | - |
| crm_quotation_items | 报价单明细表 | 从表 | 报价单管理 | crm_quotations |
| crm_contracts | 合同表 | **核心主表** | 一级菜单 | - |
| crm_contract_items | 合同明细表 | 从表 | 合同管理 | crm_contracts |
| crm_contract_invoices | 合同发票表 | 从表 | 合同管理 | crm_contracts |
| crm_orders | 订单表 | **核心主表** | 订单管理 | crm_contracts |
| crm_order_items | 订单明细表 | 从表 | 订单管理 | crm_orders |
| crm_payments | 回款记录表 | 从表 | 回款管理 | crm_contracts |
| crm_deliveries | 交付记录表 | 从表 | 交付管理 | crm_orders |
| crm_invoices | 发票表 | **独立主表** | 发票管理 | - |
| crm_invoice_payments | 发票回款关联表 | 从表 | 发票管理 | crm_invoices |

### 3.8 模块8：AI智能（4张）

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_ai_tags | AI标签定义表 | 独立表 | AI智能 | - |
| crm_customer_profiles | 客户画像表 | 从表 | AI智能 | crm_customers |
| crm_ai_customer_profiles | AI客户画像表（新版） | 从表 | AI智能 | crm_customers |
| crm_ai_recommendations | AI推荐表 | 从表 | AI智能 | crm_customers |

### 3.9 模块9：数据报表（3张）

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_report_templates | 报表模板表 | 独立表 | 数据报表 | - |
| crm_report_instances | 报表实例表 | 从表 | 数据报表 | crm_report_templates |
| crm_invoices | 发票表 | 独立表 | 发票管理 | - |

### 3.10 模块10：工作流引擎（5张表）⭐新增

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_workflow_rules | 工作流规则表 | 独立表 | 系统管理-工作流 | - |
| crm_workflow_approvals | 工作流审批表 | 从表 | 系统管理-工作流 | crm_workflow_rules |
| crm_workflow_logs | 工作流日志表 | 从表 | 系统管理-工作流 | crm_workflow_rules |
| crm_workflow_actions | 工作流动作表 | 从表 | 系统管理-工作流 | crm_workflow_rules |
| crm_workflow_triggers | 工作流触发器表 | 从表 | 系统管理-工作流 | crm_workflow_rules |

### 3.11 其他模块（2张）

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_sales_targets | 销售目标表 | 独立表 | 销售管理 | - |
| crm_customer_profiles | 客户画像表 | 从表 | AI智能 | crm_customers |

---

## 四、主从表关系全景图

### 4.1 客户管理模块（1主→13从）

```
crm_customers（客户主表）⭐
├── crm_contacts（联系人）
├── crm_customer_addresses（客户地址）
├── crm_customer_pool_logs（客户池日志）
├── crm_pool_transfers（客户池转移）
├── crm_customer_duplicate_logs（查重冲突日志）
├── crm_customer_tags（客户标签关联）
├── crm_customer_timeline（客户动态时间线）
├── crm_customer_activities（客户活动）
├── crm_customer_attachments（客户附件）
├── crm_customer_change_logs（客户变更日志）
├── crm_customer_health（客户健康度）
├── crm_customer_health_scores（客户健康度评分）
└── crm_renewals（续约管理）

crm_contacts（联系人表）
├── crm_contact_relations（联系人关系图谱）
├── crm_contact_visits（联系人拜访记录）
└── crm_contact_change_logs（联系人变更日志）
```

### 4.2 销售管理模块（1主→3从）

```
crm_opportunities（商机表）⭐
├── crm_opportunity_stages（商机阶段）
├── crm_opportunity_products（商机产品关联）
└── crm_follow_records（跟进记录）
```

### 4.3 产品管理模块（2主→7从）

```
crm_product_categories（产品分类）⭐
└── crm_products（产品）
    ├── crm_product_skus（产品SKU）
    ├── crm_product_prices（产品价格）
    │   └── crm_price_tiers（价格阶梯）
    ├── crm_product_documents（产品文档）
    ├── crm_product_price_policies（产品价格策略）
    └── crm_product_price_history（产品价格历史）
```

### 4.4 营销服务模块（2主→3从）

```
crm_marketing_campaigns（市场活动）⭐
└── crm_marketing_channels（活动渠道）

crm_leads（线索）⭐
└── crm_lead_scores（线索评分）
```

### 4.5 商务合同模块（3主→6从）⭐最复杂

```
crm_quotations（报价单）⭐
└── crm_quotation_items（报价单明细）

crm_contracts（合同）⭐
├── crm_contract_items（合同明细）
├── crm_contract_invoices（合同发票）
├── crm_orders（订单）
│   ├── crm_order_items（订单明细）
│   └── crm_deliveries（交付记录）
├── crm_payments（回款记录）
└── crm_invoices（发票）
```

### 4.6 客户成功模块（1主→4从）

```
crm_customers（客户）⭐
├── crm_customer_satisfaction_surveys（客户满意度调查）
├── crm_satisfaction_surveys（满意度调查-旧版）
└── crm_renewals（续约管理）
```

---

## 五、核心业务链路表映射

### 5.1 客户全生命周期

```
营销线索(crm_leads) 
  ↓ 转化
客户创建(crm_customers) 
  ↓
客户池分配(crm_customer_pool_logs) 
  ↓
商机跟进(crm_opportunities + crm_follow_records) 
  ↓
报价生成(crm_quotations + crm_quotation_items) 
  ↓
合同签署(crm_contracts + crm_contract_items) 
  ↓
订单执行(crm_orders + crm_order_items) 
  ↓
交付管理(crm_deliveries) 
  ↓
回款管理(crm_payments) 
  ↓
客户成功(crm_customer_health_scores + crm_renewals)
```

### 5.2 外键关系说明（使用COMMENT，无物理外键）

```sql
-- 客户相关外键
COMMENT ON COLUMN crm_contacts.customer_id IS '客户ID（关联crm_customers.id）';
COMMENT ON COLUMN crm_opportunities.customer_id IS '客户ID（关联crm_customers.id）';
COMMENT ON COLUMN crm_leads.customer_id IS '客户ID（关联crm_customers.id）';

-- 商机相关外键
COMMENT ON COLUMN crm_quotations.opportunity_id IS '商机ID（关联crm_opportunities.id）';
COMMENT ON COLUMN crm_opportunity_stages.opportunity_id IS '商机ID（关联crm_opportunities.id）';

-- 合同相关外键
COMMENT ON COLUMN crm_quotations.contract_id IS '合同ID（关联crm_contracts.id）';
COMMENT ON COLUMN crm_orders.contract_id IS '合同ID（关联crm_contracts.id）';
COMMENT ON COLUMN crm_payments.contract_id IS '合同ID（关联crm_contracts.id）';

-- 订单相关外键
COMMENT ON COLUMN crm_order_items.order_id IS '订单ID（关联crm_orders.id）';
COMMENT ON COLUMN crm_deliveries.order_id IS '订单ID（关联crm_orders.id）';

-- 产品相关外键
COMMENT ON COLUMN crm_products.category_id IS '分类ID（关联crm_product_categories.id）';
COMMENT ON COLUMN crm_product_prices.product_id IS '产品ID（关联crm_products.id）';
COMMENT ON COLUMN crm_quotation_items.product_id IS '产品ID（关联crm_products.id）';
```

---

## 六、模块功能覆盖度

| 模块 | 表数量 | 核心功能 | 覆盖度 | 备注 |
|------|-------|---------|-------|------|
| 系统基础与权限 | 2 | 数据字典、用户扩展 | 90% | 基于框架扩展 |
| 客户管理 | 16 | 客户档案、联系人、资源池、查重 | 95% | ⭐核心模块 |
| 销售管理 | 8 | 商机、跟进记录、任务 | 85% | 需补充自动化 |
| 产品管理 | 9 | 产品分类、SKU、价格体系 | 90% | 制造业特色 |
| 营销服务 | 6 | 市场活动、线索管理 | 80% | 需补充培育 |
| 客户成功 | 5 | 健康度、续约、满意度 | 75% | 需补充干预 |
| 商务合同 | 9 | 报价、合同、订单、回款 | 85% | ⭐复杂模块 |
| AI智能 | 4 | 客户画像、AI标签、推荐 | 70% | 需补充模型 |
| 数据报表 | 3 | 报表模板、实例 | 60% | 需补充分析 |
| 系统管理 | 4 | 通知、日志、工作流 | 80% | 需补充集成 |

---

## 七、关键缺失功能清单

基于00文档分析，以下功能需要重点补充：

### P0级缺失（必须实现）

1. **订单管理模块**
   - 订单创建、生产跟踪、分批交货
   - 对应表：crm_orders, crm_order_items, crm_deliveries

2. **交付管理模块**
   - 交货进度、物流跟踪、客户签收
   - 对应表：crm_deliveries

3. **发票管理模块**
   - 发票申请、开具、邮寄、红冲
   - 对应表：crm_invoices, crm_contract_invoices

4. **自动化工作流引擎**
   - 4种触发条件 + 6种执行动作
   - 对应表：crm_workflow_rules, crm_workflow_approvals, crm_workflow_logs

### P1级缺失（建议实现）

1. **线索评分模型详细配置**
   - 5维度权重可配置
   - 对应表：crm_lead_scores

2. **客户健康度详细配置**
   - 5维度权重可配置 + 行动计划
   - 对应表：crm_customer_health, crm_customer_health_scores

3. **制造业价格计算器**
   - 面积×单价×数量×(1+损耗率)+工艺费用
   - 对应表：crm_product_prices, crm_price_tiers

---

## 八、数据字典清单（需要提前创建）

### 客户管理模块
- crm_industry - 客户行业字典
- crm_customer_level - 客户等级字典（A/B/C/D）
- crm_customer_status - 客户状态字典
- crm_customer_scale - 企业规模字典
- crm_pool_type - 资源池类型字典
- crm_contact_role - 联系人角色字典

### 销售管理模块
- crm_opportunity_stage - 商机阶段字典
- crm_opportunity_source - 商机来源字典
- crm_follow_type - 跟进类型字典
- crm_task_priority - 任务优先级字典

### 产品管理模块
- crm_product_category - 产品分类字典
- crm_product_status - 产品状态字典
- crm_price_type - 价格类型字典

### 营销服务模块
- crm_campaign_type - 活动类型字典
- crm_lead_source - 线索来源字典
- crm_lead_status - 线索状态字典
- crm_lead_level - 线索等级字典

### 客户成功模块
- crm_health_level - 健康度等级字典
- crm_renewal_status - 续约状态字典
- crm_survey_type - 调查类型字典

### 商务合同模块
- crm_quotation_status - 报价单状态字典
- crm_contract_status - 合同状态字典
- crm_contract_type - 合同类型字典
- crm_payment_status - 付款状态字典
- crm_payment_method - 回款方式字典
- crm_order_status - 订单状态字典
- crm_invoice_type - 发票类型字典

### AI智能模块
- crm_tag_type - 标签类型字典
- crm_recommendation_type - 推荐类型字典

### 系统管理模块
- crm_notification_type - 通知类型字典

---

**文档版本**: v1.0  
**创建日期**: 2026-04-22  
**下次更新**: 根据实际开发进度更新
