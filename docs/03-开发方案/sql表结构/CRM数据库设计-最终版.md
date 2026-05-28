# 制造业CRM系统数据库设计文档（最终版）

## 文档信息
| 项目 | 内容 |
|------|------|
| 数据库类型 | PostgreSQL 14+ |
| 设计版本 | v2.0（最终版） |
| 设计日期 | 2026-04-17 |
| 适用行业 | 通用CRM（制造业字段已标记） |
| 表总数 | 71张（64张业务表 + 7张系统基础表） |

---

## 一、总体设计原则

### 1.1 命名规范
| 元素 | 规范 | 示例 |
|------|------|------|
| 表名 | 小写下划线命名，单数名词 | `customer`, `sales_order` |
| 字段名 | 小写下划线命名 | `customer_name`, `created_at` |
| 主键 | `id` | BIGSERIAL PRIMARY KEY |
| 外键 | `{表名}_id` | `customer_id`, `user_id` |
| 索引 | `idx_{表名}_{字段}` | `idx_customer_name` |
| 唯一索引 | `uk_{表名}_{字段}` | `uk_user_email` |

### 1.2 通用字段约定
```sql
-- 所有表必须包含的审计字段
id              BIGSERIAL PRIMARY KEY
created_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
updated_at      TIMESTAMP WITH TIME ZONE
created_by      BIGINT
updated_by      BIGINT
deleted_at      TIMESTAMP WITH TIME ZONE  -- 软删除标记，NULL表示未删除
version         INTEGER DEFAULT 1        -- 乐观锁版本号
```

### 1.3 核心设计理念
1. **软删除优先**：所有业务表支持软删除，通过 `deleted_at` 字段实现
2. **审计追溯**：完整的创建人、修改人、时间戳记录
3. **业务闭环**：从线索到回款的完整业务链路
4. **扩展性**：使用JSONB字段支持动态扩展
5. **性能优化**：合理设计索引和分区策略

---

## 二、整体数据模型架构

### 2.1 模块划分
```
┌─────────────────────────────────────────────────────────────────────────┐
│                         制造业CRM数据库架构                               │
├─────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐                                                    │
│  │ 4.0 系统基础模块 │  用户/角色/权限/部门/数据字典/操作日志               │
│  └─────────────────┘                                                    │
│  ┌─────────────────┐                                                    │
│  │ 4.1 客户管理模块 │  客户档案/联系人/地址/标签/客户池                    │
│  └─────────────────┘                                                    │
│  ┌─────────────────┐                                                    │
│  │ 4.2 销售管理模块 │  商机/商机阶段/跟进记录/销售目标/任务               │
│  └─────────────────┘                                                    │
│  ┌─────────────────┐                                                    │
│  │ 4.3 产品管理模块 │  产品分类/产品/SKU/价格/价格等级                    │
│  └─────────────────┘                                                    │
│  ┌─────────────────┐                                                    │
│  │ 4.4 营销服务模块 │  营销活动/线索/线索评分/营销渠道                    │
│  └─────────────────┘                                                    │
│  ┌─────────────────┐                                                    │
│  │ 4.5 客户成功模块 │  健康度评分/续费管理/满意度调查                     │
│  └─────────────────┘                                                    │
│  ┌─────────────────┐                                                    │
│  │ 4.6 商务合同模块 │  报价单/合同/订单/回款/发票                        │
│  └─────────────────┘                                                    │
│  ┌─────────────────┐                                                    │
│  │ 4.7 AI智能模块  │  客户画像/AI标签/AI推荐                            │
│  └─────────────────┘                                                    │
│  ┌─────────────────┐                                                    │
│  │ 4.8 数据报表模块 │  报表模板/报表实例                                  │
│  └─────────────────┘                                                    │
└─────────────────────────────────────────────────────────────────────────┘
```

### 2.2 核心业务流向
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
           订单           回款计划          发票
          (orders)      (payment_plans)  (invoices)
              │               │               │
              ▼               ▼               ▼
           回款            回款记录           │
        (payments)         ──────────────────┘
              │
              ▼
        客户健康度
    (customer_health_scores)
