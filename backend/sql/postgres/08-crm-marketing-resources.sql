-- =============================================
-- 营销资源台账 crm_marketing_resources
-- 说明: docs/database/crm_marketing_resources-建表说明.md
-- =============================================

SET search_path TO public;

BEGIN;

DROP SEQUENCE IF EXISTS crm_marketing_resources_id_seq CASCADE;
CREATE SEQUENCE crm_marketing_resources_id_seq
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 2147483647
    START 1
    CACHE 1;

CREATE TABLE IF NOT EXISTS crm_marketing_resources (
    id int4 NOT NULL DEFAULT nextval('crm_marketing_resources_id_seq'::regclass),
    serial_no int4,
    month_period varchar(7),
    resource_acquired_at timestamp(6),
    contact_name varchar(100),
    phone varchar(50),
    xiaoe_duplicate_check varchar(200),
    resource_source varchar(100),
    resource_path text,
    owner_id int4,
    lead_question text,
    is_wechat_added bool,
    real_name varchar(100),
    has_industry_background bool,
    trades_etf bool,
    trades_hk_us_stocks bool,
    trades_commodity_futures bool,
    trading_capital varchar(100),
    customer_profile text,
    customer_demand text,
    planned_recommendation text,
    is_deal_closed bool,
    deal_amount numeric(15, 2),
    wechat_id varchar(100),
    other_contact text,
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

COMMENT ON TABLE crm_marketing_resources IS '营销资源台账';
COMMENT ON COLUMN crm_marketing_resources.id IS '主键ID（自增）';
COMMENT ON COLUMN crm_marketing_resources.serial_no IS '序号（台账/导入行号）';
COMMENT ON COLUMN crm_marketing_resources.month_period IS '月份（YYYY-MM）';
COMMENT ON COLUMN crm_marketing_resources.resource_acquired_at IS '资源获取时间';
COMMENT ON COLUMN crm_marketing_resources.contact_name IS '姓名';
COMMENT ON COLUMN crm_marketing_resources.phone IS '手机号';
COMMENT ON COLUMN crm_marketing_resources.xiaoe_duplicate_check IS '小鹅通查重';
COMMENT ON COLUMN crm_marketing_resources.resource_source IS '资源来源';
COMMENT ON COLUMN crm_marketing_resources.resource_path IS '资源路径/地址';
COMMENT ON COLUMN crm_marketing_resources.owner_id IS '归属（关联sys_user.id）';
COMMENT ON COLUMN crm_marketing_resources.lead_question IS '留资问题';
COMMENT ON COLUMN crm_marketing_resources.is_wechat_added IS '是否加V（true是/false否/NULL未知）';
COMMENT ON COLUMN crm_marketing_resources.real_name IS '真实姓名';
COMMENT ON COLUMN crm_marketing_resources.has_industry_background IS '是否有产业背景';
COMMENT ON COLUMN crm_marketing_resources.trades_etf IS '是否交易ETF';
COMMENT ON COLUMN crm_marketing_resources.trades_hk_us_stocks IS '是否交易港美股';
COMMENT ON COLUMN crm_marketing_resources.trades_commodity_futures IS '是否交易商品期货';
COMMENT ON COLUMN crm_marketing_resources.trading_capital IS '交易资金';
COMMENT ON COLUMN crm_marketing_resources.customer_profile IS '客户基本情况';
COMMENT ON COLUMN crm_marketing_resources.customer_demand IS '客户需求';
COMMENT ON COLUMN crm_marketing_resources.planned_recommendation IS '计划推荐';
COMMENT ON COLUMN crm_marketing_resources.is_deal_closed IS '是否成交（true已成交/false未成交/NULL未确认）';
COMMENT ON COLUMN crm_marketing_resources.deal_amount IS '成交金额（元）';
COMMENT ON COLUMN crm_marketing_resources.wechat_id IS '微信号';
COMMENT ON COLUMN crm_marketing_resources.other_contact IS '其他联系方式';
COMMENT ON COLUMN crm_marketing_resources.created_id IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN crm_marketing_resources.updated_id IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN crm_marketing_resources.created_time IS '创建时间';
COMMENT ON COLUMN crm_marketing_resources.updated_time IS '更新时间';
COMMENT ON COLUMN crm_marketing_resources.is_deleted IS '是否已删除';
COMMENT ON COLUMN crm_marketing_resources.deleted_time IS '删除时间';
COMMENT ON COLUMN crm_marketing_resources.deleted_id IS '删除人ID';
COMMENT ON COLUMN crm_marketing_resources.uuid IS 'UUID全局唯一标识';
COMMENT ON COLUMN crm_marketing_resources.description IS '备注/描述';
COMMENT ON COLUMN crm_marketing_resources.dept_id IS '所属部门ID(关联sys_dept.id)';

CREATE INDEX IF NOT EXISTS idx_crm_marketing_resources_phone ON crm_marketing_resources (phone);
CREATE INDEX IF NOT EXISTS idx_crm_marketing_resources_month ON crm_marketing_resources (month_period);
CREATE INDEX IF NOT EXISTS idx_crm_marketing_resources_acquired_at ON crm_marketing_resources (resource_acquired_at);
CREATE INDEX IF NOT EXISTS idx_crm_marketing_resources_source ON crm_marketing_resources (resource_source);
CREATE INDEX IF NOT EXISTS idx_crm_marketing_resources_owner_id ON crm_marketing_resources (owner_id);
CREATE INDEX IF NOT EXISTS idx_crm_marketing_resources_dept_id ON crm_marketing_resources (dept_id);
CREATE INDEX IF NOT EXISTS idx_crm_marketing_resources_deleted ON crm_marketing_resources (is_deleted, deleted_time);

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'crm_marketing_resources_pkey'
    ) THEN
        ALTER TABLE crm_marketing_resources
            ADD CONSTRAINT crm_marketing_resources_pkey PRIMARY KEY (id);
    END IF;
END $$;

COMMIT;
