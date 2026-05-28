-- 自动生成的外键约束 SQL
-- 只包含列存在的外键

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

-- SKIP: crm_contacts.owner_id 列不存在
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contacts_customer') THEN
        ALTER TABLE crm_contacts ADD CONSTRAINT fk_crm_contacts_customer
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contacts_created_by') THEN
        ALTER TABLE crm_contacts ADD CONSTRAINT fk_crm_contacts_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

-- SKIP: crm_followups.owner_id 列不存在
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_customer') THEN
        ALTER TABLE crm_followups ADD CONSTRAINT fk_crm_followups_customer
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_owner') THEN
        ALTER TABLE crm_opportunities ADD CONSTRAINT fk_crm_opportunities_owner
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

-- SKIP: crm_opportunities.department_id 列不存在
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_customer') THEN
        ALTER TABLE crm_opportunities ADD CONSTRAINT fk_crm_opportunities_customer
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
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

-- SKIP: crm_contracts.department_id 列不存在
DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_customer') THEN
        ALTER TABLE crm_contracts ADD CONSTRAINT fk_crm_contracts_customer
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
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

