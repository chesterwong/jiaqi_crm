# CRM核心-完整数据库表结构与模块映射 v4.0

> **版本**: v4.0（完整菜单层级映射版）  
> **日期**: 2026-04-25  
> **数据库**: PostgreSQL 17 - 总计99张表（系统25张 + CRM业务74张）  
> **依据**: 实际数据库表结构（2026-04-25实测）+ 6张P0核心表补充  
> **更新说明**: v4.0新增§九"74张表完整菜单层级映射"，明确每张表的generate_menu配置、一级菜单归属、二级菜单名称、路由路径，直接指导代码生成器操作

---

## ⚠️ 使用指南（2026-04-25）

**本文档定位**: CRM所有数据库表的**结构字典 + 模块归属 + 菜单层级映射**，是代码生成前的**必查文档**。

**配套文档**:
| 文档 | 用途 | 何时使用 |
|------|------|---------|
| **本文档（表结构与模块映射）** | 查表归属、菜单层级 | 生成代码前确定表属于哪个模块/菜单 |
| [代码生成器使用指南_v4.0](CRM核心-代码生成器使用指南_v4.0.md) | 操作手册 | 打开代码生成器界面时对照操作 |
| [00-业务逻辑补充方案](00-CRM功能模块业务逻辑补充方案.md) | 后端代码/SQL参考 | 生成完CRUD后写业务逻辑时参考 |
| [01-产品核心功能清单](01-CRM产品核心功能清单.md) | 功能需求 | 确认功能点和交互设计 |
| [02-核心功能模块任务清单](02-CRM核心功能模块任务清单.md) | 任务排期 | 安排开发计划 |

**v4.0核心更新**：
1. ✅ 新增§九：74张表完整菜单层级映射（35张独立菜单 + 39张嵌入父页面）
2. ✅ 清理过时引用，所有补充文档已归档至old/目录
3. ✅ 模块10表计数修正（6→7张）

**v3.0补充内容（已完成）**：
1. ✅ 模块3：销售管理+3张 - crm_competitors, crm_call_records, crm_visit_records
2. ✅ 模块6：客户成功+1张 - crm_service_tickets
3. ✅ 模块10：系统管理+2张 - crm_approval_records, crm_alert_rules
4. ✅ 工作流引擎5张表、发票管理2张表

---

## 一、总体架构

### 1.1 表统计总览

```
CRM系统数据库表总计：99张
├── 系统基础表（FastApiAdmin框架）: 25张
│   ├── 用户权限相关: 7张
│   ├── 系统配置相关: 5张
│   ├── 日志审计相关: 3张
│   └── 其他系统表: 10张
│
└── CRM业务表（自定义开发）: 74张
    ├── 模块1-系统基础与权限: 2张
    ├── 模块2-客户管理: 16张 ⭐核心模块
    ├── 模块3-销售管理: 11张 ⭐新增3张
    ├── 模块4-产品管理: 9张
    ├── 模块5-营销服务: 6张
    ├── 模块6-客户成功: 6张 ⭐新增1张
    ├── 模块7-商务合同: 11张 ⭐复杂模块
    ├── 模块8-AI智能: 4张
    ├── 模块9-数据报表: 3张
    ├── 模块10-系统管理与集成: 7张 ⭐新增2张
    └── 其他模块: 2张
```

### 1.2 核心业务流向（v3.0更新）

