-- ============================================================================
-- CRM 数据库完整完善脚本（最终版）
-- 执行方式: docker exec -i postgres psql -U crm_user -d crm < 此文件
-- ============================================================================

BEGIN;

-- ============================================================================
-- 第一部分：创建缺失的系统表
-- ============================================================================

-- 1. gen_table（代码生成主表）
CREATE TABLE IF NOT EXISTS gen_table (
    id SERIAL PRIMARY KEY,
    uuid VARCHAR(64) NOT NULL UNIQUE,
    table_name VARCHAR(100) NOT NULL UNIQUE,
    table_comment VARCHAR(200),
    class_name VARCHAR(100),
    tpl_category VARCHAR(20) DEFAULT 'crud',
    package_name VARCHAR(100),
    module_name VARCHAR(100),
    business_name VARCHAR(100),
    function_name VARCHAR(100),
    function_author VARCHAR(50),
    options TEXT,
    status VARCHAR(10) DEFAULT '0',
    created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    deleted_time TIMESTAMP,
    created_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
    updated_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
    deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL
);

COMMENT ON TABLE gen_table IS '代码生成业务表';

-- 2. task_workflow（工作流定义表）
CREATE TABLE IF NOT EXISTS task_workflow (
    id SERIAL PRIMARY KEY,
    uuid VARCHAR(64) NOT NULL UNIQUE,
    workflow_name VARCHAR(100) NOT NULL,
    workflow_code VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    status VARCHAR(10) DEFAULT '0',
    version INTEGER DEFAULT 1,
    created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    deleted_time TIMESTAMP,
    created_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
    updated_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
    deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL
);

COMMENT ON TABLE task_workflow IS '工作流定义表';
CREATE INDEX IF NOT EXISTS idx_task_workflow_code ON task_workflow(workflow_code);

-- 3. task_node（工作流节点表）
CREATE TABLE IF NOT EXISTS task_node (
    id SERIAL PRIMARY KEY,
    uuid VARCHAR(64) NOT NULL UNIQUE,
    workflow_id INTEGER NOT NULL REFERENCES task_workflow(id) ON DELETE CASCADE,
    node_name VARCHAR(100) NOT NULL,
    node_type VARCHAR(20) NOT NULL,
    node_code VARCHAR(50),
    sort INTEGER DEFAULT 0,
    config TEXT,
    status VARCHAR(10) DEFAULT '0',
    created_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_deleted BOOLEAN NOT NULL DEFAULT FALSE,
    deleted_time TIMESTAMP,
    created_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
    updated_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL,
    deleted_id INTEGER REFERENCES sys_user(id) ON DELETE SET NULL
);

COMMENT ON TABLE task_node IS '工作流节点表';
CREATE INDEX IF NOT EXISTS idx_task_node_workflow_id ON task_node(workflow_id);


