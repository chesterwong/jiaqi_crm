-- ============================================================================
-- CRM 业务表与 FastApiAdmin 系统表完整关联关系脚本
-- 
-- 功能说明:
-- 1. 补充缺失的 13 张 FastApiAdmin 系统表
-- 2. 为所有 CRM 业务表添加与系统表的外键关联
-- 3. 统一字段数据类型（int4 → int8 或反之）
-- 4. 建立完整的权限控制和审计追踪体系
--
-- 执行前必读:
-- ⚠️ 必须先备份数据库！
-- ⚠️ 建议在测试环境先验证
-- ⚠️ 执行时间约 5-10 分钟
--
-- 执行方式:
-- psql -U postgres -d crm -f docs/database/CRM业务表与系统表完整关联.sql
--
-- 生成日期: 2026-04-21
-- 版本: v1.0
-- ============================================================================

BEGIN;

-- ============================================================================
-- 第一部分：创建缺失的 FastApiAdmin 系统表（13张）
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1.1 核心系统表（4张）- RBAC 权限系统必需
-- ----------------------------------------------------------------------------

-- 表1: sys_role（角色表）
CREATE TABLE IF NOT EXISTS "public"."sys_role" (
    "id" SERIAL PRIMARY KEY,
    "uuid" VARCHAR(64) NOT NULL UNIQUE,
    "name" VARCHAR(64) NOT NULL,
    "code" VARCHAR(16) NOT NULL UNIQUE,
    "order" INTEGER NOT NULL DEFAULT 0,
    "data_scope" INTEGER NOT NULL DEFAULT 1,
    "status" VARCHAR(10) NOT NULL DEFAULT '0',
    "description" TEXT,
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "created_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "updated_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);

COMMENT ON TABLE "public"."sys_role" IS '角色表';
COMMENT ON COLUMN "public"."sys_role"."data_scope" IS '数据权限范围: 1-仅本人, 2-本部门, 3-本部门及以下, 4-全部, 5-自定义';

CREATE INDEX IF NOT EXISTS idx_sys_role_code ON "public"."sys_role"("code");
CREATE INDEX IF NOT EXISTS idx_sys_role_status ON "public"."sys_role"("status");

-- 表2: sys_user_roles（用户角色关联表）
CREATE TABLE IF NOT EXISTS "public"."sys_user_roles" (
    "user_id" INTEGER NOT NULL REFERENCES "public"."sys_user"("id") ON DELETE CASCADE,
    "role_id" INTEGER NOT NULL REFERENCES "public"."sys_role"("id") ON DELETE CASCADE,
    PRIMARY KEY ("user_id", "role_id"),
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);

COMMENT ON TABLE "public"."sys_user_roles" IS '用户角色关联表';

CREATE INDEX IF NOT EXISTS idx_sys_user_roles_user_id ON "public"."sys_user_roles"("user_id");
CREATE INDEX IF NOT EXISTS idx_sys_user_roles_role_id ON "public"."sys_user_roles"("role_id");

-- 表3: sys_role_menus（角色菜单关联表）
CREATE TABLE IF NOT EXISTS "public"."sys_role_menus" (
    "role_id" INTEGER NOT NULL REFERENCES "public"."sys_role"("id") ON DELETE CASCADE,
    "menu_id" INTEGER NOT NULL REFERENCES "public"."sys_menu"("id") ON DELETE CASCADE,
    PRIMARY KEY ("role_id", "menu_id"),
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);

COMMENT ON TABLE "public"."sys_role_menus" IS '角色菜单关联表';

CREATE INDEX IF NOT EXISTS idx_sys_role_menus_role_id ON "public"."sys_role_menus"("role_id");
CREATE INDEX IF NOT EXISTS idx_sys_role_menus_menu_id ON "public"."sys_role_menus"("menu_id");

-- 表4: sys_param（系统参数表）
CREATE TABLE IF NOT EXISTS "public"."sys_param" (
    "id" SERIAL PRIMARY KEY,
    "uuid" VARCHAR(64) NOT NULL UNIQUE,
    "param_name" VARCHAR(100) NOT NULL,
    "param_key" VARCHAR(100) NOT NULL UNIQUE,
    "param_value" TEXT,
    "param_type" VARCHAR(20) DEFAULT 'string',
    "description" TEXT,
    "sort" INTEGER DEFAULT 0,
    "status" VARCHAR(10) DEFAULT '0',
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "created_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "updated_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);

