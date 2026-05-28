# CRM核心-代码生成器使用指南 v3.0 补充文档

> **版本**: v3.0补充  
> **日期**: 2026-04-25  
> **目标**: 补充6张P0核心表的代码生成器配置  
> **关联文档**: [CRM核心-代码生成器使用指南.md](./CRM核心-代码生成器使用指南.md)（原文档v1.0）

---

## 📊 一、表数量更新

### 原文档说明

- 原文档版本：v1.0
- 原文档表数量：68张CRM业务表
- 原文档生成批次：10批次

### v3.0更新

- **更新后表数量：74张CRM业务表**
- **更新后生成批次：11批次**
- **新增6张P0核心表**：
  1. crm_competitors（竞争对手管理）
  2. crm_service_tickets（服务工单管理）
  3. crm_call_records（通话记录）
  4. crm_visit_records（拜访记录）
  5. crm_approval_records（审批记录）
  6. crm_alert_rules（预警规则配置）

---

## 🗂️ 二、生成批次调整

### 原文档批次（10批次）

```
第1批：系统基础（2张表）
第2批：客户管理-主表（1张表）
第3批：客户管理-从表（15张表）
第4批：销售管理（8张表）
第5批：产品管理（9张表）
第6批：营销服务（6张表）
第7批：客户成功（5张表）
第8批：商务合同（9张表）
第9批：AI智能（4张表）
第10批：数据报表与集成（7张表）
```

### v3.0批次调整（11批次）

```
第1批：系统基础（2张表）
  └── crm_data_dicts, crm_user_extensions

第2批：客户管理-主表（1张表）⭐核心
  └── crm_customers

第3批：客户管理-从表（15张表）
  └── crm_contacts, crm_customer_addresses, crm_customer_pool_logs, ...

第4批：销售管理-主表（4张表）⭐调整
  ├── crm_opportunities
  ├── crm_tasks
  ├── crm_sales_activities
  └── crm_competitors ⭐新增

第5批：销售管理-从表（7张表）⭐调整
  ├── crm_opportunity_stages
  ├── crm_opportunity_products
  ├── crm_follow_records
  ├── crm_followups
  ├── crm_joint_followups
  ├── crm_call_records ⭐新增
  └── crm_visit_records ⭐新增

第6批：产品管理（9张表）
  └── crm_product_categories, crm_products, crm_product_skus, ...

第7批：营销服务（6张表）
  └── crm_leads, crm_marketing_campaigns, crm_marketing_channels, ...

第8批：客户成功（6张表）⭐调整
  ├── crm_customer_health
  ├── crm_customer_health_scores
  ├── crm_customer_satisfaction_surveys
  ├── crm_satisfaction_surveys
  ├── crm_renewals
  └── crm_service_tickets ⭐新增

第9批：商务合同（9张表）⭐最复杂
  └── crm_quotations, crm_contracts, crm_orders, ...

第10批：审批与预警（2张表）⭐新增
  ├── crm_approval_records ⭐新增
  └── crm_alert_rules ⭐新增

第11批：AI智能与报表（7张表）
  └── crm_ai_customer_profiles, crm_report_templates, crm_workflow_rules, ...
```

### 调整原因

1. **第4批新增crm_competitors**：
   - 竞争对手是独立主表，不依赖其他表
   - 可在销售管理早期生成
   
2. **第5批新增通话/拜访记录**：
   - 这两张表是客户和商机的从表
   - 需要在客户表（第2批）和商机表（第4批）之后生成
   
3. **第8批新增crm_service_tickets**：
   - 服务工单依赖客户表和合同表
   - 需要在客户成功模块生成
   
4. **第10批新增审批/预警**：
   - 这两张表是系统级功能
   - 依赖多张业务表（合同、报价、健康度等）
   - 需要后期生成

---

## ⚙️ 三、6张新表代码生成配置

### 3.1 crm_competitors - 竞争对手管理

**生成配置**：