```
线索(leads) ──转化──▶ 客户(customers) ──▶ 联系人(contacts)
                              │
                              ▼
                          商机(opportunities)
                              │
                    ┌─────────┼─────────┐
                    ▼         ▼         ▼
              竞争对手    通话记录    拜访记录 ⭐新增
           (competitors) (call_records)(visit_records)
                    │
                    ▼
                         报价(quotations)
                              │
                              ▼
                    审批记录(approvals) ⭐新增
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
              │
              ▼
        服务工单(tickets) ⭐新增
              │
              ▼
        客户满意度(surveys)
              │
              ▼
        客户健康度(health)
              │
              ▼
        预警规则(alerts) ⭐新增
              │
              ▼
        续约管理(renewals)
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

## 三、CRM业务表（74张）- 基于实际数据库

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

### 3.3 模块3：销售管理（11张）⭐v3.0新增3张

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
| **crm_competitors** | **竞争对手管理** | **独立主表** ⭐新增 | **销售管理** | - |
| **crm_call_records** | **通话记录** | **从表** ⭐新增 | **客户管理** | **crm_customers** |
| **crm_visit_records** | **拜访记录** | **从表** ⭐新增 | **销售管理** | **crm_customers, crm_opportunities** |

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

### 3.6 模块6：客户成功（6张）⭐v3.0新增1张

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_customer_health | 客户健康度表 | 从表 | 客户成功 | crm_customers |
| crm_customer_health_scores | 客户健康度评分表 | 从表 | 客户成功 | crm_customers |
| crm_customer_satisfaction_surveys | 客户满意度调查表 | 从表 | 客户成功 | crm_customers |
| crm_satisfaction_surveys | 满意度调查表（旧版） | 从表 | 客户成功 | crm_customers |
| crm_renewals | 续约管理表 | 从表 | 客户成功 | crm_customers |
| **crm_service_tickets** | **服务工单管理** | **独立主表** ⭐新增 | **客户成功** | **crm_customers, crm_contracts** |

### 3.7 模块7：商务合同（11张表）⭐复杂模块

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

### 3.10 模块10：工作流与系统管理（7张）⭐v3.0新增2张

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_workflow_rules | 工作流规则表 | 独立表 | 系统管理-工作流 | - |
| crm_workflow_approvals | 工作流审批表 | 从表 | 系统管理-工作流 | crm_workflow_rules |
| crm_workflow_logs | 工作流日志表 | 从表 | 系统管理-工作流 | crm_workflow_rules |
| crm_workflow_actions | 工作流动作表 | 从表 | 系统管理-工作流 | crm_workflow_rules |
| crm_workflow_triggers | 工作流触发器表 | 从表 | 系统管理-工作流 | crm_workflow_rules |
| **crm_approval_records** | **审批记录** | **独立主表** ⭐新增 | **系统管理-审批** | **crm_contracts, crm_quotations** |
| **crm_alert_rules** | **预警规则配置** | **独立主表** ⭐新增 | **系统管理-预警** | **-** |

### 3.11 其他模块（2张）

| 表名 | 功能说明 | 表类型 | 上级菜单 | 关联主表 |
|------|---------|-------|---------|---------|
| crm_sales_targets | 销售目标表 | 独立表 | 销售管理 | - |
| crm_customer_profiles | 客户画像表 | 从表 | AI智能 | crm_customers |

---

## 四、主从表关系全景图（v3.0更新）

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
├── crm_call_records（通话记录）⭐v3.0新增
└── crm_renewals（续约管理）

crm_contacts（联系人表）
├── crm_contact_relations（联系人关系图谱）
├── crm_contact_visits（联系人拜访记录）
└── crm_contact_change_logs（联系人变更日志）
```

### 4.2 销售管理模块（更新）⭐v3.0

```
销售管理模块（11张表）

1. 商机管理
crm_opportunities（商机表）⭐
├── crm_opportunity_stages（商机阶段）
├── crm_opportunity_products（商机产品关联）
└── crm_follow_records（跟进记录）

2. 竞争对手管理 ⭐v3.0新增
crm_competitors（竞争对手）⭐新增
└── 与商机关联（逻辑关联）

3. 销售活动记录 ⭐v3.0新增
crm_customers（客户）
├── crm_call_records（通话记录）⭐新增
└── crm_visit_records（拜访记录）⭐新增

4. 任务管理
crm_tasks（待办任务）
crm_sales_activities（销售活动）
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

### 4.6 客户成功模块（更新）⭐v3.0

```
客户成功模块（6张表）

1. 客户健康度
crm_customers（客户）⭐
├── crm_customer_health（客户健康度）
├── crm_customer_health_scores（客户健康度评分）
└── crm_renewals（续约管理）

2. 服务工单 ⭐v3.0新增
crm_service_tickets（服务工单）⭐新增
├── 关联 crm_customers（客户）
├── 关联 crm_contacts（联系人）
├── 关联 crm_contracts（合同）
└── 关联 crm_satisfaction_surveys（满意度）
```

### 4.7 审批与预警模块 ⭐v3.0新增

```
审批与预警模块（2张新表）