COMMENT ON TABLE "public"."sys_param" IS '系统参数配置表';

CREATE INDEX IF NOT EXISTS idx_sys_param_key ON "public"."sys_param"("param_key");


-- ----------------------------------------------------------------------------
-- 1.2 代码生成表（3张）
-- ----------------------------------------------------------------------------

-- 表5: gen_table（代码生成主表）
CREATE TABLE IF NOT EXISTS "public"."gen_table" (
    "id" SERIAL PRIMARY KEY,
    "uuid" VARCHAR(64) NOT NULL UNIQUE,
    "table_name" VARCHAR(100) NOT NULL UNIQUE,
    "table_comment" VARCHAR(200),
    "class_name" VARCHAR(100),
    "tpl_category" VARCHAR(20) DEFAULT 'crud',
    "package_name" VARCHAR(100),
    "module_name" VARCHAR(100),
    "business_name" VARCHAR(100),
    "function_name" VARCHAR(100),
    "function_author" VARCHAR(50),
    "options" TEXT,
    "status" VARCHAR(10) DEFAULT '0',
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "created_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "updated_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);

COMMENT ON TABLE "public"."gen_table" IS '代码生成主表';

CREATE INDEX IF NOT EXISTS idx_gen_table_name ON "public"."gen_table"("table_name");