```json
{
  "table_name": "crm_competitors",
  "module": "销售管理",
  "menu_name": "竞争对手管理",
  "parent_menu": "销售管理",
  "table_type": "independent",
  "has_children": false,
  "generate_crud": true,
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "competitors",
  "sort_order": 4,
  "fields_config": {
    "list_fields": [
      "competitor_name",
      "competitor_code",
      "industry",
      "threat_level",
      "market_share",
      "status"
    ],
    "form_fields": [
      "competitor_name",
      "competitor_code",
      "industry",
      "company_size",
      "headquarters",
      "website",
      "phone",
      "description",
      "strengths",
      "weaknesses",
      "market_share",
      "threat_level",
      "status"
    ],
    "search_fields": [
      "competitor_name",
      "competitor_code",
      "industry",
      "threat_level"
    ]
  }
}
```

**特殊配置说明**：
- `table_type: independent` - 独立主表，无父表
- `data_permission: true` - 启用数据权限（dept_id, owner_id）
- `threat_level` - 使用字典：competitor_threat_level

---

### 3.2 crm_service_tickets - 服务工单管理

**生成配置**：

```json
{
  "table_name": "crm_service_tickets",
  "module": "客户成功",
  "menu_name": "服务工单",
  "parent_menu": "客户成功",
  "table_type": "independent",
  "has_children": false,
  "generate_crud": true,
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "ticket",
  "sort_order": 5,
  "fields_config": {
    "list_fields": [
      "ticket_no",
      "customer_id",
      "ticket_type",
      "priority",
      "status",
      "assignee_id",
      "created_time",
      "is_overdue"
    ],
    "form_fields": [
      "ticket_no",
      "customer_id",
      "contact_id",
      "contract_id",
      "ticket_type",
      "priority",
      "title",
      "description",
      "source",
      "category",
      "expected_resolution_time",
      "sla_hours"
    ],
    "search_fields": [
      "ticket_no",
      "customer_id",
      "ticket_type",
      "priority",
      "status",
      "assignee_id"
    ],
    "readonly_fields": [
      "ticket_no",
      "resolution_notes",
      "actual_resolution_time",
      "customer_satisfaction"
    ]
  },
  "workflow_config": {
    "status_flow": ["open", "processing", "resolved", "closed"],
    "auto_assign": true,
    "sla_enabled": true,
    "notification_enabled": true
  }
}
```

**特殊配置说明**：
- `ticket_no` - 自动生成，格式：TKT-YYYYMMDD-0001
- `status` - 工作流字段，状态流转：open → processing → resolved → closed
- `sla_enabled: true` - 启用SLA超时监控
- 关联查询：customer_id → crm_customers, assignee_id → sys_user

---

### 3.3 crm_call_records - 通话记录

**生成配置**：

```json
{
  "table_name": "crm_call_records",
  "module": "销售管理",
  "menu_name": "通话记录",
  "parent_menu": "客户管理",
  "table_type": "child",
  "parent_table": "crm_customers",
  "foreign_key": "customer_id",
  "generate_crud": true,
  "generate_menu": false,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "phone",
  "fields_config": {
    "list_fields": [
      "customer_id",
      "contact_id",
      "call_type",
      "direction",
      "duration_seconds",
      "call_time",
      "summary",
      "owner_id"
    ],
    "form_fields": [
      "customer_id",
      "contact_id",
      "call_type",
      "direction",
      "phone_number",
      "duration_seconds",
      "call_time",
      "summary",
      "follow_up_action",
      "follow_up_time",
      "sentiment"
    ],
    "search_fields": [
      "customer_id",
      "call_type",
      "direction",
      "call_time"
    ]
  }
}
```

**特殊配置说明**：
- `table_type: child` - 从表，在客户详情中作为子表格展示
- `generate_menu: false` - 不生成独立菜单，嵌入客户详情页
- `duration_seconds` - 前端转换为分钟显示
- 关联查询：customer_id → crm_customers, contact_id → crm_contacts

---

### 3.4 crm_visit_records - 拜访记录

**生成配置**：