-- ============================================================================
-- 第二部分：添加外键约束（自动生成的 DO $$ 块）
-- ============================================================================

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_owner') THEN
        ALTER TABLE crm_customers ADD CONSTRAINT fk_crm_customers_owner
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_dept') THEN
        ALTER TABLE crm_customers ADD CONSTRAINT fk_crm_customers_dept
        FOREIGN KEY (department_id) REFERENCES sys_dept(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_created_by') THEN
        ALTER TABLE crm_customers ADD CONSTRAINT fk_crm_customers_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_updated_by') THEN
        ALTER TABLE crm_customers ADD CONSTRAINT fk_crm_customers_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contacts_customer') THEN
        ALTER TABLE crm_contacts ADD CONSTRAINT fk_crm_contacts_customer
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE CASCADE;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_owner') THEN
        ALTER TABLE crm_followups ADD CONSTRAINT fk_crm_followups_owner
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_customer') THEN
        ALTER TABLE crm_followups ADD CONSTRAINT fk_crm_followups_customer
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE CASCADE;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_owner') THEN
        ALTER TABLE crm_opportunities ADD CONSTRAINT fk_crm_opportunities_owner
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_dept') THEN
        ALTER TABLE crm_opportunities ADD CONSTRAINT fk_crm_opportunities_dept
        FOREIGN KEY (department_id) REFERENCES sys_dept(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_customer') THEN
        ALTER TABLE crm_opportunities ADD CONSTRAINT fk_crm_opportunities_customer
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE CASCADE;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_created_by') THEN
        ALTER TABLE crm_opportunities ADD CONSTRAINT fk_crm_opportunities_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_leads_owner') THEN
        ALTER TABLE crm_leads ADD CONSTRAINT fk_crm_leads_owner
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_leads_created_by') THEN
        ALTER TABLE crm_leads ADD CONSTRAINT fk_crm_leads_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaigns_owner') THEN
        ALTER TABLE crm_campaigns ADD CONSTRAINT fk_crm_campaigns_owner
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaigns_dept') THEN
        ALTER TABLE crm_campaigns ADD CONSTRAINT fk_crm_campaigns_dept
        FOREIGN KEY (department_id) REFERENCES sys_dept(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaigns_created_by') THEN
        ALTER TABLE crm_campaigns ADD CONSTRAINT fk_crm_campaigns_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_owner') THEN
        ALTER TABLE crm_contracts ADD CONSTRAINT fk_crm_contracts_owner
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_dept') THEN
        ALTER TABLE crm_contracts ADD CONSTRAINT fk_crm_contracts_dept
        FOREIGN KEY (department_id) REFERENCES sys_dept(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_customer') THEN
        ALTER TABLE crm_contracts ADD CONSTRAINT fk_crm_contracts_customer
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE CASCADE;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_opportunity') THEN
        ALTER TABLE crm_contracts ADD CONSTRAINT fk_crm_contracts_opportunity
        FOREIGN KEY (opportunity_id) REFERENCES crm_opportunities(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_created_by') THEN
        ALTER TABLE crm_contracts ADD CONSTRAINT fk_crm_contracts_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_products_created_by') THEN
        ALTER TABLE crm_products ADD CONSTRAINT fk_crm_products_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_products_updated_by') THEN
        ALTER TABLE crm_products ADD CONSTRAINT fk_crm_products_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;


-- ============================================================================
-- 第三部分：创建索引
-- ============================================================================

CREATE INDEX IF NOT EXISTS idx_crm_customers_owner ON crm_customers(owner_id);
CREATE INDEX IF NOT EXISTS idx_crm_customers_dept ON crm_customers(department_id);
CREATE INDEX IF NOT EXISTS idx_crm_contacts_customer ON crm_contacts(customer_id);
CREATE INDEX IF NOT EXISTS idx_crm_opportunities_owner ON crm_opportunities(owner_id);
CREATE INDEX IF NOT EXISTS idx_crm_opportunities_dept ON crm_opportunities(department_id);
CREATE INDEX IF NOT EXISTS idx_crm_opportunities_customer ON crm_opportunities(customer_id);
CREATE INDEX IF NOT EXISTS idx_crm_contracts_owner ON crm_contracts(owner_id);
CREATE INDEX IF NOT EXISTS idx_crm_contracts_dept ON crm_contracts(department_id);
CREATE INDEX IF NOT EXISTS idx_crm_contracts_customer ON crm_contracts(customer_id);
CREATE INDEX IF NOT EXISTS idx_crm_contracts_opportunity ON crm_contracts(opportunity_id);
CREATE INDEX IF NOT EXISTS idx_crm_leads_owner ON crm_leads(owner_id);
CREATE INDEX IF NOT EXISTS idx_crm_campaigns_owner ON crm_campaigns(owner_id);
CREATE INDEX IF NOT EXISTS idx_crm_campaigns_dept ON crm_campaigns(department_id);


-- ============================================================================
-- 第四部分：验证统计
-- ============================================================================

DO $$
DECLARE
    system_tables INTEGER;
    fk_count INTEGER;
    index_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO system_tables
    FROM information_schema.tables
    WHERE table_schema = 'public'
    AND (table_name LIKE 'sys_%' OR table_name LIKE 'gen_%' OR table_name LIKE 'task_%');
    
    SELECT COUNT(*) INTO fk_count
    FROM information_schema.table_constraints
    WHERE constraint_type = 'FOREIGN KEY'
    AND table_schema = 'public'
    AND table_name LIKE 'crm_%';
    
    SELECT COUNT(*) INTO index_count
    FROM pg_indexes
    WHERE schemaname = 'public'
    AND tablename LIKE 'crm_%'
    AND indexname LIKE 'idx_crm_%';
    
    RAISE NOTICE '========================================';
    RAISE NOTICE 'CRM 数据库完善完成！';
    RAISE NOTICE '========================================';
    RAISE NOTICE '系统表数量: % 张', system_tables;
    RAISE NOTICE 'CRM 外键约束: % 个', fk_count;
    RAISE NOTICE 'CRM 索引: % 个', index_count;
    RAISE NOTICE '========================================';
END $$;

COMMIT;