```

---

## 三、核心数据流向详解

### 3.1 客户全生命周期
```
营销线索 → 客户创建 → 客户池分配 → 商机跟进 → 合同签署 → 订单执行 → 回款 → 客户成功
```

### 3.2 业务闭环
| 阶段 | 核心表 | 关键操作 |
|------|--------|----------|
| 获客 | leads | 线索录入、评分、分配 |
| 转化 | opportunities | 商机创建、阶段推进 |
| 报价 | quotations | 报价生成、审批、发送 |
| 签约 | contracts | 合同创建、签署、执行 |
| 履约 | orders | 订单处理、发货、收款 |
| 成功 | customer_health_scores | 健康度监控、续费 |

---

## 四、完整数据库表设计

---

## 4.0 系统基础模块

### 4.0.1 用户表 (crm_users)
> **功能树对齐**：系统管理 → 用户管理

```sql
CREATE TABLE crm_users (
    id                  BIGSERIAL PRIMARY KEY,
    username            VARCHAR(50) NOT NULL UNIQUE,
    email               VARCHAR(255) NOT NULL UNIQUE,
    phone               VARCHAR(20),
    password_hash       VARCHAR(255) NOT NULL,
    real_name           VARCHAR(100) NOT NULL,
    avatar_url          VARCHAR(500),
    employee_no         VARCHAR(50) UNIQUE,
    department_id       BIGINT REFERENCES crm_departments(id),
    position            VARCHAR(100),
    manager_id          BIGINT REFERENCES crm_users(id),
    
    -- 用户状态
    status              VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'locked')),
    last_login_at       TIMESTAMP WITH TIME ZONE,
    last_login_ip       VARCHAR(45),
    password_changed_at TIMESTAMP WITH TIME ZONE,
    password_expire_at  DATE,
    failed_login_count  INTEGER DEFAULT 0,
    
    -- 多因素认证
    mfa_enabled         BOOLEAN DEFAULT FALSE,
    mfa_secret          VARCHAR(255),
    
    -- 偏好设置
    language            VARCHAR(10) DEFAULT 'zh-CN',
    timezone            VARCHAR(50) DEFAULT 'Asia/Shanghai',
    notification_prefs  JSONB DEFAULT '{}',
    
    -- 审计字段
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_users_department ON crm_users(department_id);
CREATE INDEX idx_crm_users_manager ON crm_users(manager_id);
CREATE INDEX idx_crm_users_status ON crm_users(status);
CREATE INDEX idx_crm_users_email ON crm_users(email);
CREATE INDEX idx_crm_users_phone ON crm_users(phone);
CREATE INDEX idx_crm_users_deleted ON crm_users(deleted_at) WHERE deleted_at IS NULL;
```

### 4.0.2 角色表 (crm_roles)
> **功能树对齐**：系统管理 → 角色权限管理

```sql
CREATE TABLE crm_roles (
    id                  BIGSERIAL PRIMARY KEY,
    role_code           VARCHAR(50) NOT NULL UNIQUE,
    role_name           VARCHAR(100) NOT NULL,
    role_type           VARCHAR(20) NOT NULL CHECK (role_type IN ('system', 'custom')),
    description         TEXT,
    data_scope          VARCHAR(20) DEFAULT 'self' CHECK (data_scope IN ('all', 'dept', 'self')),
    
    -- 角色层级（用于权限继承）
    parent_id           BIGINT REFERENCES crm_roles(id),
    level               INTEGER DEFAULT 1,
    
    -- 状态
    is_system           BOOLEAN DEFAULT FALSE,  -- 系统内置角色不可删除
    status              VARCHAR(20) DEFAULT 'active',
    sort_order          INTEGER DEFAULT 0,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_roles_parent ON crm_roles(parent_id);
CREATE INDEX idx_crm_roles_code ON crm_roles(role_code);
```

### 4.0.3 权限菜单表 (crm_permissions)
> **功能树对齐**：系统管理 → 角色权限管理

```sql
CREATE TABLE crm_permissions (
    id                  BIGSERIAL PRIMARY KEY,
    permission_code     VARCHAR(100) NOT NULL UNIQUE,
    permission_name     VARCHAR(100) NOT NULL,
    
    -- 权限类型（支持树形结构）
    permission_type     VARCHAR(20) NOT NULL CHECK (permission_type IN ('menu', 'button', 'api', 'data')),
    parent_id           BIGINT REFERENCES crm_permissions(id),
    level               INTEGER DEFAULT 1,
    path                VARCHAR(500),          -- 树形路径，如 /system/user
    icon                VARCHAR(100),
    
    -- 权限标识
    resource_path       VARCHAR(255),           -- API路径
    http_method         VARCHAR(10),            -- GET/POST/PUT/DELETE
    
    -- 排序与状态
    sort_order          INTEGER DEFAULT 0,
    status              VARCHAR(20) DEFAULT 'active',
    is_public           BOOLEAN DEFAULT FALSE,  -- 公共权限无需分配
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_permissions_parent ON crm_permissions(parent_id);
CREATE INDEX idx_crm_permissions_code ON crm_permissions(permission_code);
CREATE INDEX idx_crm_permissions_type ON crm_permissions(permission_type);
```

### 4.0.4 部门表 (crm_departments)
> **功能树对齐**：系统管理 → 用户管理

```sql
CREATE TABLE crm_departments (
    id                  BIGSERIAL PRIMARY KEY,
    dept_code           VARCHAR(50) NOT NULL UNIQUE,
    dept_name           VARCHAR(100) NOT NULL,
    
    -- 树形结构
    parent_id           BIGINT REFERENCES crm_departments(id),
    path                VARCHAR(500),           -- '/1/3/5/'
    level               INTEGER DEFAULT 1,
    leaf                BOOLEAN DEFAULT TRUE,
    
    -- 部门属性
    dept_type           VARCHAR(20),            -- 总部/分公司/部门/小组
    manager_id          BIGINT REFERENCES crm_users(id),
    cost_center         VARCHAR(50),
    
    -- 联系方式
    contact_phone       VARCHAR(20),
    contact_email       VARCHAR(255),
    address             TEXT,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    sort_order          INTEGER DEFAULT 0,
    
    -- 扩展数据
    extra_data          JSONB DEFAULT '{}',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_departments_parent ON crm_departments(parent_id);
CREATE INDEX idx_crm_departments_path ON crm_departments(path);
CREATE INDEX idx_crm_departments_manager ON crm_departments(manager_id);
```

### 4.0.5 用户角色关联表 (crm_user_roles)
> **功能树对齐**：系统管理 → 角色权限管理

```sql
CREATE TABLE crm_user_roles (
    id                  BIGSERIAL PRIMARY KEY,
    user_id             BIGINT NOT NULL REFERENCES crm_users(id),
    role_id             BIGINT NOT NULL REFERENCES crm_roles(id),
    
    -- 生效时间范围（可选）
    effective_from      TIMESTAMP WITH TIME ZONE,
    effective_to        TIMESTAMP WITH TIME ZONE,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1,
    
    UNIQUE(user_id, role_id)
);

CREATE INDEX idx_crm_user_roles_user ON crm_user_roles(user_id);
CREATE INDEX idx_crm_user_roles_role ON crm_user_roles(role_id);
```

### 4.0.6 角色权限关联表 (crm_role_permissions)
> **功能树对齐**：系统管理 → 角色权限管理

```sql
CREATE TABLE crm_role_permissions (
    id                  BIGSERIAL PRIMARY KEY,
    role_id             BIGINT NOT NULL REFERENCES crm_roles(id),
    permission_id       BIGINT NOT NULL REFERENCES crm_permissions(id),
    
    -- 权限约束（行级权限）
    constraints         JSONB DEFAULT '{}',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1,
    
    UNIQUE(role_id, permission_id)
);

CREATE INDEX idx_crm_role_permissions_role ON crm_role_permissions(role_id);
CREATE INDEX idx_crm_role_permissions_permission ON crm_role_permissions(permission_id);
```

### 4.0.7 数据字典表 (crm_data_dicts)
> **功能树对齐**：系统管理 → 系统配置

```sql
CREATE TABLE crm_data_dicts (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 字典类型
    dict_type           VARCHAR(50) NOT NULL,  -- 字典分类
    dict_code           VARCHAR(100) NOT NULL, -- 字典项代码
    
    -- 字典项信息
    dict_label          VARCHAR(100) NOT NULL, -- 显示文本
    dict_value          VARCHAR(255),           -- 存储值
    dict_sort           INTEGER DEFAULT 0,
    dict_status         VARCHAR(20) DEFAULT 'active',
    
    -- 样式配置
    css_class           VARCHAR(100),          -- CSS类名
    list_class          VARCHAR(100),          -- 列表样式
    color_class         VARCHAR(50),            -- 颜色
    
    -- 树形支持
    parent_id           BIGINT REFERENCES crm_data_dicts(id),
    
    -- 扩展属性
    is_default          BOOLEAN DEFAULT FALSE,
    is_leaf             BOOLEAN DEFAULT TRUE,
    remark              VARCHAR(500),
    extra_data          JSONB DEFAULT '{}',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1,
    
    UNIQUE(dict_type, dict_code)
);

CREATE INDEX idx_crm_data_dicts_type ON crm_data_dicts(dict_type);
CREATE INDEX idx_crm_data_dicts_parent ON crm_data_dicts(parent_id);
```

---

## 4.1 客户管理模块

### 4.1.1 客户主表 (crm_customers)
> **功能树对齐**：客户管理 → 客户档案列表 / 客户详情页（360°视图）

```sql
CREATE TABLE crm_customers (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    customer_code       VARCHAR(50) NOT NULL UNIQUE,
    customer_name       VARCHAR(200) NOT NULL,
    customer_short_name VARCHAR(100),
    customer_type       VARCHAR(20) NOT NULL,          -- customer_type: 企业客户/个人客户/集团客户
    industry            VARCHAR(50),                  -- 所属行业
    scale               VARCHAR(20),                   -- 企业规模: SME/中大型/大型/集团
    source              VARCHAR(30),                  -- 客户来源: 展会/转介绍/官网/自开拓
    
    -- 工商信息
    registration_no     VARCHAR(50),                  -- 工商注册号
    tax_no              VARCHAR(50),                   -- 税号
    legal_person        VARCHAR(100),                 -- 法人代表
    established_date    DATE,                          -- 成立日期
    registered_capital  DECIMAL(18,2),                -- 注册资本
    paid_capital        DECIMAL(18,2),                -- 实缴资本
    
    -- 联系方式
    website             VARCHAR(255),
    main_phone          VARCHAR(50),
    main_email          VARCHAR(255),
    
    -- 地址信息
    country             VARCHAR(50) DEFAULT '中国',
    province            VARCHAR(50),
    city                VARCHAR(50),
    district            VARCHAR(50),
    address             VARCHAR(500),
    
    -- 客户分级
    level               VARCHAR(20) DEFAULT 'C',     -- A/B/C/D
    rating              INTEGER DEFAULT 3 CHECK (rating BETWEEN 1 AND 5),
    
    -- 归属
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id       BIGINT REFERENCES crm_departments(id),
    territory           VARCHAR(100),               -- 所属区域
    
    -- 客户状态
    status              VARCHAR(20) DEFAULT 'potential',
                        CHECK (status IN ('potential', 'active', 'inactive', 'churned', 'blacklist')),
    customer_since      DATE,
    first_order_date    DATE,
    last_order_date     DATE,
    
    -- 业务数据
    total_revenue       DECIMAL(18,2) DEFAULT 0,
    total_orders        INTEGER DEFAULT 0,
    credit_limit        DECIMAL(18,2) DEFAULT 0,
    outstanding_amount  DECIMAL(18,2) DEFAULT 0,
    payment_days        INTEGER DEFAULT 0,
    
    -- 关联客户（用于集团客户）
    parent_customer_id  BIGINT REFERENCES crm_customers(id),
    is_parent           BOOLEAN DEFAULT FALSE,
    
    -- AI分析
    customer_segment    VARCHAR(50),                  -- 客户分群
    churn_risk          VARCHAR(20),                  -- 流失风险: high/medium/low
    
    -- 扩展数据
    description         TEXT,
    extra_data          JSONB DEFAULT '{}',
    
    -- 审计字段
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
	
	--“公海池”字段
	pool_type VARCHAR(20) DEFAULT 'personal'; --（如 'personal', 'team', 'public'）
	--“资源池”字段
	protection_deadline（保护期截止时间）
	claim_time TIMESTAMP;
	-- 查重键（已在索引中出现但未定义字段）
duplicate_check_key VARCHAR(200);  -- MD5(名称+信用代码+手机)

-- 健康度评分快照（已有 crm_customer_health_scores 表，但主表冗余可提升性能）
health_score DECIMAL(5,2);
);

ALTER TABLE crm_customers ADD COLUMN pool_type VARCHAR(20) DEFAULT 'personal';
ALTER TABLE crm_customers ADD COLUMN protection_deadline TIMESTAMP;
ALTER TABLE crm_customers ADD COLUMN claim_time TIMESTAMP;

CREATE INDEX idx_crm_customers_code ON crm_customers(customer_code);
CREATE INDEX idx_crm_customers_name ON crm_customers(customer_name);
CREATE INDEX idx_crm_customers_owner ON crm_customers(owner_id);
CREATE INDEX idx_crm_customers_dept ON crm_customers(department_id);
CREATE INDEX idx_crm_customers_status ON crm_customers(status);
CREATE INDEX idx_crm_customers_level ON crm_customers(level);
CREATE INDEX idx_crm_customers_industry ON crm_customers(industry);
CREATE INDEX idx_crm_customers_type ON crm_customers(customer_type);
CREATE INDEX idx_crm_customers_parent ON crm_customers(parent_customer_id);
CREATE INDEX idx_customers_health ON crm_customers(health_score);
CREATE INDEX idx_customers_pool ON crm_customers(pool_type, customer_status, is_deleted);
CREATE INDEX idx_customers_credit_code ON crm_customers(credit_code);
CREATE INDEX idx_customers_duplicate ON crm_customers(duplicate_check_key);
CREATE INDEX idx_crm_customers_deleted ON crm_customers(deleted_at) WHERE 
deleted_at IS NULL;






-- 全文检索索引
CREATE INDEX idx_crm_customers_fulltext ON crm_customers 
    USING GIN (to_tsvector('simple', customer_name || ' ' || COALESCE(customer_short_name, '') || ' ' || COALESCE(registration_no, '')));
```

**⚠️ 制造业特色字段警告：**

| 字段名 | 类型 | ⚠️警告 | 说明 |
|--------|------|--------|------|
| supply_chain_position | VARCHAR(50) | ⚠️ 偏离核心功能 | 供应链位置（制造业特色，建议移除） |
| business_type | VARCHAR(50) | ⚠️ 偏离核心功能 | 业务类型（制造业特色，建议移除） |

### 4.1.2 联系人表 (crm_contacts)
> **功能树对齐**：客户管理 → 联系人独立管理

```sql
CREATE TABLE crm_contacts (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    contact_name        VARCHAR(100) NOT NULL,
    contact_code        VARCHAR(50) UNIQUE,
    
    -- 联系信息
    gender              VARCHAR(10),
    mobile              VARCHAR(30),
    phone               VARCHAR(30),
    email               VARCHAR(255),
    wechat              VARCHAR(100),
    qq                  VARCHAR(50),
    
    -- 职位信息
    department          VARCHAR(100),
    position            VARCHAR(100),
    job_level           VARCHAR(30),                 -- 职级: 高层/中层/基层
    
    -- 地址
    country             VARCHAR(50) DEFAULT '中国',
    province            VARCHAR(50),
    city                VARCHAR(50),
    district            VARCHAR(50),
    address             VARCHAR(500),
    
    -- 重要性
    is_primary          BOOLEAN DEFAULT FALSE,
    is_decision_maker   BOOLEAN DEFAULT FALSE,
    importance          VARCHAR(20) DEFAULT 'normal',
    
    -- 偏好
    preferred_contact   VARCHAR(20) DEFAULT 'any',
    best_contact_time   VARCHAR(100),
    
    -- 生日与纪念日
    birthday            DATE,
    birthday_lunar      BOOLEAN DEFAULT FALSE,
    
    -- 社交信息
    linkedin            VARCHAR(255),
    hobbies             TEXT[],
    
    -- 跟进信息
    last_contact_date   TIMESTAMP WITH TIME ZONE,
    next_contact_date   DATE,
    contact_frequency   INTEGER DEFAULT 0,
	--联系人角色（决策链分析）
role_type VARCHAR(20) DEFAULT 'user' CHECK (role_type IN ('decision_maker', 'influencer', 'user', 'other'));
influence_level VARCHAR(20) CHECK (influence_level IN ('high', 'medium', 'low'));
    
    -- 备注
    description         TEXT,
    extra_data          JSONB DEFAULT '{}',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_contacts_customer ON crm_contacts(customer_id);
CREATE INDEX idx_crm_contacts_mobile ON crm_contacts(mobile);
CREATE INDEX idx_crm_contacts_email ON crm_contacts(email);
CREATE INDEX idx_crm_contacts_primary ON crm_contacts(customer_id, is_primary) WHERE is_primary = TRUE;
CREATE INDEX idx_crm_contacts_decision ON crm_contacts(customer_id, is_decision_maker) WHERE is_decision_maker = TRUE;
```

### 4.1.3 客户地址表 (crm_customer_addresses)
> **功能树对齐**：客户管理 → 客户详情页

```sql
CREATE TABLE crm_customer_addresses (
    id                  BIGSERIAL PRIMARY KEY,
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    
    -- 地址类型
    address_type        VARCHAR(20) NOT NULL CHECK (address_type IN ('billing', 'shipping', 'factory', 'warehouse', 'other')),
    address_name        VARCHAR(100),
    
    -- 地址详情
    country             VARCHAR(50) DEFAULT '中国',
    province             VARCHAR(50) NOT NULL,
    city                 VARCHAR(50) NOT NULL,
    district             VARCHAR(50),
    street_address       VARCHAR(300),
    postal_code          VARCHAR(20),
    longitude            DECIMAL(10,7),
    latitude             DECIMAL(10,7),
    
    -- 联系人信息
    contact_name        VARCHAR(100),
    contact_phone       VARCHAR(30),
    
    -- 运营信息
    is_default          BOOLEAN DEFAULT FALSE,
    receiving_hours     VARCHAR(100),
    max_freight_volume  DECIMAL(18,2),               -- ⚠️ 制造业字段：最大货运量(吨)
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    description         TEXT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_customer_addresses_customer ON crm_customer_addresses(customer_id);
CREATE INDEX idx_crm_customer_addresses_type ON crm_customer_addresses(address_type);
CREATE INDEX idx_crm_customer_addresses_default ON crm_customer_addresses(customer_id, is_default) WHERE is_default = TRUE;
```

### 4.1.4 客户池日志表 (crm_customer_pool_logs)
> **功能树对齐**：客户管理 → 客户资源池

```sql
CREATE TABLE crm_customer_pool_logs (
    id                  BIGSERIAL PRIMARY KEY,
    
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    
    -- 转移信息
    action_type         VARCHAR(30) NOT NULL,        -- assign/transfer/claim/release
    action_date         TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    -- 从业人员
    from_user_id        BIGINT REFERENCES crm_users(id),
    from_dept_id        BIGINT REFERENCES crm_departments(id),
    to_user_id          BIGINT REFERENCES crm_users(id),
    to_dept_id          BIGINT REFERENCES crm_departments(id),
    
    -- 原因
    reason              TEXT,
    transfer_type       VARCHAR(20),                 -- manual/auto/reclaim
    
    -- 操作人
    operator_id         BIGINT REFERENCES crm_users(id),
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_customer_pool_logs_customer ON crm_customer_pool_logs(customer_id);
CREATE INDEX idx_crm_customer_pool_logs_action ON crm_customer_pool_logs(action_type);
CREATE INDEX idx_crm_customer_pool_logs_date ON crm_customer_pool_logs(action_date);
CREATE INDEX idx_crm_customer_pool_logs_from_user ON crm_customer_pool_logs(from_user_id);
CREATE INDEX idx_crm_customer_pool_logs_to_user ON crm_customer_pool_logs(to_user_id);
```

-- 查重与防撞单机制,客户查重冲突日志表
CREATE TABLE crm_customer_duplicate_logs (
    id BIGSERIAL PRIMARY KEY,
    customer_a_id BIGINT,
    customer_b_id BIGINT,
    similarity DECIMAL(5,2),
    collision_type VARCHAR(30),
    duplicate_dimensions JSONB,
    handled_by BIGINT,
    handled_at TIMESTAMP,
    result VARCHAR(30)
);
自动化工作流规则表
--超期未跟进自动回收”、“保护期预警”等自动化逻辑
CREATE TABLE crm_workflow_rules (
    id BIGSERIAL PRIMARY KEY,
    rule_name VARCHAR(100) NOT NULL,
    trigger_type VARCHAR(20) NOT NULL, -- time/status/behavior/data
    trigger_config JSONB NOT NULL,
    actions JSONB NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

### 4.1.5 客户标签定义表 (crm_tag_definitions)
> **功能树对齐**：AI智能 → 动态标签管理

```sql
CREATE TABLE crm_tag_definitions (
    id                  BIGSERIAL PRIMARY KEY,
    
    tag_code            VARCHAR(50) NOT NULL UNIQUE,
    tag_name            VARCHAR(100) NOT NULL,
    tag_type            VARCHAR(20) NOT NULL,        -- system/user
    
    -- 标签分类
    category            VARCHAR(50),
    color                VARCHAR(20),
    icon                VARCHAR(50),
    
    -- 使用范围
    applicable_types    VARCHAR(20)[] DEFAULT '{}',
    
    -- 标签属性
    is_multi_select     BOOLEAN DEFAULT TRUE,
    is_required         BOOLEAN DEFAULT FALSE,
    validation_rule     VARCHAR(200),
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    sort_order          INTEGER DEFAULT 0,
    
    -- 统计
    usage_count         INTEGER DEFAULT 0,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_tag_definitions_code ON crm_tag_definitions(tag_code);
CREATE INDEX idx_crm_tag_definitions_type ON crm_tag_definitions(tag_type);
CREATE INDEX idx_crm_tag_definitions_category ON crm_tag_definitions(category);
```

### 4.1.6 客户标签关联表 (crm_customer_tags)
> **功能树对齐**：客户管理 / AI智能

```sql
CREATE TABLE crm_customer_tags (
    id                  BIGSERIAL PRIMARY KEY,
    
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    tag_id              BIGINT NOT NULL REFERENCES crm_tag_definitions(id),
    
    -- 标签值（支持动态值）
    tag_value           VARCHAR(200),
    
    -- 打标签的人和时间
    tagged_by           BIGINT REFERENCES crm_users(id),
    tagged_at           TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    
    -- 来源
    source              VARCHAR(30),                 -- manual/auto/import
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1,
    
    UNIQUE(customer_id, tag_id)
);

CREATE INDEX idx_crm_customer_tags_customer ON crm_customer_tags(customer_id);
CREATE INDEX idx_crm_customer_tags_tag ON crm_customer_tags(tag_id);
CREATE INDEX idx_crm_customer_tags_by ON crm_customer_tags(tagged_by);
```

### 4.1.7 客户动态时间线表 (crm_customer_timeline)
> **功能树对齐**：客户管理 → 客户动态时间线

```sql
CREATE TABLE crm_customer_timeline (
    id                  BIGSERIAL PRIMARY KEY,
    
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    
    -- 事件类型
    event_type          VARCHAR(50) NOT NULL,       -- create/update/follow/opportunity/quotation/contract/order/payment
    event_category      VARCHAR(30),                -- 事件分类
    
    -- 事件内容
    title               VARCHAR(200) NOT NULL,
    description         TEXT,
    
    -- 关联对象
    related_type        VARCHAR(50),                -- customer/opportunity/quotation/contract/order
    related_id          BIGINT,
    related_name        VARCHAR(200),
    
    -- 关联人
    operator_id         BIGINT REFERENCES crm_users(id),
    operator_name       VARCHAR(100),
    
    -- 附件
    attachments         JSONB DEFAULT '[]',
    
    -- 扩展数据
    extra_data          JSONB DEFAULT '{}',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_customer_timeline_customer ON crm_customer_timeline(customer_id);
CREATE INDEX idx_crm_customer_timeline_type ON crm_customer_timeline(event_type);
CREATE INDEX idx_crm_customer_timeline_date ON crm_customer_timeline(created_at);
CREATE INDEX idx_crm_customer_timeline_related ON crm_customer_timeline(related_type, related_id);
```

### 4.1.8 联系人关系图谱表 (crm_contact_relations)
> **功能树对齐**：客户管理 → 联系人独立管理 → 关系图谱

```sql
CREATE TABLE crm_contact_relations (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 关系双方
    contact_id          BIGINT NOT NULL REFERENCES crm_contacts(id),
    related_contact_id  BIGINT REFERENCES crm_contacts(id),
    related_entity_type VARCHAR(50),                -- contact/customer/user
    related_entity_id   BIGINT,
    
    -- 关系类型
    relation_type       VARCHAR(50) NOT NULL,       -- colleague/boss/subordinate/partner/family
    relation_desc       VARCHAR(200),
    
    -- 重要性
    importance          VARCHAR(20) DEFAULT 'normal',
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_contact_relations_contact ON crm_contact_relations(contact_id);
CREATE INDEX idx_crm_contact_relations_type ON crm_contact_relations(relation_type);
```

### 4.1.9 联系人拜访记录表 (crm_contact_visits)
> **功能树对齐**：客户管理 → 联系人独立管理 → 拜访记录

```sql
CREATE TABLE crm_contact_visits (
    id                  BIGSERIAL PRIMARY KEY,
    
    contact_id          BIGINT NOT NULL REFERENCES crm_contacts(id),
    customer_id         BIGINT REFERENCES crm_customers(id),
    
    -- 拜访信息
    visit_type          VARCHAR(30) NOT NULL,       -- in_person/call/video/email
    visit_date          DATE NOT NULL,
    visit_duration      INTEGER,                     -- 分钟
    
    -- 拜访内容
    purpose             VARCHAR(200),
    content             TEXT,
    outcome              VARCHAR(50),
    
    -- 参与者
    participants        BIGINT[],
    location            VARCHAR(300),
    
    -- 下次跟进
    next_visit_date     DATE,
    next_action         VARCHAR(200),
    
    -- 满意度
    satisfaction        INTEGER CHECK (satisfaction BETWEEN 1 AND 5),
    
    -- 附件
    attachments         JSONB DEFAULT '[]',
    
    -- 关联任务
    task_id             BIGINT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_contact_visits_contact ON crm_contact_visits(contact_id);
CREATE INDEX idx_crm_contact_visits_customer ON crm_contact_visits(customer_id);
CREATE INDEX idx_crm_contact_visits_date ON crm_contact_visits(visit_date);
CREATE INDEX idx_crm_contact_visits_owner ON crm_contact_visits(created_by);
```

### 4.1.10 客户导入记录表 (crm_import_records)
> **功能树对齐**：客户管理 → 批量导入/导出

```sql
CREATE TABLE crm_import_records (
    id                  BIGSERIAL PRIMARY KEY,
    
    import_type         VARCHAR(30) NOT NULL,       -- customer/contact/product
    file_name           VARCHAR(255) NOT NULL,
    file_url            VARCHAR(500),
    file_size           BIGINT,
    
    -- 导入统计
    total_rows          INTEGER DEFAULT 0,
    success_rows        INTEGER DEFAULT 0,
    failed_rows         INTEGER DEFAULT 0,
    duplicate_rows      INTEGER DEFAULT 0,
    
    -- 错误信息
    error_log           TEXT,
    failed_data         JSONB DEFAULT '[]',
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'pending', -- pending/processing/completed/failed
    completed_at        TIMESTAMP WITH TIME ZONE,
    
    -- 操作人
    created_by          BIGINT REFERENCES crm_users(id),
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_import_records_type ON crm_import_records(import_type);
CREATE INDEX idx_crm_import_records_status ON crm_import_records(status);
CREATE INDEX idx_crm_import_records_created_by ON crm_import_records(created_by);
```

---

## 4.2 销售管理模块

### 4.2.1 商机表 (crm_opportunities)
> **功能树对齐**：销售管理 → 销售漏斗看板

```sql
CREATE TABLE crm_opportunities (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    opportunity_code    VARCHAR(50) NOT NULL UNIQUE,
    opportunity_name    VARCHAR(200) NOT NULL,
    
    -- 关联客户
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    contact_id          BIGINT REFERENCES crm_contacts(id),
    
    -- 销售信息
    opportunity_type    VARCHAR(30),                -- new_sale/expansion/renewal
    channel             VARCHAR(50),
    
    -- 金额与概率
    estimated_amount    DECIMAL(18,2) NOT NULL DEFAULT 0,
    weighted_amount     DECIMAL(18,2),              -- 加权金额 = 金额 * 概率
    probability         INTEGER DEFAULT 0 CHECK (probability BETWEEN 0 AND 100),
    
    -- 时间
    expected_close_date DATE,
    actual_close_date   DATE,
    sales_cycle_days    INTEGER,
	--当前阶段停留天数
	stay_duration INTEGER DEFAULT 0  ,
    
    -- 阶段
    stage_id            BIGINT REFERENCES crm_opportunity_stages(id),
    stage_name          VARCHAR(100),
    stage_probability   INTEGER,
    stage_sequence      INTEGER,
    
    -- 归属
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id       BIGINT REFERENCES crm_departments(id),
    team_members        BIGINT[],
    
    -- 竞争信息
    competitors         TEXT[],
    our_advantages      TEXT[],
    competitive_price   DECIMAL(18,2),
    
    -- 赢单/输单
    result              VARCHAR(20),                -- won/lost/pending/cancelled
    result_reason       TEXT,
    lost_to_competitor  VARCHAR(100),
    
    -- 产品信息
    product_lines       BIGINT[],
    product_count       INTEGER DEFAULT 0,
    
    -- 来源
    source              VARCHAR(50),
    campaign_id         BIGINT,
    
    -- 扩展数据
    extra_data          JSONB DEFAULT '{}',
    description         TEXT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_opportunities_code ON crm_opportunities(opportunity_code);
CREATE INDEX idx_crm_opportunities_customer ON crm_opportunities(customer_id);
CREATE INDEX idx_crm_opportunities_owner ON crm_opportunities(owner_id);
CREATE INDEX idx_crm_opportunities_stage ON crm_opportunities(stage_id);
CREATE INDEX idx_crm_opportunities_status ON crm_opportunities(result);
CREATE INDEX idx_crm_opportunities_expected_date ON crm_opportunities(expected_close_date);
CREATE INDEX idx_crm_opportunities_amount ON crm_opportunities(estimated_amount);
CREATE INDEX idx_crm_opportunities_deleted ON crm_opportunities(deleted_at) WHERE deleted_at IS NULL;
```

### 4.2.2 商机阶段表 (crm_opportunity_stages)
> **功能树对齐**：销售管理 → 销售漏斗看板

```sql
CREATE TABLE crm_opportunity_stages (
    id                  BIGSERIAL PRIMARY KEY,
    
    stage_code          VARCHAR(50) NOT NULL UNIQUE,
    stage_name          VARCHAR(100) NOT NULL,
    stage_sequence      INTEGER NOT NULL,
    
    -- 阶段属性
    probability         INTEGER DEFAULT 0,
    stage_type          VARCHAR(20) DEFAULT 'normal',
    
    -- 里程碑
    is_milestone        BOOLEAN DEFAULT FALSE,
    milestone_name      VARCHAR(100),
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    is_default          BOOLEAN DEFAULT FALSE,
    sort_order          INTEGER DEFAULT 0,
    
    -- 统计
    avg_days_in_stage   INTEGER DEFAULT 0,
    
    -- 扩展
    description         TEXT,
    extra_data          JSONB DEFAULT '{}',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_opportunity_stages_sequence ON crm_opportunity_stages(stage_sequence);
```

### 4.2.3 商机跟进记录表 (crm_follow_records)
> **功能树对齐**：销售管理 → 跟进记录列表 / 跟进记录详情

```sql
CREATE TABLE crm_follow_records (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 关联对象
    opportunity_id      BIGINT REFERENCES crm_opportunities(id),
    customer_id         BIGINT REFERENCES crm_customers(id),
    contact_id          BIGINT REFERENCES crm_contacts(id),
    
    -- 跟进信息
    follow_type         VARCHAR(30) NOT NULL,       -- call/visit/email/meeting/proposal
    subject             VARCHAR(200),
    content             TEXT NOT NULL,
    
    -- 跟进详情
    contact_mode        VARCHAR(20),
    duration_minutes    INTEGER,
    participants        BIGINT[],
    location            VARCHAR(200),
    
    -- 结果
    outcome             VARCHAR(20),
    next_action         VARCHAR(200),
    next_follow_date    DATE,
    
    -- 附件
    attachments         JSONB DEFAULT '[]',
    
    -- AI分析
    sentiment           VARCHAR(20),
    key_points          TEXT[],
    action_items        JSONB DEFAULT '[]',
    
    -- 审计
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_follow_records_opportunity ON crm_follow_records(opportunity_id);
CREATE INDEX idx_crm_follow_records_customer ON crm_follow_records(customer_id);
CREATE INDEX idx_crm_follow_records_type ON crm_follow_records(follow_type);
CREATE INDEX idx_crm_follow_records_date ON crm_follow_records(created_at);
CREATE INDEX idx_crm_follow_records_owner ON crm_follow_records(created_by);
```

### 4.2.4 销售目标表 (crm_sales_targets)
> **功能树对齐**：销售管理 → 数据报表

```sql
CREATE TABLE crm_sales_targets (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 目标周期
    target_year         INTEGER NOT NULL,
    target_month        INTEGER,
    target_quarter      INTEGER,
    period_type         VARCHAR(20) NOT NULL,       -- yearly/quarterly/monthly
    
    -- 归属
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id        BIGINT REFERENCES crm_departments(id),
    team_id             BIGINT,
    
    -- 目标内容
    metric_type         VARCHAR(30) NOT NULL,       -- revenue/order_count/new_customers
    target_value        DECIMAL(18,2) NOT NULL,
    achieved_value      DECIMAL(18,2) DEFAULT 0,
    completion_rate     DECIMAL(5,2) DEFAULT 0,
    
    -- 产品线
    product_category_id BIGINT,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    
    -- 分解
    is_decomposed       BOOLEAN DEFAULT FALSE,
    parent_target_id    BIGINT REFERENCES crm_sales_targets(id),
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_sales_targets_period ON crm_sales_targets(target_year, target_month);
CREATE INDEX idx_crm_sales_targets_owner ON crm_sales_targets(owner_id);
CREATE INDEX idx_crm_sales_targets_dept ON crm_sales_targets(department_id);
```

### 4.2.5 任务表 (crm_tasks)
> **功能树对齐**：销售管理 → 跟进记录

```sql
CREATE TABLE crm_tasks (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 任务基本信息
    task_code           VARCHAR(50) UNIQUE,
    task_title          VARCHAR(200) NOT NULL,
    task_type           VARCHAR(30) NOT NULL,       -- follow_up/demo/presentation/contract
    priority            VARCHAR(20) DEFAULT 'medium',
    status              VARCHAR(20) DEFAULT 'pending',
    
    -- 关联对象
    related_type        VARCHAR(50),
    related_id          BIGINT,
    customer_id         BIGINT REFERENCES crm_customers(id),
    opportunity_id      BIGINT REFERENCES crm_opportunities(id),
    
    -- 负责人
    assignee_id         BIGINT REFERENCES crm_users(id),
    owner_id            BIGINT REFERENCES crm_users(id),
    
    -- 参与者
    collaborators       BIGINT[],
    followers           BIGINT[],
    
    -- 时间
    due_date            TIMESTAMP WITH TIME ZONE,
    start_date          TIMESTAMP WITH TIME ZONE,
    completed_at        TIMESTAMP WITH TIME ZONE,
    estimated_hours     DECIMAL(5,2),
    actual_hours        DECIMAL(5,2),
    
    -- 内容
    description         TEXT,
    location            VARCHAR(300),
    
    -- 重复
    is_recurring        BOOLEAN DEFAULT FALSE,
    recurrence_rule     VARCHAR(100),
    
    -- 提醒
    reminders           JSONB DEFAULT '[]',
    
    -- 子任务
    parent_task_id      BIGINT REFERENCES crm_tasks(id),
    subtask_count       INTEGER DEFAULT 0,
    
    -- 审计
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_tasks_assignee ON crm_tasks(assignee_id);
CREATE INDEX idx_crm_tasks_due_date ON crm_tasks(due_date);
CREATE INDEX idx_crm_tasks_status ON crm_tasks(status);
CREATE INDEX idx_crm_tasks_priority ON crm_tasks(priority);
CREATE INDEX idx_crm_tasks_customer ON crm_tasks(customer_id);
CREATE INDEX idx_crm_tasks_opportunity ON crm_tasks(opportunity_id);
CREATE INDEX idx_crm_tasks_related ON crm_tasks(related_type, related_id);
```

---

## 4.3 产品管理模块

### 4.3.1 产品分类表 (crm_product_categories)
> **功能树对齐**：产品管理 → 产品目录管理

```sql
CREATE TABLE crm_product_categories (
    id                  BIGSERIAL PRIMARY KEY,
    
    category_code       VARCHAR(50) NOT NULL UNIQUE,
    category_name       VARCHAR(100) NOT NULL,
    category_short_name VARCHAR(50),
    
    -- 树形结构
    parent_id           BIGINT REFERENCES crm_product_categories(id),
    path                VARCHAR(500),
    level               INTEGER DEFAULT 1,
    leaf                BOOLEAN DEFAULT TRUE,
    
    -- 属性
    category_type       VARCHAR(30),                -- product/material/service/bundle ⚠️
    is_standard         BOOLEAN DEFAULT TRUE,
    
    -- 层级属性
    level_attrs         JSONB DEFAULT '{}',
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    sort_order          INTEGER DEFAULT 0,
    
    -- SEO
    seo_title           VARCHAR(200),
    seo_keywords        VARCHAR(500),
    seo_description     TEXT,
    
    -- 图片
    icon_url            VARCHAR(500),
    banner_url          VARCHAR(500),
    
    -- 统计
    product_count       INTEGER DEFAULT 0,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_product_categories_parent ON crm_product_categories(parent_id);
CREATE INDEX idx_crm_product_categories_path ON crm_product_categories(path);
CREATE INDEX idx_crm_product_categories_level ON crm_product_categories(level);
```

### 4.3.2 产品表 (crm_products)
> **功能树对齐**：产品管理 → 产品目录管理

```sql
CREATE TABLE crm_products (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    product_code        VARCHAR(50) NOT NULL UNIQUE,
    product_name        VARCHAR(200) NOT NULL,
    product_short_name  VARCHAR(100),
    
    -- 分类
    category_id         BIGINT NOT NULL REFERENCES crm_product_categories(id),
    category_path       VARCHAR(500),
    
    -- 产品属性
    product_type        VARCHAR(30) NOT NULL,      -- standard/custom/bundle/service ⚠️
    brand               VARCHAR(100),
    model               VARCHAR(100),
    specification       VARCHAR(200),              -- ⚠️ 可选：规格参数（制造业特色）
    unit                VARCHAR(20) DEFAULT 'PCS',
    min_order_qty       INTEGER DEFAULT 1,
    
    -- 技术参数
    weight              DECIMAL(10,3),              -- ⚠️ 制造业字段
    dimensions          VARCHAR(100),
    color               VARCHAR(50),
    material            VARCHAR(100),               -- ⚠️ 制造业字段
    technical_params    JSONB DEFAULT '{}',        -- ⚠️ 制造业字段：技术参数
    
    -- 成本与价格
    cost_price          DECIMAL(18,4) DEFAULT 0,
    standard_price      DECIMAL(18,4) DEFAULT 0,
    wholesale_price     DECIMAL(18,4) DEFAULT 0,
    msrp                DECIMAL(18,4) DEFAULT 0,
    
    -- 库存
    stock_quantity      INTEGER DEFAULT 0,
    safety_stock        INTEGER DEFAULT 0,
    reserved_quantity   INTEGER DEFAULT 0,
    available_quantity  INTEGER GENERATED ALWAYS AS (stock_quantity - reserved_quantity) STORED,
    
    -- 仓库
    warehouse_id        BIGINT,                     -- ⚠️ 制造业字段
    warehouse_location  VARCHAR(100),
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    listing_date        DATE,
    delist_date         DATE,
    
    -- 销售控制
    is_sellable         BOOLEAN DEFAULT TRUE,
    is_procurable       BOOLEAN DEFAULT TRUE,
    lead_time_days      INTEGER DEFAULT 0,          -- ⚠️ 制造业字段：交期(天)
    
    -- 描述
    description         TEXT,
    short_description   VARCHAR(500),
    
    -- 图片与附件
    images              JSONB DEFAULT '[]',
    attachments         JSONB DEFAULT '[]',
    
    -- SEO
    seo_title           VARCHAR(200),
    seo_keywords        VARCHAR(500),
    
    -- 扩展
    extra_data          JSONB DEFAULT '{}',
	产品生命周期状态
lifecycle_status VARCHAR(20) DEFAULT 'active' CHECK (lifecycle_status IN ('new', 'active', 'discontinued', 'obsolete')),
    
    -- 审计
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_products_code ON crm_products(product_code);
CREATE INDEX idx_crm_products_name ON crm_products(product_name);
CREATE INDEX idx_crm_products_category ON crm_products(category_id);
CREATE INDEX idx_crm_products_brand ON crm_products(brand);
CREATE INDEX idx_crm_products_status ON crm_products(status);
CREATE INDEX idx_crm_products_deleted ON crm_products(deleted_at) WHERE deleted_at IS NULL;

-- 全文检索
CREATE INDEX idx_crm_products_fulltext ON crm_products 
    USING GIN (to_tsvector('simple', product_name || ' ' || COALESCE(product_short_name, '') || ' ' || COALESCE(brand, '') || ' ' || COALESCE(model, '')));
```

**⚠️ 制造业特色字段警告：**

| 字段名 | 类型 | ⚠️警告 | 说明 |
|--------|------|--------|------|
| specification | VARCHAR(200) | ⚠️ 制造业特色 | 规格参数（建议保留但标注为可选） |
| weight | DECIMAL(10,3) | ⚠️ 制造业特色 | 重量(kg) |
| material | VARCHAR(100) | ⚠️ 制造业特色 | 材料 |
| technical_params | JSONB | ⚠️ 制造业特色 | 技术参数 |
| warehouse_id | BIGINT | ⚠️ 制造业特色 | 仓库ID |
| lead_time_days | INTEGER | ⚠️ 制造业特色 | 交期(天) |
| category_type | VARCHAR(30) | ⚠️ 制造业特色 | 分类类型含material |
| product_type | VARCHAR(30) | ⚠️ 制造业特色 | 产品类型含custom/service |

### 4.3.3 产品SKU表 (crm_product_skus)
> **功能树对齐**：产品管理 → 产品目录管理

```sql
CREATE TABLE crm_product_skus (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 关联产品
    product_id          BIGINT NOT NULL REFERENCES crm_products(id),
    
    -- SKU编码
    sku_code            VARCHAR(50) NOT NULL UNIQUE,
    barcode             VARCHAR(50) UNIQUE,
    
    -- SKU属性组合
    sku_attributes      JSONB NOT NULL DEFAULT '{}',
    
    -- SKU价格
    sku_cost            DECIMAL(18,4) DEFAULT 0,
    sku_price           DECIMAL(18,4) DEFAULT 0,
    
    -- SKU库存
    stock_quantity      INTEGER DEFAULT 0,
    reserved_quantity   INTEGER DEFAULT 0,
    
    -- SKU特定属性
    weight              DECIMAL(10,3),              -- ⚠️ 制造业字段
    dimensions          VARCHAR(100),
    
    -- 图片
    images              JSONB DEFAULT '[]',
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    
    -- 审计
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_product_skus_product ON crm_product_skus(product_id);
CREATE INDEX idx_crm_product_skus_code ON crm_product_skus(sku_code);
CREATE INDEX idx_crm_product_skus_barcode ON crm_product_skus(barcode);
```

### 4.3.4 产品价格表 (crm_product_prices)
> **功能树对齐**：产品管理 → 价格管理

```sql
CREATE TABLE crm_product_prices (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 关联产品
    product_id          BIGINT REFERENCES crm_products(id),
    sku_id              BIGINT REFERENCES crm_product_skus(id),
    
    -- 价格信息
    price_type          VARCHAR(20) NOT NULL,       -- standard/wholesale/special/campaign
    price_name          VARCHAR(100),
    
    -- 价格
    unit_price          DECIMAL(18,4) NOT NULL,
    min_quantity        INTEGER DEFAULT 1,
    max_quantity        INTEGER,
    
    -- 有效期
    effective_from      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    effective_to        TIMESTAMP WITH TIME ZONE,
    is_active           BOOLEAN DEFAULT TRUE,
    
    -- 客户专属
    customer_id         BIGINT REFERENCES crm_customers(id),
    customer_level      VARCHAR(20),
    
    -- 数量折扣（阶梯价）
    quantity_prices     JSONB DEFAULT '[]',
    
    -- 审批
    approval_status     VARCHAR(20) DEFAULT 'pending',
    approved_by         BIGINT,
    approved_at         TIMESTAMP WITH TIME ZONE,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_product_prices_product ON crm_product_prices(product_id);
CREATE INDEX idx_crm_product_prices_sku ON crm_product_prices(sku_id);
CREATE INDEX idx_crm_product_prices_type ON crm_product_prices(price_type);
CREATE INDEX idx_crm_product_prices_customer ON crm_product_prices(customer_id);
CREATE INDEX idx_crm_product_prices_effective ON crm_product_prices(effective_from, effective_to);
```

### 4.3.5 价格等级表 (crm_price_tiers)
> **功能树对齐**：产品管理 → 价格管理

```sql
CREATE TABLE crm_price_tiers (
    id                  BIGSERIAL PRIMARY KEY,
    
    tier_code           VARCHAR(50) NOT NULL UNIQUE,
    tier_name           VARCHAR(100) NOT NULL,
    tier_level          INTEGER NOT NULL,
    
    -- 适用对象
    applicable_to       VARCHAR(20) NOT NULL,        -- customer/role/channel
    applicable_values   VARCHAR(50)[],
    
    -- 折扣设置
    discount_type       VARCHAR(20) DEFAULT 'percentage',
    discount_value      DECIMAL(10,4) NOT NULL,
    min_order_amount    DECIMAL(18,2) DEFAULT 0,
    
    -- 有效期
    effective_from      DATE,
    effective_to        DATE,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    is_default          BOOLEAN DEFAULT FALSE,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_price_tiers_level ON crm_price_tiers(tier_level);
CREATE INDEX idx_crm_price_tiers_applicable ON crm_price_tiers(applicable_to);
```

### 4.3.6 产品技术文档表 (crm_product_documents)
> **功能树对齐**：产品管理 → 产品技术文档

```sql
CREATE TABLE crm_product_documents (
    id                  BIGSERIAL PRIMARY KEY,
    
    product_id          BIGINT NOT NULL REFERENCES crm_products(id),
    
    -- 文档信息
    doc_code            VARCHAR(50) UNIQUE,
    doc_name            VARCHAR(200) NOT NULL,
    doc_type            VARCHAR(50) NOT NULL,       -- specification/datasheet/manual/certificate
    doc_version         VARCHAR(20),
    
    -- 文件信息
    file_url            VARCHAR(500),
    file_size           BIGINT,
    file_type           VARCHAR(50),
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    is_public           BOOLEAN DEFAULT FALSE,
    
    -- 描述
    description         TEXT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_product_documents_product ON crm_product_documents(product_id);
CREATE INDEX idx_crm_product_documents_type ON crm_product_documents(doc_type);
```

---

## 4.4 营销服务模块

### 4.4.1 营销活动表 (crm_campaigns)
> **功能树对齐**：营销服务 → 市场活动管理

```sql
CREATE TABLE crm_campaigns (
    id                  BIGSERIAL PRIMARY KEY,
    
    campaign_code       VARCHAR(50) NOT NULL UNIQUE,
    campaign_name       VARCHAR(200) NOT NULL,
    campaign_type       VARCHAR(30) NOT NULL,       -- exhibition/seminar/digital/email/sms
    campaign_subtype    VARCHAR(50),
    
    -- 时间
    planned_start_date  DATE,
    planned_end_date    DATE,
    actual_start_date   DATE,
    actual_end_date     DATE,
    
    -- 预算
    budget              DECIMAL(18,2) DEFAULT 0,
    actual_cost         DECIMAL(18,2) DEFAULT 0,
    cost_currency       VARCHAR(10) DEFAULT 'CNY',
    
    -- 目标
    objectives          TEXT,
    target_participants INTEGER,
    actual_participants INTEGER DEFAULT 0,
    target_leads        INTEGER,
    actual_leads        INTEGER DEFAULT 0,
    target_conversions  INTEGER,
    actual_conversions  INTEGER DEFAULT 0,
    
    -- ROI
    expected_roi        DECIMAL(10,2),
    actual_roi          DECIMAL(10,2),
    
    -- 渠道
    channels            VARCHAR(50)[],
    channel_ids         BIGINT[],
    
    -- 负责人
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id       BIGINT REFERENCES crm_departments(id),
    team_members        BIGINT[],
    
    -- 关联
    related_campaign_id BIGINT REFERENCES crm_campaigns(id),
    
    -- 内容
    description         TEXT,
    content_plan        JSONB DEFAULT '[]',
    landing_page_url    VARCHAR(500),
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'draft',
    phase               VARCHAR(20),
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_campaigns_code ON crm_campaigns(campaign_code);
CREATE INDEX idx_crm_campaigns_type ON crm_campaigns(campaign_type);
CREATE INDEX idx_crm_campaigns_status ON crm_campaigns(status);
CREATE INDEX idx_crm_campaigns_dates ON crm_campaigns(planned_start_date, planned_end_date);
CREATE INDEX idx_crm_campaigns_owner ON crm_campaigns(owner_id);
```

### 4.4.2 线索表 (crm_leads)
> **功能树对齐**：营销服务 → 线索管理（含培育）

```sql
CREATE TABLE crm_leads (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    lead_code           VARCHAR(50) NOT NULL UNIQUE,
    lead_name           VARCHAR(200) NOT NULL,
    lead_type           VARCHAR(20) DEFAULT 'individual',
    
    -- 联系信息
    company_name        VARCHAR(200),
    contact_name        VARCHAR(100),
    gender              VARCHAR(10),
    mobile              VARCHAR(30),
    phone               VARCHAR(30),
    email               VARCHAR(255),
    wechat              VARCHAR(100),
    
    -- 公司信息
    industry            VARCHAR(50),
    position            VARCHAR(100),
    company_size        VARCHAR(30),
    
    -- 来源
    source              VARCHAR(50) NOT NULL,
    source_detail       VARCHAR(100),
    channel_id          BIGINT,
    campaign_id         BIGINT,
    utm_source           VARCHAR(100),
    utm_medium           VARCHAR(100),
    utm_campaign        VARCHAR(100),
    
    -- 评分
    score               INTEGER DEFAULT 0,
    grade               VARCHAR(10) DEFAULT 'C',
    score_details       JSONB DEFAULT '{}',
    
    -- 归属
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id       BIGINT REFERENCES crm_departments(id),
    assign_date         DATE,
    
    -- 跟进
    last_contact_date   TIMESTAMP WITH TIME ZONE,
    next_contact_date   DATE,
    follow_status       VARCHAR(20) DEFAULT 'new',
    
    -- 培育信息
    nurturing_stage     VARCHAR(30),
    nurturing_score     INTEGER DEFAULT 0,
    engagement_level    VARCHAR(20) DEFAULT 'cold',
    
    -- 转化
    converted           BOOLEAN DEFAULT FALSE,
    converted_at        TIMESTAMP WITH TIME ZONE,
    converted_to_type   VARCHAR(20),
    converted_to_id     BIGINT,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    invalid_reason      VARCHAR(100),
    
    -- 来源IP
    ip_address          VARCHAR(45),
    
    -- 扩展
    extra_data          JSONB DEFAULT '{}',
    description         TEXT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_leads_code ON crm_leads(lead_code);
CREATE INDEX idx_crm_leads_mobile ON crm_leads(mobile);
CREATE INDEX idx_crm_leads_email ON crm_leads(email);
CREATE INDEX idx_crm_leads_source ON crm_leads(source);
CREATE INDEX idx_crm_leads_channel ON crm_leads(channel_id);
CREATE INDEX idx_crm_leads_campaign ON crm_leads(campaign_id);
CREATE INDEX idx_crm_leads_owner ON crm_leads(owner_id);
CREATE INDEX idx_crm_leads_score ON crm_leads(score);
CREATE INDEX idx_crm_leads_grade ON crm_leads(grade);
CREATE INDEX idx_crm_leads_converted ON crm_leads(converted);
CREATE INDEX idx_crm_leads_status ON crm_leads(status);
CREATE INDEX idx_crm_leads_deleted ON crm_leads(deleted_at) WHERE deleted_at IS NULL;
```

### 4.4.3 线索评分表 (crm_lead_scores)
> **功能树对齐**：营销服务 → 线索管理

```sql
CREATE TABLE crm_lead_scores (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 评分规则
    rule_name           VARCHAR(100) NOT NULL,
    rule_code           VARCHAR(50) UNIQUE,
    
    -- 评分维度
    dimension           VARCHAR(30) NOT NULL,       -- behavior/profile/engagement
    sub_dimension       VARCHAR(50),
    
    -- 评分条件
    condition_type      VARCHAR(30) NOT NULL,       -- threshold/range/enum
    conditions          JSONB NOT NULL DEFAULT '[]',
    
    -- 分值
    score_type          VARCHAR(20) DEFAULT 'fixed',
    score_value         INTEGER NOT NULL,
    score_range_start   INTEGER,
    score_range_end     INTEGER,
    
    -- 权重
    weight              DECIMAL(5,2) DEFAULT 1.0,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    is_system           BOOLEAN DEFAULT FALSE,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_lead_scores_dimension ON crm_lead_scores(dimension);
CREATE INDEX idx_crm_lead_scores_status ON crm_lead_scores(status);
```

### 4.4.4 营销渠道表 (crm_marketing_channels)
> **功能树对齐**：营销服务 → 渠道ROI分析

```sql
CREATE TABLE crm_marketing_channels (
    id                  BIGSERIAL PRIMARY KEY,
    
    channel_code        VARCHAR(50) NOT NULL UNIQUE,
    channel_name        VARCHAR(100) NOT NULL,
    channel_type        VARCHAR(30) NOT NULL,       -- online/offline/social
    
    -- 属性
    platform            VARCHAR(50),
    account_id          VARCHAR(100),
    
    -- 负责人
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id       BIGINT REFERENCES crm_departments(id),
    
    -- 成本
    cost_model          VARCHAR(20),
    unit_cost           DECIMAL(10,2) DEFAULT 0,
    monthly_budget       DECIMAL(18,2) DEFAULT 0,
    
    -- ROI效果
    total_visitors      INTEGER DEFAULT 0,
    total_leads         INTEGER DEFAULT 0,
    total_conversions   INTEGER DEFAULT 0,
    conversion_rate     DECIMAL(8,4) DEFAULT 0,
    total_revenue       DECIMAL(18,2) DEFAULT 0,
    roi                 DECIMAL(10,2) DEFAULT 0,
    
    -- UTM配置
    utm_params          JSONB DEFAULT '{}',
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_marketing_channels_type ON crm_marketing_channels(channel_type);
CREATE INDEX idx_crm_marketing_channels_status ON crm_marketing_channels(status);
```

---

## 4.5 客户成功模块

### 4.5.1 客户健康度评分表 (crm_customer_health_scores)
> **功能树对齐**：客户成功 → 客户健康度监控

```sql
CREATE TABLE crm_customer_health_scores (
    id                  BIGSERIAL PRIMARY KEY,
    
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    score_date          DATE NOT NULL,
    
    -- 综合评分
    overall_score       INTEGER NOT NULL CHECK (overall_score BETWEEN 0 AND 100),
    health_level        VARCHAR(20) NOT NULL,       -- healthy/at_risk/critical
    
    -- 分维度评分
    dimension_scores    JSONB NOT NULL DEFAULT '{}',
    
    -- 使用情况
    product_usage       JSONB DEFAULT '{}',
    adoption_rate       DECIMAL(5,2) DEFAULT 0,
    
    -- 互动情况
    engagement_score    INTEGER DEFAULT 0,
    avg_contact_frequency DECIMAL(5,2) DEFAULT 0,
    last_interaction_date DATE,
    
    -- 财务情况
    payment_score       INTEGER DEFAULT 0,
    revenue_trend       VARCHAR(20),
    arpu                DECIMAL(18,2) DEFAULT 0,
    
    -- 满意度
    satisfaction_score  INTEGER DEFAULT 0,
    nps_score           INTEGER,
    last_survey_date    DATE,
    
    -- 风险指标
    risk_indicators     TEXT[],
    churn_signals       TEXT[],
    
    -- 预测
    churn_probability   DECIMAL(5,2) DEFAULT 0,
    expansion_probability DECIMAL(5,2) DEFAULT 0,
    
    -- AI洞察
    ai_insights         JSONB DEFAULT '{}',
    
    -- 审计
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by          BIGINT,
    version             INTEGER DEFAULT 1,
    
    UNIQUE(customer_id, score_date)
);

CREATE INDEX idx_crm_customer_health_scores_customer ON crm_customer_health_scores(customer_id);
CREATE INDEX idx_crm_customer_health_scores_date ON crm_customer_health_scores(score_date);
CREATE INDEX idx_crm_customer_health_scores_level ON crm_customer_health_scores(health_level);
```

### 4.5.2 续费管理表 (crm_renewals)
> **功能树对齐**：客户成功 → 续约增购管理

```sql
CREATE TABLE crm_renewals (
    id                  BIGSERIAL PRIMARY KEY,
    
    renewal_code        VARCHAR(50) NOT NULL UNIQUE,
    
    -- 关联客户/合同
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    contract_id         BIGINT,
    
    -- 续费信息
    renewal_type        VARCHAR(20) NOT NULL,       -- renewal/upgrade/downgrade
    product_id          BIGINT,
    
    -- 时间
    current_expire_date DATE NOT NULL,
    renewal_date        DATE NOT NULL,
    new_expire_date     DATE,
    
    -- 金额
    current_amount      DECIMAL(18,2) NOT NULL,
    renewal_amount      DECIMAL(18,2),
    currency            VARCHAR(10) DEFAULT 'CNY',
    
    -- 概率
    renewal_probability INTEGER DEFAULT 0,
    churn_risk          VARCHAR(20),
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'pending',
    renewal_result      VARCHAR(20),
    
    -- 负责人
    owner_id            BIGINT REFERENCES crm_users(id),
    cs_owner_id         BIGINT REFERENCES crm_users(id),
    
    -- 跟进
    last_contact_date   DATE,
    last_contact_note   TEXT,
    competitor_info     VARCHAR(200),
    
    -- 升级/降级详情
    upgrade_details     JSONB DEFAULT '{}',
    
    -- 审计
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_renewals_customer ON crm_renewals(customer_id);
CREATE INDEX idx_crm_renewals_contract ON crm_renewals(contract_id);
CREATE INDEX idx_crm_renewals_date ON crm_renewals(renewal_date);
CREATE INDEX idx_crm_renewals_status ON crm_renewals(status);
CREATE INDEX idx_crm_renewals_owner ON crm_renewals(owner_id);
```

### 4.5.3 客户满意度调查表 (crm_customer_satisfaction_surveys)
> **功能树对齐**：客户成功 → 客户满意度管理

```sql
CREATE TABLE crm_customer_satisfaction_surveys (
    id                  BIGSERIAL PRIMARY KEY,
    
    survey_code         VARCHAR(50) NOT NULL UNIQUE,
    survey_name         VARCHAR(200) NOT NULL,
    survey_type         VARCHAR(30) NOT NULL,       -- nps/csat/ces/custom
    
    -- 关联
    customer_id         BIGINT REFERENCES crm_customers(id),
    contact_id          BIGINT REFERENCES crm_contacts(id),
    order_id            BIGINT,
    project_id          BIGINT,
    
    -- 时间
    sent_date           DATE,
    completed_date      DATE,
    
    -- 评分
    overall_score       INTEGER,
    nps_score           INTEGER,
    csat_score          INTEGER,
    ces_score           INTEGER,
    
    -- 分项评分
    dimension_scores    JSONB DEFAULT '{}',
    
    -- 反馈
    feedback            TEXT,
    positive_feedback   TEXT,
    negative_feedback   TEXT,
    
    -- 跟进
    follow_up_required  BOOLEAN DEFAULT FALSE,
    follow_up_status    VARCHAR(20),
    follow_up_by        BIGINT REFERENCES crm_users(id),
    follow_up_date      DATE,
    follow_up_notes     TEXT,
    
    -- 来源
    channel             VARCHAR(30),
    respondent_email    VARCHAR(255),
    
    -- 审计
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_customer_satisfaction_surveys_customer ON crm_customer_satisfaction_surveys(customer_id);
CREATE INDEX idx_crm_customer_satisfaction_surveys_type ON crm_customer_satisfaction_surveys(survey_type);
CREATE INDEX idx_crm_customer_satisfaction_surveys_nps ON crm_customer_satisfaction_surveys(nps_score);
CREATE INDEX idx_crm_customer_satisfaction_surveys_dates ON crm_customer_satisfaction_surveys(sent_date, completed_date);
```

---

## 4.6 商务合同模块

### 4.6.1 报价单表 (crm_quotations)
> **功能树对齐**：商务合同 → 报价单管理

```sql
CREATE TABLE crm_quotations (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    quotation_no        VARCHAR(50) NOT NULL UNIQUE,
    quotation_name      VARCHAR(200),
    
    -- 关联
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    contact_id          BIGINT REFERENCES crm_contacts(id),
    opportunity_id      BIGINT REFERENCES crm_opportunities(id),
    project_name        VARCHAR(200),
    
    -- 客户信息（冗余）
    customer_name       VARCHAR(200),
    customer_address    VARCHAR(500),
    
    -- 报价信息
    quotation_type      VARCHAR(20) DEFAULT 'standard', -- standard/custom/oem ⚠️
    price_term          VARCHAR(30),              -- EXW/FOB/CIF/DDP ⚠️
    payment_term        VARCHAR(50),
    delivery_term       VARCHAR(50),              -- ⚠️ 制造业字段：交货条款
    delivery_days       INTEGER DEFAULT 0,        -- ⚠️ 制造业字段：交货天数
    valid_days          INTEGER DEFAULT 30,
    
    -- 金额
    subtotal            DECIMAL(18,2) DEFAULT 0,
    discount_rate       DECIMAL(8,4) DEFAULT 0,
    discount_amount     DECIMAL(18,2) DEFAULT 0,
    tax_rate            DECIMAL(8,4) DEFAULT 0,
    tax_amount          DECIMAL(18,2) DEFAULT 0,
    total_amount        DECIMAL(18,2) DEFAULT 0,
    currency            VARCHAR(10) DEFAULT 'CNY',
    
    -- 负责人
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id       BIGINT REFERENCES crm_departments(id),
    
    -- 审批
    approval_status     VARCHAR(20) DEFAULT 'draft',
    approved_by         BIGINT,
    approved_at         TIMESTAMP WITH TIME ZONE,
    approval_comments   TEXT,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'draft',
    sent_date           DATE,
    expire_date         DATE,
    accepted_date       DATE,
    
    -- 备注
    notes               TEXT,
    terms_conditions    TEXT,
    
    -- 附件
    attachments         JSONB DEFAULT '[]',
    
    -- 关联合同/订单
    contract_id         BIGINT,
    converted_to_order   BOOLEAN DEFAULT FALSE,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_quotations_no ON crm_quotations(quotation_no);
CREATE INDEX idx_crm_quotations_customer ON crm_quotations(customer_id);
CREATE INDEX idx_crm_quotations_opportunity ON crm_quotations(opportunity_id);
CREATE INDEX idx_crm_quotations_status ON crm_quotations(status);
CREATE INDEX idx_crm_quotations_approval ON crm_quotations(approval_status);
CREATE INDEX idx_crm_quotations_owner ON crm_quotations(owner_id);
CREATE INDEX idx_crm_quotations_deleted ON crm_quotations(deleted_at) WHERE deleted_at IS NULL;
```

**⚠️ 制造业特色字段警告：**

| 字段名 | 类型 | ⚠️警告 | 说明 |
|--------|------|--------|------|
| craft_fee | DECIMAL(15,2) | ⚠️ 偏离核心功能 | 工艺费（制造业特色，建议移除） |
| loss_rate | DECIMAL(5,4) | ⚠️ 偏离核心功能 | 损耗率（制造业特色，建议移除） |
| quotation_type含oem | VARCHAR(20) | ⚠️ 制造业特色 | 报价类型含OEM |
| price_term | VARCHAR(30) | ⚠️ 制造业特色 | 价格条款(EXW/FOB/CIF/DDP) |
| delivery_term | VARCHAR(50) | ⚠️ 制造业特色 | 交货条款 |
| delivery_days | INTEGER | ⚠️ 制造业特色 | 交货天数 |

### 4.6.2 报价明细表 (crm_quotation_items)
> **功能树对齐**：商务合同 → 报价单管理

```sql
CREATE TABLE crm_quotation_items (
    id                  BIGSERIAL PRIMARY KEY,
    
    quotation_id        BIGINT NOT NULL,
    
    -- 产品信息
    product_id          BIGINT,
    sku_id              BIGINT,
    product_code        VARCHAR(50),
    product_name        VARCHAR(200),
    sku_code            VARCHAR(50),
    sku_attributes      JSONB DEFAULT '{}',
    
    -- 数量
    quantity            DECIMAL(18,4) NOT NULL,
    unit                VARCHAR(20),
    
    -- 单价
    unit_price          DECIMAL(18,4) NOT NULL,
    price_type          VARCHAR(20),
    
    -- 金额
    subtotal            DECIMAL(18,2) NOT NULL,
    discount_rate       DECIMAL(8,4) DEFAULT 0,
    discount_amount     DECIMAL(18,2) DEFAULT 0,
    tax_rate            DECIMAL(8,4) DEFAULT 0,
    tax_amount          DECIMAL(18,2) DEFAULT 0,
    line_total          DECIMAL(18,2) NOT NULL,
    
    -- 交期 ⚠️
    delivery_days       INTEGER,
    expected_date       DATE,
    
    -- 备注
    description         TEXT,
    notes               VARCHAR(500),
    
    -- 排序
    line_no             INTEGER,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_quotation_items_quotation ON crm_quotation_items(quotation_id);
CREATE INDEX idx_crm_quotation_items_product ON crm_quotation_items(product_id);
```

### 4.6.3 合同表 (crm_contracts)
> **功能树对齐**：商务合同 → 合同管理

```sql
CREATE TABLE crm_contracts (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    contract_no         VARCHAR(50) NOT NULL UNIQUE,
    contract_name       VARCHAR(200) NOT NULL,
    contract_type       VARCHAR(30) NOT NULL,       -- sales/service/rental/cooperation
    category            VARCHAR(50),
    
    -- 关联
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    contact_id          BIGINT REFERENCES crm_contacts(id),
    quotation_id        BIGINT,
    opportunity_id      BIGINT REFERENCES crm_opportunities(id),
    
    -- 客户信息（冗余）
    customer_name       VARCHAR(200),
    customer_address    VARCHAR(500),
    legal_person        VARCHAR(100),
    
    -- 合同条款
    signing_date        DATE,
    effective_date      DATE,
    expire_date         DATE,
    
    -- 金额
    contract_amount     DECIMAL(18,2) NOT NULL,
    received_amount     DECIMAL(18,2) DEFAULT 0,
    pending_amount      DECIMAL(18,2),
    currency            VARCHAR(10) DEFAULT 'CNY',
    
    -- 付款方式
    payment_method      VARCHAR(50),
    payment_terms       VARCHAR(100),
    
    -- 负责人
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id       BIGINT REFERENCES crm_departments(id),
    signatory           VARCHAR(100),
    
    -- 审批
    approval_status     VARCHAR(20) DEFAULT 'draft',
    approved_by         BIGINT,
    approved_at         TIMESTAMP WITH TIME ZONE,
    approval_comments   TEXT,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'draft',
    execution_status    VARCHAR(20),
    
    -- 合同文件
    contract_file_url   VARCHAR(500),
    attachments         JSONB DEFAULT '[]',
    
    -- 合同条款
    terms               TEXT,
    special_terms       TEXT,
    
    -- 执行情况
    delivery_status     VARCHAR(20),              -- ⚠️ 制造业字段
    invoice_status      VARCHAR(20),
    payment_status      VARCHAR(20),
    
    -- 履约情况
    performance_score   INTEGER,
    performance_notes   TEXT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_contracts_no ON crm_contracts(contract_no);
CREATE INDEX idx_crm_contracts_customer ON crm_contracts(customer_id);
CREATE INDEX idx_crm_contracts_type ON crm_contracts(contract_type);
CREATE INDEX idx_crm_contracts_status ON crm_contracts(status);
CREATE INDEX idx_crm_contracts_approval ON crm_contracts(approval_status);
CREATE INDEX idx_crm_contracts_owner ON crm_contracts(owner_id);
CREATE INDEX idx_crm_contracts_expire ON crm_contracts(expire_date);
CREATE INDEX idx_crm_contracts_deleted ON crm_contracts(deleted_at) WHERE deleted_at IS NULL;
```

### 4.6.4 合同明细表 (crm_contract_items)
> **功能树对齐**：商务合同 → 合同管理

```sql
CREATE TABLE crm_contract_items (
    id                  BIGSERIAL PRIMARY KEY,
    
    contract_id         BIGINT NOT NULL,
    
    product_id          BIGINT,
    sku_id              BIGINT,
    product_code        VARCHAR(50),
    product_name        VARCHAR(200),
    sku_attributes      JSONB DEFAULT '{}',
    
    quantity            DECIMAL(18,4) NOT NULL,
    delivered_quantity  DECIMAL(18,4) DEFAULT 0,   -- ⚠️ 制造业字段
    invoiced_quantity   DECIMAL(18,4) DEFAULT 0,
    unit                VARCHAR(20),
    
    unit_price          DECIMAL(18,4) NOT NULL,
    subtotal            DECIMAL(18,2) NOT NULL,
    discount_rate       DECIMAL(8,4) DEFAULT 0,
    discount_amount     DECIMAL(18,2) DEFAULT 0,
    line_total          DECIMAL(18,2) NOT NULL,
    
    delivery_date       DATE,                       -- ⚠️ 制造业字段
    delivery_status     VARCHAR(20) DEFAULT 'pending', -- ⚠️ 制造业字段
    
    line_no             INTEGER,
    description         TEXT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_contract_items_contract ON crm_contract_items(contract_id);
```

### 4.6.5 订单表 (crm_orders)
> **功能树对齐**：商务合同 → 订单管理

```sql
CREATE TABLE crm_orders (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    order_no            VARCHAR(50) NOT NULL UNIQUE,
    order_name          VARCHAR(200),
    
    -- 关联
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    contact_id          BIGINT REFERENCES crm_contacts(id),
    quotation_id        BIGINT,
    contract_id         BIGINT,
    opportunity_id      BIGINT REFERENCES crm_opportunities(id),
    
    -- 客户信息（冗余）
    customer_name       VARCHAR(200),
    
    -- 地址
    billing_address_id  BIGINT,
    shipping_address_id BIGINT,
    billing_address     VARCHAR(500),
    shipping_address    VARCHAR(500),
    
    -- 订单类型
    order_type          VARCHAR(20) NOT NULL,
    source_type         VARCHAR(20),
    
    -- 金额
    subtotal            DECIMAL(18,2) DEFAULT 0,
    discount_amount     DECIMAL(18,2) DEFAULT 0,
    shipping_fee        DECIMAL(18,2) DEFAULT 0,
    tax_amount          DECIMAL(18,2) DEFAULT 0,
    total_amount        DECIMAL(18,2) DEFAULT 0,
    paid_amount         DECIMAL(18,2) DEFAULT 0,
    currency            VARCHAR(10) DEFAULT 'CNY',
    
    -- 付款
    payment_status      VARCHAR(20) DEFAULT 'unpaid',
    payment_method      VARCHAR(30),
    payment_terms       VARCHAR(50),
    
    -- 时间
    order_date          DATE NOT NULL,
    delivery_date       DATE,                       -- ⚠️ 制造业字段
    shipping_date       DATE,                       -- ⚠️ 制造业字段
    received_date       DATE,
    
    -- 负责人
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id       BIGINT REFERENCES crm_departments(id),
    sales_rep_id        BIGINT REFERENCES crm_users(id),
    
    -- 审批
    approval_status     VARCHAR(20) DEFAULT 'pending',
    approved_by         BIGINT,
    approved_at         TIMESTAMP WITH TIME ZONE,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'pending',
    fulfillment_status  VARCHAR(20) DEFAULT 'pending',
    
    -- 物流 ⚠️
    shipping_method     VARCHAR(50),
    tracking_no         VARCHAR(100),
    shipping_company    VARCHAR(100),
    
    -- 备注
    customer_notes      TEXT,
    internal_notes      TEXT,
    
    -- 附件
    attachments         JSONB DEFAULT '[]',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_orders_no ON crm_orders(order_no);
CREATE INDEX idx_crm_orders_customer ON crm_orders(customer_id);
CREATE INDEX idx_crm_orders_contract ON crm_orders(contract_id);
CREATE INDEX idx_crm_orders_status ON crm_orders(status);
CREATE INDEX idx_crm_orders_payment ON crm_orders(payment_status);
CREATE INDEX idx_crm_orders_date ON crm_orders(order_date);
CREATE INDEX idx_crm_orders_owner ON crm_orders(owner_id);
CREATE INDEX idx_crm_orders_deleted ON crm_orders(deleted_at) WHERE deleted_at IS NULL;
```

### 4.6.6 订单明细表 (crm_order_items)
> **功能树对齐**：商务合同 → 订单管理

```sql
CREATE TABLE crm_order_items (
    id                  BIGSERIAL PRIMARY KEY,
    
    order_id            BIGINT NOT NULL,
    
    product_id          BIGINT,
    sku_id              BIGINT,
    product_code        VARCHAR(50),
    product_name        VARCHAR(200),
    sku_code            VARCHAR(50),
    sku_attributes      JSONB DEFAULT '{}',
    
    quantity            DECIMAL(18,4) NOT NULL,
    shipped_quantity    DECIMAL(18,4) DEFAULT 0,   -- ⚠️ 制造业字段
    invoiced_quantity   DECIMAL(18,4) DEFAULT 0,
    returned_quantity   DECIMAL(18,4) DEFAULT 0,
    unit                VARCHAR(20),
    
    unit_price          DECIMAL(18,4) NOT NULL,
    subtotal            DECIMAL(18,2) NOT NULL,
    discount_rate       DECIMAL(8,4) DEFAULT 0,
    discount_amount     DECIMAL(18,2) DEFAULT 0,
    tax_rate            DECIMAL(8,4) DEFAULT 0,
    tax_amount          DECIMAL(18,2) DEFAULT 0,
    line_total          DECIMAL(18,2) NOT NULL,
    
    delivery_date       DATE,                       -- ⚠️ 制造业字段
    warehouse_id        BIGINT,                      -- ⚠️ 制造业字段
    
    line_no             INTEGER,
    description         TEXT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_order_items_order ON crm_order_items(order_id);
CREATE INDEX idx_crm_order_items_product ON crm_order_items(product_id);
```

### 4.6.7 回款计划表 (crm_payment_plans)
> **功能树对齐**：商务合同 → 付款计划与回款管理

```sql
CREATE TABLE crm_payment_plans (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 关联
    customer_id         BIGINT REFERENCES crm_customers(id),
    contract_id         BIGINT,
    order_id            BIGINT,
    quotation_id         BIGINT,
    
    -- 计划信息
    plan_no             VARCHAR(50) NOT NULL UNIQUE,
    plan_name           VARCHAR(200),
    plan_type           VARCHAR(20) NOT NULL,       -- installment/deposit/progress
    
    -- 期次
    installment_no      INTEGER,
    total_installments  INTEGER,
    
    -- 金额
    plan_amount         DECIMAL(18,2) NOT NULL,
    currency            VARCHAR(10) DEFAULT 'CNY',
    
    -- 时间
    due_date            DATE NOT NULL,
    paid_date           DATE,
    is_overdue          BOOLEAN DEFAULT FALSE,
    overdue_days        INTEGER DEFAULT 0,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'pending',
    payment_status      VARCHAR(20),
    
    -- 付款信息
    payment_method      VARCHAR(30),
    payment_reference   VARCHAR(100),
    
    -- 提醒
    reminder_count      INTEGER DEFAULT 0,
    last_reminder_date  DATE,
    next_reminder_date  DATE,
    
    notes               TEXT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_payment_plans_customer ON crm_payment_plans(customer_id);
CREATE INDEX idx_crm_payment_plans_contract ON crm_payment_plans(contract_id);
CREATE INDEX idx_crm_payment_plans_order ON crm_payment_plans(order_id);
CREATE INDEX idx_crm_payment_plans_due_date ON crm_payment_plans(due_date);
CREATE INDEX idx_crm_payment_plans_status ON crm_payment_plans(status);
```

### 4.6.8 回款记录表 (crm_payments)
> **功能树对齐**：商务合同 → 付款计划与回款管理

```sql
CREATE TABLE crm_payments (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    payment_no          VARCHAR(50) NOT NULL UNIQUE,
    payment_date        DATE NOT NULL,
    
    -- 关联
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    contract_id         BIGINT,
    order_id            BIGINT,
    invoice_id          BIGINT,
    
    -- 客户信息
    customer_name       VARCHAR(200),
    
    -- 金额
    payment_amount      DECIMAL(18,2) NOT NULL,
    currency            VARCHAR(10) DEFAULT 'CNY',
    
    -- 付款方式
    payment_method     VARCHAR(30) NOT NULL,
    bank_name           VARCHAR(100),
    account_no          VARCHAR(50),
    transaction_no      VARCHAR(100),
    
    -- 认款信息
    payment_plan_id     BIGINT,
    allocated_amount    DECIMAL(18,2) DEFAULT 0,
    
    -- 负责人
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id       BIGINT REFERENCES crm_departments(id),
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'pending',
    confirmation_status VARCHAR(20),
    confirmed_by        BIGINT,
    confirmed_at        TIMESTAMP WITH TIME ZONE,
    
    -- 收据
    receipt_no          VARCHAR(50),
    receipt_url         VARCHAR(500),
    
    -- 备注
    notes               TEXT,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_payments_no ON crm_payments(payment_no);
CREATE INDEX idx_crm_payments_customer ON crm_payments(customer_id);
CREATE INDEX idx_crm_payments_order ON crm_payments(order_id);
CREATE INDEX idx_crm_payments_contract ON crm_payments(contract_id);
CREATE INDEX idx_crm_payments_date ON crm_payments(payment_date);
CREATE INDEX idx_crm_payments_status ON crm_payments(status);
CREATE INDEX idx_crm_payments_owner ON crm_payments(owner_id);
```

### 4.6.9 发票表 (crm_invoices)
> **功能树对齐**：商务合同 → 付款计划与回款管理

```sql
CREATE TABLE crm_invoices (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 基本信息
    invoice_no          VARCHAR(50) NOT NULL UNIQUE,
    invoice_type        VARCHAR(20) NOT NULL,       -- VAT/simplified/commercial
    invoice_kind        VARCHAR(20) NOT NULL,
    
    -- 关联
    customer_id         BIGINT NOT NULL REFERENCES crm_customers(id),
    order_id            BIGINT,
    contract_id         BIGINT,
    payment_id          BIGINT,
	--指向原发票（用于红冲追溯）
	red_flush_id ,
	
	--红冲关联ID
	red_flush_id BIGINT REFERENCES crm_invoices(id),
    
    -- 客户信息
    customer_name       VARCHAR(200),
    customer_tax_no     VARCHAR(50),
    customer_address    VARCHAR(500),
    customer_bank       VARCHAR(100),
    customer_account    VARCHAR(50),
    
    -- 金额
    subtotal            DECIMAL(18,2) DEFAULT 0,
    tax_rate            DECIMAL(8,4) DEFAULT 0,
    tax_amount          DECIMAL(18,2) DEFAULT 0,
    total_amount        DECIMAL(18,2) NOT NULL,
    total_amount_capital VARCHAR(200),
    currency            VARCHAR(10) DEFAULT 'CNY',
    
    -- 已核销
    write_off_amount    DECIMAL(18,2) DEFAULT 0,
    write_off_status    VARCHAR(20) DEFAULT 'unwriteoff',
    
    -- 时间
    invoice_date        DATE NOT NULL,
    billing_date        DATE,
    expected_date       DATE,
    
    -- 负责人
    owner_id            BIGINT REFERENCES crm_users(id),
    
    -- 发票状态
    status              VARCHAR(20) DEFAULT 'draft',
    issue_status        VARCHAR(20),
    
    -- 快递信息
    express_company     VARCHAR(50),
    tracking_no         VARCHAR(100),
    sent_date           DATE,
    received_date       DATE,
    
    -- 红字信息
    red_invoice_reason  VARCHAR(200),
    red_invoice_no     VARCHAR(50),
    
    -- 附件
    invoice_file_url    VARCHAR(500),
    attachments         JSONB DEFAULT '[]',
    
    -- 备注
    notes               TEXT,
    remark              VARCHAR(500),
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_invoices_no ON crm_invoices(invoice_no);
CREATE INDEX idx_crm_invoices_customer ON crm_invoices(customer_id);
CREATE INDEX idx_crm_invoices_order ON crm_invoices(order_id);
CREATE INDEX idx_crm_invoices_type ON crm_invoices(invoice_type);
CREATE INDEX idx_crm_invoices_status ON crm_invoices(status);
CREATE INDEX idx_crm_invoices_date ON crm_invoices(invoice_date);
CREATE INDEX idx_crm_invoices_writeoff ON crm_invoices(write_off_status);
CREATE INDEX idx_crm_invoices_owner ON crm_invoices(owner_id);
```

---

## 4.7 AI智能模块

### 4.7.1 客户画像表 (crm_customer_profiles)
> **功能树对齐**：AI智能 → 客户画像（360°可视化）

```sql
CREATE TABLE crm_customer_profiles (
    id                  BIGSERIAL PRIMARY KEY,
    
    customer_id         BIGINT NOT NULL UNIQUE REFERENCES crm_customers(id),
    
    -- 基本画像
    basic_profile       JSONB DEFAULT '{}',
    behavior_profile    JSONB DEFAULT '{}',
    preference_profile  JSONB DEFAULT '{}',
    value_profile       JSONB DEFAULT '{}',
    
    -- 购买特征
    purchase_patterns   JSONB DEFAULT '{}',
    preferred_products  JSONB DEFAULT '{}',
    price_sensitivity   VARCHAR(20),
    buying_stages       VARCHAR(20),
    
    -- 互动特征
    communication_prefs JSONB DEFAULT '{}',
    best_contact_times  VARCHAR(20)[],
    preferred_channels  VARCHAR(20)[],
    
    -- 预测分析
    lifetime_value      DECIMAL(18,2),
    churn_probability   DECIMAL(5,2),
    upsell_probability  DECIMAL(5,2),
    referral_probability DECIMAL(5,2),
    
    -- 分群标签
    personas            VARCHAR(50)[],
    tags                VARCHAR(50)[],
    
    -- 统计信息
    analysis_count      INTEGER DEFAULT 0,
    last_analysis_at    TIMESTAMP WITH TIME ZONE,
    model_version       VARCHAR(50),
    
    -- 置信度
    confidence_score    DECIMAL(5,2),
    data_completeness   DECIMAL(5,2),
    
    -- 审计
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_customer_profiles_customer ON crm_customer_profiles(customer_id);
CREATE INDEX idx_crm_customer_profiles_ltv ON crm_customer_profiles(lifetime_value);
CREATE INDEX idx_crm_customer_profiles_churn ON crm_customer_profiles(churn_probability);
```

### 4.7.2 AI标签表 (crm_ai_tags)
> **功能树对齐**：AI智能 → 动态标签管理

```sql
CREATE TABLE crm_ai_tags (
    id                  BIGSERIAL PRIMARY KEY,
    
    tag_code            VARCHAR(50) NOT NULL UNIQUE,
    tag_name            VARCHAR(100) NOT NULL,
    tag_category        VARCHAR(50) NOT NULL,       -- behavior/preference/intent/risk
    
    -- 标签属性
    tag_type            VARCHAR(20) NOT NULL,       -- system/user
    is_auto_tagged      BOOLEAN DEFAULT TRUE,
    
    -- 使用范围
    applicable_types    VARCHAR(20)[] DEFAULT '{customer}',
    
    -- 生成信息
    generation_method   VARCHAR(30),
    model_name          VARCHAR(100),
    confidence_threshold DECIMAL(5,2) DEFAULT 0.7,
    
    -- 统计
    usage_count         INTEGER DEFAULT 0,
    accuracy            DECIMAL(5,2),
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_ai_tags_code ON crm_ai_tags(tag_code);
CREATE INDEX idx_crm_ai_tags_category ON crm_ai_tags(tag_category);
```

### 4.7.3 AI推荐表 (crm_ai_recommendations)
> **功能树对齐**：AI智能 → 客户画像

```sql
CREATE TABLE crm_ai_recommendations (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 推荐对象
    recommend_type      VARCHAR(30) NOT NULL,       -- product/cross_sell/upsell/content/action
    customer_id         BIGINT REFERENCES crm_customers(id),
    opportunity_id      BIGINT REFERENCES crm_opportunities(id),
    
    -- 推荐内容
    recommended_items   JSONB NOT NULL DEFAULT '[]',
    reason              TEXT,
    
    -- 场景
    scenario            VARCHAR(50),
    context             JSONB DEFAULT '{}',
    
    -- 评分
    score               DECIMAL(5,4),
    rank_position       INTEGER,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'pending',
    action_result       VARCHAR(50),
    
    -- 反馈
    feedback            TEXT,
    rating              INTEGER,
    
    -- 有效性
    valid_from          TIMESTAMP WITH TIME ZONE,
    valid_to            TIMESTAMP WITH TIME ZONE,
    
    -- 模型信息
    model_name          VARCHAR(100),
    model_version       VARCHAR(50),
    
    -- 审计
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_ai_recommendations_type ON crm_ai_recommendations(recommend_type);
CREATE INDEX idx_crm_ai_recommendations_customer ON crm_ai_recommendations(customer_id);
CREATE INDEX idx_crm_ai_recommendations_opportunity ON crm_ai_recommendations(opportunity_id);
CREATE INDEX idx_crm_ai_recommendations_score ON crm_ai_recommendations(score);
CREATE INDEX idx_crm_ai_recommendations_status ON crm_ai_recommendations(status);
```

---

## 4.8 数据报表模块

### 4.8.1 报表模板表 (crm_report_templates)
> **功能树对齐**：数据报表

```sql
CREATE TABLE crm_report_templates (
    id                  BIGSERIAL PRIMARY KEY,
    
    template_code       VARCHAR(50) NOT NULL UNIQUE,
    template_name       VARCHAR(200) NOT NULL,
    template_type       VARCHAR(30) NOT NULL,       -- sales/customer/finance/inventory/custom
    
    -- 分类
    category            VARCHAR(50),
    tags                VARCHAR(50)[],
    
    -- 配置
    config              JSONB NOT NULL DEFAULT '{}',
    data_sources        JSONB DEFAULT '[]',
    filters             JSONB DEFAULT '[]',
    chart_config        JSONB DEFAULT '{}',
    table_config        JSONB DEFAULT '{}',
    
    -- 权限
    access_level        VARCHAR(20) DEFAULT 'private',
    allowed_roles       BIGINT[],
    allowed_users       BIGINT[],
    
    -- 调度
    is_scheduled        BOOLEAN DEFAULT FALSE,
    schedule_config      JSONB DEFAULT '{}',
    recipients          JSONB DEFAULT '[]',
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'draft',
    is_featured         BOOLEAN DEFAULT FALSE,
    usage_count         INTEGER DEFAULT 0,
    
    -- 创建者
    owner_id            BIGINT REFERENCES crm_users(id),
    department_id        BIGINT REFERENCES crm_departments(id),
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_report_templates_type ON crm_report_templates(template_type);
CREATE INDEX idx_crm_report_templates_category ON crm_report_templates(category);
CREATE INDEX idx_crm_report_templates_owner ON crm_report_templates(owner_id);
CREATE INDEX idx_crm_report_templates_status ON crm_report_templates(status);
```

### 4.8.2 报表实例表 (crm_report_instances)
> **功能树对齐**：数据报表

```sql
CREATE TABLE crm_report_instances (
    id                  BIGSERIAL PRIMARY KEY,
    
    instance_code       VARCHAR(50) NOT NULL UNIQUE,
    
    -- 关联模板
    template_id         BIGINT,
    template_name       VARCHAR(200),
    
    -- 报表参数
    report_name         VARCHAR(200),
    parameters          JSONB DEFAULT '{}',
    
    -- 时间范围
    date_range_type     VARCHAR(20),
    start_date          DATE,
    end_date            DATE,
    
    -- 执行信息
    executed_by         BIGINT REFERENCES crm_users(id),
    executed_at         TIMESTAMP WITH TIME ZONE,
    execution_time_ms   INTEGER,
    
    -- 结果
    result_data         JSONB,
    result_url          VARCHAR(500),
    result_format       VARCHAR(20),
    file_size           BIGINT,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'pending',
    error_message       TEXT,
    
    -- 订阅
    is_subscription     BOOLEAN DEFAULT FALSE,
    subscription_id     VARCHAR(50),
    
    -- 共享
    shared_with         BIGINT[],
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_crm_report_instances_template ON crm_report_instances(template_id);
CREATE INDEX idx_crm_report_instances_executed_by ON crm_report_instances(executed_by);
CREATE INDEX idx_crm_report_instances_dates ON crm_report_instances(executed_at);
CREATE INDEX idx_crm_report_instances_status ON crm_report_instances(status);
```

---

## 4.9 系统管理模块

### 4.9.1 操作日志表 (crm_operation_logs)
> **功能树对齐**：系统管理 → 操作日志与审计

```sql
CREATE TABLE crm_operation_logs (
    id                  BIGSERIAL PRIMARY KEY,
    
    -- 操作主体
    user_id             BIGINT REFERENCES crm_users(id),
    username            VARCHAR(50),
    real_name           VARCHAR(100),
    ip_address          VARCHAR(45),
    user_agent          VARCHAR(500),
    
    -- 操作信息
    module              VARCHAR(50) NOT NULL,
    action              VARCHAR(50) NOT NULL,
    operation_type      VARCHAR(30),
    description         TEXT,
    
    -- 操作对象
    object_type         VARCHAR(100),
    object_id           BIGINT,
    object_name         VARCHAR(200),
    
    -- 请求信息
    request_method      VARCHAR(10),
    request_url         VARCHAR(500),
    request_params      JSONB,
    request_body        JSONB,
    
    -- 响应信息
    response_code       INTEGER,
    response_time_ms    INTEGER,
    error_message       TEXT,
    
    -- 变更前后数据
    old_data            JSONB,
    new_data            JSONB,
    diff_data           JSONB,
    
    -- 审计字段
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 分区表：按月分区
CREATE INDEX idx_crm_operation_logs_user ON crm_operation_logs(user_id);
CREATE INDEX idx_crm_operation_logs_module ON crm_operation_logs(module);
CREATE INDEX idx_crm_operation_logs_object ON crm_operation_logs(object_type, object_id);
CREATE INDEX idx_crm_operation_logs_created ON crm_operation_logs(created_at);
CREATE INDEX idx_crm_operation_logs_action ON crm_operation_logs(action);

crm_departments（部门表）
整合说明：采用系列1的树形设计，融入系列2的path、leaf、cost_center、extra_data等字段。

sql
CREATE TABLE crm_departments (
    id                  BIGSERIAL PRIMARY KEY,
    dept_code           VARCHAR(50) NOT NULL UNIQUE,
    dept_name           VARCHAR(100) NOT NULL,
    
    -- 树形结构
    parent_id           BIGINT REFERENCES crm_departments(id),
    path                VARCHAR(500),
    level               INTEGER DEFAULT 1,
    leaf                BOOLEAN DEFAULT TRUE,
    
    -- 部门属性
    dept_type           VARCHAR(20),
    manager_id          BIGINT REFERENCES crm_users(id),
    cost_center         VARCHAR(50),
    
    -- 联系方式
    contact_phone       VARCHAR(20),
    contact_email       VARCHAR(255),
    address             TEXT,
    
    -- 状态
    status              VARCHAR(20) DEFAULT 'active',
    sort_order          INTEGER DEFAULT 0,
    
    -- 扩展数据
    extra_data          JSONB DEFAULT '{}',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

CREATE INDEX idx_departments_parent ON crm_departments(parent_id);
CREATE INDEX idx_departments_path ON crm_departments(path);
CREATE INDEX idx_departments_manager ON crm_departments(manager_id);

-- 全文检索索引
CREATE INDEX idx_crm_operation_logs_fulltext ON crm_operation_logs 
    USING GIN (to_tsvector('simple', description || ' ' || COALESCE(object_name, '')));
```

---

## 五、表统计与关系总览

### 5.1 模块表统计

| 模块 | 表数量 | 表名列表 |
|------|--------|----------|
| 4.0 系统基础模块 | 7 | crm_users, crm_roles, crm_permissions, crm_departments, crm_user_roles, crm_role_permissions, crm_data_dicts |
| 4.1 客户管理模块 | 10 | crm_customers, crm_contacts, crm_customer_addresses, crm_customer_pool_logs, crm_tag_definitions, crm_customer_tags, crm_customer_timeline, crm_contact_relations, crm_contact_visits, crm_import_records |
| 4.2 销售管理模块 | 5 | crm_opportunities, crm_opportunity_stages, crm_follow_records, crm_sales_targets, crm_tasks |
| 4.3 产品管理模块 | 6 | crm_product_categories, crm_products, crm_product_skus, crm_product_prices, crm_price_tiers, crm_product_documents |
| 4.4 营销服务模块 | 4 | crm_campaigns, crm_leads, crm_lead_scores, crm_marketing_channels |
| 4.5 客户成功模块 | 3 | crm_customer_health_scores, crm_renewals, crm_customer_satisfaction_surveys |
| 4.6 商务合同模块 | 9 | crm_quotations, crm_quotation_items, crm_contracts, crm_contract_items, crm_orders, crm_order_items, crm_payment_plans, crm_payments, crm_invoices |
| 4.7 AI智能模块 | 3 | crm_customer_profiles, crm_ai_tags, crm_ai_recommendations |
| 4.8 数据报表模块 | 2 | crm_report_templates, crm_report_instances |
| 4.9 系统管理模块 | 1 | crm_operation_logs |
| **总计** | **50** | |

### 5.2 ER关系说明

| 关系 | 表A | 表B | 关系类型 |
|------|-----|-----|----------|
| 用户-角色 | crm_users | crm_roles | N:N (crm_user_roles) |
| 角色-权限 | crm_roles | crm_permissions | N:N (crm_role_permissions) |
| 部门-用户 | crm_departments | crm_users | 1:N |
| 客户-联系人 | crm_customers | crm_contacts | 1:N |
| 客户-地址 | crm_customers | crm_customer_addresses | 1:N |
| 客户-标签 | crm_customers | crm_tag_definitions | N:N (crm_customer_tags) |
| 客户-商机 | crm_customers | crm_opportunities | 1:N |
| 商机-跟进 | crm_opportunities | crm_follow_records | 1:N |
| 商机-产品 | crm_opportunities | crm_products | N:N (crm_opportunity_products) |
| 报价-明细 | crm_quotations | crm_quotation_items | 1:N |
| 合同-明细 | crm_contracts | crm_contract_items | 1:N |
| 订单-明细 | crm_orders | crm_order_items | 1:N |
| 合同-回款 | crm_contracts | crm_payments | 1:N |
| 合同-订单 | crm_contracts | crm_orders | 1:N |

### 5.3 树形结构表

| 表名 | 字段 | 说明 |
|------|------|------|
| crm_departments | parent_id, path, level | 部门树 |
| crm_product_categories | parent_id, path, level | 产品分类树 |
| crm_permissions | parent_id, path, level | 权限菜单树 |
| crm_data_dicts | parent_id | 数据字典树 |

---

## 六、初始化数据脚本

### 6.1 超级管理员初始化

```sql
-- 创建超级管理员用户（密码: admin123，请首次登录后修改）
INSERT INTO crm_users (
    username, email, phone, password_hash, real_name, 
    status, is_super_admin, created_at
) VALUES (
    'admin', 'admin@company.com', '13800138000', 
    '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/X4.5o4Xp5VVZfJKIC', -- BCrypt hash of 'admin123'
    '系统管理员', 'active', TRUE, NOW()
);

-- 获取超级管理员ID
DO $$
DECLARE
    admin_id BIGINT;
BEGIN
    SELECT id INTO admin_id FROM crm_users WHERE username = 'admin';
    
    -- 赋予超级管理员角色
    INSERT INTO crm_user_roles (user_id, role_id, created_at)
    SELECT admin_id, id, NOW() FROM crm_roles WHERE role_code = 'SUPER_ADMIN';
END $$;
```

### 6.2 系统内置角色

```sql
INSERT INTO crm_roles (role_code, role_name, role_type, description, is_system, status, sort_order, created_at) VALUES
('SUPER_ADMIN', '超级管理员', 'system', '系统超级管理员，拥有所有权限', TRUE, 'active', 1, NOW()),
('ADMIN', '系统管理员', 'system', '系统管理员，管理基础配置', TRUE, 'active', 2, NOW()),
('SALES_DIRECTOR', '销售总监', 'system', '销售总监，查看所有销售数据', FALSE, 'active', 10, NOW()),
('SALES_MANAGER', '销售经理', 'system', '销售经理，管理销售团队', FALSE, 'active', 11, NOW()),
('SALES_REP', '销售代表', 'system', '销售代表，负责客户跟进', FALSE, 'active', 12, NOW()),
('CS_MANAGER', '客户成功经理', 'system', '客户成功经理', FALSE, 'active', 20, NOW()),
('MARKETING_MANAGER', '市场经理', 'system', '市场经理', FALSE, 'active', 30, NOW()),
('FINANCE', '财务人员', 'system', '财务人员', FALSE, 'active', 40, NOW()),
('VIEWER', '查看者', 'system', '只读查看者', FALSE, 'active', 99, NOW());
```

### 6.3 权限菜单初始化

```sql
-- 一级菜单
INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, icon, sort_order, status) VALUES
('DASHBOARD', '首页', 'menu', NULL, '/dashboard', 'dashboard', 1, 'active'),
('CUSTOMER', '客户管理', 'menu', NULL, '/customer', 'team', 2, 'active'),
('SALES', '销售管理', 'menu', NULL, '/sales', 'trending-up', 3, 'active'),
('PRODUCT', '产品管理', 'menu', NULL, '/product', 'package', 4, 'active'),
('MARKETING', '营销服务', 'menu', NULL, '/marketing', 'megaphone', 5, 'active'),
('CS', '客户成功', 'menu', NULL, '/cs', 'heart', 6, 'active'),
('CONTRACT', '商务合同', 'menu', NULL, '/contract', 'file-text', 7, 'active'),
('AI', 'AI智能', 'menu', NULL, '/ai', 'cpu', 8, 'active'),
('REPORT', '数据报表', 'menu', NULL, '/report', 'bar-chart', 9, 'active'),
('SYSTEM', '系统管理', 'menu', NULL, '/system', 'settings', 10, 'active');

-- 客户管理子菜单
INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, sort_order, status)
SELECT 'CUSTOMER_LIST', '客户列表', 'menu', id, '/customer/list', 1, 'active' FROM crm_permissions WHERE permission_code = 'CUSTOMER';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, sort_order, status)
SELECT 'CUSTOMER_DETAIL', '客户详情', 'menu', id, '/customer/detail', 2, 'active' FROM crm_permissions WHERE permission_code = 'CUSTOMER';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, sort_order, status)
SELECT 'CUSTOMER_POOL', '客户池', 'menu', id, '/customer/pool', 3, 'active' FROM crm_permissions WHERE permission_code = 'CUSTOMER';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, sort_order, status)
SELECT 'CONTACT_LIST', '联系人', 'menu', id, '/contact/list', 4, 'active' FROM crm_permissions WHERE permission_code = 'CUSTOMER';

-- 系统管理子菜单
INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, sort_order, status)
SELECT 'SYSTEM_USER', '用户管理', 'menu', id, '/system/user', 1, 'active' FROM crm_permissions WHERE permission_code = 'SYSTEM';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, sort_order, status)
SELECT 'SYSTEM_ROLE', '角色权限', 'menu', id, '/system/role', 2, 'active' FROM crm_permissions WHERE permission_code = 'SYSTEM';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, sort_order, status)
SELECT 'SYSTEM_DEPT', '部门管理', 'menu', id, '/system/department', 3, 'active' FROM crm_permissions WHERE permission_code = 'SYSTEM';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, sort_order, status)
SELECT 'SYSTEM_DICT', '数据字典', 'menu', id, '/system/dict', 4, 'active' FROM crm_permissions WHERE permission_code = 'SYSTEM';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, path, sort_order, status)
SELECT 'SYSTEM_LOGS', '操作日志', 'menu', id, '/system/logs', 5, 'active' FROM crm_permissions WHERE permission_code = 'SYSTEM';

-- 按钮权限
INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, resource_path, http_method, status)
SELECT 'CUSTOMER_CREATE', '创建客户', 'button', id, '/api/customer', 'POST', 'active' FROM crm_permissions WHERE permission_code = 'CUSTOMER_LIST';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, resource_path, http_method, status)
SELECT 'CUSTOMER_EDIT', '编辑客户', 'button', id, '/api/customer/:id', 'PUT', 'active' FROM crm_permissions WHERE permission_code = 'CUSTOMER_LIST';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, resource_path, http_method, status)
SELECT 'CUSTOMER_DELETE', '删除客户', 'button', id, '/api/customer/:id', 'DELETE', 'active' FROM crm_permissions WHERE permission_code = 'CUSTOMER_LIST';

INSERT INTO crm_permissions (permission_code, permission_name, permission_type, parent_id, resource_path, http_method, status)
SELECT 'CUSTOMER_EXPORT', '导出客户', 'button', id, '/api/customer/export', 'GET', 'active' FROM crm_permissions WHERE permission_code = 'CUSTOMER_LIST';
```

### 6.4 基础数据字典

```sql
-- 客户类型
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('customer_type', 'enterprise', '企业客户', 'enterprise', 1),
('customer_type', 'individual', '个人客户', 'individual', 2),
('customer_type', 'group', '集团客户', 'group', 3);

-- 客户级别
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('customer_level', 'A', 'A级客户', 'A', 1),
('customer_level', 'B', 'B级客户', 'B', 2),
('customer_level', 'C', 'C级客户', 'C', 3),
('customer_level', 'D', 'D级客户', 'D', 4);

-- 客户状态
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('customer_status', 'potential', '潜在客户', 'potential', 1),
('customer_status', 'active', '正式客户', 'active', 2),
('customer_status', 'inactive', '非活跃客户', 'inactive', 3),
('customer_status', 'churned', '流失客户', 'churned', 4),
('customer_status', 'blacklist', '黑名单', 'blacklist', 5);

-- 客户来源
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('customer_source', 'exhibition', '展会', 'exhibition', 1),
('customer_source', 'referral', '转介绍', 'referral', 2),
('customer_source', 'website', '官网', 'website', 3),
('customer_source', 'cold_call', '电话开拓', 'cold_call', 4),
('customer_source', 'marketing', '营销活动', 'marketing', 5),
('customer_source', 'partner', '渠道合作', 'partner', 6);

-- 行业分类
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('industry', 'manufacturing', '制造业', 'manufacturing', 1),
('industry', 'electronics', '电子行业', 'electronics', 2),
('industry', 'machinery', '机械设备', 'machinery', 3),
('industry', 'automotive', '汽车行业', 'automotive', 4),
('industry', 'medical', '医疗器械', 'medical', 5),
('industry', 'energy', '能源电力', 'energy', 6),
('industry', 'construction', '建筑工程', 'construction', 7),
('industry', 'retail', '零售', 'retail', 8),
('industry', 'finance', '金融', 'finance', 9),
('industry', 'other', '其他', 'other', 99);

-- 商机阶段
INSERT INTO crm_opportunity_stages (stage_code, stage_name, stage_sequence, probability, is_milestone, status) VALUES
('LEAD', '线索', 1, 10, FALSE, 'active'),
('QUALIFIED', '资格确认', 2, 20, FALSE, 'active'),
('PROPOSAL', '方案报价', 3, 40, FALSE, 'active'),
('NEGOTIATION', '商务谈判', 4, 60, FALSE, 'active'),
('CLOSING', '合同签署', 5, 90, TRUE, 'active'),
('WON', '赢单', 6, 100, TRUE, 'active'),
('LOST', '输单', 7, 0, TRUE, 'active');

-- 产品单位
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('product_unit', 'PCS', '件', 'PCS', 1),
('product_unit', 'SET', '套', 'SET', 2),
('product_unit', 'BOX', '箱', 'BOX', 3),
('product_unit', 'KG', '千克', 'KG', 4),
('product_unit', 'M', '米', 'M', 5),
('product_unit', 'SQM', '平方米', 'SQM', 6),
('product_unit', 'TON', '吨', 'TON', 7);

-- 联系人重要性
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('contact_importance', 'key', '关键联系人', 'key', 1),
('contact_importance', 'important', '重要联系人', 'important', 2),
('contact_importance', 'normal', '普通联系人', 'normal', 3);

-- 跟进类型
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('follow_type', 'call', '电话', 'call', 1),
('follow_type', 'visit', '拜访', 'visit', 2),
('follow_type', 'email', '邮件', 'email', 3),
('follow_type', 'meeting', '会议', 'meeting', 4),
('follow_type', 'proposal', '方案', 'proposal', 5);

-- 报价单状态
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('quotation_status', 'draft', '草稿', 'draft', 1),
('quotation_status', 'sent', '已发送', 'sent', 2),
('quotation_status', 'negotiating', '谈判中', 'negotiating', 3),
('quotation_status', 'accepted', '已接受', 'accepted', 4),
('quotation_status', 'rejected', '已拒绝', 'rejected', 5),
('quotation_status', 'expired', '已过期', 'expired', 6);

-- 合同状态
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('contract_status', 'draft', '草稿', 'draft', 1),
('contract_status', 'active', '生效中', 'active', 2),
('contract_status', 'executing', '执行中', 'executing', 3),
('contract_status', 'completed', '已完成', 'completed', 4),
('contract_status', 'terminated', '已终止', 'terminated', 5);

-- 订单状态
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('order_status', 'pending', '待确认', 'pending', 1),
('order_status', 'confirmed', '已确认', 'confirmed', 2),
('order_status', 'processing', '处理中', 'processing', 3),
('order_status', 'shipped', '已发货', 'shipped', 4),
('order_status', 'delivered', '已收货', 'delivered', 5),
('order_status', 'completed', '已完成', 'completed', 6),
('order_status', 'cancelled', '已取消', 'cancelled', 9);

-- 付款状态
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('payment_status', 'unpaid', '未付款', 'unpaid', 1),
('payment_status', 'partial', '部分付款', 'partial', 2),
('payment_status', 'paid', '已付款', 'paid', 3);

-- 付款方式
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('payment_method', 'bank_transfer', '银行转账', 'bank_transfer', 1),
('payment_method', 'cash', '现金', 'cash', 2),
('payment_method', 'check', '支票', 'check', 3),
('payment_method', 'credit_card', '信用卡', 'credit_card', 4),
('payment_method', 'online', '在线支付', 'online', 5);

-- 线索来源
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('lead_source', 'website', '网站', 'website', 1),
('lead_source', 'phone', '电话', 'phone', 2),
('lead_source', 'exhibition', '展会', 'exhibition', 3),
('lead_source', 'referral', '转介绍', 'referral', 4),
('lead_source', 'import', '批量导入', 'import', 5),
('lead_source', 'campaign', '营销活动', 'campaign', 6);

-- 线索状态
INSERT INTO crm_data_dicts (dict_type, dict_code, dict_label, dict_value, dict_sort) VALUES
('lead_status', 'new', '新线索', 'new', 1),
('lead_status', 'contacted', '已联系', 'contacted', 2),
('lead_status', 'qualified', '已合格', 'qualified', 3),
('lead_status', 'unqualified', '不合格', 'unqualified', 4);
```

### 6.5 部门初始化

```sql
INSERT INTO crm_departments (dept_code, dept_name, dept_type, parent_id, path, level, status, sort_order, created_at) VALUES
('HQ', '总公司', 'headquarters', NULL, '/', 1, 'active', 0, NOW()),
('SALES', '销售部', 'department', 1, '/1/', 2, 'active', 1, NOW()),
('MARKETING', '市场部', 'department', 1, '/1/', 2, 'active', 2, NOW()),
('CS', '客户成功部', 'department', 1, '/1/', 2, 'active', 3, NOW()),
('FINANCE', '财务部', 'department', 1, '/1/', 2, 'active', 4, NOW()),
('IT', 'IT部', 'department', 1, '/1/', 2, 'active', 5, NOW()),
('HR', '人力资源部', 'department', 1, '/1/', 2, 'active', 6, NOW()),
('SALES_NORTH', '北方销售组', 'team', 2, '/1/2/', 3, 'active', 1, NOW()),
('SALES_SOUTH', '南方销售组', 'team', 2, '/1/2/', 3, 'active', 2, NOW());
```

### 6.6 序列号规则初始化

```sql
INSERT INTO sequence_rules (rule_code, rule_name, entity_type, prefix, date_format, separator, sequence_length, reset_type, current_value) VALUES
('CUSTOMER', '客户编号', 'customer', 'C', 'YYYYMM', '-', 4, 'monthly', 0),
('CONTACT', '联系人编号', 'contact', 'CT', 'YYYYMM', '-', 4, 'monthly', 0),
('OPPORTUNITY', '商机编号', 'opportunity', 'OPP', 'YYYYMM', '-', 4, 'monthly', 0),
('QUOTATION', '报价单号', 'quotation', 'QT', 'YYYYMM', '-', 5, 'monthly', 0),
('CONTRACT', '合同编号', 'contract', 'CT', 'YYYY', '-', 5, 'yearly', 0),
('ORDER', '订单编号', 'order', 'SO', 'YYYYMM', '-', 6, 'monthly', 0),
('INVOICE', '发票号', 'invoice', 'INV', 'YYYYMM', '-', 6, 'monthly', 0),
('LEAD', '线索编号', 'lead', 'LD', 'YYYYMM', '-', 5, 'monthly', 0),
('PAYMENT', '回款编号', 'payment', 'PAY', 'YYYYMM', '-', 5, 'monthly', 0);

-- 序列号生成函数
CREATE OR REPLACE FUNCTION generate_sequence_number(p_rule_code VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
    v_rule RECORD;
    v_seq VARCHAR;
    v_date VARCHAR;
    v_seq_num INTEGER;
BEGIN
    SELECT * INTO v_rule FROM sequence_rules WHERE rule_code = p_rule_code AND status = 'active';
    
    IF v_rule IS NULL THEN
        RAISE EXCEPTION 'Sequence rule not found: %', p_rule_code;
    END IF;
    
    v_date := TO_CHAR(CURRENT_DATE, COALESCE(v_rule.date_format, 'YYYYMMDD'));
    
    IF v_rule.reset_type = 'daily' AND v_rule.current_date != CURRENT_DATE THEN
        UPDATE sequence_rules SET current_value = 0, current_date = CURRENT_DATE WHERE id = v_rule.id;
        v_seq_num := 1;
    ELSIF v_rule.reset_type = 'monthly' AND EXTRACT(MONTH FROM v_rule.current_date) != EXTRACT(MONTH FROM CURRENT_DATE) THEN
        UPDATE sequence_rules SET current_value = 0, current_date = CURRENT_DATE WHERE id = v_rule.id;
        v_seq_num := 1;
    ELSIF v_rule.reset_type = 'yearly' AND EXTRACT(YEAR FROM v_rule.current_date) != EXTRACT(YEAR FROM CURRENT_DATE) THEN
        UPDATE sequence_rules SET current_value = 0, current_date = CURRENT_DATE WHERE id = v_rule.id;
        v_seq_num := 1;
    ELSE
        UPDATE sequence_rules SET current_value = current_value + 1 WHERE id = v_rule.id RETURNING current_value INTO v_seq_num;
    END IF;
    
    v_seq := LPAD(v_seq_num::TEXT, v_rule.sequence_length, v_rule.padding_char);
    
    RETURN v_rule.prefix || v_date || v_rule.separator || v_seq || v_rule.suffix;
END;
$$ LANGUAGE plpgsql;
```

---

## 七、偏离核心功能警告汇总

### 7.1 制造业特色字段警告清单

| 序号 | 表名 | 字段名 | 类型 | ⚠️警告等级 | 说明 | 建议处理 |
|------|------|--------|------|------------|------|----------|
| 1 | crm_customers | supply_chain_position | VARCHAR(50) | ⚠️ 高 | 供应链位置 | 建议移除 |
| 2 | crm_customers | business_type | VARCHAR(50) | ⚠️ 高 | 业务类型 | 建议移除 |
| 3 | crm_products | specification | VARCHAR(200) | ⚠️ 低 | 规格参数 | 保留但标注为可选 |
| 4 | crm_products | weight | DECIMAL(10,3) | ⚠️ 低 | 重量(kg) | 保留但标注为可选 |
| 5 | crm_products | material | VARCHAR(100) | ⚠️ 中 | 材料 | 保留但标注为可选 |
| 6 | crm_products | technical_params | JSONB | ⚠️ 中 | 技术参数 | 保留但标注为可选 |
| 7 | crm_products | warehouse_id | BIGINT | ⚠️ 中 | 仓库ID | 保留但标注为可选 |
| 8 | crm_products | lead_time_days | INTEGER | ⚠️ 中 | 交期(天) | 保留但标注为可选 |
| 9 | crm_products | category_type含material | VARCHAR(30) | ⚠️ 中 | 分类类型 | 移除material选项 |
| 10 | crm_products | product_type含custom/service | VARCHAR(30) | ⚠️ 中 | 产品类型 | 评估是否需要 |
| 11 | crm_quotations | craft_fee | DECIMAL(15,2) | ⚠️ 高 | 工艺费 | 建议移除 |
| 12 | crm_quotations | loss_rate | DECIMAL(5,4) | ⚠️ 高 | 损耗率 | 建议移除 |
| 13 | crm_quotations | quotation_type含oem | VARCHAR(20) | ⚠️ 中 | 报价类型 | 评估是否需要 |
| 14 | crm_quotations | price_term含EXW/FOB/CIF/DDP | VARCHAR(30) | ⚠️ 中 | 价格条款 | 保留但标注为可选 |
| 15 | crm_quotations | delivery_term | VARCHAR(50) | ⚠️ 中 | 交货条款 | 保留但标注为可选 |
| 16 | crm_quotations | delivery_days | INTEGER | ⚠️ 中 | 交货天数 | 保留但标注为可选 |
| 17 | crm_contract_items | delivered_quantity | DECIMAL(18,4) | ⚠️ 低 | 已交付数量 | 保留 |
| 18 | crm_contract_items | delivery_date | DATE | ⚠️ 中 | 交付日期 | 保留但标注为可选 |
| 19 | crm_contract_items | delivery_status | VARCHAR(20) | ⚠️ 中 | 交付状态 | 保留但标注为可选 |
| 20 | crm_order_items | shipped_quantity | DECIMAL(18,4) | ⚠️ 低 | 已发货数量 | 保留 |
| 21 | crm_order_items | delivery_date | DATE | ⚠️ 中 | 交付日期 | 保留但标注为可选 |
| 22 | crm_order_items | warehouse_id | BIGINT | ⚠️ 中 | 仓库ID | 保留但标注为可选 |
| 23 | crm_customer_addresses | max_freight_volume | DECIMAL(18,2) | ⚠️ 中 | 最大货运量 | 保留但标注为可选 |
| 24 | crm_product_skus | weight | DECIMAL(10,3) | ⚠️ 低 | SKU重量 | 保留但标注为可选 |

### 7.2 警告字段统计

| 警告等级 | 数量 | 说明 |
|----------|------|------|
| ⚠️ 高（建议移除） | 4 | 明显偏离通用CRM功能 |
| ⚠️ 中（保留但标注可选） | 15 | 制造业特色，可选保留 |
| ⚠️ 低（可保留） | 5 | 轻微涉及制造业务 |

### 7.3 建议保留的核心字段

以下字段是通用CRM必需的核心字段，即使有轻微制造业特征也应保留：

| 表名 | 字段名 | 说明 |
|------|--------|------|
| crm_products | standard_price | 标准售价（必需） |
| crm_products | cost_price | 成本价（必需） |
| crm_products | stock_quantity | 库存数量（通用） |
| crm_orders | shipping_method | 物流方式（通用） |
| crm_orders | tracking_no | 物流单号（通用） |
| crm_invoices | invoice_type | 发票类型（必需） |

---

## 八、PostgreSQL特性应用

### 8.1 JSONB字段应用场景

```sql
-- 订单扩展数据
extra_data JSONB DEFAULT '{}'
-- 示例: {"source": "ecommerce", "coupon_code": "DISCOUNT20"}

-- 审批配置
workflow_config JSONB DEFAULT '{}'
-- 示例: {"auto_approve_threshold": 10000, "require_backup": true}

-- 动态表单数据
form_data JSONB DEFAULT '{}'
```

### 8.2 数组字段应用场景

```sql
-- 团队成员
team_members BIGINT[]

-- 标签列表
tags VARCHAR(50)[]

-- 竞争对手
competitors TEXT[]

-- 适用类型
applicable_types VARCHAR(20)[]
```

### 8.3 全文检索配置

```sql
-- 启用中文分词扩展（需要安装）
CREATE EXTENSION IF NOT EXISTS zhparser;

-- 创建全文检索配置
CREATE TEXT SEARCH CONFIGURATION chinese_zhparser (PARSER = zhparser);

-- 创建复合索引
CREATE INDEX idx_products_fulltext ON crm_products 
    USING GIN (to_tsvector('chinese_zhparser', product_name || ' ' || COALESCE(description, '')));
```

---

## 九、常用查询示例

### 9.1 客户完整视图

```sql
CREATE OR REPLACE VIEW v_customer_complete AS
SELECT 
    c.*,
    u.real_name AS owner_name,
    d.dept_name,
    COUNT(DISTINCT ct.id) AS contact_count,
    COUNT(DISTINCT o.id) AS opportunity_count,
    COUNT(DISTINCT q.id) AS quotation_count,
    COUNT(DISTINCT co.id) AS contract_count,
    COUNT(DISTINCT ord.id) AS order_count,
    COALESCE(SUM(pmt.payment_amount), 0) AS total_received,
    COALESCE(MAX(chs.overall_score), 0) AS health_score
FROM crm_customers c
LEFT JOIN crm_users u ON c.owner_id = u.id
LEFT JOIN crm_departments d ON c.department_id = d.id
LEFT JOIN crm_contacts ct ON c.id = ct.customer_id
LEFT JOIN crm_opportunities o ON c.id = o.customer_id
LEFT JOIN crm_quotations q ON c.id = q.customer_id
LEFT JOIN crm_contracts co ON c.id = co.customer_id
LEFT JOIN crm_orders ord ON c.id = ord.customer_id
LEFT JOIN crm_payments pmt ON c.id = pmt.customer_id
LEFT JOIN crm_customer_health_scores chs ON c.id = chs.customer_id
WHERE c.deleted_at IS NULL
GROUP BY c.id, u.real_name, d.dept_name;
```

### 9.2 商机漏斗分析

```sql
CREATE OR REPLACE VIEW v_opportunity_funnel AS
SELECT 
    s.stage_name,
    s.stage_sequence,
    COUNT(o.id) AS opportunity_count,
    COALESCE(SUM(o.estimated_amount), 0) AS total_amount,
    AVG(o.probability) AS avg_probability
FROM crm_opportunity_stages s
LEFT JOIN crm_opportunities o ON s.id = o.stage_id AND o.deleted_at IS NULL
WHERE s.deleted_at IS NULL
GROUP BY s.id, s.stage_name, s.stage_sequence
ORDER BY s.stage_sequence;
```

### 9.3 销售预测视图

```sql
CREATE OR REPLACE VIEW v_sales_forecast AS
SELECT 
    DATE_TRUNC('month', o.expected_close_date) AS month,
    SUM(o.estimated_amount * o.probability / 100) AS weighted_amount,
    SUM(CASE WHEN o.result = 'won' THEN o.estimated_amount ELSE 0 END) AS confirmed_amount,
    COUNT(CASE WHEN o.result = 'won' THEN 1 END) AS won_count,
    COUNT(CASE WHEN o.result = 'lost' THEN 1 END) AS lost_count
FROM crm_opportunities o
WHERE o.deleted_at IS NULL 
    AND o.expected_close_date >= CURRENT_DATE
    AND o.result IN ('won', 'lost', 'pending')
GROUP BY DATE_TRUNC('month', o.expected_close_date)
ORDER BY month;
```

crm_operation_logs（操作日志表）包含请求/响应、新旧数据对比、分区表建议。
sql
CREATE TABLE crm_operation_logs (
    id                  BIGSERIAL PRIMARY KEY,
    
    user_id             BIGINT REFERENCES crm_users(id),
    username            VARCHAR(50),
    real_name           VARCHAR(100),
    ip_address          VARCHAR(45),
    user_agent          VARCHAR(500),
    
    module              VARCHAR(50) NOT NULL,
    action              VARCHAR(50) NOT NULL,
    operation_type      VARCHAR(30),
    description         TEXT,
    
    object_type         VARCHAR(100),
    object_id           BIGINT,
    object_name         VARCHAR(200),
    
    request_method      VARCHAR(10),
    request_url         VARCHAR(500),
    request_params       JSONB,
    request_body        JSONB,
    
    response_code       INTEGER,
    response_time_ms    INTEGER,
    error_message       TEXT,
    
    old_data            JSONB,
    new_data            JSONB,
    diff_data           JSONB,
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (created_at);  -- 建议按月分区

CREATE INDEX idx_operation_logs_user ON crm_operation_logs(user_id);
CREATE INDEX idx_operation_logs_module ON crm_operation_logs(module);
CREATE INDEX idx_operation_logs_object ON crm_operation_logs(object_type, object_id);
CREATE INDEX idx_operation_logs_created ON crm_operation_logs(created_at);
---

序列号规则表，统一管理所有业务单号生成。
CREATE TABLE crm_sequence_rules (
    id                  BIGSERIAL PRIMARY KEY,
    
    rule_code           VARCHAR(50) NOT NULL UNIQUE,
    rule_name           VARCHAR(100) NOT NULL,
    entity_type         VARCHAR(50) NOT NULL,
    
    prefix              VARCHAR(20) DEFAULT '',
    date_format         VARCHAR(20),
    separator           VARCHAR(10) DEFAULT '-',
    sequence_length     INTEGER DEFAULT 4,
    
    reset_type          VARCHAR(20) DEFAULT 'never',
    reset_date          DATE,
    
    current_value       INTEGER DEFAULT 0,
    current_date        DATE,
    
    padding_char        VARCHAR(1) DEFAULT '0',
    suffix              VARCHAR(20) DEFAULT '',
    
    status              VARCHAR(20) DEFAULT 'active',
    
    created_at          TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP WITH TIME ZONE,
    created_by          BIGINT,
    updated_by          BIGINT,
    deleted_at          TIMESTAMP WITH TIME ZONE,
    version             INTEGER DEFAULT 1
);

联合跟进关系表
CREATE TABLE crm_joint_followups (
    id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES crm_customers(id),
    main_owner_id BIGINT NOT NULL REFERENCES crm_users(id),
    joint_owner_id BIGINT NOT NULL REFERENCES crm_users(id),
    share_ratio DECIMAL(5,2) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT NOW()
);
## 十、数据库维护建议

### 10.1 分区表建议

```sql
-- 操作日志按月分区
CREATE TABLE crm_operation_logs (
    id BIGSERIAL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    ...
) PARTITION BY RANGE (created_at);

-- 创建月度分区
CREATE TABLE crm_operation_logs_2026_01 PARTITION OF crm_operation_logs
    FOR VALUES FROM ('2026-01-01') TO ('2026-02-01');
```

### 10.2 定期维护任务

```sql
-- 重建索引
REINDEX INDEX CONCURRENTLY idx_crm_customers_name;

-- 更新统计信息
ANALYZE crm_customers;

-- 清理软删除数据（保留2年）
DELETE FROM crm_customers WHERE deleted_at < CURRENT_DATE - INTERVAL '2 years';

-- 归档旧日志
DELETE FROM crm_operation_logs WHERE created_at < CURRENT_DATE - INTERVAL '90 days';
```

### 10.3 性能监控

```sql
-- 查看慢查询
SELECT query, calls, mean_time, total_time
FROM pg_stat_statements
ORDER BY mean_time DESC
LIMIT 20;

-- 查看表大小
SELECT relname, pg_size_pretty(pg_total_relation_size(relid))
FROM pg_stat_user_tables
ORDER BY pg_total_relation_size(relid) DESC;
```

七、PostgreSQL高级特性应用
7.1 序列号生成函数
sql
CREATE OR REPLACE FUNCTION generate_sequence_number(p_rule_code VARCHAR)
RETURNS VARCHAR AS $$
DECLARE
    v_rule RECORD;
    v_seq VARCHAR;
    v_date VARCHAR;
    v_seq_num INTEGER;
BEGIN
    SELECT * INTO v_rule FROM crm_sequence_rules WHERE rule_code = p_rule_code AND status = 'active';
    
    IF v_rule IS NULL THEN
        RAISE EXCEPTION 'Sequence rule not found: %', p_rule_code;
    END IF;
    
    v_date := TO_CHAR(CURRENT_DATE, COALESCE(v_rule.date_format, 'YYYYMMDD'));
    
    IF v_rule.reset_type = 'daily' AND v_rule.current_date != CURRENT_DATE THEN
        UPDATE crm_sequence_rules SET current_value = 0, current_date = CURRENT_DATE WHERE id = v_rule.id;
        v_seq_num := 1;
    ELSIF v_rule.reset_type = 'monthly' AND EXTRACT(MONTH FROM v_rule.current_date) != EXTRACT(MONTH FROM CURRENT_DATE) THEN
        UPDATE crm_sequence_rules SET current_value = 0, current_date = CURRENT_DATE WHERE id = v_rule.id;
        v_seq_num := 1;
    ELSIF v_rule.reset_type = 'yearly' AND EXTRACT(YEAR FROM v_rule.current_date) != EXTRACT(YEAR FROM CURRENT_DATE) THEN
        UPDATE crm_sequence_rules SET current_value = 0, current_date = CURRENT_DATE WHERE id = v_rule.id;
        v_seq_num := 1;
    ELSE
        UPDATE crm_sequence_rules SET current_value = current_value + 1 WHERE id = v_rule.id RETURNING current_value INTO v_seq_num;
    END IF;
    
    v_seq := LPAD(v_seq_num::TEXT, v_rule.sequence_length, v_rule.padding_char);
    
    RETURN v_rule.prefix || v_date || v_rule.separator || v_seq || v_rule.suffix;
END;
$$ LANGUAGE plpgsql;
7.2 核心视图
sql
-- 客户360完整视图
CREATE OR REPLACE VIEW v_customer_complete AS
SELECT 
    c.*,
    u.real_name AS owner_name,
    d.dept_name,
    COUNT(DISTINCT ct.id) AS contact_count,
    COUNT(DISTINCT o.id) AS opportunity_count,
    COALESCE(SUM(pmt.amount), 0) AS total_received,
    COALESCE(MAX(chs.total_score), 0) AS health_score
FROM crm_customers c
LEFT JOIN crm_users u ON c.owner_id = u.id
LEFT JOIN crm_departments d ON c.dept_id = d.id
LEFT JOIN crm_contacts ct ON c.id = ct.customer_id
LEFT JOIN crm_opportunities o ON c.id = o.customer_id
LEFT JOIN crm_payments pmt ON c.id = pmt.customer_id
LEFT JOIN crm_customer_health_scores chs ON c.id = chs.customer_id
WHERE c.is_deleted = FALSE
GROUP BY c.id, u.real_name, d.dept_name;

-- 商机漏斗分析视图
CREATE OR REPLACE VIEW v_opportunity_funnel AS
SELECT 
    stage,
    COUNT(id) AS opportunity_count,
    COALESCE(SUM(amount), 0) AS total_amount,
    AVG(probability) AS avg_probability
FROM crm_opportunities
WHERE is_deleted = FALSE
GROUP BY stage
ORDER BY MIN(stage_updated_at);
八、初始化数据（关键部分）
sql
-- 系统内置角色
INSERT INTO crm_roles (role_code, role_name, role_type, is_system, status, sort_order) VALUES
('SUPER_ADMIN', '超级管理员', 'system', TRUE, 'active', 1),
('SALES_MANAGER', '销售经理', 'system', FALSE, 'active', 10),
('SALES_REP', '销售代表', 'system', FALSE, 'active', 11),
('CS_MANAGER', '客户成功经理', 'system', FALSE, 'active', 20),
('MARKETING', '市场人员', 'system', FALSE, 'active', 30),
('FINANCE', '财务人员', 'system', FALSE, 'active', 40);

-- 序列号规则初始化
INSERT INTO crm_sequence_rules (rule_code, rule_name, entity_type, prefix, date_format, sequence_length, reset_type) VALUES
('CUSTOMER', '客户编号', 'customer', 'C', 'YYYYMM', 4, 'monthly'),
('OPPORTUNITY', '商机编号', 'opportunity', 'OPP', 'YYYYMM', 4, 'monthly'),
('QUOTATION', '报价单号', 'quotation', 'QT', 'YYYYMM', 5, 'monthly'),
('CONTRACT', '合同编号', 'contract', 'HT', 'YYYY', 5, 'yearly'),
('ORDER', '订单编号', 'order', 'ORD', 'YYYYMM', 6, 'monthly'),
('INVOICE', '发票编号', 'invoice', 'INV', 'YYYYMM', 6, 'monthly'),
('LEAD', '线索编号', 'lead', 'LD', 'YYYYMM', 5, 'monthly');

---

**文档结束**

| 版本 | 日期 | 修改内容 |
|------|------|----------|
| v1.0 | 2026-03-25 | 初始版本 |
| v2.0 | 2026-04-17 | 最终版：按功能树重构，新增系统基础模块，标记制造业特色字段 |