```json
{
  "table_name": "crm_visit_records",
  "module": "销售管理",
  "menu_name": "拜访记录",
  "parent_menu": "销售管理",
  "table_type": "child",
  "parent_table": "crm_customers",
  "foreign_key": "customer_id",
  "generate_crud": true,
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "visit",
  "fields_config": {
    "list_fields": [
      "customer_id",
      "contact_id",
      "opportunity_id",
      "visit_type",
      "visit_date",
      "duration_minutes",
      "location",
      "is_successful",
      "owner_id"
    ],
    "form_fields": [
      "customer_id",
      "contact_id",
      "opportunity_id",
      "visit_type",
      "visit_date",
      "start_time",
      "end_time",
      "location",
      "purpose",
      "participants",
      "summary",
      "outcome",
      "next_action",
      "next_visit_date",
      "expense_amount",
      "mileage",
      "transport_type",
      "rating"
    ],
    "search_fields": [
      "customer_id",
      "visit_type",
      "visit_date",
      "owner_id"
    ]
  }
}
```

**特殊配置说明**：
- 可在客户详情页作为子表格展示
- 也可作为独立菜单查看所有拜访记录
- `expense_amount` - 支持费用统计和报销
- 关联查询：customer_id → crm_customers, opportunity_id → crm_opportunities

---

### 3.5 crm_approval_records - 审批记录

**生成配置**：

```json
{
  "table_name": "crm_approval_records",
  "module": "系统管理",
  "menu_name": "审批管理",
  "parent_menu": "系统管理",
  "table_type": "independent",
  "has_children": false,
  "generate_crud": true,
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": true,
  "soft_delete": true,
  "icon": "approval",
  "sort_order": 10,
  "fields_config": {
    "list_fields": [
      "approval_no",
      "approval_type",
      "title",
      "applicant_id",
      "approval_status",
      "current_approver_id",
      "current_step",
      "total_steps",
      "deadline",
      "created_time"
    ],
    "form_fields": [
      "approval_no",
      "approval_type",
      "related_table",
      "related_id",
      "title",
      "description",
      "priority",
      "deadline",
      "cc_users"
    ],
    "search_fields": [
      "approval_no",
      "approval_type",
      "approval_status",
      "applicant_id",
      "current_approver_id"
    ],
    "readonly_fields": [
      "approval_no",
      "approval_status",
      "current_approver_id",
      "current_step",
      "approved_time",
      "approval_notes",
      "rejection_reason"
    ]
  },
  "workflow_config": {
    "status_flow": ["pending", "approving", "approved", "rejected", "cancelled"],
    "multi_level_approval": true,
    "timeout_reminder": true,
    "escalation_enabled": true
  }
}
```

**特殊配置说明**：
- `approval_no` - 自动生成，格式：APP-YYYYMMDD-0001
- `approval_status` - 工作流字段，支持多级审批
- `related_table` + `related_id` - 动态关联业务表
- 权限控制：申请人可提交，审批人可审批，其他人只读

---

### 3.6 crm_alert_rules - 预警规则配置

**生成配置**：

```json
{
  "table_name": "crm_alert_rules",
  "module": "系统管理",
  "menu_name": "预警规则",
  "parent_menu": "系统管理",
  "table_type": "independent",
  "has_children": false,
  "generate_crud": true,
  "generate_menu": true,
  "generate_api": true,
  "generate_model": true,
  "data_permission": false,
  "soft_delete": true,
  "icon": "alert",
  "sort_order": 11,
  "fields_config": {
    "list_fields": [
      "rule_name",
      "rule_code",
      "alert_type",
      "severity",
      "is_active",
      "trigger_frequency",
      "notify_channels",
      "sort_order"
    ],
    "form_fields": [
      "rule_name",
      "rule_code",
      "alert_type",
      "trigger_condition",
      "trigger_frequency",
      "severity",
      "is_active",
      "notify_channels",
      "notify_users",
      "notify_roles",
      "template_id",
      "escalation_rule",
      "suppress_hours",
      "description"
    ],
    "search_fields": [
      "rule_name",
      "rule_code",
      "alert_type",
      "severity",
      "is_active"
    ],
    "special_fields": {
      "trigger_condition": {
        "type": "json_editor",
        "description": "触发条件（JSON格式）"
      },
      "notify_channels": {
        "type": "multi_select",
        "options": ["system_notification", "email", "sms", "wechat"]
      }
    }
  }
}
```