1. 审批记录 ⭐v3.0新增
crm_approval_records（审批记录）⭐新增
├── 关联 crm_contracts（合同审批）
├── 关联 crm_quotations（报价审批）
├── 关联 crm_workflow_approvals（工作流审批）
└── 关联 sys_user（申请人/审批人）

2. 预警规则 ⭐v3.0新增
crm_alert_rules（预警规则）⭐新增
├── 关联 crm_customer_health（健康度预警）
├── 关联 crm_contracts（合同到期预警）
├── 关联 crm_customers（流失预警）
├── 关联 crm_opportunities（商机停滞预警）
└── 关联 crm_notifications（预警通知）
```

---

## 五、核心业务链路表映射（v3.0更新）

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
┌─ 竞争对手对比(crm_competitors) ⭐新增
├─ 通话记录(crm_call_records) ⭐新增
└─ 拜访记录(crm_visit_records) ⭐新增
  ↓
报价生成(crm_quotations + crm_quotation_items) 
  ↓
审批流程(crm_approval_records) ⭐新增
  ↓
合同签署(crm_contracts + crm_contract_items) 
  ↓
订单执行(crm_orders + crm_order_items) 
  ↓
交付管理(crm_deliveries) 
  ↓
回款管理(crm_payments) 
  ↓
服务工单(crm_service_tickets) ⭐新增
  ↓
客户成功(crm_customer_health_scores + crm_renewals)
  ↓
预警监控(crm_alert_rules) ⭐新增
```

### 5.2 外键关系说明（使用COMMENT，无物理外键）

```sql
-- 客户相关外键
COMMENT ON COLUMN crm_contacts.customer_id IS '客户ID（关联crm_customers.id）';
COMMENT ON COLUMN crm_opportunities.customer_id IS '客户ID（关联crm_customers.id）';
COMMENT ON COLUMN crm_leads.customer_id IS '客户ID（关联crm_customers.id）';
COMMENT ON COLUMN crm_call_records.customer_id IS '客户ID（关联crm_customers.id）';
COMMENT ON COLUMN crm_visit_records.customer_id IS '客户ID（关联crm_customers.id）';
COMMENT ON COLUMN crm_service_tickets.customer_id IS '客户ID（关联crm_customers.id）';

-- 商机相关外键
COMMENT ON COLUMN crm_quotations.opportunity_id IS '商机ID（关联crm_opportunities.id）';
COMMENT ON COLUMN crm_opportunity_stages.opportunity_id IS '商机ID（关联crm_opportunities.id）';
COMMENT ON COLUMN crm_visit_records.opportunity_id IS '商机ID（关联crm_opportunities.id）';

-- 合同相关外键
COMMENT ON COLUMN crm_quotations.contract_id IS '合同ID（关联crm_contracts.id）';
COMMENT ON COLUMN crm_orders.contract_id IS '合同ID（关联crm_contracts.id）';
COMMENT ON COLUMN crm_payments.contract_id IS '合同ID（关联crm_contracts.id）';
COMMENT ON COLUMN crm_service_tickets.contract_id IS '合同ID（关联crm_contracts.id）';
COMMENT ON COLUMN crm_approval_records.related_id IS '关联记录ID（关联业务表主键）';

-- 订单相关外键
COMMENT ON COLUMN crm_order_items.order_id IS '订单ID（关联crm_orders.id）';
COMMENT ON COLUMN crm_deliveries.order_id IS '订单ID（关联crm_orders.id）';

-- 产品相关外键
COMMENT ON COLUMN crm_products.category_id IS '分类ID（关联crm_product_categories.id）';
COMMENT ON COLUMN crm_product_prices.product_id IS '产品ID（关联crm_products.id）';
COMMENT ON COLUMN crm_quotation_items.product_id IS '产品ID（关联crm_products.id）';

-- 预警规则关联（逻辑关联）
COMMENT ON COLUMN crm_alert_rules.trigger_condition IS '触发条件（JSON格式，包含表名和字段名）';
```

---

## 六、模块功能覆盖度（v3.0更新）

