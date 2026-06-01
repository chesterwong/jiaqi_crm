-- =============================================
-- 小鹅通联系表 crm_xiaoe_contacts
-- 说明: docs/database/crm_xiaoe_contacts-建表说明.md
-- =============================================

SET search_path TO public;

BEGIN;

DROP SEQUENCE IF EXISTS crm_xiaoe_contacts_id_seq CASCADE;
CREATE SEQUENCE crm_xiaoe_contacts_id_seq
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 2147483647
    START 1
    CACHE 1;

CREATE TABLE IF NOT EXISTS crm_xiaoe_contacts (
    id int4 NOT NULL DEFAULT nextval('crm_xiaoe_contacts_id_seq'::regclass),
    serial_no int4,
    username varchar(100),
    phone varchar(50),
    xiaoe_updated_at timestamp(6),
    created_id int4,
    updated_id int4,
    created_time timestamp(6) DEFAULT now(),
    updated_time timestamp(6) DEFAULT CURRENT_TIMESTAMP,
    is_deleted bool NOT NULL DEFAULT false,
    deleted_time timestamp(6),
    deleted_id int4,
    uuid varchar(64) NOT NULL DEFAULT (gen_random_uuid())::text,
    description text,
    dept_id int4
);

COMMENT ON TABLE crm_xiaoe_contacts IS '小鹅通联系表';
COMMENT ON COLUMN crm_xiaoe_contacts.id IS '主键ID（自增）';
COMMENT ON COLUMN crm_xiaoe_contacts.serial_no IS '序号（台账/导入行号）';
COMMENT ON COLUMN crm_xiaoe_contacts.username IS '用户名';
COMMENT ON COLUMN crm_xiaoe_contacts.phone IS '手机号';
COMMENT ON COLUMN crm_xiaoe_contacts.xiaoe_updated_at IS '更新时间（小鹅通侧）';
COMMENT ON COLUMN crm_xiaoe_contacts.created_id IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN crm_xiaoe_contacts.updated_id IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN crm_xiaoe_contacts.created_time IS '创建时间';
COMMENT ON COLUMN crm_xiaoe_contacts.updated_time IS '记录更新时间（系统）';
COMMENT ON COLUMN crm_xiaoe_contacts.is_deleted IS '是否已删除';
COMMENT ON COLUMN crm_xiaoe_contacts.deleted_time IS '删除时间';
COMMENT ON COLUMN crm_xiaoe_contacts.deleted_id IS '删除人ID';
COMMENT ON COLUMN crm_xiaoe_contacts.uuid IS 'UUID全局唯一标识';
COMMENT ON COLUMN crm_xiaoe_contacts.description IS '备注/描述';
COMMENT ON COLUMN crm_xiaoe_contacts.dept_id IS '所属部门ID(关联sys_dept.id)';

CREATE INDEX IF NOT EXISTS idx_crm_xiaoe_contacts_phone ON crm_xiaoe_contacts (phone);
CREATE INDEX IF NOT EXISTS idx_crm_xiaoe_contacts_username ON crm_xiaoe_contacts (username);
CREATE INDEX IF NOT EXISTS idx_crm_xiaoe_contacts_xiaoe_updated_at ON crm_xiaoe_contacts (xiaoe_updated_at);

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'crm_xiaoe_contacts_pkey'
    ) THEN
        ALTER TABLE crm_xiaoe_contacts
            ADD CONSTRAINT crm_xiaoe_contacts_pkey PRIMARY KEY (id);
    END IF;
END $$;

COMMIT;