**特殊配置说明**：
- `data_permission: false` - 系统级配置表，不需要数据权限
- `trigger_condition` - JSON编辑器，支持复杂条件配置
- `notify_channels` - 多选：系统通知/邮件/短信/微信
- `is_active` - 启用/禁用开关
- `suppress_hours` - 静默期，避免重复预警

---

## 📚 四、数据字典补充（v3.0）

### 4.1 新增字典清单

原文档包含30+个字典，v3.0新增**8个字典**：

| 字典类型 | 字典值 | 说明 | 关联表 |
|---------|--------|------|--------|
| **competitor_threat_level** | **high, medium, low** | **竞争对手威胁级别** | **crm_competitors** |
| **call_type** | **sales_followup, after_sales, negotiation, other** | **通话类型** | **crm_call_records** |
| **visit_type** | **first_visit, requirement, demo, negotiation, revisit, other** | **拜访类型** | **crm_visit_records** |
| **ticket_type** | **repair, consultation, complaint, other** | **工单类型** | **crm_service_tickets** |
| **ticket_priority** | **urgent, high, medium, low** | **工单优先级** | **crm_service_tickets** |
| **ticket_status** | **open, processing, resolved, closed** | **工单状态** | **crm_service_tickets** |
| **approval_type** | **contract, quotation, discount, expense, other** | **审批类型** | **crm_approval_records** |
| **alert_type** | **contract_expire, customer_churn, overdue_followup, health_decline, opportunity_stuck, other** | **预警类型** | **crm_alert_rules** |
| **alert_severity** | **critical, high, medium, low** | **预警严重程度** | **crm_alert_rules** |
| **approval_status** | **pending, approving, approved, rejected, cancelled** | **审批状态** | **crm_approval_records** |

### 4.2 字典创建SQL

```sql
-- 1. 竞争对手威胁级别
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('竞争对手威胁级别', 'competitor_threat_level', 'on', '竞争对手威胁级别分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'competitor_threat_level', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['高威胁', '中威胁', '低威胁']) AS label,
    unnest(ARRAY['high', 'medium', 'low']) AS value,
    unnest(ARRAY[1, 2, 3]) AS sort,
    unnest(ARRAY['高风险竞争对手', '中等风险竞争对手', '低风险竞争对手']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'competitor_threat_level'
) t;

-- 2. 通话类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('通话类型', 'call_type', 'on', '客户通话类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'call_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['销售跟进', '售后服务', '商务谈判', '其他']) AS label,
    unnest(ARRAY['sales_followup', 'after_sales', 'negotiation', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['销售跟进相关通话', '售后服务相关通话', '商务谈判通话', '其他类型通话']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'call_type'
) t;

-- 3. 拜访类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('拜访类型', 'visit_type', 'on', '客户拜访类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'visit_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['初次拜访', '需求调研', '方案演示', '商务谈判', '售后回访', '其他']) AS label,
    unnest(ARRAY['first_visit', 'requirement', 'demo', 'negotiation', 'revisit', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4, 5, 6]) AS sort,
    unnest(ARRAY['首次客户拜访', '客户需求调研拜访', '产品方案演示拜访', '商务合同谈判拜访', '售后服务回访', '其他类型拜访']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'visit_type'
) t;

-- 4. 工单类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('工单类型', 'ticket_type', 'on', '服务工单类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'ticket_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['故障报修', '技术咨询', '投诉建议', '其他']) AS label,
    unnest(ARRAY['repair', 'consultation', 'complaint', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['产品故障报修工单', '技术使用咨询工单', '客户投诉建议工单', '其他类型工单']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'ticket_type'
) t;

-- 5. 工单优先级
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('工单优先级', 'ticket_priority', 'on', '服务工单优先级分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'ticket_priority', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['紧急', '高', '中', '低']) AS label,
    unnest(ARRAY['urgent', 'high', 'medium', 'low']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['紧急处理工单', '高优先级工单', '中优先级工单', '低优先级工单']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'ticket_priority'
) t;

-- 6. 工单状态
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('工单状态', 'ticket_status', 'on', '服务工单状态分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'ticket_status', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['待处理', '处理中', '已解决', '已关闭']) AS label,
    unnest(ARRAY['open', 'processing', 'resolved', 'closed']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['新建待处理工单', '正在处理中工单', '已解决问题工单', '已关闭工单']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'ticket_status'
) t;

-- 7. 审批类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('审批类型', 'approval_type', 'on', '审批类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'approval_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['合同审批', '报价审批', '折扣审批', '费用审批', '其他']) AS label,
    unnest(ARRAY['contract', 'quotation', 'discount', 'expense', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4, 5]) AS sort,
    unnest(ARRAY['合同签署审批', '报价单审批', '价格折扣审批', '费用报销审批', '其他类型审批']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'approval_type'
) t;

-- 8. 审批状态
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('审批状态', 'approval_status', 'on', '审批流程状态分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'approval_status', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['待提交', '审批中', '已通过', '已驳回', '已取消']) AS label,
    unnest(ARRAY['pending', 'approving', 'approved', 'rejected', 'cancelled']) AS value,
    unnest(ARRAY[1, 2, 3, 4, 5]) AS sort,
    unnest(ARRAY['草稿待提交审批', '正在审批流程中', '审批已通过', '审批已驳回', '审批已取消']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'approval_status'
) t;

-- 9. 预警类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('预警类型', 'alert_type', 'on', '预警规则类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'alert_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['合同到期', '客户流失', '超期未跟进', '健康度下降', '商机停滞', '其他']) AS label,
    unnest(ARRAY['contract_expire', 'customer_churn', 'overdue_followup', 'health_decline', 'opportunity_stuck', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4, 5, 6]) AS sort,
    unnest(ARRAY['合同即将到期预警', '客户可能流失预警', '客户超期未跟进预警', '客户健康度下降预警', '商机长时间停滞预警', '其他类型预警']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'alert_type'
) t;

-- 10. 预警严重程度
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('预警严重程度', 'alert_severity', 'on', '预警严重程度分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'alert_severity', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['严重', '高', '中', '低']) AS label,
    unnest(ARRAY['critical', 'high', 'medium', 'low']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['严重级别预警，需立即处理', '高级别预警，需优先处理', '中级别预警，需关注处理', '低级别预警，可延后处理']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'alert_severity'
) t;
```