| 模块 | 表数量 | 核心功能 | 覆盖度 | 备注 |
|------|-------|---------|-------|------|
| 系统基础与权限 | 2 | 数据字典、用户扩展 | 90% | 基于框架扩展 |
| 客户管理 | 16 | 客户档案、联系人、资源池、查重 | 95% | ⭐核心模块 |
| **销售管理** | **11** | **商机、跟进、任务、竞争对手、通话、拜访** | **95%** ⬆️ | **⭐v3.0新增3张** |
| 产品管理 | 9 | 产品分类、SKU、价格体系 | 90% | 制造业特色 |
| 营销服务 | 6 | 市场活动、线索管理 | 80% | 需补充培育 |
| **客户成功** | **6** | **健康度、续约、满意度、服务工单** | **90%** ⬆️ | **⭐v3.0新增1张** |
| 商务合同 | 11 | 报价、合同、订单、回款 | 85% | ⭐复杂模块 |
| AI智能 | 4 | 客户画像、AI标签、推荐 | 70% | 需补充模型 |
| 数据报表 | 3 | 报表模板、实例 | 60% | 需补充分析 |
| **系统管理** | **7** | **通知、日志、工作流、审批、预警** | **95%** ⬆️ | **⭐v3.0新增2张** |

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

5. **⭐v3.0新增 - 竞争对手管理**
   - 竞品信息维护、商机对比分析
   - 对应表：crm_competitors

6. **⭐v3.0新增 - 服务工单管理**
   - 工单创建、分配、处理、SLA监控
   - 对应表：crm_service_tickets

7. **⭐v3.0新增 - 审批管理**
   - 合同审批、报价审批、多级审批流程
   - 对应表：crm_approval_records

8. **⭐v3.0新增 - 预警规则**
   - 合同到期、客户流失、健康度下降预警
   - 对应表：crm_alert_rules

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

## 八、数据字典清单（v3.0补充）

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
- **⭐competitor_threat_level - 竞争对手威胁级别（v3.0新增）**
- **⭐call_type - 通话类型字典（v3.0新增）**
- **⭐visit_type - 拜访类型字典（v3.0新增）**

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
- **⭐ticket_type - 工单类型字典（v3.0新增）**
- **⭐ticket_priority - 工单优先级字典（v3.0新增）**
- **⭐ticket_status - 工单状态字典（v3.0新增）**

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
- **⭐approval_type - 审批类型字典（v3.0新增）**
- **⭐approval_status - 审批状态字典（v3.0新增）**
- **⭐alert_type - 预警类型字典（v3.0新增）**
- **⭐alert_severity - 预警严重程度字典（v3.0新增）**

---

## 九、74张表完整菜单层级映射（代码生成快速参考）

> ⚠️ **详细树状结构（含外键、sub_table_name/sub_table_fk_name）请参见：**
> 📄 [CRM核心-代码生成器使用指南_v4.0.md §第三部分](CRM核心-代码生成器使用指南_v4.0.md)

**核心数据**：74张表中 **35张** 独立二级菜单 + **39张** 嵌入父页面Tab

### 9.1 模块→菜单→表树状层级总览