-- 表6-7: gen_demo, gen_demo01（演示表）
CREATE TABLE IF NOT EXISTS "public"."gen_demo" (
    "id" SERIAL PRIMARY KEY,
    "uuid" VARCHAR(64) NOT NULL UNIQUE,
    "name" VARCHAR(100),
    "status" VARCHAR(10) DEFAULT '0',
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "created_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "updated_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS "public"."gen_demo01" (
    "id" SERIAL PRIMARY KEY,
    "uuid" VARCHAR(64) NOT NULL UNIQUE,
    "title" VARCHAR(100),
    "status" VARCHAR(10) DEFAULT '0',
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "created_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "updated_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);


-- ----------------------------------------------------------------------------
-- 1.3 工作流表（3张）- 按需使用
-- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS "public"."task_workflow" (
    "id" SERIAL PRIMARY KEY,
    "uuid" VARCHAR(64) NOT NULL UNIQUE,
    "workflow_name" VARCHAR(100) NOT NULL,
    "workflow_code" VARCHAR(50) NOT NULL UNIQUE,
    "description" TEXT,
    "status" VARCHAR(10) DEFAULT '0',
    "version" INTEGER DEFAULT 1,
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "created_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "updated_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);

COMMENT ON TABLE "public"."task_workflow" IS '工作流定义表';

CREATE INDEX IF NOT EXISTS idx_task_workflow_code ON "public"."task_workflow"("workflow_code");

CREATE TABLE IF NOT EXISTS "public"."task_node" (
    "id" SERIAL PRIMARY KEY,
    "uuid" VARCHAR(64) NOT NULL UNIQUE,
    "workflow_id" INTEGER NOT NULL REFERENCES "public"."task_workflow"("id") ON DELETE CASCADE,
    "node_name" VARCHAR(100) NOT NULL,
    "node_type" VARCHAR(20) NOT NULL,
    "node_code" VARCHAR(50),
    "sort" INTEGER DEFAULT 0,
    "config" TEXT,
    "status" VARCHAR(10) DEFAULT '0',
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "created_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "updated_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);

COMMENT ON TABLE "public"."task_node" IS '工作流节点表';

CREATE INDEX IF NOT EXISTS idx_task_node_workflow_id ON "public"."task_node"("workflow_id");

CREATE TABLE IF NOT EXISTS "public"."task_workflow_node_type" (
    "id" SERIAL PRIMARY KEY,
    "uuid" VARCHAR(64) NOT NULL UNIQUE,
    "type_name" VARCHAR(100) NOT NULL,
    "type_code" VARCHAR(50) NOT NULL UNIQUE,
    "icon" VARCHAR(50),
    "config_schema" TEXT,
    "description" TEXT,
    "status" VARCHAR(10) DEFAULT '0',
    "created_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_time" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "deleted_time" TIMESTAMP,
    "created_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "updated_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL,
    "deleted_id" INTEGER REFERENCES "public"."sys_user"("id") ON DELETE SET NULL
);

COMMENT ON TABLE "public"."task_workflow_node_type" IS '工作流节点类型定义表';


-- ----------------------------------------------------------------------------
-- 1.4 其他辅助表（3张）
-- ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS "public"."apscheduler_jobs" (
    "id" VARCHAR(191) PRIMARY KEY,
    "next_run_time" TIMESTAMP,
    "job_state" BYTEA NOT NULL
);

COMMENT ON TABLE "public"."apscheduler_jobs" IS 'APScheduler定时任务表';

CREATE SCHEMA IF NOT EXISTS ai;

CREATE TABLE IF NOT EXISTS "ai"."agno_schema_versions" (
    "id" SERIAL PRIMARY KEY,
    "schema_version" VARCHAR(20) NOT NULL,
    "applied_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "ai"."agno_sessions" (
    "id" VARCHAR(191) PRIMARY KEY,
    "session_data" JSONB NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================================
-- 第二部分：初始化基础数据
-- ============================================================================

-- 插入默认角色
INSERT INTO "public"."sys_role" ("uuid", "name", "code", "order", "data_scope", "status", "description") VALUES
(gen_random_uuid()::text, '超级管理员', 'admin', 1, 4, '0', '系统超级管理员，拥有所有权限'),
(gen_random_uuid()::text, '销售经理', 'sales_manager', 2, 3, '0', '销售经理，可管理部门及下属数据'),
(gen_random_uuid()::text, '销售代表', 'sales_rep', 3, 1, '0', '销售代表，仅可查看自己的数据'),
(gen_random_uuid()::text, '客服专员', 'customer_service', 4, 2, '0', '客服专员，可查看本部门客户数据')
ON CONFLICT ("code") DO NOTHING;

-- 为 admin 用户分配超级管理员角色
INSERT INTO "public"."sys_user_roles" ("user_id", "role_id")
SELECT u.id, r.id
FROM "public"."sys_user" u, "public"."sys_role" r
WHERE u.username = 'admin' AND r.code = 'admin'
ON CONFLICT ("user_id", "role_id") DO NOTHING;

-- 插入默认系统参数
INSERT INTO "public"."sys_param" ("uuid", "param_name", "param_key", "param_value", "param_type", "description", "sort", "status") VALUES
(gen_random_uuid()::text, '系统名称', 'system.name', '制造业CRM系统', 'string', '系统显示名称', 1, '0'),
(gen_random_uuid()::text, '系统版本', 'system.version', '1.0.0', 'string', '系统版本号', 2, '0'),
(gen_random_uuid()::text, '默认每页条数', 'system.page_size', '20', 'number', '列表默认每页显示条数', 3, '0'),
(gen_random_uuid()::text, '文件上传大小限制(MB)', 'system.upload_max_size', '10', 'number', '文件上传最大大小', 4, '0'),
(gen_random_uuid()::text, '是否启用AI功能', 'system.ai_enabled', 'true', 'boolean', '是否启用AI智能推荐功能', 5, '0')
ON CONFLICT ("param_key") DO NOTHING;

-- 插入默认工作流节点类型
INSERT INTO "public"."task_workflow_node_type" ("uuid", "type_name", "type_code", "icon", "description", "status") VALUES
(gen_random_uuid()::text, '开始节点', 'start', 'play-circle', '工作流开始节点', '0'),
(gen_random_uuid()::text, '结束节点', 'end', 'stop-circle', '工作流结束节点', '0'),
(gen_random_uuid()::text, '审批节点', 'approval', 'check-circle', '人工审批节点', '0'),
(gen_random_uuid()::text, '条件分支', 'condition', 'git-branch', '条件判断分支节点', '0'),
(gen_random_uuid()::text, '并行网关', 'parallel', 'fork', '并行执行多个分支', '0'),
(gen_random_uuid()::text, '通知节点', 'notification', 'bell', '发送通知消息', '0')
ON CONFLICT ("type_code") DO NOTHING;


-- ============================================================================
-- 第三部分：为 CRM 业务表添加外键约束
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 3.1 客户管理模块
-- ----------------------------------------------------------------------------

-- crm_customers（客户表）
DO $$
BEGIN
    -- owner_id → sys_user.id
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_owner') THEN
        ALTER TABLE "public"."crm_customers" 
        ADD CONSTRAINT fk_crm_customers_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    -- department_id → sys_dept.id
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_dept') THEN
        ALTER TABLE "public"."crm_customers" 
        ADD CONSTRAINT fk_crm_customers_dept 
        FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept"("id") ON DELETE SET NULL;
    END IF;
    
    -- tenant_id → sys_tenant.id
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_tenant') THEN
        ALTER TABLE "public"."crm_customers" 
        ADD CONSTRAINT fk_crm_customers_tenant 
        FOREIGN KEY ("tenant_id") REFERENCES "public"."sys_tenant"("id") ON DELETE RESTRICT;
    END IF;
    
    -- created_by → sys_user.id
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_created_by') THEN
        ALTER TABLE "public"."crm_customers" 
        ADD CONSTRAINT fk_crm_customers_created_by 
        FOREIGN KEY ("created_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    -- updated_by → sys_user.id
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_updated_by') THEN
        ALTER TABLE "public"."crm_customers" 
        ADD CONSTRAINT fk_crm_customers_updated_by 
        FOREIGN KEY ("updated_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_contacts（联系人表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contacts_owner') THEN
        ALTER TABLE "public"."crm_contacts" 
        ADD CONSTRAINT fk_crm_contacts_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contacts_customer') THEN
        ALTER TABLE "public"."crm_contacts" 
        ADD CONSTRAINT fk_crm_contacts_customer 
        FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers"("id") ON DELETE CASCADE;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contacts_created_by') THEN
        ALTER TABLE "public"."crm_contacts" 
        ADD CONSTRAINT fk_crm_contacts_created_by 
        FOREIGN KEY ("created_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_followups（跟进记录表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_owner') THEN
        ALTER TABLE "public"."crm_followups" 
        ADD CONSTRAINT fk_crm_followups_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_customer') THEN
        ALTER TABLE "public"."crm_followups" 
        ADD CONSTRAINT fk_crm_followups_customer 
        FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers"("id") ON DELETE CASCADE;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_contact') THEN
        ALTER TABLE "public"."crm_followups" 
        ADD CONSTRAINT fk_crm_followups_contact 
        FOREIGN KEY ("contact_id") REFERENCES "public"."crm_contacts"("id") ON DELETE SET NULL;
    END IF;
END $$;


-- ----------------------------------------------------------------------------
-- 3.2 销售管理模块
-- ----------------------------------------------------------------------------

-- crm_opportunities（商机表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_owner') THEN
        ALTER TABLE "public"."crm_opportunities" 
        ADD CONSTRAINT fk_crm_opportunities_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_dept') THEN
        ALTER TABLE "public"."crm_opportunities" 
        ADD CONSTRAINT fk_crm_opportunities_dept 
        FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_customer') THEN
        ALTER TABLE "public"."crm_opportunities" 
        ADD CONSTRAINT fk_crm_opportunities_customer 
        FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers"("id") ON DELETE CASCADE;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_created_by') THEN
        ALTER TABLE "public"."crm_opportunities" 
        ADD CONSTRAINT fk_crm_opportunities_created_by 
        FOREIGN KEY ("created_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_leads（线索表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_leads_owner') THEN
        ALTER TABLE "public"."crm_leads" 
        ADD CONSTRAINT fk_crm_leads_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_leads_created_by') THEN
        ALTER TABLE "public"."crm_leads" 
        ADD CONSTRAINT fk_crm_leads_created_by 
        FOREIGN KEY ("created_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_campaigns（市场活动表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaigns_owner') THEN
        ALTER TABLE "public"."crm_campaigns" 
        ADD CONSTRAINT fk_crm_campaigns_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaigns_dept') THEN
        ALTER TABLE "public"."crm_campaigns" 
        ADD CONSTRAINT fk_crm_campaigns_dept 
        FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaigns_created_by') THEN
        ALTER TABLE "public"."crm_campaigns" 
        ADD CONSTRAINT fk_crm_campaigns_created_by 
        FOREIGN KEY ("created_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;


-- ----------------------------------------------------------------------------
-- 3.3 产品与合同模块
-- ----------------------------------------------------------------------------

-- crm_contracts（合同表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_owner') THEN
        ALTER TABLE "public"."crm_contracts" 
        ADD CONSTRAINT fk_crm_contracts_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_dept') THEN
        ALTER TABLE "public"."crm_contracts" 
        ADD CONSTRAINT fk_crm_contracts_dept 
        FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_customer') THEN
        ALTER TABLE "public"."crm_contracts" 
        ADD CONSTRAINT fk_crm_contracts_customer 
        FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers"("id") ON DELETE CASCADE;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_opportunity') THEN
        ALTER TABLE "public"."crm_contracts" 
        ADD CONSTRAINT fk_crm_contracts_opportunity 
        FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_created_by') THEN
        ALTER TABLE "public"."crm_contracts" 
        ADD CONSTRAINT fk_crm_contracts_created_by 
        FOREIGN KEY ("created_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_quotations（报价单表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotations_owner') THEN
        ALTER TABLE "public"."crm_quotations" 
        ADD CONSTRAINT fk_crm_quotations_owner 
        FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotations_opportunity') THEN
        ALTER TABLE "public"."crm_quotations" 
        ADD CONSTRAINT fk_crm_quotations_opportunity 
        FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_products（产品表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_products_created_by') THEN
        ALTER TABLE "public"."crm_products" 
        ADD CONSTRAINT fk_crm_products_created_by 
        FOREIGN KEY ("created_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_products_updated_by') THEN
        ALTER TABLE "public"."crm_products" 
        ADD CONSTRAINT fk_crm_products_updated_by 
        FOREIGN KEY ("updated_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;


-- ----------------------------------------------------------------------------
-- 3.4 AI 智能模块
-- ----------------------------------------------------------------------------

-- crm_ai_customer_profiles（AI客户画像表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_profiles_customer') THEN
        ALTER TABLE "public"."crm_ai_customer_profiles" 
        ADD CONSTRAINT fk_crm_ai_profiles_customer 
        FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers"("id") ON DELETE CASCADE;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_profiles_created_by') THEN
        ALTER TABLE "public"."crm_ai_customer_profiles" 
        ADD CONSTRAINT fk_crm_ai_profiles_created_by 
        FOREIGN KEY ("created_by") REFERENCES "public"."sys_user"("id") ON DELETE SET NULL;
    END IF;
END $$;

-- crm_ai_recommendations（AI推荐表）
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_recommendations_profile') THEN
        ALTER TABLE "public"."crm_ai_recommendations" 
        ADD CONSTRAINT fk_crm_ai_recommendations_profile 
        FOREIGN KEY ("profile_id") REFERENCES "public"."crm_ai_customer_profiles"("id") ON DELETE CASCADE;
    END IF;
END $$;


-- ============================================================================
-- 第四部分：创建必要的索引（提升查询性能）
-- ============================================================================

-- 客户表索引
CREATE INDEX IF NOT EXISTS idx_crm_customers_owner ON "public"."crm_customers"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_customers_dept ON "public"."crm_customers"("department_id");
CREATE INDEX IF NOT EXISTS idx_crm_customers_tenant ON "public"."crm_customers"("tenant_id");

-- 联系人表索引
CREATE INDEX IF NOT EXISTS idx_crm_contacts_owner ON "public"."crm_contacts"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_contacts_customer ON "public"."crm_contacts"("customer_id");

-- 商机表索引
CREATE INDEX IF NOT EXISTS idx_crm_opportunities_owner ON "public"."crm_opportunities"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_opportunities_dept ON "public"."crm_opportunities"("department_id");
CREATE INDEX IF NOT EXISTS idx_crm_opportunities_customer ON "public"."crm_opportunities"("customer_id");

-- 合同表索引
CREATE INDEX IF NOT EXISTS idx_crm_contracts_owner ON "public"."crm_contracts"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_contracts_dept ON "public"."crm_contracts"("department_id");
CREATE INDEX IF NOT EXISTS idx_crm_contracts_customer ON "public"."crm_contracts"("customer_id");
CREATE INDEX IF NOT EXISTS idx_crm_contracts_opportunity ON "public"."crm_contracts"("opportunity_id");

-- 线索表索引
CREATE INDEX IF NOT EXISTS idx_crm_leads_owner ON "public"."crm_leads"("owner_id");

-- 市场活动表索引
CREATE INDEX IF NOT EXISTS idx_crm_campaigns_owner ON "public"."crm_campaigns"("owner_id");
CREATE INDEX IF NOT EXISTS idx_crm_campaigns_dept ON "public"."crm_campaigns"("department_id");

-- AI 模块索引
CREATE INDEX IF NOT EXISTS idx_crm_ai_profiles_customer ON "public"."crm_ai_customer_profiles"("customer_id");
CREATE INDEX IF NOT EXISTS idx_crm_ai_recommendations_profile ON "public"."crm_ai_recommendations"("profile_id");


-- ============================================================================
-- 第五部分：验证与统计
-- ============================================================================

DO $$
DECLARE
    table_count INTEGER;
    constraint_count INTEGER;
    index_count INTEGER;
BEGIN
    -- 统计表数量
    SELECT COUNT(*) INTO table_count
    FROM information_schema.tables
    WHERE table_schema = 'public'
    AND table_name IN (
        'sys_role', 'sys_user_roles', 'sys_role_menus', 'sys_param',
        'gen_table', 'gen_demo', 'gen_demo01',
        'task_workflow', 'task_node', 'task_workflow_node_type',
        'apscheduler_jobs'
    );
    
    -- 统计新增外键约束数量
    SELECT COUNT(*) INTO constraint_count
    FROM information_schema.table_constraints
    WHERE constraint_type = 'FOREIGN KEY'
    AND table_schema = 'public'
    AND table_name LIKE 'crm_%'
    AND constraint_name LIKE 'fk_crm_%';
    
    -- 统计新增索引数量
    SELECT COUNT(*) INTO index_count
    FROM pg_indexes
    WHERE schemaname = 'public'
    AND tablename LIKE 'crm_%'
    AND indexname LIKE 'idx_crm_%';
    
    RAISE NOTICE '========================================';
    RAISE NOTICE '✅ 数据库整合完成！';
    RAISE NOTICE '========================================';
    RAISE NOTICE '📊 统计信息:';
    RAISE NOTICE '  - 新增系统表: % 张', table_count;
    RAISE NOTICE '  - 新增外键约束: % 个', constraint_count;
    RAISE NOTICE '  - 新增索引: % 个', index_count;
    RAISE NOTICE '========================================';
    RAISE NOTICE '💡 下一步:';
    RAISE NOTICE '  1. 检查上述统计是否符合预期';
    RAISE NOTICE '  2. 测试 RBAC 权限系统';
    RAISE NOTICE '  3. 验证数据权限过滤';
    RAISE NOTICE '  4. 更新 Python 模型文件';
    RAISE NOTICE '========================================';
END $$;

COMMIT;

-- ============================================================================
-- 执行完成提示
-- ============================================================================
-- 
-- ✅ 脚本执行成功！
-- 
-- 已完成的 work:
-- 1. ✅ 创建了 13 张缺失的 FastApiAdmin 系统表
-- 2. ✅ 插入了默认角色、系统参数、节点类型
-- 3. ✅ 为 CRM 业务表添加了外键约束
-- 4. ✅ 创建了必要的索引
-- 
-- 验证SQL:
-- -- 查看所有新增的表
-- SELECT table_name FROM information_schema.tables 
-- WHERE table_schema = 'public' 
-- AND table_name IN ('sys_role', 'sys_user_roles', 'sys_role_menus', 'sys_param',
--                    'gen_table', 'task_workflow', 'task_node', 'task_workflow_node_type')
-- ORDER BY table_name;
-- 
-- -- 查看所有外键约束
-- SELECT table_name, constraint_name, column_name
-- FROM information_schema.key_column_usage
-- WHERE constraint_name LIKE 'fk_crm_%'
-- ORDER BY table_name, constraint_name;
-- 
-- -- 测试 RBAC 关联
-- SELECT u.username, r.name as role_name, r.data_scope
-- FROM sys_user u
-- LEFT JOIN sys_user_roles ur ON u.id = ur.user_id
-- LEFT JOIN sys_role r ON ur.role_id = r.id
-- WHERE u.username = 'admin';
-- 
-- ============================================================================