---

## 🎯 五、菜单权限配置（v3.0补充）

### 5.1 新增菜单

原文档未包含这6张表的菜单配置，补充如下：

| 菜单名称 | 父菜单 | 类型 | 路由 | 权限标识 | 排序 |
|---------|-------|------|------|---------|------|
| **竞争对手管理** | **销售管理** | **二级菜单** | **/sales/competitors** | **crm:competitors:list** | **4** |
| **通话记录** | **客户管理** | **二级菜单** | **/customers/calls** | **crm:calls:list** | **5** |
| **拜访记录** | **销售管理** | **二级菜单** | **/sales/visits** | **crm:visits:list** | **6** |
| **服务工单** | **客户成功** | **二级菜单** | **/success/tickets** | **crm:tickets:list** | **5** |
| **审批管理** | **系统管理** | **二级菜单** | **/system/approvals** | **crm:approvals:list** | **10** |
| **预警规则** | **系统管理** | **二级菜单** | **/system/alerts** | **crm:alerts:list** | **11** |

### 5.2 按钮权限

| 菜单 | 按钮 | 权限标识 | 说明 |
|------|------|---------|------|
| 竞争对手管理 | 新增 | crm:competitors:create | 创建竞争对手记录 |
| 竞争对手管理 | 编辑 | crm:competitors:update | 编辑竞争对手信息 |
| 竞争对手管理 | 删除 | crm:competitors:delete | 删除竞争对手记录 |
| 竞争对手管理 | 导出 | crm:competitors:export | 导出竞争对手列表 |
| 服务工单 | 新增 | crm:tickets:create | 创建服务工单 |
| 服务工单 | 编辑 | crm:tickets:update | 编辑工单信息 |
| 服务工单 | 处理 | crm:tickets:process | 处理工单（特殊权限） |
| 服务工单 | 关闭 | crm:tickets:close | 关闭工单（特殊权限） |
| 服务工单 | 删除 | crm:tickets:delete | 删除工单 |
| 审批管理 | 审批 | crm:approvals:approve | 通过审批（特殊权限） |
| 审批管理 | 驳回 | crm:approvals:reject | 驳回审批（特殊权限） |
| 审批管理 | 查看 | crm:approvals:view | 查看审批详情 |
| 预警规则 | 新增 | crm:alerts:create | 创建预警规则 |
| 预警规则 | 编辑 | crm:alerts:update | 编辑预警规则 |
| 预警规则 | 启用/禁用 | crm:alerts:toggle | 启用或禁用规则（特殊权限） |
| 预警规则 | 测试 | crm:alerts:test | 测试预警规则（特殊权限） |
| 预警规则 | 删除 | crm:alerts:delete | 删除预警规则 |