```
📦 客户管理 ─── 2个二级菜单 · 16张表
├── 📁 客户档案 → crm_customers [主] ─── 12个子Tab(地址/池日志/转移/查重/标签/时间线/活动/附件/变更/健康评分/通话记录/旧版画像)
└── 📁 联系人管理 → crm_contacts [从] ─── 3个子Tab(关系图谱/拜访记录/变更日志)

📦 销售管理 ─── 6个二级菜单 · 11张表
├── 📁 商机管理 → crm_opportunities [主] ─── 5个子Tab(阶段/关联产品/跟进/跟进旧版/联合跟进)
├── 📁 竞争对手管理 → crm_competitors [独立] ⭐v3.0
├── 📁 待办任务 → crm_tasks [独立]
├── 📁 销售活动 → crm_sales_activities [独立]
├── 📁 拜访记录 → crm_visit_records [从·独立菜单] ⭐v3.0
└── 📁 销售目标 → crm_sales_targets [独立]

📦 产品管理 ─── 2个二级菜单 · 9张表
├── 📁 产品分类 → crm_product_categories [主] → crm_products [从]
└── 📁 产品管理 → crm_products [从·独立菜单] ─── 5个子Tab(SKU/价格/文档/价格策略/价格历史) + 阶梯价子表

📦 营销服务 ─── 3个二级菜单 · 6张表
├── 📁 线索管理 → crm_leads [主] ─── 评分历史Tab
├── 📁 市场活动 → crm_marketing_campaigns [主] ─── 活动渠道Tab
└── 📁 活动管理 → crm_campaigns [主·旧版] ─── 关联线索Tab

📦 客户成功 ─── 4个二级菜单 · 6张表
├── 📁 客户健康度 → crm_customer_health [从·独立菜单]
├── 📁 服务工单 → crm_service_tickets [独立] ⭐v3.0
├── 📁 续约管理 → crm_renewals [从·独立菜单]
└── 📁 满意度调查 → crm_customer_satisfaction_surveys [从·独立菜单] ─── 旧版数据子表

📦 商务合同 ─── 7个二级菜单 · 11张表 ⭐最复杂
├── 📁 报价单管理 → crm_quotations [主] ─── 报价明细Tab
├── 📁 合同管理 → crm_contracts [主] ─── 合同明细/关联发票Tab
├── 📁 订单管理 → crm_orders [从·独立菜单] ─── 订单明细/交付记录Tab
├── 📁 回款管理 → crm_payments [从·独立菜单]
├── 📁 交付管理 → crm_deliveries [从·独立菜单]
└── 📁 发票管理 → crm_invoices [独立] ─── 回款关联Tab

📦 AI智能 ─── 4个二级菜单 · 4张表
├── 📁 客户画像 → crm_ai_customer_profiles [从·独立菜单]
├── 📁 智能推荐 → crm_ai_recommendations [从·独立菜单]
├── 📁 标签定义 → crm_tag_definitions [独立] ─── 旧版标签子表
└── 📁 AI标签定义 → crm_ai_tags [独立]

📦 数据报表 ─── 1个二级菜单 · 3张表
└── 📁 报表模板 → crm_report_templates [独立] ─── 报表实例子表

📦 系统管理 ─── 7个二级菜单 · 7张表
├── 📁 数据字典 → crm_data_dicts [独立]
├── 📁 用户扩展 → crm_user_extensions [从·独立菜单]
├── 📁 导入记录 → crm_import_records [独立]
├── 📁 工作流规则 → crm_workflow_rules [独立] ─── 执行日志/动作配置/触发器Tab
├── 📁 工作流审批 → crm_workflow_approvals [从·独立菜单]
├── 📁 审批管理 → crm_approval_records [独立] ⭐v3.0
└── 📁 预警规则 → crm_alert_rules [独立] ⭐v3.0
```

### 9.2 代码生成器主子表配置速查

> FastApiAdmin代码生成器**原生支持主子表同时生成**：
> - `sub_table_name` — 要一起生成的子表表名
> - `sub_table_fk_name` — 子表的外键字段名
> - 二者**必须同时填写或同时留空**

| 主表 | sub_table_name | sub_table_fk_name | 生成结果 |
|------|:---|:---|------|
| crm_customers | crm_customer_addresses | customer_id | 客户档案 + 地址管理Tab |
| crm_customers | crm_call_records | customer_id | 客户档案 + 通话记录Tab |
| crm_opportunities | crm_opportunity_stages | opportunity_id | 商机管理 + 阶段历史Tab |
| crm_opportunities | crm_follow_records | opportunity_id | 商机管理 + 跟进记录Tab |
| crm_products | crm_product_skus | product_id | 产品管理 + SKU管理Tab |
| crm_quotations | crm_quotation_items | quotation_id | 报价单 + 明细Tab |
| crm_contracts | crm_contract_items | contract_id | 合同 + 明细Tab |
| crm_orders | crm_order_items | order_id | 订单 + 明细Tab |
| crm_workflow_rules | crm_workflow_logs | rule_id | 工作流规则 + 执行日志Tab |

> 💡 **注意**：每次生成只能关联1个子表，多子表需分批。嵌入Tab的子表设置 `sub: true`，不生成独立菜单。

---

**文档版本**: v4.0  
**创建日期**: 2026-04-22  
**更新日期**: 2026-04-25（新增§九完整菜单层级映射）  
**下次更新**: 根据实际开发进度更新