---

## ✅ 六、验证清单

### 6.1 生成后验证

```bash
# 1. 验证Model生成
ls -la backend/app/models/ | grep -E "competitor|ticket|call|visit|approval|alert"

# 2. 验证API生成
ls -la backend/app/api/ | grep -E "competitor|ticket|call|visit|approval|alert"

# 3. 验证Schema生成
ls -la backend/app/schemas/ | grep -E "competitor|ticket|call|visit|approval|alert"

# 4. 验证CRUD生成
ls -la backend/app/crud/ | grep -E "competitor|ticket|call|visit|approval|alert"
```

### 6.2 数据库验证

```sql
-- 验证6张表是否存在
SELECT table_name, obj_description(oid) AS comment
FROM information_schema.tables t
JOIN pg_class c ON t.table_name = c.relname
WHERE table_name IN (
  'crm_competitors',
  'crm_service_tickets',
  'crm_call_records',
  'crm_visit_records',
  'crm_approval_records',
  'crm_alert_rules'
)
ORDER BY table_name;

-- 验证数据权限字段
SELECT table_name, 
  SUM(CASE WHEN column_name = 'dept_id' THEN 1 ELSE 0 END) as has_dept_id,
  SUM(CASE WHEN column_name = 'owner_id' THEN 1 ELSE 0 END) as has_owner_id
FROM information_schema.columns
WHERE table_name IN (
  'crm_competitors',
  'crm_service_tickets',
  'crm_call_records',
  'crm_visit_records',
  'crm_approval_records',
  'crm_alert_rules'
)
AND column_name IN ('dept_id', 'owner_id')
GROUP BY table_name;

-- 验证字典数据
SELECT dt.dict_type, COUNT(dd.id) as data_count
FROM sys_dict_type dt
LEFT JOIN sys_dict_data dd ON dt.id = dd.dict_type_id
WHERE dt.dict_type IN (
  'competitor_threat_level',
  'call_type',
  'visit_type',
  'ticket_type',
  'ticket_priority',
  'ticket_status',
  'approval_type',
  'approval_status',
  'alert_type',
  'alert_severity'
)
GROUP BY dt.dict_type;
```

---

## 📝 七、总结

### 7.1 v3.0更新要点

| 维度 | v1.0 | v3.0 | 变化 |
|------|------|------|------|
| CRM业务表 | 68张 | 74张 | +6张 |
| 生成批次 | 10批 | 11批 | +1批 |
| 数据字典 | 30+个 | 40+个 | +10个 |
| 菜单数量 | - | +6个二级菜单 | 新增 |
| 按钮权限 | - | +17个按钮权限 | 新增 |

### 7.2 下一步工作

1. ✅ ~~创建6张P0核心表~~（已完成）
2. ✅ ~~更新数据库表映射文档~~（已完成）
3. ⏸️ 使用代码生成器生成6张表的CRUD代码
4. ⏸️ 创建菜单和权限配置SQL
5. ⏸️ 创建10个数据字典数据SQL
6. ⏸️ 测试生成的API接口
7. ⏸️ 创建前端页面（如需要）

---

**文档版本**: v3.0补充  
**创建日期**: 2026-04-25  
**创建人**: AI助手  
**关联文档**: 
- CRM核心-代码生成器使用指南.md（v1.0）
- CRM核心-完整数据库表结构与模块映射_v3.0.md
- CRM核心文档更新-6张P0核心表补充指南_v3.0.md
