-- =============================================
-- CRM Business Tables - Pure CREATE TABLE + COMMENT + INDEX
-- No foreign key constraints (see crm_tables_fk.sql)
-- =============================================

SET search_path TO public;

BEGIN;

-- =============================================
-- CRM Business Tables
-- Extracted from: crm-public-4-26-1701.sql
-- Table count: 75
-- =============================================
-- ----------------------------
-- Table: crm_ai_customer_profiles
-- ----------------------------
CREATE TABLE "crm_ai_customer_profiles" (
  "id" int4 NOT NULL DEFAULT nextval('crm_ai_customer_profiles_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "overall_score" int4,
  "purchase_power" varchar(20) COLLATE "pg_catalog"."default",
  "decision_speed" varchar(20) COLLATE "pg_catalog"."default",
  "tags" json,
  "interests" json,
  "pain_points" json,
  "engagement_level" varchar(20) COLLATE "pg_catalog"."default",
  "preferred_contact_method" varchar(50) COLLATE "pg_catalog"."default",
  "best_contact_time" varchar(50) COLLATE "pg_catalog"."default",
  "churn_risk" varchar(20) COLLATE "pg_catalog"."default",
  "upsell_probability" int4,
  "next_best_action" varchar(200) COLLATE "pg_catalog"."default",
  "summary" text COLLATE "pg_catalog"."default",
  "generated_at" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_ai_customer_profiles"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_ai_customer_profiles"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_ai_customer_profiles"."overall_score" IS '综合评分';
COMMENT ON COLUMN "crm_ai_customer_profiles"."purchase_power" IS '购买力评分';
COMMENT ON COLUMN "crm_ai_customer_profiles"."decision_speed" IS '决策速度评分';
COMMENT ON COLUMN "crm_ai_customer_profiles"."tags" IS '标签';
COMMENT ON COLUMN "crm_ai_customer_profiles"."interests" IS '兴趣标签';
COMMENT ON COLUMN "crm_ai_customer_profiles"."pain_points" IS '痛点分析';
COMMENT ON COLUMN "crm_ai_customer_profiles"."engagement_level" IS '参与度等级';
COMMENT ON COLUMN "crm_ai_customer_profiles"."preferred_contact_method" IS '首选联系方式';
COMMENT ON COLUMN "crm_ai_customer_profiles"."best_contact_time" IS '最佳联系时间';
COMMENT ON COLUMN "crm_ai_customer_profiles"."churn_risk" IS '流失风险等级';
COMMENT ON COLUMN "crm_ai_customer_profiles"."upsell_probability" IS '增购概率';
COMMENT ON COLUMN "crm_ai_customer_profiles"."next_best_action" IS '下一步最佳行动';
COMMENT ON COLUMN "crm_ai_customer_profiles"."summary" IS '摘要';
COMMENT ON COLUMN "crm_ai_customer_profiles"."generated_at" IS '生成时间';
COMMENT ON COLUMN "crm_ai_customer_profiles"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_ai_customer_profiles"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_ai_customer_profiles"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_ai_customer_profiles"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_ai_customer_profiles"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_ai_customer_profiles"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_ai_customer_profiles"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_ai_customer_profiles"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_ai_customer_profiles"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_ai_customer_profiles"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_ai_customer_profiles"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_ai_customer_profiles" IS 'Ai Customer Profiles';
-- ----------------------------
-- Records of crm_ai_customer_profiles
-- ----------------------------
-- ----------------------------
-- Table structure for crm_ai_recommendations
-- ----------------------------
-- ----------------------------
-- Table: crm_ai_recommendations
-- ----------------------------
CREATE TABLE "crm_ai_recommendations" (
  "id" int4 NOT NULL DEFAULT nextval('crm_ai_recommendations_id_seq'::regclass),
  "entity_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "entity_id" int4 NOT NULL,
  "recommendation_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "recommendation_content" json NOT NULL,
  "ai_model" varchar(50) COLLATE "pg_catalog"."default",
  "confidence" numeric(5,2),
  "reasoning" text COLLATE "pg_catalog"."default",
  "user_feedback" varchar(20) COLLATE "pg_catalog"."default",
  "feedback_at" timestamp(6),
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_ai_recommendations"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_ai_recommendations"."entity_type" IS '实体类型';
COMMENT ON COLUMN "crm_ai_recommendations"."entity_id" IS '实体ID';
COMMENT ON COLUMN "crm_ai_recommendations"."recommendation_type" IS '推荐类型';
COMMENT ON COLUMN "crm_ai_recommendations"."recommendation_content" IS '推荐内容';
COMMENT ON COLUMN "crm_ai_recommendations"."ai_model" IS 'AI模型';
COMMENT ON COLUMN "crm_ai_recommendations"."confidence" IS '置信度';
COMMENT ON COLUMN "crm_ai_recommendations"."reasoning" IS '推理依据';
COMMENT ON COLUMN "crm_ai_recommendations"."user_feedback" IS '用户反馈';
COMMENT ON COLUMN "crm_ai_recommendations"."feedback_at" IS '反馈时间';
COMMENT ON COLUMN "crm_ai_recommendations"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_ai_recommendations"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_ai_recommendations"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_ai_recommendations"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_ai_recommendations"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_ai_recommendations"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_ai_recommendations"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_ai_recommendations"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_ai_recommendations"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_ai_recommendations"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_ai_recommendations"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_ai_recommendations" IS 'Ai Recommendations';
-- ----------------------------
-- Records of crm_ai_recommendations
-- ----------------------------
-- ----------------------------
-- Table structure for crm_ai_tags
-- ----------------------------
-- ----------------------------
-- Table: crm_ai_tags
-- ----------------------------
CREATE TABLE "crm_ai_tags" (
  "id" int4 NOT NULL DEFAULT nextval('crm_ai_tags_id_seq'::regclass),
  "tag_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "tag_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "ai_model" varchar(50) COLLATE "pg_catalog"."default",
  "ai_prompt" text COLLATE "pg_catalog"."default",
  "confidence_threshold" numeric(5,2) DEFAULT 0.80,
  "applicable_entities" json,
  "usage_count" int4 DEFAULT 0,
  "accuracy_rate" numeric(5,2),
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_ai_tags"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_ai_tags"."tag_code" IS '标签编号';
COMMENT ON COLUMN "crm_ai_tags"."tag_name" IS '标签名称';
COMMENT ON COLUMN "crm_ai_tags"."ai_model" IS 'AI模型';
COMMENT ON COLUMN "crm_ai_tags"."ai_prompt" IS 'AI提示词';
COMMENT ON COLUMN "crm_ai_tags"."confidence_threshold" IS '置信度阈值';
COMMENT ON COLUMN "crm_ai_tags"."applicable_entities" IS '适用实体';
COMMENT ON COLUMN "crm_ai_tags"."usage_count" IS '使用次数';
COMMENT ON COLUMN "crm_ai_tags"."accuracy_rate" IS '准确率比率';
COMMENT ON COLUMN "crm_ai_tags"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_ai_tags"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_ai_tags"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_ai_tags"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_ai_tags"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_ai_tags"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_ai_tags"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_ai_tags"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_ai_tags"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_ai_tags"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_ai_tags"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_ai_tags"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_ai_tags" IS 'Ai Tags';
-- ----------------------------
-- Records of crm_ai_tags
-- ----------------------------
-- ----------------------------
-- Table structure for crm_alert_rules
-- ----------------------------
-- ----------------------------
-- Table: crm_alert_rules
-- ----------------------------
CREATE TABLE "crm_alert_rules" (
  "id" int4 NOT NULL DEFAULT nextval('crm_alert_rules_id_seq'::regclass),
  "rule_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "rule_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "alert_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_condition" text COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_frequency" varchar(30) COLLATE "pg_catalog"."default" DEFAULT 'once'::character varying,
  "severity" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'medium'::character varying,
  "is_active" bool DEFAULT true,
  "notify_channels" text COLLATE "pg_catalog"."default",
  "notify_users" text COLLATE "pg_catalog"."default",
  "notify_roles" text COLLATE "pg_catalog"."default",
  "template_id" int4,
  "escalation_rule" text COLLATE "pg_catalog"."default",
  "suppress_hours" int4,
  "description" text COLLATE "pg_catalog"."default",
  "sort_order" int4 DEFAULT 0,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" DEFAULT (gen_random_uuid())::text,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4,
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_alert_rules"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_alert_rules"."rule_name" IS '规则名称';
COMMENT ON COLUMN "crm_alert_rules"."rule_code" IS '规则编码';
COMMENT ON COLUMN "crm_alert_rules"."alert_type" IS '预警类型(contract_expire/customer_churn/overdue_followup/health_decline/opportunity_stuck/other)';
COMMENT ON COLUMN "crm_alert_rules"."trigger_condition" IS '触发条件(JSON表达式或SQL)';
COMMENT ON COLUMN "crm_alert_rules"."trigger_frequency" IS '触发频率(once/daily/hourly/realtime)';
COMMENT ON COLUMN "crm_alert_rules"."severity" IS '严重程度(critical/high/medium/low)';
COMMENT ON COLUMN "crm_alert_rules"."is_active" IS '是否启用';
COMMENT ON COLUMN "crm_alert_rules"."notify_channels" IS '通知渠道(JSON数组:system/email/sms/wechat)';
COMMENT ON COLUMN "crm_alert_rules"."notify_users" IS '通知用户ID列表(JSON)';
COMMENT ON COLUMN "crm_alert_rules"."notify_roles" IS '通知角色列表(JSON)';
COMMENT ON COLUMN "crm_alert_rules"."template_id" IS '通知模板ID';
COMMENT ON COLUMN "crm_alert_rules"."escalation_rule" IS '升级规则(JSON)';
COMMENT ON COLUMN "crm_alert_rules"."suppress_hours" IS '静默期(小时)';
COMMENT ON COLUMN "crm_alert_rules"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_alert_rules"."sort_order" IS '排序号';
COMMENT ON COLUMN "crm_alert_rules"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_alert_rules"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_alert_rules"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_alert_rules"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_alert_rules"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_alert_rules"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_alert_rules"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_alert_rules"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_alert_rules"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_alert_rules"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_alert_rules" IS '预警规则配置表';
-- ----------------------------
-- Records of crm_alert_rules
-- ----------------------------
-- ----------------------------
-- Table structure for crm_approval_records
-- ----------------------------
-- ----------------------------
-- Table: crm_approval_records
-- ----------------------------
CREATE TABLE "crm_approval_records" (
  "id" int4 NOT NULL DEFAULT nextval('crm_approval_records_id_seq'::regclass),
  "approval_no" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "approval_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "related_table" varchar(50) COLLATE "pg_catalog"."default",
  "related_id" int4,
  "title" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "applicant_id" int4 NOT NULL,
  "applicant_dept_id" int4,
  "approval_status" varchar(30) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "current_approver_id" int4,
  "current_step" int4 DEFAULT 1,
  "total_steps" int4,
  "priority" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'normal'::character varying,
  "deadline" timestamp(6),
  "approved_time" timestamp(6),
  "approval_notes" text COLLATE "pg_catalog"."default",
  "rejection_reason" text COLLATE "pg_catalog"."default",
  "cc_users" text COLLATE "pg_catalog"."default",
  "uuid" varchar(64) COLLATE "pg_catalog"."default" DEFAULT (gen_random_uuid())::text,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4,
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_approval_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_approval_records"."approval_no" IS '审批编号(格式:APP-YYYYMMDD-XXXX)';
COMMENT ON COLUMN "crm_approval_records"."approval_type" IS '审批类型(contract/quotation/discount/expense/other)';
COMMENT ON COLUMN "crm_approval_records"."related_table" IS '关联表名(如crm_contracts/crm_quotations)';
COMMENT ON COLUMN "crm_approval_records"."related_id" IS '关联记录ID';
COMMENT ON COLUMN "crm_approval_records"."title" IS '审批标题';
COMMENT ON COLUMN "crm_approval_records"."description" IS '审批说明';
COMMENT ON COLUMN "crm_approval_records"."applicant_id" IS '申请人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_approval_records"."applicant_dept_id" IS '申请人部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_approval_records"."approval_status" IS '审批状态(pending/approving/approved/rejected/cancelled)';
COMMENT ON COLUMN "crm_approval_records"."current_approver_id" IS '当前审批人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_approval_records"."current_step" IS '当前审批步骤';
COMMENT ON COLUMN "crm_approval_records"."total_steps" IS '总审批步骤';
COMMENT ON COLUMN "crm_approval_records"."priority" IS '审批优先级(normal/urgent)';
COMMENT ON COLUMN "crm_approval_records"."deadline" IS '审批截止时间';
COMMENT ON COLUMN "crm_approval_records"."approved_time" IS '审批通过时间';
COMMENT ON COLUMN "crm_approval_records"."approval_notes" IS '审批备注';
COMMENT ON COLUMN "crm_approval_records"."rejection_reason" IS '拒绝原因';
COMMENT ON COLUMN "crm_approval_records"."cc_users" IS '抄送用户ID列表(JSON)';
COMMENT ON COLUMN "crm_approval_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_approval_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_approval_records"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_approval_records"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_approval_records"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_approval_records"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_approval_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_approval_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_approval_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_approval_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_approval_records" IS '审批记录表';
-- ----------------------------
-- Records of crm_approval_records
-- ----------------------------
-- ----------------------------
-- Table structure for crm_call_records
-- ----------------------------
-- ----------------------------
-- Table: crm_call_records
-- ----------------------------
CREATE TABLE "crm_call_records" (
  "id" int4 NOT NULL DEFAULT nextval('crm_call_records_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "contact_id" int4,
  "call_type" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "direction" varchar(20) COLLATE "pg_catalog"."default",
  "phone_number" varchar(50) COLLATE "pg_catalog"."default",
  "duration_seconds" int4,
  "call_time" timestamp(6) NOT NULL,
  "summary" text COLLATE "pg_catalog"."default",
  "follow_up_action" varchar(500) COLLATE "pg_catalog"."default",
  "follow_up_time" timestamp(6),
  "sentiment" varchar(20) COLLATE "pg_catalog"."default",
  "quality_score" int4,
  "is_recorded" bool DEFAULT false,
  "recording_url" varchar(500) COLLATE "pg_catalog"."default",
  "uuid" varchar(64) COLLATE "pg_catalog"."default" DEFAULT (gen_random_uuid())::text,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4,
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_call_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_call_records"."customer_id" IS '客户ID(关联crm_customers.id)';
COMMENT ON COLUMN "crm_call_records"."contact_id" IS '联系人ID(关联crm_contacts.id)';
COMMENT ON COLUMN "crm_call_records"."call_type" IS '通话类型(sales_followup/after_sales/negotiation/other)';
COMMENT ON COLUMN "crm_call_records"."direction" IS '通话方向(inbound:呼入/outbound:呼出)';
COMMENT ON COLUMN "crm_call_records"."phone_number" IS '通话号码';
COMMENT ON COLUMN "crm_call_records"."duration_seconds" IS '通话时长(秒)';
COMMENT ON COLUMN "crm_call_records"."call_time" IS '通话时间';
COMMENT ON COLUMN "crm_call_records"."summary" IS '通话摘要';
COMMENT ON COLUMN "crm_call_records"."follow_up_action" IS '后续跟进动作';
COMMENT ON COLUMN "crm_call_records"."follow_up_time" IS '计划跟进时间';
COMMENT ON COLUMN "crm_call_records"."sentiment" IS '客户情绪(positive/neutral/negative)';
COMMENT ON COLUMN "crm_call_records"."quality_score" IS '通话质量评分';
COMMENT ON COLUMN "crm_call_records"."is_recorded" IS '是否录音';
COMMENT ON COLUMN "crm_call_records"."recording_url" IS '录音文件URL';
COMMENT ON COLUMN "crm_call_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_call_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_call_records"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_call_records"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_call_records"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_call_records"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_call_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_call_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_call_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_call_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_call_records" IS '通话记录表';
-- ----------------------------
-- Records of crm_call_records
-- ----------------------------
-- ----------------------------
-- Table structure for crm_campaign_leads
-- ----------------------------
-- ----------------------------
-- Table: crm_campaign_leads
-- ----------------------------
CREATE TABLE "crm_campaign_leads" (
  "id" int8 NOT NULL DEFAULT nextval('crm_campaign_leads_id_seq'::regclass),
  "campaign_id" int8 NOT NULL,
  "lead_id" int8 NOT NULL,
  "participation_type" varchar(30) COLLATE "pg_catalog"."default",
  "registration_date" date,
  "attendance_status" varchar(20) COLLATE "pg_catalog"."default",
  "lead_source_detail" varchar(100) COLLATE "pg_catalog"."default",
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "is_converted" bool DEFAULT false,
  "converted_customer_id" int8,
  "interaction_count" int4 DEFAULT 0,
  "engagement_score" numeric(5,2),
  "remark" text COLLATE "pg_catalog"."default",
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "created_id" int8,
  "updated_id" int8,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_campaign_leads"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_campaign_leads"."campaign_id" IS '活动ID';
COMMENT ON COLUMN "crm_campaign_leads"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "crm_campaign_leads"."participation_type" IS '参与类型';
COMMENT ON COLUMN "crm_campaign_leads"."registration_date" IS '注册日期';
COMMENT ON COLUMN "crm_campaign_leads"."attendance_status" IS '出席状态';
COMMENT ON COLUMN "crm_campaign_leads"."lead_source_detail" IS '线索来源详情';
COMMENT ON COLUMN "crm_campaign_leads"."channel" IS '渠道';
COMMENT ON COLUMN "crm_campaign_leads"."is_converted" IS '是否已转化';
COMMENT ON COLUMN "crm_campaign_leads"."converted_customer_id" IS '转化后客户ID';
COMMENT ON COLUMN "crm_campaign_leads"."interaction_count" IS '互动次数';
COMMENT ON COLUMN "crm_campaign_leads"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "crm_campaign_leads"."remark" IS '备注';
COMMENT ON COLUMN "crm_campaign_leads"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_campaign_leads"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_campaign_leads"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_campaign_leads"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_campaign_leads"."version" IS '版本号';
COMMENT ON COLUMN "crm_campaign_leads"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_campaign_leads"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_campaign_leads"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_campaign_leads"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_campaign_leads"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_campaign_leads"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_campaign_leads"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_campaign_leads" IS 'Campaign Leads';
-- ----------------------------
-- Records of crm_campaign_leads
-- ----------------------------
-- ----------------------------
-- Table structure for crm_campaigns
-- ----------------------------
-- ----------------------------
-- Table: crm_campaigns
-- ----------------------------
CREATE TABLE "crm_campaigns" (
  "id" int8 NOT NULL DEFAULT nextval('crm_campaigns_id_seq'::regclass),
  "campaign_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "campaign_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "campaign_type" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "campaign_subtype" varchar(50) COLLATE "pg_catalog"."default",
  "planned_start_date" date,
  "planned_end_date" date,
  "actual_start_date" date,
  "actual_end_date" date,
  "budget" numeric(18,2) DEFAULT 0,
  "actual_cost" numeric(18,2) DEFAULT 0,
  "cost_currency" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'CNY'::character varying,
  "objectives" text COLLATE "pg_catalog"."default",
  "target_participants" int4,
  "actual_participants" int4 DEFAULT 0,
  "target_leads" int4,
  "actual_leads" int4 DEFAULT 0,
  "target_conversions" int4,
  "actual_conversions" int4 DEFAULT 0,
  "expected_roi" numeric(10,2),
  "actual_roi" numeric(10,2),
  "channels" varchar(50)[] COLLATE "pg_catalog"."default",
  "channel_ids" int8[],
  "owner_id" int8,
  "department_id" int8,
  "team_members" int8[],
  "related_campaign_id" int8,
  "description" text COLLATE "pg_catalog"."default",
  "content_plan" jsonb DEFAULT '[]'::jsonb,
  "landing_page_url" varchar(500) COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'draft'::character varying,
  "phase" varchar(20) COLLATE "pg_catalog"."default",
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamptz(6),
  "created_id" int8,
  "updated_id" int8,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_campaigns"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_campaigns"."campaign_code" IS '活动编号';
COMMENT ON COLUMN "crm_campaigns"."campaign_name" IS '活动名称';
COMMENT ON COLUMN "crm_campaigns"."campaign_type" IS '活动类型';
COMMENT ON COLUMN "crm_campaigns"."campaign_subtype" IS '活动子类型';
COMMENT ON COLUMN "crm_campaigns"."planned_start_date" IS '计划开始日期';
COMMENT ON COLUMN "crm_campaigns"."planned_end_date" IS '计划结束日期';
COMMENT ON COLUMN "crm_campaigns"."actual_start_date" IS '实际开始日期';
COMMENT ON COLUMN "crm_campaigns"."actual_end_date" IS '实际结束日期';
COMMENT ON COLUMN "crm_campaigns"."budget" IS '预算金额';
COMMENT ON COLUMN "crm_campaigns"."actual_cost" IS '实际成本';
COMMENT ON COLUMN "crm_campaigns"."cost_currency" IS '成本币种';
COMMENT ON COLUMN "crm_campaigns"."objectives" IS '活动目标';
COMMENT ON COLUMN "crm_campaigns"."target_participants" IS '目标参与人数';
COMMENT ON COLUMN "crm_campaigns"."actual_participants" IS '实际参与人数';
COMMENT ON COLUMN "crm_campaigns"."target_leads" IS '目标线索数';
COMMENT ON COLUMN "crm_campaigns"."actual_leads" IS '实际线索数';
COMMENT ON COLUMN "crm_campaigns"."target_conversions" IS '目标转化数';
COMMENT ON COLUMN "crm_campaigns"."actual_conversions" IS '实际转化数';
COMMENT ON COLUMN "crm_campaigns"."expected_roi" IS '预期投资回报率';
COMMENT ON COLUMN "crm_campaigns"."actual_roi" IS '实际投资回报率';
COMMENT ON COLUMN "crm_campaigns"."channels" IS '渠道列表';
COMMENT ON COLUMN "crm_campaigns"."channel_ids" IS '渠道ID列表';
COMMENT ON COLUMN "crm_campaigns"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_campaigns"."department_id" IS '所属部门ID,关联sys_dept';
COMMENT ON COLUMN "crm_campaigns"."team_members" IS '团队成员';
COMMENT ON COLUMN "crm_campaigns"."related_campaign_id" IS 'relatedcampaignID,关联对应表';
COMMENT ON COLUMN "crm_campaigns"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_campaigns"."content_plan" IS '内容计划';
COMMENT ON COLUMN "crm_campaigns"."landing_page_url" IS '落地页URL';
COMMENT ON COLUMN "crm_campaigns"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_campaigns"."phase" IS '阶段';
COMMENT ON COLUMN "crm_campaigns"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_campaigns"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_campaigns"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_campaigns"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_campaigns"."version" IS '版本号';
COMMENT ON COLUMN "crm_campaigns"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_campaigns"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_campaigns"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_campaigns"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_campaigns"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_campaigns" IS 'Campaigns';
-- ----------------------------
-- Records of crm_campaigns
-- ----------------------------
-- ----------------------------
-- Table structure for crm_competitors
-- ----------------------------
-- ----------------------------
-- Table: crm_competitors
-- ----------------------------
CREATE TABLE "crm_competitors" (
  "id" int4 NOT NULL DEFAULT nextval('crm_competitors_id_seq'::regclass),
  "competitor_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "competitor_code" varchar(50) COLLATE "pg_catalog"."default",
  "industry" varchar(100) COLLATE "pg_catalog"."default",
  "company_size" varchar(50) COLLATE "pg_catalog"."default",
  "headquarters" varchar(200) COLLATE "pg_catalog"."default",
  "website" varchar(500) COLLATE "pg_catalog"."default",
  "phone" varchar(50) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "strengths" text COLLATE "pg_catalog"."default",
  "weaknesses" text COLLATE "pg_catalog"."default",
  "market_share" numeric(5,2),
  "threat_level" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'medium'::character varying,
  "status" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "sort_order" int4 DEFAULT 0,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" DEFAULT (gen_random_uuid())::text,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4,
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_competitors"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_competitors"."competitor_name" IS '竞争对手名称';
COMMENT ON COLUMN "crm_competitors"."competitor_code" IS '竞争对手编码';
COMMENT ON COLUMN "crm_competitors"."industry" IS '所属行业';
COMMENT ON COLUMN "crm_competitors"."company_size" IS '公司规模';
COMMENT ON COLUMN "crm_competitors"."headquarters" IS '总部所在地';
COMMENT ON COLUMN "crm_competitors"."website" IS '公司网址';
COMMENT ON COLUMN "crm_competitors"."phone" IS '联系电话';
COMMENT ON COLUMN "crm_competitors"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_competitors"."strengths" IS '优势';
COMMENT ON COLUMN "crm_competitors"."weaknesses" IS '劣势';
COMMENT ON COLUMN "crm_competitors"."market_share" IS '市场份额(%)';
COMMENT ON COLUMN "crm_competitors"."threat_level" IS '威胁级别(high/medium/low)';
COMMENT ON COLUMN "crm_competitors"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_competitors"."sort_order" IS '排序号';
COMMENT ON COLUMN "crm_competitors"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_competitors"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_competitors"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_competitors"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_competitors"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_competitors"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_competitors"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_competitors"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_competitors"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_competitors"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_competitors" IS '竞争对手管理表';
-- ----------------------------
-- Records of crm_competitors
-- ----------------------------
-- ----------------------------
-- Table structure for crm_contact_change_logs
-- ----------------------------
-- ----------------------------
-- Table: crm_contact_change_logs
-- ----------------------------
CREATE TABLE "crm_contact_change_logs" (
  "id" int4 NOT NULL DEFAULT nextval('crm_contact_change_logs_id_seq'::regclass),
  "contact_id" int4 NOT NULL,
  "customer_id" int4 NOT NULL,
  "field_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "field_label" varchar(100) COLLATE "pg_catalog"."default",
  "old_value" text COLLATE "pg_catalog"."default",
  "new_value" text COLLATE "pg_catalog"."default",
  "change_type" varchar(50) COLLATE "pg_catalog"."default",
  "operator_id" int4 NOT NULL,
  "operator_name" varchar(100) COLLATE "pg_catalog"."default",
  "changed_at" timestamp(6) DEFAULT now(),
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_contact_change_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_contact_change_logs"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "crm_contact_change_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_contact_change_logs"."field_name" IS '字段名称';
COMMENT ON COLUMN "crm_contact_change_logs"."field_label" IS '字段标签';
COMMENT ON COLUMN "crm_contact_change_logs"."old_value" IS '旧值';
COMMENT ON COLUMN "crm_contact_change_logs"."new_value" IS '新值';
COMMENT ON COLUMN "crm_contact_change_logs"."change_type" IS '变更类型';
COMMENT ON COLUMN "crm_contact_change_logs"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "crm_contact_change_logs"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "crm_contact_change_logs"."changed_at" IS '变更时间';
COMMENT ON COLUMN "crm_contact_change_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_contact_change_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contact_change_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contact_change_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_contact_change_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_contact_change_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_contact_change_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_contact_change_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contact_change_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_contact_change_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_contact_change_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_contact_change_logs" IS 'Contact Change Logs';
-- ----------------------------
-- Records of crm_contact_change_logs
-- ----------------------------
-- ----------------------------
-- Table structure for crm_contact_relations
-- ----------------------------
-- ----------------------------
-- Table: crm_contact_relations
-- ----------------------------
CREATE TABLE "crm_contact_relations" (
  "id" int4 NOT NULL DEFAULT nextval('crm_contact_relations_id_seq'::regclass),
  "contact_id" int4 NOT NULL,
  "related_contact_id" int4,
  "related_entity_type" varchar(50) COLLATE "pg_catalog"."default",
  "related_entity_id" int4,
  "relation_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "relation_desc" varchar(200) COLLATE "pg_catalog"."default",
  "importance" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'normal'::character varying,
  "decision_role" varchar(50) COLLATE "pg_catalog"."default",
  "influence_level" int4,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_contact_relations"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_contact_relations"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "crm_contact_relations"."related_contact_id" IS '关联联系人ID,关联对应表';
COMMENT ON COLUMN "crm_contact_relations"."related_entity_type" IS '关联实体类型';
COMMENT ON COLUMN "crm_contact_relations"."related_entity_id" IS '关联实体ID,关联对应表';
COMMENT ON COLUMN "crm_contact_relations"."relation_type" IS '关系类型';
COMMENT ON COLUMN "crm_contact_relations"."relation_desc" IS '关系描述';
COMMENT ON COLUMN "crm_contact_relations"."importance" IS '重要性';
COMMENT ON COLUMN "crm_contact_relations"."decision_role" IS '决策角色';
COMMENT ON COLUMN "crm_contact_relations"."influence_level" IS '影响力等级';
COMMENT ON COLUMN "crm_contact_relations"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_contact_relations"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contact_relations"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_contact_relations"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contact_relations"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_contact_relations"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_contact_relations"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_contact_relations"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_contact_relations"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contact_relations"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_contact_relations"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_contact_relations"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_contact_relations" IS 'Contact Relations';
-- ----------------------------
-- Records of crm_contact_relations
-- ----------------------------
-- ----------------------------
-- Table structure for crm_contact_visits
-- ----------------------------
-- ----------------------------
-- Table: crm_contact_visits
-- ----------------------------
CREATE TABLE "crm_contact_visits" (
  "id" int4 NOT NULL DEFAULT nextval('crm_contact_visits_id_seq'::regclass),
  "contact_id" int4 NOT NULL,
  "customer_id" int4 NOT NULL,
  "visit_date" date NOT NULL,
  "visit_type" varchar(50) COLLATE "pg_catalog"."default",
  "visit_location" varchar(200) COLLATE "pg_catalog"."default",
  "visit_duration" int4,
  "visitor_id" int4 NOT NULL,
  "visitor_name" varchar(100) COLLATE "pg_catalog"."default",
  "attendees" json,
  "visit_content" text COLLATE "pg_catalog"."default",
  "visit_result" varchar(200) COLLATE "pg_catalog"."default",
  "follow_up_action" text COLLATE "pg_catalog"."default",
  "next_visit_date" date,
  "attachments" json,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "created_id" int4,
  "updated_id" int4,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_contact_visits"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_contact_visits"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "crm_contact_visits"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_contact_visits"."visit_date" IS '拜访日期';
COMMENT ON COLUMN "crm_contact_visits"."visit_type" IS '拜访类型';
COMMENT ON COLUMN "crm_contact_visits"."visit_location" IS '拜访地点';
COMMENT ON COLUMN "crm_contact_visits"."visit_duration" IS '拜访时长';
COMMENT ON COLUMN "crm_contact_visits"."visitor_id" IS '拜访人ID';
COMMENT ON COLUMN "crm_contact_visits"."visitor_name" IS '拜访人姓名';
COMMENT ON COLUMN "crm_contact_visits"."attendees" IS '参与人';
COMMENT ON COLUMN "crm_contact_visits"."visit_content" IS '拜访内容';
COMMENT ON COLUMN "crm_contact_visits"."visit_result" IS '拜访结果';
COMMENT ON COLUMN "crm_contact_visits"."follow_up_action" IS '跟进动作';
COMMENT ON COLUMN "crm_contact_visits"."next_visit_date" IS '下次拜访日期';
COMMENT ON COLUMN "crm_contact_visits"."attachments" IS '附件';
COMMENT ON COLUMN "crm_contact_visits"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_contact_visits"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_contact_visits"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_contact_visits"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contact_visits"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contact_visits"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_contact_visits"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_contact_visits"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contact_visits"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_contact_visits"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_contact_visits"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_contact_visits" IS 'Contact Visits';
-- ----------------------------
-- Records of crm_contact_visits
-- ----------------------------
-- ----------------------------
-- Table structure for crm_contacts
-- ----------------------------
-- ----------------------------
-- Table: crm_contacts
-- ----------------------------
CREATE TABLE "crm_contacts" (
  "id" int4 NOT NULL DEFAULT nextval('crm_contacts_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "contact_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "gender" varchar(10) COLLATE "pg_catalog"."default",
  "position" varchar(100) COLLATE "pg_catalog"."default",
  "department" varchar(100) COLLATE "pg_catalog"."default",
  "mobile" varchar(50) COLLATE "pg_catalog"."default",
  "phone" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "wechat" varchar(100) COLLATE "pg_catalog"."default",
  "qq" varchar(50) COLLATE "pg_catalog"."default",
  "is_primary" bool DEFAULT false,
  "relationship" varchar(50) COLLATE "pg_catalog"."default",
  "influence_level" varchar(20) COLLATE "pg_catalog"."default",
  "birthday" date,
  "anniversary_date" date,
  "remark" text COLLATE "pg_catalog"."default",
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_contacts"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_contacts"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_contacts"."contact_name" IS '联系人姓名';
COMMENT ON COLUMN "crm_contacts"."gender" IS '性别';
COMMENT ON COLUMN "crm_contacts"."position" IS '职位';
COMMENT ON COLUMN "crm_contacts"."department" IS '部门';
COMMENT ON COLUMN "crm_contacts"."mobile" IS '手机';
COMMENT ON COLUMN "crm_contacts"."phone" IS '电话';
COMMENT ON COLUMN "crm_contacts"."email" IS '邮箱';
COMMENT ON COLUMN "crm_contacts"."wechat" IS '微信';
COMMENT ON COLUMN "crm_contacts"."qq" IS 'QQ号';
COMMENT ON COLUMN "crm_contacts"."is_primary" IS '是否主要联系人';
COMMENT ON COLUMN "crm_contacts"."relationship" IS '关系';
COMMENT ON COLUMN "crm_contacts"."influence_level" IS '影响力等级';
COMMENT ON COLUMN "crm_contacts"."birthday" IS '生日';
COMMENT ON COLUMN "crm_contacts"."anniversary_date" IS '纪念日';
COMMENT ON COLUMN "crm_contacts"."remark" IS '备注';
COMMENT ON COLUMN "crm_contacts"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contacts"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_contacts"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contacts"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_contacts"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_contacts"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_contacts"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_contacts"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contacts"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_contacts"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_contacts"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_contacts" IS 'Contacts';
-- ----------------------------
-- Records of crm_contacts
-- ----------------------------
-- ----------------------------
-- Table structure for crm_contract_invoices
-- ----------------------------
-- ----------------------------
-- Table: crm_contract_invoices
-- ----------------------------
CREATE TABLE "crm_contract_invoices" (
  "id" int4 NOT NULL DEFAULT nextval('crm_contract_invoices_id_seq'::regclass),
  "contract_id" int4 NOT NULL,
  "payment_plan_id" int4,
  "invoice_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "invoice_number" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "invoice_type" varchar(50) COLLATE "pg_catalog"."default",
  "amount" numeric(15,2) NOT NULL,
  "tax_rate" numeric(5,2) DEFAULT 13.00,
  "tax_amount" numeric(15,2),
  "total_amount" numeric(15,2),
  "invoice_date" date,
  "invoice_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "issued_by" int4,
  "issued_at" timestamp(6),
  "invoice_file_url" varchar(500) COLLATE "pg_catalog"."default",
  "remark" text COLLATE "pg_catalog"."default",
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "updated_id" int4,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_contract_invoices"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_contract_invoices"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "crm_contract_invoices"."payment_plan_id" IS '付款计划ID,关联对应表';
COMMENT ON COLUMN "crm_contract_invoices"."invoice_code" IS '发票编号';
COMMENT ON COLUMN "crm_contract_invoices"."invoice_number" IS '发票号码';
COMMENT ON COLUMN "crm_contract_invoices"."invoice_type" IS '发票类型';
COMMENT ON COLUMN "crm_contract_invoices"."amount" IS '金额';
COMMENT ON COLUMN "crm_contract_invoices"."tax_rate" IS '税率';
COMMENT ON COLUMN "crm_contract_invoices"."tax_amount" IS '税额';
COMMENT ON COLUMN "crm_contract_invoices"."total_amount" IS '总金额';
COMMENT ON COLUMN "crm_contract_invoices"."invoice_date" IS '开票日期';
COMMENT ON COLUMN "crm_contract_invoices"."invoice_status" IS '发票状态';
COMMENT ON COLUMN "crm_contract_invoices"."issued_by" IS '开具人ID';
COMMENT ON COLUMN "crm_contract_invoices"."issued_at" IS '开具时间';
COMMENT ON COLUMN "crm_contract_invoices"."invoice_file_url" IS '发票文件URL';
COMMENT ON COLUMN "crm_contract_invoices"."remark" IS '备注';
COMMENT ON COLUMN "crm_contract_invoices"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contract_invoices"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_contract_invoices"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_contract_invoices"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_contract_invoices"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contract_invoices"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_contract_invoices"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_contract_invoices"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contract_invoices"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_contract_invoices"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_contract_invoices"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_contract_invoices" IS 'Contract Invoices';
-- ----------------------------
-- Records of crm_contract_invoices
-- ----------------------------
-- ----------------------------
-- Table structure for crm_contract_items
-- ----------------------------
-- ----------------------------
-- Table: crm_contract_items
-- ----------------------------
CREATE TABLE "crm_contract_items" (
  "id" int4 NOT NULL DEFAULT nextval('crm_contract_items_id_seq'::regclass),
  "contract_id" int4 NOT NULL,
  "product_id" int4,
  "product_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "product_code" varchar(50) COLLATE "pg_catalog"."default",
  "quantity" numeric(10,2) NOT NULL,
  "unit_price" numeric(15,2) NOT NULL,
  "discount_rate" numeric(5,2) DEFAULT 0,
  "amount" numeric(15,2) NOT NULL,
  "delivery_date" date,
  "delivery_address" text COLLATE "pg_catalog"."default",
  "remark" text COLLATE "pg_catalog"."default",
  "sort" int4 DEFAULT 0,
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_contract_items"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_contract_items"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "crm_contract_items"."product_id" IS '产品ID';
COMMENT ON COLUMN "crm_contract_items"."product_name" IS '产品名称';
COMMENT ON COLUMN "crm_contract_items"."product_code" IS '产品编号';
COMMENT ON COLUMN "crm_contract_items"."quantity" IS '数量';
COMMENT ON COLUMN "crm_contract_items"."unit_price" IS '单价';
COMMENT ON COLUMN "crm_contract_items"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "crm_contract_items"."amount" IS '金额';
COMMENT ON COLUMN "crm_contract_items"."delivery_date" IS '交付日期';
COMMENT ON COLUMN "crm_contract_items"."delivery_address" IS '收货地址';
COMMENT ON COLUMN "crm_contract_items"."remark" IS '备注';
COMMENT ON COLUMN "crm_contract_items"."sort" IS '排序';
COMMENT ON COLUMN "crm_contract_items"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_contract_items"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contract_items"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contract_items"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_contract_items"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_contract_items"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_contract_items"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_contract_items"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contract_items"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_contract_items"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_contract_items"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_contract_items" IS 'Contract Items';
-- ----------------------------
-- Records of crm_contract_items
-- ----------------------------
-- ----------------------------
-- Table structure for crm_contracts
-- ----------------------------
-- ----------------------------
-- Table: crm_contracts
-- ----------------------------
CREATE TABLE "crm_contracts" (
  "id" int4 NOT NULL DEFAULT nextval('crm_contracts_id_seq'::regclass),
  "contract_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "contract_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" int4 NOT NULL,
  "opportunity_id" int4,
  "quotation_id" int4,
  "contract_type" varchar(50) COLLATE "pg_catalog"."default",
  "start_date" date,
  "end_date" date,
  "currency" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'CNY'::character varying,
  "total_amount" numeric(15,2) NOT NULL,
  "paid_amount" numeric(15,2) DEFAULT 0,
  "unpaid_amount" numeric(15,2) GENERATED ALWAYS AS (
(total_amount - paid_amount)
) STORED,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'draft'::character varying,
  "approval_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "approved_by" int4,
  "approved_at" timestamp(6),
  "signed_date" date,
  "signed_by_customer" varchar(100) COLLATE "pg_catalog"."default",
  "signed_by_company" varchar(100) COLLATE "pg_catalog"."default",
  "contract_file_url" varchar(500) COLLATE "pg_catalog"."default",
  "owner_id" int4,
  "terms_conditions" text COLLATE "pg_catalog"."default",
  "remark" text COLLATE "pg_catalog"."default",
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_contracts"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_contracts"."contract_code" IS '合同编号';
COMMENT ON COLUMN "crm_contracts"."contract_name" IS '合同名称';
COMMENT ON COLUMN "crm_contracts"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_contracts"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "crm_contracts"."quotation_id" IS '报价ID,关联对应表';
COMMENT ON COLUMN "crm_contracts"."contract_type" IS '合同类型';
COMMENT ON COLUMN "crm_contracts"."start_date" IS '开始日期';
COMMENT ON COLUMN "crm_contracts"."end_date" IS '结束日期';
COMMENT ON COLUMN "crm_contracts"."currency" IS '币种';
COMMENT ON COLUMN "crm_contracts"."total_amount" IS '总金额';
COMMENT ON COLUMN "crm_contracts"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "crm_contracts"."unpaid_amount" IS '未付金额';
COMMENT ON COLUMN "crm_contracts"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_contracts"."approval_status" IS '审批状态';
COMMENT ON COLUMN "crm_contracts"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "crm_contracts"."approved_at" IS '审批时间';
COMMENT ON COLUMN "crm_contracts"."signed_date" IS '签约日期';
COMMENT ON COLUMN "crm_contracts"."signed_by_customer" IS '客户签字人';
COMMENT ON COLUMN "crm_contracts"."signed_by_company" IS '公司签字人';
COMMENT ON COLUMN "crm_contracts"."contract_file_url" IS '合同文件URL';
COMMENT ON COLUMN "crm_contracts"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_contracts"."terms_conditions" IS '条款条件';
COMMENT ON COLUMN "crm_contracts"."remark" IS '备注';
COMMENT ON COLUMN "crm_contracts"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contracts"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_contracts"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contracts"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_contracts"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_contracts"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_contracts"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_contracts"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_contracts"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_contracts"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_contracts" IS 'Contracts';
-- ----------------------------
-- Records of crm_contracts
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_activities
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_activities
-- ----------------------------
CREATE TABLE "crm_customer_activities" (
  "id" int4 NOT NULL DEFAULT nextval('crm_customer_activities_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "activity_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "activity_title" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "activity_content" text COLLATE "pg_catalog"."default",
  "related_type" varchar(50) COLLATE "pg_catalog"."default",
  "related_id" int4,
  "operator_id" int4 NOT NULL,
  "operator_name" varchar(100) COLLATE "pg_catalog"."default",
  "activity_date" timestamp(6) DEFAULT now(),
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_activities"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_activities"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_activities"."activity_type" IS '活动类型';
COMMENT ON COLUMN "crm_customer_activities"."activity_title" IS '活动标题';
COMMENT ON COLUMN "crm_customer_activities"."activity_content" IS '活动内容';
COMMENT ON COLUMN "crm_customer_activities"."related_type" IS '关联类型';
COMMENT ON COLUMN "crm_customer_activities"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "crm_customer_activities"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "crm_customer_activities"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "crm_customer_activities"."activity_date" IS '活动日期';
COMMENT ON COLUMN "crm_customer_activities"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_activities"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_activities"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_activities"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customer_activities"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_activities"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_activities"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_activities"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_activities"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_activities"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_activities"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_activities" IS 'Customer Activities';
-- ----------------------------
-- Records of crm_customer_activities
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_addresses
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_addresses
-- ----------------------------
CREATE TABLE "crm_customer_addresses" (
  "id" int4 NOT NULL DEFAULT nextval('crm_customer_addresses_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "address_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "address_name" varchar(200) COLLATE "pg_catalog"."default",
  "province" varchar(50) COLLATE "pg_catalog"."default",
  "city" varchar(50) COLLATE "pg_catalog"."default",
  "district" varchar(50) COLLATE "pg_catalog"."default",
  "detail_address" text COLLATE "pg_catalog"."default" NOT NULL,
  "postal_code" varchar(20) COLLATE "pg_catalog"."default",
  "latitude" numeric(10,8),
  "longitude" numeric(11,8),
  "contact_person" varchar(100) COLLATE "pg_catalog"."default",
  "contact_phone" varchar(50) COLLATE "pg_catalog"."default",
  "is_default" bool DEFAULT false,
  "is_active" bool DEFAULT true,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_addresses"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_addresses"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_addresses"."address_type" IS '地址类型';
COMMENT ON COLUMN "crm_customer_addresses"."address_name" IS '地址名称';
COMMENT ON COLUMN "crm_customer_addresses"."province" IS '省份';
COMMENT ON COLUMN "crm_customer_addresses"."city" IS '城市';
COMMENT ON COLUMN "crm_customer_addresses"."district" IS '区县';
COMMENT ON COLUMN "crm_customer_addresses"."detail_address" IS '详细地址';
COMMENT ON COLUMN "crm_customer_addresses"."postal_code" IS '邮编';
COMMENT ON COLUMN "crm_customer_addresses"."latitude" IS '纬度';
COMMENT ON COLUMN "crm_customer_addresses"."longitude" IS '经度';
COMMENT ON COLUMN "crm_customer_addresses"."contact_person" IS '联系人';
COMMENT ON COLUMN "crm_customer_addresses"."contact_phone" IS '联系电话';
COMMENT ON COLUMN "crm_customer_addresses"."is_default" IS '是否默认';
COMMENT ON COLUMN "crm_customer_addresses"."is_active" IS '是否启用';
COMMENT ON COLUMN "crm_customer_addresses"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_addresses"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_addresses"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customer_addresses"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_addresses"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_addresses"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_addresses"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_addresses"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_addresses"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_addresses"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_addresses" IS 'Customer Addresses';
-- ----------------------------
-- Records of crm_customer_addresses
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_attachments
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_attachments
-- ----------------------------
CREATE TABLE "crm_customer_attachments" (
  "id" int4 NOT NULL DEFAULT nextval('crm_customer_attachments_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "file_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "file_path" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "file_type" varchar(50) COLLATE "pg_catalog"."default",
  "mime_type" varchar(100) COLLATE "pg_catalog"."default",
  "file_size" int8,
  "attachment_type" varchar(50) COLLATE "pg_catalog"."default",
  "uploader_id" int4 NOT NULL,
  "uploaded_at" timestamp(6) DEFAULT now(),
  "created_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_attachments"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_attachments"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_attachments"."file_name" IS '文件名';
COMMENT ON COLUMN "crm_customer_attachments"."file_path" IS '文件路径';
COMMENT ON COLUMN "crm_customer_attachments"."file_type" IS '文件类型';
COMMENT ON COLUMN "crm_customer_attachments"."mime_type" IS 'MIME类型';
COMMENT ON COLUMN "crm_customer_attachments"."file_size" IS '文件大小';
COMMENT ON COLUMN "crm_customer_attachments"."attachment_type" IS '附件类型';
COMMENT ON COLUMN "crm_customer_attachments"."uploader_id" IS '上传人ID';
COMMENT ON COLUMN "crm_customer_attachments"."uploaded_at" IS '上传时间';
COMMENT ON COLUMN "crm_customer_attachments"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_attachments"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_attachments"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_attachments"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_attachments"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customer_attachments"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_attachments"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_attachments"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_attachments"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_attachments"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_attachments"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_attachments" IS 'Customer Attachments';
-- ----------------------------
-- Records of crm_customer_attachments
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_change_logs
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_change_logs
-- ----------------------------
CREATE TABLE "crm_customer_change_logs" (
  "id" int4 NOT NULL DEFAULT nextval('crm_customer_change_logs_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "field_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "field_label" varchar(100) COLLATE "pg_catalog"."default",
  "old_value" text COLLATE "pg_catalog"."default",
  "new_value" text COLLATE "pg_catalog"."default",
  "change_type" varchar(50) COLLATE "pg_catalog"."default",
  "operator_id" int4 NOT NULL,
  "operator_name" varchar(100) COLLATE "pg_catalog"."default",
  "change_reason" varchar(200) COLLATE "pg_catalog"."default",
  "changed_at" timestamp(6) DEFAULT now(),
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_change_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_change_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_change_logs"."field_name" IS '字段名称';
COMMENT ON COLUMN "crm_customer_change_logs"."field_label" IS '字段标签';
COMMENT ON COLUMN "crm_customer_change_logs"."old_value" IS '旧值';
COMMENT ON COLUMN "crm_customer_change_logs"."new_value" IS '新值';
COMMENT ON COLUMN "crm_customer_change_logs"."change_type" IS '变更类型';
COMMENT ON COLUMN "crm_customer_change_logs"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "crm_customer_change_logs"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "crm_customer_change_logs"."change_reason" IS '变更原因';
COMMENT ON COLUMN "crm_customer_change_logs"."changed_at" IS '变更时间';
COMMENT ON COLUMN "crm_customer_change_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_change_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_change_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_change_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customer_change_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_change_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_change_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_change_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_change_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_change_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_change_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_change_logs" IS 'Customer Change Logs';
-- ----------------------------
-- Records of crm_customer_change_logs
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_duplicate_logs
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_duplicate_logs
-- ----------------------------
CREATE TABLE "crm_customer_duplicate_logs" (
  "id" int4 NOT NULL DEFAULT nextval('crm_customer_duplicate_logs_id_seq'::regclass),
  "customer_a_id" int4 NOT NULL,
  "customer_b_id" int4 NOT NULL,
  "similarity" numeric(5,2) NOT NULL,
  "collision_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "handled_by" int4,
  "handled_at" timestamp(6),
  "result" varchar(50) COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_duplicate_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."customer_a_id" IS '客户A ID';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."customer_b_id" IS '客户B ID';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."similarity" IS '相似度';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."collision_type" IS '冲突类型';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."handled_by" IS '处理人ID';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."handled_at" IS '处理时间';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."result" IS '结果';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_duplicate_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_duplicate_logs" IS 'Customer Duplicate Logs';
-- ----------------------------
-- Records of crm_customer_duplicate_logs
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_health
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_health
-- ----------------------------
CREATE TABLE "crm_customer_health" (
  "id" int4 NOT NULL DEFAULT nextval('crm_customer_health_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "health_score" int4 DEFAULT 50,
  "health_level" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'medium'::character varying,
  "product_usage_score" int4,
  "support_tickets_score" int4,
  "payment_score" int4,
  "engagement_score" int4,
  "satisfaction_score" int4,
  "risk_factors" json,
  "risk_level" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'low'::character varying,
  "contract_end_date" date,
  "renewal_probability" int4,
  "renewal_status" varchar(20) COLLATE "pg_catalog"."default",
  "assessed_at" timestamp(6) DEFAULT now(),
  "next_assessment_date" date,
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_health"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_health"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_health"."health_score" IS '健康度评分';
COMMENT ON COLUMN "crm_customer_health"."health_level" IS '健康等级';
COMMENT ON COLUMN "crm_customer_health"."product_usage_score" IS '产品使用评分';
COMMENT ON COLUMN "crm_customer_health"."support_tickets_score" IS '支持工单评分';
COMMENT ON COLUMN "crm_customer_health"."payment_score" IS '付款评分';
COMMENT ON COLUMN "crm_customer_health"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "crm_customer_health"."satisfaction_score" IS '满意度评分';
COMMENT ON COLUMN "crm_customer_health"."risk_factors" IS '风险因素';
COMMENT ON COLUMN "crm_customer_health"."risk_level" IS '风险等级';
COMMENT ON COLUMN "crm_customer_health"."contract_end_date" IS '合同结束日期';
COMMENT ON COLUMN "crm_customer_health"."renewal_probability" IS '续约概率';
COMMENT ON COLUMN "crm_customer_health"."renewal_status" IS '续约状态';
COMMENT ON COLUMN "crm_customer_health"."assessed_at" IS '评估时间';
COMMENT ON COLUMN "crm_customer_health"."next_assessment_date" IS '下次评估日期';
COMMENT ON COLUMN "crm_customer_health"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customer_health"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_health"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_health"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_health"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_health"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_health"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_health"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_health"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_health"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_health"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_health" IS 'Customer Health';
-- ----------------------------
-- Records of crm_customer_health
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_health_scores
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_health_scores
-- ----------------------------
CREATE TABLE "crm_customer_health_scores" (
  "id" int8 NOT NULL DEFAULT nextval('crm_customer_health_scores_id_seq'::regclass),
  "customer_id" int8 NOT NULL,
  "score_date" date NOT NULL,
  "overall_score" int4 NOT NULL,
  "health_level" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "dimension_scores" jsonb NOT NULL DEFAULT '{}'::jsonb,
  "product_usage" jsonb DEFAULT '{}'::jsonb,
  "adoption_rate" numeric(5,2) DEFAULT 0,
  "engagement_score" int4 DEFAULT 0,
  "avg_contact_frequency" numeric(5,2) DEFAULT 0,
  "last_interaction_date" date,
  "payment_score" int4 DEFAULT 0,
  "revenue_trend" varchar(20) COLLATE "pg_catalog"."default",
  "arpu" numeric(18,2) DEFAULT 0,
  "satisfaction_score" int4 DEFAULT 0,
  "nps_score" int4,
  "last_survey_date" date,
  "risk_indicators" text[] COLLATE "pg_catalog"."default",
  "churn_signals" text[] COLLATE "pg_catalog"."default",
  "churn_probability" numeric(5,2) DEFAULT 0,
  "expansion_probability" numeric(5,2) DEFAULT 0,
  "ai_insights" jsonb DEFAULT '{}'::jsonb,
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "created_id" int8,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_health_scores"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_health_scores"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_health_scores"."score_date" IS '评分日期';
COMMENT ON COLUMN "crm_customer_health_scores"."overall_score" IS '综合评分';
COMMENT ON COLUMN "crm_customer_health_scores"."health_level" IS '健康等级';
COMMENT ON COLUMN "crm_customer_health_scores"."dimension_scores" IS '维度评分';
COMMENT ON COLUMN "crm_customer_health_scores"."product_usage" IS '产品使用情况';
COMMENT ON COLUMN "crm_customer_health_scores"."adoption_rate" IS '采用率';
COMMENT ON COLUMN "crm_customer_health_scores"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "crm_customer_health_scores"."avg_contact_frequency" IS '平均联系频率';
COMMENT ON COLUMN "crm_customer_health_scores"."last_interaction_date" IS '最后互动日期';
COMMENT ON COLUMN "crm_customer_health_scores"."payment_score" IS '付款评分';
COMMENT ON COLUMN "crm_customer_health_scores"."revenue_trend" IS '收入趋势';
COMMENT ON COLUMN "crm_customer_health_scores"."arpu" IS 'ARPU';
COMMENT ON COLUMN "crm_customer_health_scores"."satisfaction_score" IS '满意度评分';
COMMENT ON COLUMN "crm_customer_health_scores"."nps_score" IS 'NPS评分';
COMMENT ON COLUMN "crm_customer_health_scores"."last_survey_date" IS '最后调查日期';
COMMENT ON COLUMN "crm_customer_health_scores"."risk_indicators" IS '风险指标';
COMMENT ON COLUMN "crm_customer_health_scores"."churn_signals" IS '流失信号';
COMMENT ON COLUMN "crm_customer_health_scores"."churn_probability" IS '流失概率';
COMMENT ON COLUMN "crm_customer_health_scores"."expansion_probability" IS '扩展概率';
COMMENT ON COLUMN "crm_customer_health_scores"."ai_insights" IS 'AI洞察';
COMMENT ON COLUMN "crm_customer_health_scores"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_health_scores"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_health_scores"."version" IS '版本号';
COMMENT ON COLUMN "crm_customer_health_scores"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_health_scores"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_health_scores"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_health_scores"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_health_scores"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_health_scores"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_health_scores"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_health_scores" IS 'Customer Health Scores';
-- ----------------------------
-- Records of crm_customer_health_scores
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_pool_logs
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_pool_logs
-- ----------------------------
CREATE TABLE "crm_customer_pool_logs" (
  "id" int8 NOT NULL DEFAULT nextval('crm_customer_pool_logs_id_seq'::regclass),
  "customer_id" int8 NOT NULL,
  "action_type" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "action_date" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "from_user_id" int8,
  "from_dept_id" int8,
  "to_user_id" int8,
  "to_dept_id" int8,
  "reason" text COLLATE "pg_catalog"."default",
  "transfer_type" varchar(20) COLLATE "pg_catalog"."default",
  "operator_id" int8,
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "version" int4 DEFAULT 1,
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_pool_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_pool_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_pool_logs"."action_type" IS '操作类型';
COMMENT ON COLUMN "crm_customer_pool_logs"."action_date" IS '操作日期';
COMMENT ON COLUMN "crm_customer_pool_logs"."from_user_id" IS '原负责人ID';
COMMENT ON COLUMN "crm_customer_pool_logs"."from_dept_id" IS '原部门ID';
COMMENT ON COLUMN "crm_customer_pool_logs"."to_user_id" IS '目标负责人ID';
COMMENT ON COLUMN "crm_customer_pool_logs"."to_dept_id" IS '目标部门ID';
COMMENT ON COLUMN "crm_customer_pool_logs"."reason" IS '原因';
COMMENT ON COLUMN "crm_customer_pool_logs"."transfer_type" IS '转移类型';
COMMENT ON COLUMN "crm_customer_pool_logs"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "crm_customer_pool_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_pool_logs"."version" IS '版本号';
COMMENT ON COLUMN "crm_customer_pool_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_pool_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_pool_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customer_pool_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_pool_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_pool_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_pool_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_pool_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_pool_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_pool_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_pool_logs" IS 'Customer Pool Logs';
-- ----------------------------
-- Records of crm_customer_pool_logs
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_profiles
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_profiles
-- ----------------------------
CREATE TABLE "crm_customer_profiles" (
  "id" int8 NOT NULL DEFAULT nextval('crm_customer_profiles_id_seq'::regclass),
  "customer_id" int8 NOT NULL,
  "basic_profile" jsonb DEFAULT '{}'::jsonb,
  "behavior_profile" jsonb DEFAULT '{}'::jsonb,
  "preference_profile" jsonb DEFAULT '{}'::jsonb,
  "value_profile" jsonb DEFAULT '{}'::jsonb,
  "purchase_patterns" jsonb DEFAULT '{}'::jsonb,
  "preferred_products" jsonb DEFAULT '{}'::jsonb,
  "price_sensitivity" varchar(20) COLLATE "pg_catalog"."default",
  "buying_stages" varchar(20) COLLATE "pg_catalog"."default",
  "communication_prefs" jsonb DEFAULT '{}'::jsonb,
  "best_contact_times" varchar(20)[] COLLATE "pg_catalog"."default",
  "preferred_channels" varchar(20)[] COLLATE "pg_catalog"."default",
  "lifetime_value" numeric(18,2),
  "churn_probability" numeric(5,2),
  "upsell_probability" numeric(5,2),
  "referral_probability" numeric(5,2),
  "personas" varchar(50)[] COLLATE "pg_catalog"."default",
  "tags" varchar(50)[] COLLATE "pg_catalog"."default",
  "analysis_count" int4 DEFAULT 0,
  "last_analysis_at" timestamptz(6),
  "model_version" varchar(50) COLLATE "pg_catalog"."default",
  "confidence_score" numeric(5,2),
  "data_completeness" numeric(5,2),
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamptz(6),
  "version" int4 DEFAULT 1,
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_profiles"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_profiles"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_profiles"."basic_profile" IS '基础画像';
COMMENT ON COLUMN "crm_customer_profiles"."behavior_profile" IS '行为画像';
COMMENT ON COLUMN "crm_customer_profiles"."preference_profile" IS '偏好画像';
COMMENT ON COLUMN "crm_customer_profiles"."value_profile" IS '价值画像';
COMMENT ON COLUMN "crm_customer_profiles"."purchase_patterns" IS '购买模式';
COMMENT ON COLUMN "crm_customer_profiles"."preferred_products" IS '首选产品';
COMMENT ON COLUMN "crm_customer_profiles"."price_sensitivity" IS '价格敏感度';
COMMENT ON COLUMN "crm_customer_profiles"."buying_stages" IS '购买阶段';
COMMENT ON COLUMN "crm_customer_profiles"."communication_prefs" IS '沟通偏好';
COMMENT ON COLUMN "crm_customer_profiles"."best_contact_times" IS '最佳联系时段';
COMMENT ON COLUMN "crm_customer_profiles"."preferred_channels" IS '首选渠道';
COMMENT ON COLUMN "crm_customer_profiles"."lifetime_value" IS '生命周期价值';
COMMENT ON COLUMN "crm_customer_profiles"."churn_probability" IS '流失概率';
COMMENT ON COLUMN "crm_customer_profiles"."upsell_probability" IS '增购概率';
COMMENT ON COLUMN "crm_customer_profiles"."referral_probability" IS '推荐概率';
COMMENT ON COLUMN "crm_customer_profiles"."personas" IS '角色';
COMMENT ON COLUMN "crm_customer_profiles"."tags" IS '标签';
COMMENT ON COLUMN "crm_customer_profiles"."analysis_count" IS '分析次数';
COMMENT ON COLUMN "crm_customer_profiles"."last_analysis_at" IS '最后分析时间';
COMMENT ON COLUMN "crm_customer_profiles"."model_version" IS '模型版本';
COMMENT ON COLUMN "crm_customer_profiles"."confidence_score" IS '置信度评分';
COMMENT ON COLUMN "crm_customer_profiles"."data_completeness" IS '数据完整度';
COMMENT ON COLUMN "crm_customer_profiles"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_profiles"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customer_profiles"."version" IS '版本号';
COMMENT ON COLUMN "crm_customer_profiles"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_profiles"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_profiles"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_profiles"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_profiles"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_profiles"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_profiles"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_profiles"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_profiles"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_profiles" IS 'Customer Profiles';
-- ----------------------------
-- Records of crm_customer_profiles
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_satisfaction_surveys
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_satisfaction_surveys
-- ----------------------------
CREATE TABLE "crm_customer_satisfaction_surveys" (
  "id" int8 NOT NULL DEFAULT nextval('crm_customer_satisfaction_surveys_id_seq'::regclass),
  "survey_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "survey_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "survey_type" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" int8,
  "contact_id" int8,
  "order_id" int8,
  "project_id" int8,
  "sent_date" date,
  "completed_date" date,
  "overall_score" int4,
  "nps_score" int4,
  "csat_score" int4,
  "ces_score" int4,
  "dimension_scores" jsonb DEFAULT '{}'::jsonb,
  "feedback" text COLLATE "pg_catalog"."default",
  "positive_feedback" text COLLATE "pg_catalog"."default",
  "negative_feedback" text COLLATE "pg_catalog"."default",
  "follow_up_required" bool DEFAULT false,
  "follow_up_status" varchar(20) COLLATE "pg_catalog"."default",
  "follow_up_by" int8,
  "follow_up_date" date,
  "follow_up_notes" text COLLATE "pg_catalog"."default",
  "channel" varchar(30) COLLATE "pg_catalog"."default",
  "respondent_email" varchar(255) COLLATE "pg_catalog"."default",
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamptz(6),
  "created_id" int8,
  "updated_id" int8,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."survey_code" IS '调查编号';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."survey_name" IS '调查名称';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."survey_type" IS '调查类型';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."project_id" IS '项目ID';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."sent_date" IS '发送日期';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."completed_date" IS '完成日期';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."overall_score" IS '综合评分';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."nps_score" IS 'NPS评分';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."csat_score" IS 'CSAT评分';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."ces_score" IS 'CES评分';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."dimension_scores" IS '维度评分';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."feedback" IS '反馈';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."positive_feedback" IS '正面反馈';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."negative_feedback" IS '负面反馈';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."follow_up_required" IS '需要跟进';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."follow_up_status" IS '跟进状态';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."follow_up_by" IS '跟进人ID';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."follow_up_date" IS '跟进日期';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."follow_up_notes" IS '跟进备注';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."channel" IS '渠道';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."respondent_email" IS '受访者邮箱';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."version" IS '版本号';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_satisfaction_surveys"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_satisfaction_surveys" IS 'Customer Satisfaction Surveys';
-- ----------------------------
-- Records of crm_customer_satisfaction_surveys
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_tags
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_tags
-- ----------------------------
CREATE TABLE "crm_customer_tags" (
  "id" int4 NOT NULL DEFAULT nextval('crm_customer_tags_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "tag_id" int4 NOT NULL,
  "tag_source" varchar(50) COLLATE "pg_catalog"."default" DEFAULT 'manual'::character varying,
  "confidence" numeric(5,2),
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "updated_id" int4,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_tags"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_tags"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_tags"."tag_id" IS '标签ID,关联对应表';
COMMENT ON COLUMN "crm_customer_tags"."tag_source" IS '标签来源';
COMMENT ON COLUMN "crm_customer_tags"."confidence" IS '置信度';
COMMENT ON COLUMN "crm_customer_tags"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_tags"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_tags"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_tags"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_tags"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_tags"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_tags"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_tags"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_tags"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_tags"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_tags" IS 'Customer Tags';
-- ----------------------------
-- Records of crm_customer_tags
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customer_timeline
-- ----------------------------
-- ----------------------------
-- Table: crm_customer_timeline
-- ----------------------------
CREATE TABLE "crm_customer_timeline" (
  "id" int4 NOT NULL DEFAULT nextval('crm_customer_timeline_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "event_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "event_category" varchar(30) COLLATE "pg_catalog"."default",
  "title" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "related_type" varchar(50) COLLATE "pg_catalog"."default",
  "related_id" int4,
  "related_name" varchar(200) COLLATE "pg_catalog"."default",
  "operator_id" int4,
  "operator_name" varchar(100) COLLATE "pg_catalog"."default",
  "attachments" json,
  "extra_data" json,
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_customer_timeline"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customer_timeline"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_customer_timeline"."event_type" IS '事件类型';
COMMENT ON COLUMN "crm_customer_timeline"."event_category" IS '事件分类';
COMMENT ON COLUMN "crm_customer_timeline"."title" IS '职位';
COMMENT ON COLUMN "crm_customer_timeline"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customer_timeline"."related_type" IS '关联类型';
COMMENT ON COLUMN "crm_customer_timeline"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "crm_customer_timeline"."related_name" IS '关联名称';
COMMENT ON COLUMN "crm_customer_timeline"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "crm_customer_timeline"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "crm_customer_timeline"."attachments" IS '附件';
COMMENT ON COLUMN "crm_customer_timeline"."extra_data" IS '扩展数据';
COMMENT ON COLUMN "crm_customer_timeline"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customer_timeline"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_timeline"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_timeline"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customer_timeline"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customer_timeline"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customer_timeline"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_customer_timeline"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_customer_timeline"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_customer_timeline" IS 'Customer Timeline';
-- ----------------------------
-- Records of crm_customer_timeline
-- ----------------------------
-- ----------------------------
-- Table structure for crm_customers
-- ----------------------------
-- ----------------------------
-- Table: crm_customers
-- ----------------------------
CREATE TABLE "crm_customers" (
  "id" int4 NOT NULL DEFAULT nextval('crm_customers_id_seq'::regclass),
  "customer_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_type" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'enterprise'::character varying,
  "industry" varchar(100) COLLATE "pg_catalog"."default",
  "source" varchar(50) COLLATE "pg_catalog"."default",
  "customer_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "owner_id" int4,
  "department_id" int4,
  "lead_id" int4,
  "pool_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'private'::character varying,
  "last_followup_at" timestamp(6),
  "next_followup_at" timestamp(6),
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "created_id" int4,
  "updated_id" int4,
  "customer_short_name" varchar(100) COLLATE "pg_catalog"."default",
  "customer_level" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'C'::character varying,
  "scale" varchar(20) COLLATE "pg_catalog"."default",
  "registration_no" varchar(50) COLLATE "pg_catalog"."default",
  "tax_no" varchar(50) COLLATE "pg_catalog"."default",
  "legal_person" varchar(100) COLLATE "pg_catalog"."default",
  "established_date" date,
  "registered_capital" numeric(18,2),
  "paid_capital" numeric(18,2),
  "website" varchar(255) COLLATE "pg_catalog"."default",
  "main_phone" varchar(50) COLLATE "pg_catalog"."default",
  "main_email" varchar(255) COLLATE "pg_catalog"."default",
  "country" varchar(50) COLLATE "pg_catalog"."default" DEFAULT '中国'::character varying,
  "province" varchar(50) COLLATE "pg_catalog"."default",
  "city" varchar(50) COLLATE "pg_catalog"."default",
  "district" varchar(50) COLLATE "pg_catalog"."default",
  "address" varchar(500) COLLATE "pg_catalog"."default",
  "rating" int4 DEFAULT 3,
  "territory" varchar(100) COLLATE "pg_catalog"."default",
  "customer_since" date,
  "first_order_date" date,
  "last_order_date" date,
  "total_revenue" numeric(18,2) DEFAULT 0,
  "total_orders" int4 DEFAULT 0,
  "credit_limit" numeric(18,2) DEFAULT 0,
  "outstanding_amount" numeric(18,2) DEFAULT 0,
  "payment_days" int4 DEFAULT 0,
  "parent_customer_id" int4,
  "is_parent" bool DEFAULT false,
  "customer_segment" varchar(50) COLLATE "pg_catalog"."default",
  "churn_risk" varchar(20) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "extra_data" jsonb DEFAULT '{}'::jsonb,
  "version" int4 DEFAULT 1,
  "protection_deadline" timestamp(6),
  "claim_time" timestamp(6),
  "health_score" numeric(5,2),
  "duplicate_check_key" varchar(200) COLLATE "pg_catalog"."default",
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '0'::character varying,
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_customers"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_customers"."customer_code" IS '客户编号';
COMMENT ON COLUMN "crm_customers"."customer_name" IS '客户名称';
COMMENT ON COLUMN "crm_customers"."customer_type" IS '客户类型';
COMMENT ON COLUMN "crm_customers"."industry" IS '所属行业';
COMMENT ON COLUMN "crm_customers"."source" IS '客户来源';
COMMENT ON COLUMN "crm_customers"."customer_status" IS '客户状态';
COMMENT ON COLUMN "crm_customers"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_customers"."department_id" IS '所属部门ID,关联sys_dept';
COMMENT ON COLUMN "crm_customers"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "crm_customers"."pool_status" IS '公海池状态';
COMMENT ON COLUMN "crm_customers"."last_followup_at" IS '最后跟进时间';
COMMENT ON COLUMN "crm_customers"."next_followup_at" IS '下次跟进时间';
COMMENT ON COLUMN "crm_customers"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_customers"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_customers"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_customers"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_customers"."customer_short_name" IS '客户简称';
COMMENT ON COLUMN "crm_customers"."customer_level" IS '客户等级';
COMMENT ON COLUMN "crm_customers"."scale" IS '企业规模';
COMMENT ON COLUMN "crm_customers"."registration_no" IS '工商注册号';
COMMENT ON COLUMN "crm_customers"."tax_no" IS '税号';
COMMENT ON COLUMN "crm_customers"."legal_person" IS '法人代表';
COMMENT ON COLUMN "crm_customers"."established_date" IS '成立日期';
COMMENT ON COLUMN "crm_customers"."registered_capital" IS '注册资本';
COMMENT ON COLUMN "crm_customers"."paid_capital" IS '实缴资本';
COMMENT ON COLUMN "crm_customers"."website" IS '公司网站';
COMMENT ON COLUMN "crm_customers"."main_phone" IS '主联系电话';
COMMENT ON COLUMN "crm_customers"."main_email" IS '主联系邮箱';
COMMENT ON COLUMN "crm_customers"."country" IS '国家';
COMMENT ON COLUMN "crm_customers"."province" IS '省份';
COMMENT ON COLUMN "crm_customers"."city" IS '城市';
COMMENT ON COLUMN "crm_customers"."district" IS '区县';
COMMENT ON COLUMN "crm_customers"."address" IS '详细地址';
COMMENT ON COLUMN "crm_customers"."rating" IS '客户评分';
COMMENT ON COLUMN "crm_customers"."territory" IS '所属区域';
COMMENT ON COLUMN "crm_customers"."customer_since" IS '成为客户时间';
COMMENT ON COLUMN "crm_customers"."first_order_date" IS '首单日期';
COMMENT ON COLUMN "crm_customers"."last_order_date" IS '最后订单日期';
COMMENT ON COLUMN "crm_customers"."total_revenue" IS '总营收';
COMMENT ON COLUMN "crm_customers"."total_orders" IS '总订单数';
COMMENT ON COLUMN "crm_customers"."credit_limit" IS '信用额度';
COMMENT ON COLUMN "crm_customers"."outstanding_amount" IS '欠款金额';
COMMENT ON COLUMN "crm_customers"."payment_days" IS '账期天数';
COMMENT ON COLUMN "crm_customers"."parent_customer_id" IS '父客户ID(集团客户)';
COMMENT ON COLUMN "crm_customers"."is_parent" IS '是否父客户(集团总部)';
COMMENT ON COLUMN "crm_customers"."customer_segment" IS '客户分群';
COMMENT ON COLUMN "crm_customers"."churn_risk" IS '流失风险(high/medium/low)';
COMMENT ON COLUMN "crm_customers"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_customers"."extra_data" IS '扩展数据(JSONB)';
COMMENT ON COLUMN "crm_customers"."version" IS '版本号(乐观锁)';
COMMENT ON COLUMN "crm_customers"."protection_deadline" IS '保护期截止时间(公海池)';
COMMENT ON COLUMN "crm_customers"."claim_time" IS '领取时间(公海池)';
COMMENT ON COLUMN "crm_customers"."health_score" IS '健康度评分';
COMMENT ON COLUMN "crm_customers"."duplicate_check_key" IS '查重键(防止重复客户)';
COMMENT ON COLUMN "crm_customers"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_customers"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_customers"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_customers"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_customers"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_customers"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_customers" IS 'Customers';
-- ----------------------------
-- Records of crm_customers
-- ----------------------------
-- ----------------------------
-- Table structure for crm_deliveries
-- ----------------------------
-- ----------------------------
-- Table: crm_deliveries
-- ----------------------------
CREATE TABLE "crm_deliveries" (
  "id" int4 NOT NULL DEFAULT nextval('crm_deliveries_id_seq'::regclass),
  "order_id" int4 NOT NULL,
  "delivery_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "delivery_date" date NOT NULL,
  "delivery_method" varchar(50) COLLATE "pg_catalog"."default",
  "logistics_company" varchar(100) COLLATE "pg_catalog"."default",
  "tracking_number" varchar(100) COLLATE "pg_catalog"."default",
  "receiver_name" varchar(100) COLLATE "pg_catalog"."default",
  "receiver_signature" varchar(200) COLLATE "pg_catalog"."default",
  "signed_at" timestamp(6),
  "delivery_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "remark" text COLLATE "pg_catalog"."default",
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_deliveries"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_deliveries"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "crm_deliveries"."delivery_code" IS '配送编号';
COMMENT ON COLUMN "crm_deliveries"."delivery_date" IS '交付日期';
COMMENT ON COLUMN "crm_deliveries"."delivery_method" IS '交付方式';
COMMENT ON COLUMN "crm_deliveries"."logistics_company" IS '物流公司';
COMMENT ON COLUMN "crm_deliveries"."tracking_number" IS '运单号';
COMMENT ON COLUMN "crm_deliveries"."receiver_name" IS '收货人姓名';
COMMENT ON COLUMN "crm_deliveries"."receiver_signature" IS '签收人';
COMMENT ON COLUMN "crm_deliveries"."signed_at" IS '签收时间';
COMMENT ON COLUMN "crm_deliveries"."delivery_status" IS '物流状态';
COMMENT ON COLUMN "crm_deliveries"."remark" IS '备注';
COMMENT ON COLUMN "crm_deliveries"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_deliveries"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_deliveries"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_deliveries"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_deliveries"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_deliveries"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_deliveries"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_deliveries"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_deliveries"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_deliveries"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_deliveries"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_deliveries" IS 'Deliveries';
-- ----------------------------
-- Records of crm_deliveries
-- ----------------------------
-- ----------------------------
-- Table structure for crm_follow_records
-- ----------------------------
-- ----------------------------
-- Table: crm_follow_records
-- ----------------------------
CREATE TABLE "crm_follow_records" (
  "id" int8 NOT NULL DEFAULT nextval('crm_follow_records_id_seq'::regclass),
  "opportunity_id" int8,
  "customer_id" int8,
  "contact_id" int8,
  "follow_type" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "subject" varchar(200) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "contact_mode" varchar(20) COLLATE "pg_catalog"."default",
  "duration_minutes" int4,
  "participants" int8[],
  "location" varchar(200) COLLATE "pg_catalog"."default",
  "outcome" varchar(20) COLLATE "pg_catalog"."default",
  "next_action" varchar(200) COLLATE "pg_catalog"."default",
  "next_follow_date" date,
  "attachments" jsonb DEFAULT '[]'::jsonb,
  "sentiment" varchar(20) COLLATE "pg_catalog"."default",
  "key_points" text[] COLLATE "pg_catalog"."default",
  "action_items" jsonb DEFAULT '[]'::jsonb,
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamptz(6),
  "created_id" int8,
  "updated_id" int8,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_follow_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_follow_records"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "crm_follow_records"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_follow_records"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "crm_follow_records"."follow_type" IS '跟进方式';
COMMENT ON COLUMN "crm_follow_records"."subject" IS '主题';
COMMENT ON COLUMN "crm_follow_records"."content" IS '内容';
COMMENT ON COLUMN "crm_follow_records"."contact_mode" IS '联系方式';
COMMENT ON COLUMN "crm_follow_records"."duration_minutes" IS '用时(分钟)';
COMMENT ON COLUMN "crm_follow_records"."participants" IS '参与人';
COMMENT ON COLUMN "crm_follow_records"."location" IS '地点';
COMMENT ON COLUMN "crm_follow_records"."outcome" IS '结果';
COMMENT ON COLUMN "crm_follow_records"."next_action" IS '下一步行动';
COMMENT ON COLUMN "crm_follow_records"."next_follow_date" IS '下次跟进日期';
COMMENT ON COLUMN "crm_follow_records"."attachments" IS '附件';
COMMENT ON COLUMN "crm_follow_records"."sentiment" IS '情感倾向';
COMMENT ON COLUMN "crm_follow_records"."key_points" IS '要点';
COMMENT ON COLUMN "crm_follow_records"."action_items" IS '行动项';
COMMENT ON COLUMN "crm_follow_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_follow_records"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_follow_records"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_follow_records"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_follow_records"."version" IS '版本号';
COMMENT ON COLUMN "crm_follow_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_follow_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_follow_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_follow_records"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_follow_records"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_follow_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_follow_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_follow_records" IS 'Follow Records';
-- ----------------------------
-- Records of crm_follow_records
-- ----------------------------
-- ----------------------------
-- Table structure for crm_followups
-- ----------------------------
-- ----------------------------
-- Table: crm_followups
-- ----------------------------
CREATE TABLE "crm_followups" (
  "id" int4 NOT NULL DEFAULT nextval('crm_followups_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "contact_id" int4,
  "followup_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "followup_date" date NOT NULL,
  "followup_time" time(6),
  "duration" int4,
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "result" varchar(50) COLLATE "pg_catalog"."default",
  "next_followup_date" date,
  "next_followup_content" text COLLATE "pg_catalog"."default",
  "location" varchar(200) COLLATE "pg_catalog"."default",
  "participants" text COLLATE "pg_catalog"."default",
  "attachments" json,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_followups"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_followups"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_followups"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "crm_followups"."followup_type" IS '跟进类型';
COMMENT ON COLUMN "crm_followups"."followup_date" IS '跟进日期';
COMMENT ON COLUMN "crm_followups"."followup_time" IS '跟进时间';
COMMENT ON COLUMN "crm_followups"."duration" IS '时长';
COMMENT ON COLUMN "crm_followups"."content" IS '内容';
COMMENT ON COLUMN "crm_followups"."result" IS '结果';
COMMENT ON COLUMN "crm_followups"."next_followup_date" IS '下次跟进日期';
COMMENT ON COLUMN "crm_followups"."next_followup_content" IS '下次跟进内容';
COMMENT ON COLUMN "crm_followups"."location" IS '地点';
COMMENT ON COLUMN "crm_followups"."participants" IS '参与人';
COMMENT ON COLUMN "crm_followups"."attachments" IS '附件';
COMMENT ON COLUMN "crm_followups"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_followups"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_followups"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_followups"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_followups"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_followups"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_followups"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_followups"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_followups"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_followups"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_followups" IS 'Followups';
-- ----------------------------
-- Records of crm_followups
-- ----------------------------
-- ----------------------------
-- Table structure for crm_import_records
-- ----------------------------
-- ----------------------------
-- Table: crm_import_records
-- ----------------------------
CREATE TABLE "crm_import_records" (
  "id" int4 NOT NULL DEFAULT nextval('crm_import_records_id_seq'::regclass),
  "import_type" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "file_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "file_url" varchar(500) COLLATE "pg_catalog"."default",
  "file_size" int8,
  "total_rows" int4 DEFAULT 0,
  "success_rows" int4 DEFAULT 0,
  "failed_rows" int4 DEFAULT 0,
  "duplicate_rows" int4 DEFAULT 0,
  "error_log" text COLLATE "pg_catalog"."default",
  "failed_data" json,
  "success_ids" json,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "started_at" timestamp(6),
  "completed_at" timestamp(6),
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_import_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_import_records"."import_type" IS '导入类型';
COMMENT ON COLUMN "crm_import_records"."file_name" IS '文件名';
COMMENT ON COLUMN "crm_import_records"."file_url" IS '文件URL';
COMMENT ON COLUMN "crm_import_records"."file_size" IS '文件大小';
COMMENT ON COLUMN "crm_import_records"."total_rows" IS '总行数';
COMMENT ON COLUMN "crm_import_records"."success_rows" IS '成功行数';
COMMENT ON COLUMN "crm_import_records"."failed_rows" IS '失败行数';
COMMENT ON COLUMN "crm_import_records"."duplicate_rows" IS '重复行数';
COMMENT ON COLUMN "crm_import_records"."error_log" IS '错误日志';
COMMENT ON COLUMN "crm_import_records"."failed_data" IS '失败数据';
COMMENT ON COLUMN "crm_import_records"."success_ids" IS '成功ID列表';
COMMENT ON COLUMN "crm_import_records"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_import_records"."started_at" IS '开始时间';
COMMENT ON COLUMN "crm_import_records"."completed_at" IS '完成时间';
COMMENT ON COLUMN "crm_import_records"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_import_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_import_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_import_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_import_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_import_records"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_import_records"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_import_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_import_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_import_records" IS 'Import Records';
-- ----------------------------
-- Records of crm_import_records
-- ----------------------------
-- ----------------------------
-- Table structure for crm_invoices
-- ----------------------------
-- ----------------------------
-- Table: crm_invoices
-- ----------------------------
CREATE TABLE "crm_invoices" (
  "id" int4 NOT NULL DEFAULT nextval('crm_invoices_id_seq'::regclass),
  "invoice_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "contract_id" int4 NOT NULL,
  "order_id" int4,
  "customer_id" int4 NOT NULL,
  "invoice_type" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'standard'::character varying,
  "invoice_date" date,
  "due_date" date,
  "amount" numeric(18,2) NOT NULL,
  "tax_amount" numeric(18,2) DEFAULT 0,
  "total_amount" numeric(18,2) NOT NULL,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'draft'::character varying,
  "paid_amount" numeric(18,2) DEFAULT 0,
  "payment_date" date,
  "notes" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_invoices"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_invoices"."invoice_code" IS '发票编号';
COMMENT ON COLUMN "crm_invoices"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "crm_invoices"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "crm_invoices"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_invoices"."invoice_type" IS '发票类型';
COMMENT ON COLUMN "crm_invoices"."invoice_date" IS '开票日期';
COMMENT ON COLUMN "crm_invoices"."due_date" IS '到期日期';
COMMENT ON COLUMN "crm_invoices"."amount" IS '金额';
COMMENT ON COLUMN "crm_invoices"."tax_amount" IS '税额';
COMMENT ON COLUMN "crm_invoices"."total_amount" IS '总金额';
COMMENT ON COLUMN "crm_invoices"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_invoices"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "crm_invoices"."payment_date" IS '付款日期';
COMMENT ON COLUMN "crm_invoices"."notes" IS '备注说明';
COMMENT ON COLUMN "crm_invoices"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_invoices"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_invoices"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_invoices"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_invoices"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_invoices"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_invoices"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_invoices"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_invoices"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_invoices"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_invoices"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_invoices" IS 'Invoices';
-- ----------------------------
-- Records of crm_invoices
-- ----------------------------
-- ----------------------------
-- Table structure for crm_joint_followups
-- ----------------------------
-- ----------------------------
-- Table: crm_joint_followups
-- ----------------------------
CREATE TABLE "crm_joint_followups" (
  "id" int8 NOT NULL DEFAULT nextval('crm_joint_followups_id_seq'::regclass),
  "opportunity_id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "role_type" varchar(30) COLLATE "pg_catalog"."default",
  "responsibility" text COLLATE "pg_catalog"."default",
  "can_edit" bool DEFAULT false,
  "can_view_sensitive" bool DEFAULT false,
  "followup_count" int4 DEFAULT 0,
  "last_followup_date" date,
  "contribution_score" numeric(5,2),
  "assigned_date" date,
  "assigned_by" int8,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "end_date" date,
  "remark" text COLLATE "pg_catalog"."default",
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "created_id" int8,
  "updated_id" int8,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_joint_followups"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_joint_followups"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "crm_joint_followups"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "crm_joint_followups"."role_type" IS '角色类型';
COMMENT ON COLUMN "crm_joint_followups"."responsibility" IS '职责';
COMMENT ON COLUMN "crm_joint_followups"."can_edit" IS '是否可编辑';
COMMENT ON COLUMN "crm_joint_followups"."can_view_sensitive" IS '是否可查看敏感信息';
COMMENT ON COLUMN "crm_joint_followups"."followup_count" IS '跟进次数';
COMMENT ON COLUMN "crm_joint_followups"."last_followup_date" IS '最后跟进日期';
COMMENT ON COLUMN "crm_joint_followups"."contribution_score" IS '贡献评分';
COMMENT ON COLUMN "crm_joint_followups"."assigned_date" IS '分配日期';
COMMENT ON COLUMN "crm_joint_followups"."assigned_by" IS '分配人ID';
COMMENT ON COLUMN "crm_joint_followups"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_joint_followups"."end_date" IS '结束日期';
COMMENT ON COLUMN "crm_joint_followups"."remark" IS '备注';
COMMENT ON COLUMN "crm_joint_followups"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_joint_followups"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_joint_followups"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_joint_followups"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_joint_followups"."version" IS '版本号';
COMMENT ON COLUMN "crm_joint_followups"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_joint_followups"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_joint_followups"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_joint_followups"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_joint_followups"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_joint_followups"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_joint_followups"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_joint_followups" IS 'Joint Followups';
-- ----------------------------
-- Records of crm_joint_followups
-- ----------------------------
-- ----------------------------
-- Table structure for crm_lead_scores
-- ----------------------------
-- ----------------------------
-- Table: crm_lead_scores
-- ----------------------------
CREATE TABLE "crm_lead_scores" (
  "id" int4 NOT NULL DEFAULT nextval('crm_lead_scores_id_seq'::regclass),
  "lead_id" int4 NOT NULL,
  "total_score" int4 DEFAULT 0,
  "demographic_score" int4 DEFAULT 0,
  "behavior_score" int4 DEFAULT 0,
  "engagement_score" int4 DEFAULT 0,
  "score_grade" varchar(10) COLLATE "pg_catalog"."default",
  "score_level" varchar(20) COLLATE "pg_catalog"."default",
  "score_details" json,
  "last_scored_at" timestamp(6),
  "next_score_date" date,
  "is_qualified" bool DEFAULT false,
  "qualified_at" timestamp(6),
  "converted_to_opportunity" bool DEFAULT false,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_lead_scores"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_lead_scores"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "crm_lead_scores"."total_score" IS '总分';
COMMENT ON COLUMN "crm_lead_scores"."demographic_score" IS '人口统计评分';
COMMENT ON COLUMN "crm_lead_scores"."behavior_score" IS '行为评分';
COMMENT ON COLUMN "crm_lead_scores"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "crm_lead_scores"."score_grade" IS '评分等级';
COMMENT ON COLUMN "crm_lead_scores"."score_level" IS '评分等级';
COMMENT ON COLUMN "crm_lead_scores"."score_details" IS '评分详情';
COMMENT ON COLUMN "crm_lead_scores"."last_scored_at" IS '最后评分时间';
COMMENT ON COLUMN "crm_lead_scores"."next_score_date" IS '下次评分日期';
COMMENT ON COLUMN "crm_lead_scores"."is_qualified" IS '是否合格';
COMMENT ON COLUMN "crm_lead_scores"."qualified_at" IS '合格时间';
COMMENT ON COLUMN "crm_lead_scores"."converted_to_opportunity" IS '是否转商机';
COMMENT ON COLUMN "crm_lead_scores"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_lead_scores"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_lead_scores"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_lead_scores"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_lead_scores"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_lead_scores"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_lead_scores"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_lead_scores"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_lead_scores"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_lead_scores"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_lead_scores"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_lead_scores" IS 'Lead Scores';
-- ----------------------------
-- Records of crm_lead_scores
-- ----------------------------
-- ----------------------------
-- Table structure for crm_leads
-- ----------------------------
-- ----------------------------
-- Table: crm_leads
-- ----------------------------
CREATE TABLE "crm_leads" (
  "id" int4 NOT NULL DEFAULT nextval('crm_leads_id_seq'::regclass),
  "lead_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "lead_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "source" varchar(50) COLLATE "pg_catalog"."default",
  "campaign_id" int4,
  "channel" varchar(50) COLLATE "pg_catalog"."default",
  "phone" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "company" varchar(200) COLLATE "pg_catalog"."default",
  "position" varchar(100) COLLATE "pg_catalog"."default",
  "score" int4 DEFAULT 0,
  "grade" varchar(10) COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'new'::character varying,
  "converted_customer_id" int4,
  "owner_id" int4,
  "assigned_at" timestamp(6),
  "nurturing_stage" varchar(50) COLLATE "pg_catalog"."default",
  "last_nurturing_date" date,
  "duplicate_check_key" varchar(100) COLLATE "pg_catalog"."default",
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_leads"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_leads"."lead_code" IS '线索编号';
COMMENT ON COLUMN "crm_leads"."lead_name" IS '线索名称';
COMMENT ON COLUMN "crm_leads"."source" IS '来源';
COMMENT ON COLUMN "crm_leads"."campaign_id" IS '活动ID';
COMMENT ON COLUMN "crm_leads"."channel" IS '渠道';
COMMENT ON COLUMN "crm_leads"."phone" IS '电话';
COMMENT ON COLUMN "crm_leads"."email" IS '邮箱';
COMMENT ON COLUMN "crm_leads"."company" IS '公司名称';
COMMENT ON COLUMN "crm_leads"."position" IS '职位';
COMMENT ON COLUMN "crm_leads"."score" IS '评分';
COMMENT ON COLUMN "crm_leads"."grade" IS '等级';
COMMENT ON COLUMN "crm_leads"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_leads"."converted_customer_id" IS '转化后客户ID';
COMMENT ON COLUMN "crm_leads"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "crm_leads"."assigned_at" IS '分配时间';
COMMENT ON COLUMN "crm_leads"."nurturing_stage" IS '培育阶段';
COMMENT ON COLUMN "crm_leads"."last_nurturing_date" IS '最后培育日期';
COMMENT ON COLUMN "crm_leads"."duplicate_check_key" IS '查重键';
COMMENT ON COLUMN "crm_leads"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_leads"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_leads"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_leads"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_leads"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_leads"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_leads"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_leads"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_leads"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_leads"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_leads" IS 'Leads';
-- ----------------------------
-- Records of crm_leads
-- ----------------------------
-- ----------------------------
-- Table structure for crm_marketing_campaigns
-- ----------------------------
-- ----------------------------
-- Table: crm_marketing_campaigns
-- ----------------------------
CREATE TABLE "crm_marketing_campaigns" (
  "id" int4 NOT NULL DEFAULT nextval('crm_marketing_campaigns_id_seq'::regclass),
  "campaign_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "campaign_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "campaign_type" varchar(50) COLLATE "pg_catalog"."default",
  "start_date" date,
  "end_date" date,
  "location" varchar(200) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "budget" numeric(15,2),
  "actual_cost" numeric(15,2),
  "target_leads" int4,
  "target_customers" int4,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'planning'::character varying,
  "owner_id" int4,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_marketing_campaigns"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_marketing_campaigns"."campaign_code" IS '活动编号';
COMMENT ON COLUMN "crm_marketing_campaigns"."campaign_name" IS '活动名称';
COMMENT ON COLUMN "crm_marketing_campaigns"."campaign_type" IS '活动类型';
COMMENT ON COLUMN "crm_marketing_campaigns"."start_date" IS '开始日期';
COMMENT ON COLUMN "crm_marketing_campaigns"."end_date" IS '结束日期';
COMMENT ON COLUMN "crm_marketing_campaigns"."location" IS '地点';
COMMENT ON COLUMN "crm_marketing_campaigns"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_marketing_campaigns"."budget" IS '预算金额';
COMMENT ON COLUMN "crm_marketing_campaigns"."actual_cost" IS '实际成本';
COMMENT ON COLUMN "crm_marketing_campaigns"."target_leads" IS '目标线索数';
COMMENT ON COLUMN "crm_marketing_campaigns"."target_customers" IS '目标客户';
COMMENT ON COLUMN "crm_marketing_campaigns"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_marketing_campaigns"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_marketing_campaigns"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_marketing_campaigns"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_marketing_campaigns"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_marketing_campaigns"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_marketing_campaigns"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_marketing_campaigns"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_marketing_campaigns"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_marketing_campaigns"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_marketing_campaigns"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_marketing_campaigns" IS 'Marketing Campaigns';
-- ----------------------------
-- Records of crm_marketing_campaigns
-- ----------------------------
-- ----------------------------
-- Table structure for crm_marketing_channels
-- ----------------------------
-- ----------------------------
-- Table: crm_marketing_channels
-- ----------------------------
CREATE TABLE "crm_marketing_channels" (
  "id" int4 NOT NULL DEFAULT nextval('crm_marketing_channels_id_seq'::regclass),
  "channel_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "channel_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "channel_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "channel_category" varchar(50) COLLATE "pg_catalog"."default",
  "parent_id" int4 DEFAULT 0,
  "cost_per_lead" numeric(10,2),
  "monthly_budget" numeric(15,2),
  "actual_cost" numeric(15,2) DEFAULT 0,
  "total_leads" int4 DEFAULT 0,
  "qualified_leads" int4 DEFAULT 0,
  "converted_customers" int4 DEFAULT 0,
  "total_revenue" numeric(15,2) DEFAULT 0,
  "conversion_rate" numeric(5,2),
  "roi" numeric(5,2),
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_marketing_channels"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_marketing_channels"."channel_code" IS '渠道编号';
COMMENT ON COLUMN "crm_marketing_channels"."channel_name" IS '渠道名称';
COMMENT ON COLUMN "crm_marketing_channels"."channel_type" IS '渠道类型';
COMMENT ON COLUMN "crm_marketing_channels"."channel_category" IS '渠道分类';
COMMENT ON COLUMN "crm_marketing_channels"."parent_id" IS '父级ID';
COMMENT ON COLUMN "crm_marketing_channels"."cost_per_lead" IS '单线索成本';
COMMENT ON COLUMN "crm_marketing_channels"."monthly_budget" IS '月度预算';
COMMENT ON COLUMN "crm_marketing_channels"."actual_cost" IS '实际成本';
COMMENT ON COLUMN "crm_marketing_channels"."total_leads" IS '总线索数';
COMMENT ON COLUMN "crm_marketing_channels"."qualified_leads" IS '合格线索数';
COMMENT ON COLUMN "crm_marketing_channels"."converted_customers" IS '转化客户数';
COMMENT ON COLUMN "crm_marketing_channels"."total_revenue" IS '总收入';
COMMENT ON COLUMN "crm_marketing_channels"."conversion_rate" IS '转化率';
COMMENT ON COLUMN "crm_marketing_channels"."roi" IS '投资回报率';
COMMENT ON COLUMN "crm_marketing_channels"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_marketing_channels"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_marketing_channels"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_marketing_channels"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_marketing_channels"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_marketing_channels"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_marketing_channels"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_marketing_channels"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_marketing_channels"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_marketing_channels"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_marketing_channels"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_marketing_channels"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_marketing_channels" IS 'Marketing Channels';
-- ----------------------------
-- Records of crm_marketing_channels
-- ----------------------------
-- ----------------------------
-- Table structure for crm_notifications
-- ----------------------------
-- ----------------------------
-- Table: crm_notifications
-- ----------------------------
CREATE TABLE "crm_notifications" (
  "id" int4 NOT NULL DEFAULT nextval('crm_notifications_id_seq'::regclass),
  "user_id" int4 NOT NULL,
  "notification_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "content" text COLLATE "pg_catalog"."default",
  "related_type" varchar(50) COLLATE "pg_catalog"."default",
  "related_id" int4,
  "is_read" bool DEFAULT false,
  "read_at" timestamp(6),
  "priority" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'normal'::character varying,
  "sent_at" timestamp(6) DEFAULT now(),
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_notifications"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_notifications"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "crm_notifications"."notification_type" IS '通知类型';
COMMENT ON COLUMN "crm_notifications"."title" IS '职位';
COMMENT ON COLUMN "crm_notifications"."content" IS '内容';
COMMENT ON COLUMN "crm_notifications"."related_type" IS '关联类型';
COMMENT ON COLUMN "crm_notifications"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "crm_notifications"."is_read" IS '是否已读';
COMMENT ON COLUMN "crm_notifications"."read_at" IS '阅读时间';
COMMENT ON COLUMN "crm_notifications"."priority" IS '优先级';
COMMENT ON COLUMN "crm_notifications"."sent_at" IS '发送时间';
COMMENT ON COLUMN "crm_notifications"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_notifications"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_notifications"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_notifications"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_notifications"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_notifications"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_notifications"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_notifications"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_notifications"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_notifications"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_notifications"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_notifications" IS 'Notifications';
-- ----------------------------
-- Records of crm_notifications
-- ----------------------------
-- ----------------------------
-- Table structure for crm_operation_logs
-- ----------------------------
-- ----------------------------
-- Table: crm_operation_logs
-- ----------------------------
CREATE TABLE "crm_operation_logs" (
  "id" int4 NOT NULL DEFAULT nextval('crm_operation_logs_id_seq'::regclass),
  "user_id" int4 NOT NULL,
  "username" varchar(100) COLLATE "pg_catalog"."default",
  "module" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "action" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "target_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "target_id" int4 NOT NULL,
  "target_name" varchar(200) COLLATE "pg_catalog"."default",
  "old_value" json,
  "new_value" json,
  "changed_fields" json,
  "ip_address" varchar(45) COLLATE "pg_catalog"."default",
  "user_agent" text COLLATE "pg_catalog"."default",
  "request_method" varchar(10) COLLATE "pg_catalog"."default",
  "request_url" varchar(500) COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'success'::character varying,
  "error_message" text COLLATE "pg_catalog"."default",
  "execution_time" int4,
  "operated_at" timestamp(6) DEFAULT now(),
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_operation_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_operation_logs"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "crm_operation_logs"."username" IS '用户名';
COMMENT ON COLUMN "crm_operation_logs"."module" IS '模块';
COMMENT ON COLUMN "crm_operation_logs"."action" IS '行动';
COMMENT ON COLUMN "crm_operation_logs"."target_type" IS '目标类型';
COMMENT ON COLUMN "crm_operation_logs"."target_id" IS '目标ID,关联对应表';
COMMENT ON COLUMN "crm_operation_logs"."target_name" IS '目标名称';
COMMENT ON COLUMN "crm_operation_logs"."old_value" IS '旧值';
COMMENT ON COLUMN "crm_operation_logs"."new_value" IS '新值';
COMMENT ON COLUMN "crm_operation_logs"."changed_fields" IS '变更字段';
COMMENT ON COLUMN "crm_operation_logs"."ip_address" IS 'IP地址';
COMMENT ON COLUMN "crm_operation_logs"."user_agent" IS '用户代理';
COMMENT ON COLUMN "crm_operation_logs"."request_method" IS '请求方法';
COMMENT ON COLUMN "crm_operation_logs"."request_url" IS '请求URL';
COMMENT ON COLUMN "crm_operation_logs"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_operation_logs"."error_message" IS '错误信息';
COMMENT ON COLUMN "crm_operation_logs"."execution_time" IS '执行时间';
COMMENT ON COLUMN "crm_operation_logs"."operated_at" IS '操作时间';
COMMENT ON COLUMN "crm_operation_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_operation_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_operation_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_operation_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_operation_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_operation_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_operation_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_operation_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_operation_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_operation_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_operation_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_operation_logs" IS 'Operation Logs';
-- ----------------------------
-- Records of crm_operation_logs
-- ----------------------------
-- ----------------------------
-- Table structure for crm_opportunities
-- ----------------------------
-- ----------------------------
-- Table: crm_opportunities
-- ----------------------------
CREATE TABLE "crm_opportunities" (
  "id" int4 NOT NULL DEFAULT nextval('crm_opportunities_id_seq'::regclass),
  "opportunity_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "opportunity_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" int4 NOT NULL,
  "amount" numeric(15,2),
  "currency" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'CNY'::character varying,
  "probability" int4 DEFAULT 10,
  "expected_close_date" date,
  "stage" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'discovery'::character varying,
  "stage_updated_at" timestamp(6),
  "product_ids" json,
  "source" varchar(50) COLLATE "pg_catalog"."default",
  "owner_id" int4 NOT NULL,
  "lost_reason" varchar(200) COLLATE "pg_catalog"."default",
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_opportunities"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_opportunities"."opportunity_code" IS '商机编号';
COMMENT ON COLUMN "crm_opportunities"."opportunity_name" IS '商机名称';
COMMENT ON COLUMN "crm_opportunities"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_opportunities"."amount" IS '金额';
COMMENT ON COLUMN "crm_opportunities"."currency" IS '币种';
COMMENT ON COLUMN "crm_opportunities"."probability" IS '赢单概率';
COMMENT ON COLUMN "crm_opportunities"."expected_close_date" IS '预计成交日期';
COMMENT ON COLUMN "crm_opportunities"."stage" IS '阶段';
COMMENT ON COLUMN "crm_opportunities"."stage_updated_at" IS '阶段更新时间';
COMMENT ON COLUMN "crm_opportunities"."product_ids" IS '产品IDs';
COMMENT ON COLUMN "crm_opportunities"."source" IS '来源';
COMMENT ON COLUMN "crm_opportunities"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_opportunities"."lost_reason" IS '输单原因';
COMMENT ON COLUMN "crm_opportunities"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_opportunities"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_opportunities"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_opportunities"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_opportunities"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_opportunities"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_opportunities"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_opportunities"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_opportunities"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_opportunities"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_opportunities" IS 'Opportunities';
-- ----------------------------
-- Records of crm_opportunities
-- ----------------------------
-- ----------------------------
-- Table structure for crm_opportunity_products
-- ----------------------------
-- ----------------------------
-- Table: crm_opportunity_products
-- ----------------------------
CREATE TABLE "crm_opportunity_products" (
  "id" int8 NOT NULL DEFAULT nextval('crm_opportunity_products_id_seq'::regclass),
  "opportunity_id" int8 NOT NULL,
  "product_id" int8 NOT NULL,
  "product_name" varchar(200) COLLATE "pg_catalog"."default",
  "quantity" int4 DEFAULT 1,
  "unit_price" numeric(18,4),
  "estimated_amount" numeric(18,2),
  "is_preferred" bool DEFAULT false,
  "win_rate" numeric(5,2),
  "competitor_product" varchar(200) COLLATE "pg_catalog"."default",
  "remark" text COLLATE "pg_catalog"."default",
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "created_id" int8,
  "updated_id" int8,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_opportunity_products"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_opportunity_products"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "crm_opportunity_products"."product_id" IS '产品ID';
COMMENT ON COLUMN "crm_opportunity_products"."product_name" IS '产品名称';
COMMENT ON COLUMN "crm_opportunity_products"."quantity" IS '数量';
COMMENT ON COLUMN "crm_opportunity_products"."unit_price" IS '单价';
COMMENT ON COLUMN "crm_opportunity_products"."estimated_amount" IS '预计金额';
COMMENT ON COLUMN "crm_opportunity_products"."is_preferred" IS '是否首选';
COMMENT ON COLUMN "crm_opportunity_products"."win_rate" IS '赢单率';
COMMENT ON COLUMN "crm_opportunity_products"."competitor_product" IS '竞品';
COMMENT ON COLUMN "crm_opportunity_products"."remark" IS '备注';
COMMENT ON COLUMN "crm_opportunity_products"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_opportunity_products"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_opportunity_products"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_opportunity_products"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_opportunity_products"."version" IS '版本号';
COMMENT ON COLUMN "crm_opportunity_products"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_opportunity_products"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_opportunity_products"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_opportunity_products"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_opportunity_products"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_opportunity_products"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_opportunity_products"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_opportunity_products" IS 'Opportunity Products';
-- ----------------------------
-- Records of crm_opportunity_products
-- ----------------------------
-- ----------------------------
-- Table structure for crm_opportunity_stages
-- ----------------------------
-- ----------------------------
-- Table: crm_opportunity_stages
-- ----------------------------
CREATE TABLE "crm_opportunity_stages" (
  "id" int4 NOT NULL DEFAULT nextval('crm_opportunity_stages_id_seq'::regclass),
  "stage_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "stage_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "stage_sequence" int4 NOT NULL,
  "probability" int4 NOT NULL,
  "color" varchar(20) COLLATE "pg_catalog"."default",
  "stay_limit" int4,
  "stay_limit_action" varchar(50) COLLATE "pg_catalog"."default",
  "required_fields" json,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "is_system" bool DEFAULT false,
  "is_final" bool DEFAULT false,
  "final_result" varchar(20) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "sort" int4 DEFAULT 0,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_opportunity_stages"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_opportunity_stages"."stage_code" IS '阶段编号';
COMMENT ON COLUMN "crm_opportunity_stages"."stage_name" IS '阶段名称';
COMMENT ON COLUMN "crm_opportunity_stages"."stage_sequence" IS '阶段顺序';
COMMENT ON COLUMN "crm_opportunity_stages"."probability" IS '赢单概率';
COMMENT ON COLUMN "crm_opportunity_stages"."color" IS '颜色';
COMMENT ON COLUMN "crm_opportunity_stages"."stay_limit" IS '停留限制(天)';
COMMENT ON COLUMN "crm_opportunity_stages"."stay_limit_action" IS '超时动作';
COMMENT ON COLUMN "crm_opportunity_stages"."required_fields" IS '必填字段';
COMMENT ON COLUMN "crm_opportunity_stages"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_opportunity_stages"."is_system" IS '是否系统内置';
COMMENT ON COLUMN "crm_opportunity_stages"."is_final" IS '是否终态';
COMMENT ON COLUMN "crm_opportunity_stages"."final_result" IS '最终结果';
COMMENT ON COLUMN "crm_opportunity_stages"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_opportunity_stages"."sort" IS '排序';
COMMENT ON COLUMN "crm_opportunity_stages"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_opportunity_stages"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_opportunity_stages"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_opportunity_stages"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_opportunity_stages"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_opportunity_stages"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_opportunity_stages"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_opportunity_stages"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_opportunity_stages"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_opportunity_stages"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_opportunity_stages" IS 'Opportunity Stages';
-- ----------------------------
-- Records of crm_opportunity_stages
-- ----------------------------
-- ----------------------------
-- Table structure for crm_order_items
-- ----------------------------
-- ----------------------------
-- Table: crm_order_items
-- ----------------------------
CREATE TABLE "crm_order_items" (
  "id" int4 NOT NULL DEFAULT nextval('crm_order_items_id_seq'::regclass),
  "order_id" int4 NOT NULL,
  "product_id" int4,
  "product_code" varchar(50) COLLATE "pg_catalog"."default",
  "product_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "sku_id" int4,
  "sku_code" varchar(50) COLLATE "pg_catalog"."default",
  "quantity" numeric(10,2) NOT NULL,
  "unit_price" numeric(15,2) NOT NULL,
  "discount_rate" numeric(5,2) DEFAULT 0,
  "discount_amount" numeric(15,2) DEFAULT 0,
  "tax_rate" numeric(5,2) DEFAULT 13.00,
  "tax_amount" numeric(15,2) DEFAULT 0,
  "amount" numeric(15,2) NOT NULL,
  "delivery_date" date,
  "delivery_address" text COLLATE "pg_catalog"."default",
  "delivered_quantity" numeric(10,2) DEFAULT 0,
  "pending_quantity" numeric(10,2) GENERATED ALWAYS AS (
(quantity - delivered_quantity)
) STORED,
  "production_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "production_note" text COLLATE "pg_catalog"."default",
  "remark" text COLLATE "pg_catalog"."default",
  "sort" int4 DEFAULT 0,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_order_items"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_order_items"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "crm_order_items"."product_id" IS '产品ID';
COMMENT ON COLUMN "crm_order_items"."product_code" IS '产品编号';
COMMENT ON COLUMN "crm_order_items"."product_name" IS '产品名称';
COMMENT ON COLUMN "crm_order_items"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "crm_order_items"."sku_code" IS 'SKU编号';
COMMENT ON COLUMN "crm_order_items"."quantity" IS '数量';
COMMENT ON COLUMN "crm_order_items"."unit_price" IS '单价';
COMMENT ON COLUMN "crm_order_items"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "crm_order_items"."discount_amount" IS '折扣金额';
COMMENT ON COLUMN "crm_order_items"."tax_rate" IS '税率';
COMMENT ON COLUMN "crm_order_items"."tax_amount" IS '税额';
COMMENT ON COLUMN "crm_order_items"."amount" IS '金额';
COMMENT ON COLUMN "crm_order_items"."delivery_date" IS '交付日期';
COMMENT ON COLUMN "crm_order_items"."delivery_address" IS '收货地址';
COMMENT ON COLUMN "crm_order_items"."delivered_quantity" IS '已交付数量';
COMMENT ON COLUMN "crm_order_items"."pending_quantity" IS '待交付数量';
COMMENT ON COLUMN "crm_order_items"."production_status" IS '生产状态';
COMMENT ON COLUMN "crm_order_items"."production_note" IS '生产备注';
COMMENT ON COLUMN "crm_order_items"."remark" IS '备注';
COMMENT ON COLUMN "crm_order_items"."sort" IS '排序';
COMMENT ON COLUMN "crm_order_items"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_order_items"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_order_items"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_order_items"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_order_items"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_order_items"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_order_items"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_order_items"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_order_items"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_order_items"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_order_items" IS 'Order Items';
-- ----------------------------
-- Records of crm_order_items
-- ----------------------------
-- ----------------------------
-- Table structure for crm_orders
-- ----------------------------
-- ----------------------------
-- Table: crm_orders
-- ----------------------------
CREATE TABLE "crm_orders" (
  "id" int4 NOT NULL DEFAULT nextval('crm_orders_id_seq'::regclass),
  "order_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "contract_id" int4 NOT NULL,
  "customer_id" int4 NOT NULL,
  "order_date" date NOT NULL,
  "expected_delivery_date" date,
  "actual_delivery_date" date,
  "total_amount" numeric(15,2) NOT NULL,
  "paid_amount" numeric(15,2) DEFAULT 0,
  "unpaid_amount" numeric(15,2) GENERATED ALWAYS AS (
(total_amount - paid_amount)
) STORED,
  "order_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "payment_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'unpaid'::character varying,
  "owner_id" int4,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_orders"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_orders"."order_code" IS '订单编号';
COMMENT ON COLUMN "crm_orders"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "crm_orders"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_orders"."order_date" IS '订单日期';
COMMENT ON COLUMN "crm_orders"."expected_delivery_date" IS '预计交付日期';
COMMENT ON COLUMN "crm_orders"."actual_delivery_date" IS '实际交付日期';
COMMENT ON COLUMN "crm_orders"."total_amount" IS '总金额';
COMMENT ON COLUMN "crm_orders"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "crm_orders"."unpaid_amount" IS '未付金额';
COMMENT ON COLUMN "crm_orders"."order_status" IS '订单状态';
COMMENT ON COLUMN "crm_orders"."payment_status" IS '付款状态';
COMMENT ON COLUMN "crm_orders"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_orders"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_orders"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_orders"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_orders"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_orders"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_orders"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_orders"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_orders"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_orders"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_orders" IS 'Orders';
-- ----------------------------
-- Records of crm_orders
-- ----------------------------
-- ----------------------------
-- Table structure for crm_payments
-- ----------------------------
-- ----------------------------
-- Table: crm_payments
-- ----------------------------
CREATE TABLE "crm_payments" (
  "id" int4 NOT NULL DEFAULT nextval('crm_payments_id_seq'::regclass),
  "payment_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "contract_id" int4 NOT NULL,
  "order_id" int4,
  "payment_plan_id" int4,
  "customer_id" int4 NOT NULL,
  "payment_amount" numeric(15,2) NOT NULL,
  "payment_method" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "payment_date" date NOT NULL,
  "bank_name" varchar(100) COLLATE "pg_catalog"."default",
  "bank_account" varchar(100) COLLATE "pg_catalog"."default",
  "account_name" varchar(100) COLLATE "pg_catalog"."default",
  "receipt_number" varchar(50) COLLATE "pg_catalog"."default",
  "receipt_file_url" varchar(500) COLLATE "pg_catalog"."default",
  "invoice_id" int4,
  "is_invoiced" bool DEFAULT false,
  "payment_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'confirmed'::character varying,
  "confirmed_by" int4,
  "confirmed_at" timestamp(6),
  "remark" text COLLATE "pg_catalog"."default",
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_payments"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_payments"."payment_code" IS '收款编号';
COMMENT ON COLUMN "crm_payments"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "crm_payments"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "crm_payments"."payment_plan_id" IS '付款计划ID,关联对应表';
COMMENT ON COLUMN "crm_payments"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_payments"."payment_amount" IS '收款金额';
COMMENT ON COLUMN "crm_payments"."payment_method" IS '付款方式';
COMMENT ON COLUMN "crm_payments"."payment_date" IS '付款日期';
COMMENT ON COLUMN "crm_payments"."bank_name" IS '银行名称';
COMMENT ON COLUMN "crm_payments"."bank_account" IS '银行账号';
COMMENT ON COLUMN "crm_payments"."account_name" IS '账户名称';
COMMENT ON COLUMN "crm_payments"."receipt_number" IS '收款单号';
COMMENT ON COLUMN "crm_payments"."receipt_file_url" IS '收款凭证URL';
COMMENT ON COLUMN "crm_payments"."invoice_id" IS '发票ID,关联对应表';
COMMENT ON COLUMN "crm_payments"."is_invoiced" IS '是否已开票';
COMMENT ON COLUMN "crm_payments"."payment_status" IS '付款状态';
COMMENT ON COLUMN "crm_payments"."confirmed_by" IS '确认人ID';
COMMENT ON COLUMN "crm_payments"."confirmed_at" IS '确认时间';
COMMENT ON COLUMN "crm_payments"."remark" IS '备注';
COMMENT ON COLUMN "crm_payments"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_payments"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_payments"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_payments"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_payments"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_payments"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_payments"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_payments"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_payments"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_payments"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_payments"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_payments" IS 'Payments';
-- ----------------------------
-- Records of crm_payments
-- ----------------------------
-- ----------------------------
-- Table structure for crm_pool_transfers
-- ----------------------------
-- ----------------------------
-- Table: crm_pool_transfers
-- ----------------------------
CREATE TABLE "crm_pool_transfers" (
  "id" int4 NOT NULL DEFAULT nextval('crm_pool_transfers_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "from_pool" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "to_pool" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "from_owner_id" int4,
  "to_owner_id" int4,
  "transfer_reason" varchar(200) COLLATE "pg_catalog"."default",
  "transfer_type" varchar(20) COLLATE "pg_catalog"."default",
  "operator_id" int4 NOT NULL,
  "transferred_at" timestamp(6) DEFAULT now(),
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_pool_transfers"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_pool_transfers"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_pool_transfers"."from_pool" IS '来源公海';
COMMENT ON COLUMN "crm_pool_transfers"."to_pool" IS '目标公海';
COMMENT ON COLUMN "crm_pool_transfers"."from_owner_id" IS '原负责人ID,关联对应表';
COMMENT ON COLUMN "crm_pool_transfers"."to_owner_id" IS '新负责人ID,关联对应表';
COMMENT ON COLUMN "crm_pool_transfers"."transfer_reason" IS '转移原因';
COMMENT ON COLUMN "crm_pool_transfers"."transfer_type" IS '转移类型';
COMMENT ON COLUMN "crm_pool_transfers"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "crm_pool_transfers"."transferred_at" IS '转移时间';
COMMENT ON COLUMN "crm_pool_transfers"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_pool_transfers"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_pool_transfers"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_pool_transfers"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_pool_transfers"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_pool_transfers"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_pool_transfers"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_pool_transfers"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_pool_transfers"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_pool_transfers"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_pool_transfers"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_pool_transfers" IS 'Pool Transfers';
-- ----------------------------
-- Records of crm_pool_transfers
-- ----------------------------
-- ----------------------------
-- Table structure for crm_price_tiers
-- ----------------------------
-- ----------------------------
-- Table: crm_price_tiers
-- ----------------------------
CREATE TABLE "crm_price_tiers" (
  "id" int4 NOT NULL DEFAULT nextval('crm_price_tiers_id_seq'::regclass),
  "tier_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "tier_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "discount_rate" numeric(5,2) NOT NULL,
  "min_amount" numeric(15,2),
  "max_amount" numeric(15,2),
  "customer_level" varchar(20) COLLATE "pg_catalog"."default",
  "annual_revenue_min" numeric(15,2),
  "order_count_min" int4,
  "benefits" json,
  "priority" int4 DEFAULT 0,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_price_tiers"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_price_tiers"."tier_code" IS '层级编号';
COMMENT ON COLUMN "crm_price_tiers"."tier_name" IS '层级名称';
COMMENT ON COLUMN "crm_price_tiers"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "crm_price_tiers"."min_amount" IS '最小金额';
COMMENT ON COLUMN "crm_price_tiers"."max_amount" IS '最大金额';
COMMENT ON COLUMN "crm_price_tiers"."customer_level" IS '客户等级';
COMMENT ON COLUMN "crm_price_tiers"."annual_revenue_min" IS '最低年营业额';
COMMENT ON COLUMN "crm_price_tiers"."order_count_min" IS '最低订单数';
COMMENT ON COLUMN "crm_price_tiers"."benefits" IS '权益说明';
COMMENT ON COLUMN "crm_price_tiers"."priority" IS '优先级';
COMMENT ON COLUMN "crm_price_tiers"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_price_tiers"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_price_tiers"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_price_tiers"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_price_tiers"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_price_tiers"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_price_tiers"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_price_tiers"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_price_tiers"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_price_tiers"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_price_tiers"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_price_tiers"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_price_tiers" IS 'Price Tiers';
-- ----------------------------
-- Records of crm_price_tiers
-- ----------------------------
-- ----------------------------
-- Table structure for crm_product_categories
-- ----------------------------
-- ----------------------------
-- Table: crm_product_categories
-- ----------------------------
CREATE TABLE "crm_product_categories" (
  "id" int4 NOT NULL DEFAULT nextval('crm_product_categories_id_seq'::regclass),
  "category_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int4 DEFAULT 0,
  "level" int4 DEFAULT 1,
  "sort" int4 DEFAULT 0,
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_product_categories"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_product_categories"."category_name" IS '分类名称';
COMMENT ON COLUMN "crm_product_categories"."parent_id" IS '父级ID';
COMMENT ON COLUMN "crm_product_categories"."level" IS '级别';
COMMENT ON COLUMN "crm_product_categories"."sort" IS '排序';
COMMENT ON COLUMN "crm_product_categories"."icon" IS '图标';
COMMENT ON COLUMN "crm_product_categories"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_product_categories"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_product_categories"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_product_categories"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_product_categories"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_categories"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_categories"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_product_categories"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_product_categories"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_product_categories"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_categories"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_product_categories"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_product_categories" IS 'Product Categories';
-- ----------------------------
-- Records of crm_product_categories
-- ----------------------------
-- ----------------------------
-- Table structure for crm_product_documents
-- ----------------------------
-- ----------------------------
-- Table: crm_product_documents
-- ----------------------------
CREATE TABLE "crm_product_documents" (
  "id" int4 NOT NULL DEFAULT nextval('crm_product_documents_id_seq'::regclass),
  "product_id" int4 NOT NULL,
  "sku_id" int4,
  "doc_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "doc_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "file_path" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "file_size" int4,
  "mime_type" varchar(100) COLLATE "pg_catalog"."default",
  "version" varchar(20) COLLATE "pg_catalog"."default",
  "is_latest" bool DEFAULT true,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "updated_id" int4,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4,
  "updated_time" timestamp(6)
)
;
COMMENT ON COLUMN "crm_product_documents"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_product_documents"."product_id" IS '产品ID';
COMMENT ON COLUMN "crm_product_documents"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "crm_product_documents"."doc_name" IS '文档名称';
COMMENT ON COLUMN "crm_product_documents"."doc_type" IS '文档类型';
COMMENT ON COLUMN "crm_product_documents"."file_path" IS '文件路径';
COMMENT ON COLUMN "crm_product_documents"."file_size" IS '文件大小';
COMMENT ON COLUMN "crm_product_documents"."mime_type" IS 'MIME类型';
COMMENT ON COLUMN "crm_product_documents"."version" IS '版本号';
COMMENT ON COLUMN "crm_product_documents"."is_latest" IS '是否最新版本';
COMMENT ON COLUMN "crm_product_documents"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_product_documents"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_documents"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_product_documents"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_product_documents"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_documents"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_product_documents"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_product_documents"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_documents"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_product_documents"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_product_documents"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_product_documents" IS 'Product Documents';
-- ----------------------------
-- Records of crm_product_documents
-- ----------------------------
-- ----------------------------
-- Table structure for crm_product_price_history
-- ----------------------------
-- ----------------------------
-- Table: crm_product_price_history
-- ----------------------------
CREATE TABLE "crm_product_price_history" (
  "id" int4 NOT NULL DEFAULT nextval('crm_product_price_history_id_seq'::regclass),
  "product_id" int4 NOT NULL,
  "old_price" numeric(15,2),
  "new_price" numeric(15,2) NOT NULL,
  "price_type" varchar(20) COLLATE "pg_catalog"."default",
  "change_reason" varchar(200) COLLATE "pg_catalog"."default",
  "approval_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'approved'::character varying,
  "approved_by" int4,
  "effective_date" date NOT NULL,
  "operator_id" int4 NOT NULL,
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_product_price_history"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_product_price_history"."product_id" IS '产品ID';
COMMENT ON COLUMN "crm_product_price_history"."old_price" IS '原价';
COMMENT ON COLUMN "crm_product_price_history"."new_price" IS '新价';
COMMENT ON COLUMN "crm_product_price_history"."price_type" IS '价格类型';
COMMENT ON COLUMN "crm_product_price_history"."change_reason" IS '变更原因';
COMMENT ON COLUMN "crm_product_price_history"."approval_status" IS '审批状态';
COMMENT ON COLUMN "crm_product_price_history"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "crm_product_price_history"."effective_date" IS '生效日期';
COMMENT ON COLUMN "crm_product_price_history"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "crm_product_price_history"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_product_price_history"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_price_history"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_price_history"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_product_price_history"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_product_price_history"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_product_price_history"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_product_price_history"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_price_history"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_product_price_history"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_product_price_history"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_product_price_history" IS 'Product Price History';
-- ----------------------------
-- Records of crm_product_price_history
-- ----------------------------
-- ----------------------------
-- Table structure for crm_product_price_policies
-- ----------------------------
-- ----------------------------
-- Table: crm_product_price_policies
-- ----------------------------
CREATE TABLE "crm_product_price_policies" (
  "id" int4 NOT NULL DEFAULT nextval('crm_product_price_policies_id_seq'::regclass),
  "product_id" int4 NOT NULL,
  "sku_id" int4,
  "policy_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "policy_name" varchar(200) COLLATE "pg_catalog"."default",
  "customer_level" varchar(20) COLLATE "pg_catalog"."default",
  "customer_id" int4,
  "min_quantity" int4,
  "max_quantity" int4,
  "price" numeric(15,2) NOT NULL,
  "discount_rate" numeric(5,2),
  "valid_from" date,
  "valid_to" date,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "priority" int4 DEFAULT 0,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_product_price_policies"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_product_price_policies"."product_id" IS '产品ID';
COMMENT ON COLUMN "crm_product_price_policies"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "crm_product_price_policies"."policy_type" IS '策略类型';
COMMENT ON COLUMN "crm_product_price_policies"."policy_name" IS '策略名称';
COMMENT ON COLUMN "crm_product_price_policies"."customer_level" IS '客户等级';
COMMENT ON COLUMN "crm_product_price_policies"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_product_price_policies"."min_quantity" IS '最小数量';
COMMENT ON COLUMN "crm_product_price_policies"."max_quantity" IS '最大数量';
COMMENT ON COLUMN "crm_product_price_policies"."price" IS '价格';
COMMENT ON COLUMN "crm_product_price_policies"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "crm_product_price_policies"."valid_from" IS '生效日期';
COMMENT ON COLUMN "crm_product_price_policies"."valid_to" IS '失效日期';
COMMENT ON COLUMN "crm_product_price_policies"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_product_price_policies"."priority" IS '优先级';
COMMENT ON COLUMN "crm_product_price_policies"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_price_policies"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_product_price_policies"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_product_price_policies"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_product_price_policies"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_product_price_policies"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_product_price_policies"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_price_policies"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_product_price_policies"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_product_price_policies"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_product_price_policies" IS 'Product Price Policies';
-- ----------------------------
-- Records of crm_product_price_policies
-- ----------------------------
-- ----------------------------
-- Table structure for crm_product_prices
-- ----------------------------
-- ----------------------------
-- Table: crm_product_prices
-- ----------------------------
CREATE TABLE "crm_product_prices" (
  "id" int8 NOT NULL DEFAULT nextval('crm_product_prices_id_seq'::regclass),
  "product_id" int8,
  "sku_id" int8,
  "price_type" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "price_name" varchar(100) COLLATE "pg_catalog"."default",
  "unit_price" numeric(18,4) NOT NULL,
  "min_quantity" int4 DEFAULT 1,
  "max_quantity" int4,
  "effective_from" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "effective_to" timestamptz(6),
  "is_active" bool DEFAULT true,
  "customer_id" int8,
  "customer_level" varchar(20) COLLATE "pg_catalog"."default",
  "quantity_prices" jsonb DEFAULT '[]'::jsonb,
  "approval_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "approved_by" int8,
  "approved_at" timestamptz(6),
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamptz(6),
  "created_id" int8,
  "updated_id" int8,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_product_prices"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_product_prices"."product_id" IS '产品ID';
COMMENT ON COLUMN "crm_product_prices"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "crm_product_prices"."price_type" IS '价格类型';
COMMENT ON COLUMN "crm_product_prices"."price_name" IS '价格名称';
COMMENT ON COLUMN "crm_product_prices"."unit_price" IS '单价';
COMMENT ON COLUMN "crm_product_prices"."min_quantity" IS '最小数量';
COMMENT ON COLUMN "crm_product_prices"."max_quantity" IS '最大数量';
COMMENT ON COLUMN "crm_product_prices"."effective_from" IS '生效日期';
COMMENT ON COLUMN "crm_product_prices"."effective_to" IS '失效日期';
COMMENT ON COLUMN "crm_product_prices"."is_active" IS '是否启用';
COMMENT ON COLUMN "crm_product_prices"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_product_prices"."customer_level" IS '客户等级';
COMMENT ON COLUMN "crm_product_prices"."quantity_prices" IS '阶梯价格';
COMMENT ON COLUMN "crm_product_prices"."approval_status" IS '审批状态';
COMMENT ON COLUMN "crm_product_prices"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "crm_product_prices"."approved_at" IS '审批时间';
COMMENT ON COLUMN "crm_product_prices"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_product_prices"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_product_prices"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_prices"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_prices"."version" IS '版本号';
COMMENT ON COLUMN "crm_product_prices"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_product_prices"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_product_prices"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_product_prices"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_prices"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_product_prices"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_product_prices"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_product_prices" IS 'Product Prices';
-- ----------------------------
-- Records of crm_product_prices
-- ----------------------------
-- ----------------------------
-- Table structure for crm_product_skus
-- ----------------------------
-- ----------------------------
-- Table: crm_product_skus
-- ----------------------------
CREATE TABLE "crm_product_skus" (
  "id" int4 NOT NULL DEFAULT nextval('crm_product_skus_id_seq'::regclass),
  "product_id" int4 NOT NULL,
  "sku_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "sku_name" varchar(200) COLLATE "pg_catalog"."default",
  "specifications" json,
  "standard_price" numeric(15,2) NOT NULL,
  "cost_price" numeric(15,2),
  "stock_quantity" int4 DEFAULT 0,
  "min_stock" int4 DEFAULT 0,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "is_default" bool DEFAULT false,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_product_skus"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_product_skus"."product_id" IS '产品ID';
COMMENT ON COLUMN "crm_product_skus"."sku_code" IS 'SKU编号';
COMMENT ON COLUMN "crm_product_skus"."sku_name" IS 'SKU名称';
COMMENT ON COLUMN "crm_product_skus"."specifications" IS '规格参数';
COMMENT ON COLUMN "crm_product_skus"."standard_price" IS '标准价';
COMMENT ON COLUMN "crm_product_skus"."cost_price" IS '成本价';
COMMENT ON COLUMN "crm_product_skus"."stock_quantity" IS '库存数量';
COMMENT ON COLUMN "crm_product_skus"."min_stock" IS '最低库存';
COMMENT ON COLUMN "crm_product_skus"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_product_skus"."is_default" IS '是否默认';
COMMENT ON COLUMN "crm_product_skus"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_skus"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_product_skus"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_product_skus"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_product_skus"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_product_skus"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_product_skus"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_product_skus"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_product_skus"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_product_skus"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_product_skus" IS 'Product Skus';
-- ----------------------------
-- Records of crm_product_skus
-- ----------------------------
-- ----------------------------
-- Table structure for crm_products
-- ----------------------------
-- ----------------------------
-- Table: crm_products
-- ----------------------------
CREATE TABLE "crm_products" (
  "id" int4 NOT NULL DEFAULT nextval('crm_products_id_seq'::regclass),
  "product_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "product_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "category_id" int4,
  "product_type" varchar(20) COLLATE "pg_catalog"."default",
  "standard_price" numeric(15,2) NOT NULL,
  "cost_price" numeric(15,2),
  "min_price" numeric(15,2),
  "currency" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'CNY'::character varying,
  "unit" varchar(20) COLLATE "pg_catalog"."default",
  "specifications" text COLLATE "pg_catalog"."default",
  "stock_quantity" int4 DEFAULT 0,
  "min_stock" int4 DEFAULT 0,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "is_featured" bool DEFAULT false,
  "image_url" varchar(500) COLLATE "pg_catalog"."default",
  "document_urls" json,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_products"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_products"."product_code" IS '产品编号';
COMMENT ON COLUMN "crm_products"."product_name" IS '产品名称';
COMMENT ON COLUMN "crm_products"."category_id" IS '分类ID';
COMMENT ON COLUMN "crm_products"."product_type" IS '产品类型';
COMMENT ON COLUMN "crm_products"."standard_price" IS '标准价';
COMMENT ON COLUMN "crm_products"."cost_price" IS '成本价';
COMMENT ON COLUMN "crm_products"."min_price" IS '最低价';
COMMENT ON COLUMN "crm_products"."currency" IS '币种';
COMMENT ON COLUMN "crm_products"."unit" IS '单位';
COMMENT ON COLUMN "crm_products"."specifications" IS '规格参数';
COMMENT ON COLUMN "crm_products"."stock_quantity" IS '库存数量';
COMMENT ON COLUMN "crm_products"."min_stock" IS '最低库存';
COMMENT ON COLUMN "crm_products"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_products"."is_featured" IS '是否推荐';
COMMENT ON COLUMN "crm_products"."image_url" IS '图片URL';
COMMENT ON COLUMN "crm_products"."document_urls" IS '文档链接';
COMMENT ON COLUMN "crm_products"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_products"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_products"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_products"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_products"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_products"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_products"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_products"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_products"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_products"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_products"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_products" IS 'Products';
-- ----------------------------
-- Records of crm_products
-- ----------------------------
-- ----------------------------
-- Table structure for crm_quotation_items
-- ----------------------------
-- ----------------------------
-- Table: crm_quotation_items
-- ----------------------------
CREATE TABLE "crm_quotation_items" (
  "id" int4 NOT NULL DEFAULT nextval('crm_quotation_items_id_seq'::regclass),
  "quotation_id" int4 NOT NULL,
  "product_id" int4,
  "product_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "product_code" varchar(50) COLLATE "pg_catalog"."default",
  "quantity" numeric(10,2) NOT NULL,
  "unit_price" numeric(15,2) NOT NULL,
  "discount_rate" numeric(5,2) DEFAULT 0,
  "amount" numeric(15,2) NOT NULL,
  "remark" text COLLATE "pg_catalog"."default",
  "sort" int4 DEFAULT 0,
  "created_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4,
  "updated_time" timestamp(6)
)
;
COMMENT ON COLUMN "crm_quotation_items"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_quotation_items"."quotation_id" IS '报价ID,关联对应表';
COMMENT ON COLUMN "crm_quotation_items"."product_id" IS '产品ID';
COMMENT ON COLUMN "crm_quotation_items"."product_name" IS '产品名称';
COMMENT ON COLUMN "crm_quotation_items"."product_code" IS '产品编号';
COMMENT ON COLUMN "crm_quotation_items"."quantity" IS '数量';
COMMENT ON COLUMN "crm_quotation_items"."unit_price" IS '单价';
COMMENT ON COLUMN "crm_quotation_items"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "crm_quotation_items"."amount" IS '金额';
COMMENT ON COLUMN "crm_quotation_items"."remark" IS '备注';
COMMENT ON COLUMN "crm_quotation_items"."sort" IS '排序';
COMMENT ON COLUMN "crm_quotation_items"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_quotation_items"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_quotation_items"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_quotation_items"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_quotation_items"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_quotation_items"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_quotation_items"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_quotation_items"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_quotation_items"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_quotation_items"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_quotation_items" IS 'Quotation Items';
-- ----------------------------
-- Records of crm_quotation_items
-- ----------------------------
-- ----------------------------
-- Table structure for crm_quotations
-- ----------------------------
-- ----------------------------
-- Table: crm_quotations
-- ----------------------------
CREATE TABLE "crm_quotations" (
  "id" int4 NOT NULL DEFAULT nextval('crm_quotations_id_seq'::regclass),
  "quotation_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "quotation_name" varchar(200) COLLATE "pg_catalog"."default",
  "customer_id" int4 NOT NULL,
  "opportunity_id" int4,
  "valid_until" date,
  "currency" varchar(10) COLLATE "pg_catalog"."default" DEFAULT 'CNY'::character varying,
  "exchange_rate" numeric(10,4) DEFAULT 1.0000,
  "subtotal" numeric(15,2) DEFAULT 0,
  "discount_rate" numeric(5,2) DEFAULT 0,
  "discount_amount" numeric(15,2) DEFAULT 0,
  "tax_rate" numeric(5,2) DEFAULT 13.00,
  "tax_amount" numeric(15,2) DEFAULT 0,
  "total_amount" numeric(15,2) DEFAULT 0,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'draft'::character varying,
  "approval_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "approved_by" int4,
  "approved_at" timestamp(6),
  "converted_contract_id" int4,
  "terms_conditions" text COLLATE "pg_catalog"."default",
  "remark" text COLLATE "pg_catalog"."default",
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_quotations"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_quotations"."quotation_code" IS '报价编号';
COMMENT ON COLUMN "crm_quotations"."quotation_name" IS '报价名称';
COMMENT ON COLUMN "crm_quotations"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_quotations"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "crm_quotations"."valid_until" IS '有效期至';
COMMENT ON COLUMN "crm_quotations"."currency" IS '币种';
COMMENT ON COLUMN "crm_quotations"."exchange_rate" IS '汇率';
COMMENT ON COLUMN "crm_quotations"."subtotal" IS '小计';
COMMENT ON COLUMN "crm_quotations"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "crm_quotations"."discount_amount" IS '折扣金额';
COMMENT ON COLUMN "crm_quotations"."tax_rate" IS '税率';
COMMENT ON COLUMN "crm_quotations"."tax_amount" IS '税额';
COMMENT ON COLUMN "crm_quotations"."total_amount" IS '总金额';
COMMENT ON COLUMN "crm_quotations"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_quotations"."approval_status" IS '审批状态';
COMMENT ON COLUMN "crm_quotations"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "crm_quotations"."approved_at" IS '审批时间';
COMMENT ON COLUMN "crm_quotations"."converted_contract_id" IS '转化合同ID,关联对应表';
COMMENT ON COLUMN "crm_quotations"."terms_conditions" IS '条款条件';
COMMENT ON COLUMN "crm_quotations"."remark" IS '备注';
COMMENT ON COLUMN "crm_quotations"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_quotations"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_quotations"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_quotations"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_quotations"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_quotations"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_quotations"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_quotations"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_quotations"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_quotations"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_quotations"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_quotations" IS 'Quotations';
-- ----------------------------
-- Records of crm_quotations
-- ----------------------------
-- ----------------------------
-- Table structure for crm_renewals
-- ----------------------------
-- ----------------------------
-- Table: crm_renewals
-- ----------------------------
CREATE TABLE "crm_renewals" (
  "id" int4 NOT NULL DEFAULT nextval('crm_renewals_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "renewal_type" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "current_contract_id" int4,
  "new_contract_id" int4,
  "current_amount" numeric(15,2),
  "new_amount" numeric(15,2),
  "increase_amount" numeric(15,2),
  "contract_start_date" date,
  "contract_end_date" date,
  "renewal_date" date,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "owner_id" int4,
  "remark" text COLLATE "pg_catalog"."default",
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_id" int4,
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_renewals"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_renewals"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_renewals"."renewal_type" IS '续约类型';
COMMENT ON COLUMN "crm_renewals"."current_contract_id" IS '当前合同ID,关联对应表';
COMMENT ON COLUMN "crm_renewals"."new_contract_id" IS '新合同ID,关联对应表';
COMMENT ON COLUMN "crm_renewals"."current_amount" IS '当前金额';
COMMENT ON COLUMN "crm_renewals"."new_amount" IS '新金额';
COMMENT ON COLUMN "crm_renewals"."increase_amount" IS '增加金额';
COMMENT ON COLUMN "crm_renewals"."contract_start_date" IS '合同开始日期';
COMMENT ON COLUMN "crm_renewals"."contract_end_date" IS '合同结束日期';
COMMENT ON COLUMN "crm_renewals"."renewal_date" IS '续约日期';
COMMENT ON COLUMN "crm_renewals"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_renewals"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_renewals"."remark" IS '备注';
COMMENT ON COLUMN "crm_renewals"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_renewals"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_renewals"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_renewals"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_renewals"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_renewals"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_renewals"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_renewals"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_renewals"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_renewals"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_renewals" IS 'Renewals';
-- ----------------------------
-- Records of crm_renewals
-- ----------------------------
-- ----------------------------
-- Table structure for crm_report_instances
-- ----------------------------
-- ----------------------------
-- Table: crm_report_instances
-- ----------------------------
CREATE TABLE "crm_report_instances" (
  "id" int4 NOT NULL DEFAULT nextval('crm_report_instances_id_seq'::regclass),
  "template_id" int4 NOT NULL,
  "generated_by" int4 NOT NULL,
  "generated_at" timestamp(6) DEFAULT now(),
  "filter_params" json,
  "result_data" json,
  "total_rows" int4,
  "file_url" varchar(500) COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'completed'::character varying,
  "error_message" text COLLATE "pg_catalog"."default",
  "execution_time" int4,
  "created_id" int4,
  "updated_id" int4,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_report_instances"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_report_instances"."template_id" IS '模板ID';
COMMENT ON COLUMN "crm_report_instances"."generated_by" IS '生成人ID';
COMMENT ON COLUMN "crm_report_instances"."generated_at" IS '生成时间';
COMMENT ON COLUMN "crm_report_instances"."filter_params" IS '过滤参数';
COMMENT ON COLUMN "crm_report_instances"."result_data" IS '结果数据';
COMMENT ON COLUMN "crm_report_instances"."total_rows" IS '总行数';
COMMENT ON COLUMN "crm_report_instances"."file_url" IS '文件URL';
COMMENT ON COLUMN "crm_report_instances"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_report_instances"."error_message" IS '错误信息';
COMMENT ON COLUMN "crm_report_instances"."execution_time" IS '执行时间';
COMMENT ON COLUMN "crm_report_instances"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_report_instances"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_report_instances"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_report_instances"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_report_instances"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_report_instances"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_report_instances"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_report_instances"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_report_instances"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_report_instances"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_report_instances"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_report_instances" IS 'Report Instances';
-- ----------------------------
-- Records of crm_report_instances
-- ----------------------------
-- ----------------------------
-- Table structure for crm_report_templates
-- ----------------------------
-- ----------------------------
-- Table: crm_report_templates
-- ----------------------------
CREATE TABLE "crm_report_templates" (
  "id" int4 NOT NULL DEFAULT nextval('crm_report_templates_id_seq'::regclass),
  "template_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "template_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "report_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "query_config" json NOT NULL,
  "chart_config" json,
  "columns_config" json,
  "filter_config" json,
  "owner_id" int4,
  "is_public" bool DEFAULT false,
  "shared_roles" json,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_report_templates"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_report_templates"."template_code" IS '模板编号';
COMMENT ON COLUMN "crm_report_templates"."template_name" IS '模板名称';
COMMENT ON COLUMN "crm_report_templates"."report_type" IS '报表类型';
COMMENT ON COLUMN "crm_report_templates"."query_config" IS '查询配置';
COMMENT ON COLUMN "crm_report_templates"."chart_config" IS '图表配置';
COMMENT ON COLUMN "crm_report_templates"."columns_config" IS '列配置';
COMMENT ON COLUMN "crm_report_templates"."filter_config" IS '过滤配置';
COMMENT ON COLUMN "crm_report_templates"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_report_templates"."is_public" IS '是否公开';
COMMENT ON COLUMN "crm_report_templates"."shared_roles" IS '共享角色';
COMMENT ON COLUMN "crm_report_templates"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_report_templates"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_report_templates"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_report_templates"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_report_templates"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_report_templates"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_report_templates"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_report_templates"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_report_templates"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_report_templates"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_report_templates"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_report_templates" IS 'Report Templates';
-- ----------------------------
-- Records of crm_report_templates
-- ----------------------------
-- ----------------------------
-- Table structure for crm_sales_activities
-- ----------------------------
-- ----------------------------
-- Table: crm_sales_activities
-- ----------------------------
CREATE TABLE "crm_sales_activities" (
  "id" int4 NOT NULL DEFAULT nextval('crm_sales_activities_id_seq'::regclass),
  "customer_id" int4,
  "contact_id" int4,
  "opportunity_id" int4,
  "activity_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "subject" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "activity_date" date NOT NULL,
  "start_time" time(6),
  "end_time" time(6),
  "duration_minutes" int4,
  "participants" json,
  "outcome" varchar(200) COLLATE "pg_catalog"."default",
  "next_step" text COLLATE "pg_catalog"."default",
  "next_follow_date" date,
  "related_customer_id" int4,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_sales_activities"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_sales_activities"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_sales_activities"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "crm_sales_activities"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "crm_sales_activities"."activity_type" IS '活动类型';
COMMENT ON COLUMN "crm_sales_activities"."subject" IS '主题';
COMMENT ON COLUMN "crm_sales_activities"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_sales_activities"."activity_date" IS '活动日期';
COMMENT ON COLUMN "crm_sales_activities"."start_time" IS '开始时间';
COMMENT ON COLUMN "crm_sales_activities"."end_time" IS '结束时间';
COMMENT ON COLUMN "crm_sales_activities"."duration_minutes" IS '用时(分钟)';
COMMENT ON COLUMN "crm_sales_activities"."participants" IS '参与人';
COMMENT ON COLUMN "crm_sales_activities"."outcome" IS '结果';
COMMENT ON COLUMN "crm_sales_activities"."next_step" IS '下一步行动';
COMMENT ON COLUMN "crm_sales_activities"."next_follow_date" IS '下次跟进日期';
COMMENT ON COLUMN "crm_sales_activities"."related_customer_id" IS '关联客户ID,关联对应表';
COMMENT ON COLUMN "crm_sales_activities"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_sales_activities"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_sales_activities"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_sales_activities"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_sales_activities"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_sales_activities"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_sales_activities"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_sales_activities"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_sales_activities"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_sales_activities" IS 'Sales Activities';
-- ----------------------------
-- Records of crm_sales_activities
-- ----------------------------
-- ----------------------------
-- Table structure for crm_sales_targets
-- ----------------------------
-- ----------------------------
-- Table: crm_sales_targets
-- ----------------------------
CREATE TABLE "crm_sales_targets" (
  "id" int4 NOT NULL DEFAULT nextval('crm_sales_targets_id_seq'::regclass),
  "owner_id" int4 NOT NULL,
  "target_year" int4 NOT NULL,
  "target_quarter" int4,
  "target_month" int4,
  "target_amount" numeric(15,2) NOT NULL,
  "target_deals" int4,
  "target_new_customers" int4,
  "actual_amount" numeric(15,2) DEFAULT 0,
  "actual_deals" int4 DEFAULT 0,
  "actual_new_customers" int4 DEFAULT 0,
  "completion_rate" numeric(5,2) GENERATED ALWAYS AS (

CASE
    WHEN (target_amount > (0)::numeric) THEN ((actual_amount / target_amount) * (100)::numeric)
    ELSE (0)::numeric
END
) STORED,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4
)
;
COMMENT ON COLUMN "crm_sales_targets"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_sales_targets"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_sales_targets"."target_year" IS '目标年份';
COMMENT ON COLUMN "crm_sales_targets"."target_quarter" IS '目标季度';
COMMENT ON COLUMN "crm_sales_targets"."target_month" IS '目标月份';
COMMENT ON COLUMN "crm_sales_targets"."target_amount" IS '目标金额';
COMMENT ON COLUMN "crm_sales_targets"."target_deals" IS '目标成交数';
COMMENT ON COLUMN "crm_sales_targets"."target_new_customers" IS '目标新客数';
COMMENT ON COLUMN "crm_sales_targets"."actual_amount" IS '实际金额';
COMMENT ON COLUMN "crm_sales_targets"."actual_deals" IS '实际成交数';
COMMENT ON COLUMN "crm_sales_targets"."actual_new_customers" IS '实际新客数';
COMMENT ON COLUMN "crm_sales_targets"."completion_rate" IS '完成比率';
COMMENT ON COLUMN "crm_sales_targets"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_sales_targets"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_sales_targets"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_sales_targets"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_sales_targets"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_sales_targets"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_sales_targets"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_sales_targets"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_sales_targets"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "crm_sales_targets" IS 'Sales Targets';
-- ----------------------------
-- Records of crm_sales_targets
-- ----------------------------
-- ----------------------------
-- Table structure for crm_satisfaction_surveys
-- ----------------------------
-- ----------------------------
-- Table: crm_satisfaction_surveys
-- ----------------------------
CREATE TABLE "crm_satisfaction_surveys" (
  "id" int4 NOT NULL DEFAULT nextval('crm_satisfaction_surveys_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "survey_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "survey_date" date NOT NULL,
  "overall_score" numeric(3,1) NOT NULL,
  "product_quality_score" numeric(3,1),
  "service_score" numeric(3,1),
  "delivery_score" numeric(3,1),
  "communication_score" numeric(3,1),
  "strengths" text COLLATE "pg_catalog"."default",
  "weaknesses" text COLLATE "pg_catalog"."default",
  "suggestions" text COLLATE "pg_catalog"."default",
  "nps_score" int4,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'completed'::character varying,
  "created_id" int4,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_satisfaction_surveys"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_satisfaction_surveys"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_satisfaction_surveys"."survey_type" IS '调查类型';
COMMENT ON COLUMN "crm_satisfaction_surveys"."survey_date" IS '调查日期';
COMMENT ON COLUMN "crm_satisfaction_surveys"."overall_score" IS '综合评分';
COMMENT ON COLUMN "crm_satisfaction_surveys"."product_quality_score" IS '产品质量评分';
COMMENT ON COLUMN "crm_satisfaction_surveys"."service_score" IS '服务评分';
COMMENT ON COLUMN "crm_satisfaction_surveys"."delivery_score" IS '交付评分';
COMMENT ON COLUMN "crm_satisfaction_surveys"."communication_score" IS '沟通评分';
COMMENT ON COLUMN "crm_satisfaction_surveys"."strengths" IS '优势分析';
COMMENT ON COLUMN "crm_satisfaction_surveys"."weaknesses" IS '劣势分析';
COMMENT ON COLUMN "crm_satisfaction_surveys"."suggestions" IS '改进建议';
COMMENT ON COLUMN "crm_satisfaction_surveys"."nps_score" IS 'NPS评分';
COMMENT ON COLUMN "crm_satisfaction_surveys"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_satisfaction_surveys"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_satisfaction_surveys"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_satisfaction_surveys"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_satisfaction_surveys"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_satisfaction_surveys"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_satisfaction_surveys"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_satisfaction_surveys"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_satisfaction_surveys"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_satisfaction_surveys"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_satisfaction_surveys"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_satisfaction_surveys" IS 'Satisfaction Surveys';
-- ----------------------------
-- Records of crm_satisfaction_surveys
-- ----------------------------
-- ----------------------------
-- Table structure for crm_service_tickets
-- ----------------------------
-- ----------------------------
-- Table: crm_service_tickets
-- ----------------------------
CREATE TABLE "crm_service_tickets" (
  "id" int4 NOT NULL DEFAULT nextval('crm_service_tickets_id_seq'::regclass),
  "ticket_no" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" int4 NOT NULL,
  "contact_id" int4,
  "contract_id" int4,
  "ticket_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "priority" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'medium'::character varying,
  "title" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "status" varchar(30) COLLATE "pg_catalog"."default" DEFAULT 'open'::character varying,
  "assignee_id" int4,
  "reporter_id" int4,
  "source" varchar(50) COLLATE "pg_catalog"."default",
  "category" varchar(100) COLLATE "pg_catalog"."default",
  "expected_resolution_time" timestamp(6),
  "actual_resolution_time" timestamp(6),
  "resolution_notes" text COLLATE "pg_catalog"."default",
  "customer_satisfaction" int4,
  "sla_hours" int4,
  "is_overdue" bool DEFAULT false,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" DEFAULT (gen_random_uuid())::text,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4,
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_service_tickets"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_service_tickets"."ticket_no" IS '工单编号(格式:TKT-YYYYMMDD-XXXX)';
COMMENT ON COLUMN "crm_service_tickets"."customer_id" IS '客户ID(关联crm_customers.id)';
COMMENT ON COLUMN "crm_service_tickets"."contact_id" IS '联系人ID(关联crm_contacts.id)';
COMMENT ON COLUMN "crm_service_tickets"."contract_id" IS '合同ID(关联crm_contracts.id)';
COMMENT ON COLUMN "crm_service_tickets"."ticket_type" IS '工单类型(repair:报修/consultation:咨询/complaint:投诉/other:其他)';
COMMENT ON COLUMN "crm_service_tickets"."priority" IS '优先级(urgent:紧急/high:高/medium:中/low:低)';
COMMENT ON COLUMN "crm_service_tickets"."title" IS '工单标题';
COMMENT ON COLUMN "crm_service_tickets"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_service_tickets"."status" IS '工单状态(open:待处理/processing:处理中/resolved:已解决/closed:已关闭)';
COMMENT ON COLUMN "crm_service_tickets"."assignee_id" IS '处理人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_service_tickets"."reporter_id" IS '报备人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_service_tickets"."source" IS '工单来源';
COMMENT ON COLUMN "crm_service_tickets"."category" IS '工单分类';
COMMENT ON COLUMN "crm_service_tickets"."expected_resolution_time" IS '预期解决时间';
COMMENT ON COLUMN "crm_service_tickets"."actual_resolution_time" IS '实际解决时间';
COMMENT ON COLUMN "crm_service_tickets"."resolution_notes" IS '解决备注';
COMMENT ON COLUMN "crm_service_tickets"."customer_satisfaction" IS '客户满意度(1-5分)';
COMMENT ON COLUMN "crm_service_tickets"."sla_hours" IS 'SLA时效(小时)';
COMMENT ON COLUMN "crm_service_tickets"."is_overdue" IS '是否超时';
COMMENT ON COLUMN "crm_service_tickets"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_service_tickets"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_service_tickets"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_service_tickets"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_service_tickets"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_service_tickets"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_service_tickets"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_service_tickets"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_service_tickets"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_service_tickets"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_service_tickets" IS '服务工单管理表';
-- ----------------------------
-- Records of crm_service_tickets
-- ----------------------------
-- ----------------------------
-- Table structure for crm_tag_definitions
-- ----------------------------
-- ----------------------------
-- Table: crm_tag_definitions
-- ----------------------------
CREATE TABLE "crm_tag_definitions" (
  "id" int8 NOT NULL DEFAULT nextval('crm_tag_definitions_id_seq'::regclass),
  "tag_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "tag_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "tag_type" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "category" varchar(50) COLLATE "pg_catalog"."default",
  "color" varchar(20) COLLATE "pg_catalog"."default",
  "icon" varchar(50) COLLATE "pg_catalog"."default",
  "applicable_types" varchar(20)[] COLLATE "pg_catalog"."default" DEFAULT '{}'::character varying[],
  "is_multi_select" bool DEFAULT true,
  "is_required" bool DEFAULT false,
  "validation_rule" varchar(200) COLLATE "pg_catalog"."default",
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "sort_order" int4 DEFAULT 0,
  "usage_count" int4 DEFAULT 0,
  "created_time" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamptz(6),
  "created_id" int8,
  "updated_id" int8,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_tag_definitions"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_tag_definitions"."tag_code" IS '标签编号';
COMMENT ON COLUMN "crm_tag_definitions"."tag_name" IS '标签名称';
COMMENT ON COLUMN "crm_tag_definitions"."tag_type" IS '标签类型';
COMMENT ON COLUMN "crm_tag_definitions"."category" IS '分类';
COMMENT ON COLUMN "crm_tag_definitions"."color" IS '颜色';
COMMENT ON COLUMN "crm_tag_definitions"."icon" IS '图标';
COMMENT ON COLUMN "crm_tag_definitions"."applicable_types" IS '适用类型';
COMMENT ON COLUMN "crm_tag_definitions"."is_multi_select" IS '是否多选';
COMMENT ON COLUMN "crm_tag_definitions"."is_required" IS '是否必填';
COMMENT ON COLUMN "crm_tag_definitions"."validation_rule" IS '验证规则';
COMMENT ON COLUMN "crm_tag_definitions"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_tag_definitions"."sort_order" IS '排序';
COMMENT ON COLUMN "crm_tag_definitions"."usage_count" IS '使用次数';
COMMENT ON COLUMN "crm_tag_definitions"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_tag_definitions"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_tag_definitions"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_tag_definitions"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_tag_definitions"."version" IS '版本号';
COMMENT ON COLUMN "crm_tag_definitions"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_tag_definitions"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_tag_definitions"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_tag_definitions"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_tag_definitions"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_tag_definitions"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_tag_definitions"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_tag_definitions" IS 'Tag Definitions';
-- ----------------------------
-- Records of crm_tag_definitions
-- ----------------------------
-- ----------------------------
-- Table structure for crm_tags
-- ----------------------------
-- ----------------------------
-- Table: crm_tags
-- ----------------------------
CREATE TABLE "crm_tags" (
  "id" int4 NOT NULL DEFAULT nextval('crm_tags_id_seq'::regclass),
  "tag_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "tag_category" varchar(50) COLLATE "pg_catalog"."default",
  "tag_color" varchar(20) COLLATE "pg_catalog"."default",
  "tag_icon" varchar(100) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "ai_accuracy" numeric(5,2),
  "usage_count" int4 DEFAULT 0,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "sort" int4 DEFAULT 0,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_tags"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_tags"."tag_name" IS '标签名称';
COMMENT ON COLUMN "crm_tags"."tag_category" IS '标签分类';
COMMENT ON COLUMN "crm_tags"."tag_color" IS '标签颜色';
COMMENT ON COLUMN "crm_tags"."tag_icon" IS '标签图标';
COMMENT ON COLUMN "crm_tags"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_tags"."ai_accuracy" IS 'AI准确率';
COMMENT ON COLUMN "crm_tags"."usage_count" IS '使用次数';
COMMENT ON COLUMN "crm_tags"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_tags"."sort" IS '排序';
COMMENT ON COLUMN "crm_tags"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_tags"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_tags"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_tags"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_tags"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_tags"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_tags"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_tags"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_tags"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_tags"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_tags" IS 'Tags';
-- ----------------------------
-- Records of crm_tags
-- ----------------------------
-- ----------------------------
-- Table structure for crm_tasks
-- ----------------------------
-- ----------------------------
-- Table: crm_tasks
-- ----------------------------
CREATE TABLE "crm_tasks" (
  "id" int4 NOT NULL DEFAULT nextval('crm_tasks_id_seq'::regclass),
  "task_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "title" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "customer_id" int4,
  "contact_id" int4,
  "opportunity_id" int4,
  "contract_id" int4,
  "assignee_id" int4 NOT NULL,
  "assigner_id" int4,
  "due_date" date NOT NULL,
  "priority" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'medium'::character varying,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "completed_at" timestamp(6),
  "remind_enabled" bool DEFAULT true,
  "remind_before_minutes" int4 DEFAULT 60,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "is_deleted" bool DEFAULT false,
  "created_id" int4,
  "updated_id" int4,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_tasks"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_tasks"."task_type" IS '任务类型';
COMMENT ON COLUMN "crm_tasks"."title" IS '职位';
COMMENT ON COLUMN "crm_tasks"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_tasks"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_tasks"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "crm_tasks"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "crm_tasks"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "crm_tasks"."assignee_id" IS '接收人ID,关联对应表';
COMMENT ON COLUMN "crm_tasks"."assigner_id" IS '分配人ID,关联对应表';
COMMENT ON COLUMN "crm_tasks"."due_date" IS '到期日期';
COMMENT ON COLUMN "crm_tasks"."priority" IS '优先级';
COMMENT ON COLUMN "crm_tasks"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_tasks"."completed_at" IS '完成时间';
COMMENT ON COLUMN "crm_tasks"."remind_enabled" IS '是否启用提醒';
COMMENT ON COLUMN "crm_tasks"."remind_before_minutes" IS '提前提醒分钟数';
COMMENT ON COLUMN "crm_tasks"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_tasks"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_tasks"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_tasks"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_tasks"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_tasks"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_tasks"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_tasks"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_tasks"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_tasks"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_tasks" IS 'Tasks';
-- ----------------------------
-- Records of crm_tasks
-- ----------------------------
-- ----------------------------
-- Table structure for crm_test_monitor_report
-- ----------------------------
-- ----------------------------
-- Table: crm_test_monitor_report
-- ----------------------------
CREATE TABLE "crm_test_monitor_report" (
  "report_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "test_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "total_tests" int4 NOT NULL,
  "passed_count" int4 NOT NULL,
  "failed_count" int4 NOT NULL,
  "error_count" int4 NOT NULL,
  "skipped_count" int4 NOT NULL,
  "pass_rate" float8 NOT NULL,
  "start_time" timestamp(6),
  "end_time" timestamp(6),
  "duration" float8,
  "report_file" varchar(500) COLLATE "pg_catalog"."default",
  "log_file" varchar(500) COLLATE "pg_catalog"."default",
  "file_size" varchar(50) COLLATE "pg_catalog"."default",
  "error_message" text COLLATE "pg_catalog"."default",
  "test_summary" text COLLATE "pg_catalog"."default",
  "environment" varchar(100) COLLATE "pg_catalog"."default",
  "is_completed" int4 NOT NULL,
  "created_by" int4,
  "updated_by" int4,
  "created_at" timestamp(6),
  "updated_at" timestamp(6),
  "deleted_at" timestamp(6),
  "remark" varchar(500) COLLATE "pg_catalog"."default",
  "id" int4 NOT NULL DEFAULT nextval('crm_test_monitor_report_id_seq'::regclass),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6)
)
;
COMMENT ON COLUMN "crm_test_monitor_report"."report_name" IS '报告名称';
COMMENT ON COLUMN "crm_test_monitor_report"."test_type" IS '测试类型(api/ui/all)';
COMMENT ON COLUMN "crm_test_monitor_report"."total_tests" IS '总测试数';
COMMENT ON COLUMN "crm_test_monitor_report"."passed_count" IS '通过数';
COMMENT ON COLUMN "crm_test_monitor_report"."failed_count" IS '失败数';
COMMENT ON COLUMN "crm_test_monitor_report"."error_count" IS '错误数';
COMMENT ON COLUMN "crm_test_monitor_report"."skipped_count" IS '跳过数';
COMMENT ON COLUMN "crm_test_monitor_report"."pass_rate" IS '通过率(%)';
COMMENT ON COLUMN "crm_test_monitor_report"."start_time" IS '开始时间';
COMMENT ON COLUMN "crm_test_monitor_report"."end_time" IS '结束时间';
COMMENT ON COLUMN "crm_test_monitor_report"."duration" IS '执行时长(秒)';
COMMENT ON COLUMN "crm_test_monitor_report"."report_file" IS '报告文件路径';
COMMENT ON COLUMN "crm_test_monitor_report"."log_file" IS '日志文件路径';
COMMENT ON COLUMN "crm_test_monitor_report"."file_size" IS '文件大小';
COMMENT ON COLUMN "crm_test_monitor_report"."error_message" IS '错误信息';
COMMENT ON COLUMN "crm_test_monitor_report"."test_summary" IS '测试摘要';
COMMENT ON COLUMN "crm_test_monitor_report"."environment" IS '测试环境';
COMMENT ON COLUMN "crm_test_monitor_report"."is_completed" IS '是否完成(0否/1是)';
COMMENT ON COLUMN "crm_test_monitor_report"."created_by" IS '创建人ID';
COMMENT ON COLUMN "crm_test_monitor_report"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "crm_test_monitor_report"."created_at" IS '创建时间';
COMMENT ON COLUMN "crm_test_monitor_report"."updated_at" IS '更新时间';
COMMENT ON COLUMN "crm_test_monitor_report"."deleted_at" IS '删除时间';
COMMENT ON COLUMN "crm_test_monitor_report"."remark" IS '备注';
COMMENT ON COLUMN "crm_test_monitor_report"."id" IS '主键ID';
COMMENT ON COLUMN "crm_test_monitor_report"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_test_monitor_report"."status" IS '状态(0';
COMMENT ON COLUMN "crm_test_monitor_report"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_test_monitor_report"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_test_monitor_report"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_test_monitor_report"."created_id" IS '创建人ID';
COMMENT ON COLUMN "crm_test_monitor_report"."updated_id" IS '更新人ID';
COMMENT ON TABLE "crm_test_monitor_report" IS 'CRM监控报告';
-- ----------------------------
-- Records of crm_test_monitor_report
-- ----------------------------
-- ----------------------------
-- Table structure for crm_user_extensions
-- ----------------------------
-- ----------------------------
-- Table: crm_user_extensions
-- ----------------------------
CREATE TABLE "crm_user_extensions" (
  "id" int8 NOT NULL DEFAULT nextval('crm_user_extensions_id_seq'::regclass),
  "user_id" int4 NOT NULL,
  "sales_area" varchar(100) COLLATE "pg_catalog"."default",
  "team_id" int4,
  "territory" varchar(100) COLLATE "pg_catalog"."default",
  "sales_targets" numeric(18,2),
  "commission_rate" numeric(5,2),
  "max_discount" numeric(5,2),
  "manager_id" int4,
  "max_customers" int4,
  "auto_assign_enabled" bool DEFAULT true,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "created_id" int4,
  "updated_id" int4,
  "version" int4 DEFAULT 1,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_user_extensions"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_user_extensions"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "crm_user_extensions"."sales_area" IS '销售区域';
COMMENT ON COLUMN "crm_user_extensions"."team_id" IS '团队ID';
COMMENT ON COLUMN "crm_user_extensions"."territory" IS '领土';
COMMENT ON COLUMN "crm_user_extensions"."sales_targets" IS '销售目标';
COMMENT ON COLUMN "crm_user_extensions"."commission_rate" IS '佣金比率';
COMMENT ON COLUMN "crm_user_extensions"."max_discount" IS '最大折扣';
COMMENT ON COLUMN "crm_user_extensions"."manager_id" IS '经理ID,关联sys_users';
COMMENT ON COLUMN "crm_user_extensions"."max_customers" IS '最大客户数';
COMMENT ON COLUMN "crm_user_extensions"."auto_assign_enabled" IS '自动分配启用';
COMMENT ON COLUMN "crm_user_extensions"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_user_extensions"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_user_extensions"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_user_extensions"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_user_extensions"."version" IS '版本号';
COMMENT ON COLUMN "crm_user_extensions"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_user_extensions"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_user_extensions"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_user_extensions"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_user_extensions"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_user_extensions"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_user_extensions"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_user_extensions" IS 'User Extensions';
-- ----------------------------
-- Records of crm_user_extensions
-- ----------------------------
-- ----------------------------
-- Table structure for crm_visit_records
-- ----------------------------
-- ----------------------------
-- Table: crm_visit_records
-- ----------------------------
CREATE TABLE "crm_visit_records" (
  "id" int4 NOT NULL DEFAULT nextval('crm_visit_records_id_seq'::regclass),
  "customer_id" int4 NOT NULL,
  "contact_id" int4,
  "opportunity_id" int4,
  "visit_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "visit_date" date NOT NULL,
  "start_time" time(6),
  "end_time" time(6),
  "duration_minutes" int4,
  "location" varchar(500) COLLATE "pg_catalog"."default",
  "purpose" text COLLATE "pg_catalog"."default",
  "participants" text COLLATE "pg_catalog"."default",
  "summary" text COLLATE "pg_catalog"."default",
  "outcome" text COLLATE "pg_catalog"."default",
  "next_action" text COLLATE "pg_catalog"."default",
  "next_visit_date" date,
  "expense_amount" numeric(10,2),
  "mileage" float8,
  "transport_type" varchar(50) COLLATE "pg_catalog"."default",
  "is_successful" bool,
  "rating" int4,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" DEFAULT (gen_random_uuid())::text,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4,
  "is_deleted" bool DEFAULT false,
  "deleted_time" timestamp(6),
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_visit_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_visit_records"."customer_id" IS '客户ID(关联crm_customers.id)';
COMMENT ON COLUMN "crm_visit_records"."contact_id" IS '联系人ID(关联crm_contacts.id)';
COMMENT ON COLUMN "crm_visit_records"."opportunity_id" IS '商机ID(关联crm_opportunities.id)';
COMMENT ON COLUMN "crm_visit_records"."visit_type" IS '拜访类型(first_visit/requirement/demo/negotiation/return_visit/other)';
COMMENT ON COLUMN "crm_visit_records"."visit_date" IS '拜访日期';
COMMENT ON COLUMN "crm_visit_records"."start_time" IS '开始时间';
COMMENT ON COLUMN "crm_visit_records"."end_time" IS '结束时间';
COMMENT ON COLUMN "crm_visit_records"."duration_minutes" IS '拜访时长(分钟)';
COMMENT ON COLUMN "crm_visit_records"."location" IS '拜访地点';
COMMENT ON COLUMN "crm_visit_records"."purpose" IS '拜访目的';
COMMENT ON COLUMN "crm_visit_records"."participants" IS '参与人员';
COMMENT ON COLUMN "crm_visit_records"."summary" IS '拜访总结';
COMMENT ON COLUMN "crm_visit_records"."outcome" IS '拜访结果';
COMMENT ON COLUMN "crm_visit_records"."next_action" IS '后续行动';
COMMENT ON COLUMN "crm_visit_records"."next_visit_date" IS '下次拜访日期';
COMMENT ON COLUMN "crm_visit_records"."expense_amount" IS '拜访费用(元)';
COMMENT ON COLUMN "crm_visit_records"."mileage" IS '拜访里程(公里)';
COMMENT ON COLUMN "crm_visit_records"."transport_type" IS '出行方式';
COMMENT ON COLUMN "crm_visit_records"."is_successful" IS '是否成功';
COMMENT ON COLUMN "crm_visit_records"."rating" IS '拜访评分(1-5)';
COMMENT ON COLUMN "crm_visit_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_visit_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_visit_records"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_visit_records"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_visit_records"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_visit_records"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "crm_visit_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_visit_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_visit_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_visit_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_visit_records" IS '拜访记录表';
-- ----------------------------
-- Records of crm_visit_records
-- ----------------------------
-- ----------------------------
-- Table structure for crm_workflow_approvals
-- ----------------------------
-- ----------------------------
-- Table: crm_workflow_approvals
-- ----------------------------
CREATE TABLE "crm_workflow_approvals" (
  "id" int4 NOT NULL DEFAULT nextval('crm_workflow_approvals_id_seq'::regclass),
  "workflow_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "related_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "related_id" int4 NOT NULL,
  "current_step" int4 DEFAULT 1,
  "total_steps" int4 NOT NULL,
  "status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'pending'::character varying,
  "initiator_id" int4 NOT NULL,
  "initiated_at" timestamp(6) DEFAULT now(),
  "remark" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_workflow_approvals"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_workflow_approvals"."workflow_type" IS '工作流类型';
COMMENT ON COLUMN "crm_workflow_approvals"."related_type" IS '关联类型';
COMMENT ON COLUMN "crm_workflow_approvals"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "crm_workflow_approvals"."current_step" IS '当前步骤';
COMMENT ON COLUMN "crm_workflow_approvals"."total_steps" IS '总步骤数';
COMMENT ON COLUMN "crm_workflow_approvals"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "crm_workflow_approvals"."initiator_id" IS '发起人ID,关联对应表';
COMMENT ON COLUMN "crm_workflow_approvals"."initiated_at" IS '发起时间';
COMMENT ON COLUMN "crm_workflow_approvals"."remark" IS '备注';
COMMENT ON COLUMN "crm_workflow_approvals"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_workflow_approvals"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_workflow_approvals"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_workflow_approvals"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_workflow_approvals"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_workflow_approvals"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_workflow_approvals"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_workflow_approvals"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_workflow_approvals"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_workflow_approvals"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_workflow_approvals"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_workflow_approvals" IS 'Workflow Approvals';
-- ----------------------------
-- Records of crm_workflow_approvals
-- ----------------------------
-- ----------------------------
-- Table structure for crm_workflow_logs
-- ----------------------------
-- ----------------------------
-- Table: crm_workflow_logs
-- ----------------------------
CREATE TABLE "crm_workflow_logs" (
  "id" int4 NOT NULL DEFAULT nextval('crm_workflow_logs_id_seq'::regclass),
  "rule_id" int4 NOT NULL,
  "customer_id" int4,
  "opportunity_id" int4,
  "trigger_data" json,
  "execution_result" varchar(50) COLLATE "pg_catalog"."default",
  "error_message" text COLLATE "pg_catalog"."default",
  "executed_at" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "created_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_time" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_workflow_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_workflow_logs"."rule_id" IS '规则ID,关联对应表';
COMMENT ON COLUMN "crm_workflow_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "crm_workflow_logs"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "crm_workflow_logs"."trigger_data" IS '触发数据';
COMMENT ON COLUMN "crm_workflow_logs"."execution_result" IS '执行结果';
COMMENT ON COLUMN "crm_workflow_logs"."error_message" IS '错误信息';
COMMENT ON COLUMN "crm_workflow_logs"."executed_at" IS '执行时间';
COMMENT ON COLUMN "crm_workflow_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_workflow_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_workflow_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_workflow_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_workflow_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_workflow_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_workflow_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_workflow_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_workflow_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_workflow_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_workflow_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_workflow_logs" IS 'Workflow Logs';
-- ----------------------------
-- Records of crm_workflow_logs
-- ----------------------------
-- ----------------------------
-- Table structure for crm_workflow_rules
-- ----------------------------
-- ----------------------------
-- Table: crm_workflow_rules
-- ----------------------------
CREATE TABLE "crm_workflow_rules" (
  "id" int4 NOT NULL DEFAULT nextval('crm_workflow_rules_id_seq'::regclass),
  "rule_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "rule_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_event" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "trigger_condition" json,
  "action_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "action_config" json,
  "enabled" bool DEFAULT true,
  "priority" int4 DEFAULT 0,
  "created_time" timestamp(6) DEFAULT now(),
  "updated_time" timestamp(6) DEFAULT now(),
  "created_id" int4,
  "updated_id" int4,
  "is_deleted" bool NOT NULL DEFAULT false,
  "deleted_time" timestamp(6),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT (gen_random_uuid())::text,
  "deleted_id" int4,
  "description" text COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "owner_id" int4
)
;
COMMENT ON COLUMN "crm_workflow_rules"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "crm_workflow_rules"."rule_name" IS '规则名称';
COMMENT ON COLUMN "crm_workflow_rules"."rule_type" IS '规则类型';
COMMENT ON COLUMN "crm_workflow_rules"."trigger_event" IS '触发事件';
COMMENT ON COLUMN "crm_workflow_rules"."trigger_condition" IS '触发条件';
COMMENT ON COLUMN "crm_workflow_rules"."action_type" IS '操作类型';
COMMENT ON COLUMN "crm_workflow_rules"."action_config" IS '动作配置';
COMMENT ON COLUMN "crm_workflow_rules"."enabled" IS '是否启用';
COMMENT ON COLUMN "crm_workflow_rules"."priority" IS '优先级';
COMMENT ON COLUMN "crm_workflow_rules"."created_time" IS '创建时间';
COMMENT ON COLUMN "crm_workflow_rules"."updated_time" IS '更新时间';
COMMENT ON COLUMN "crm_workflow_rules"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_workflow_rules"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_workflow_rules"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "crm_workflow_rules"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "crm_workflow_rules"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "crm_workflow_rules"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "crm_workflow_rules"."description" IS '备注/描述';
COMMENT ON COLUMN "crm_workflow_rules"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "crm_workflow_rules"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "crm_workflow_rules" IS 'Workflow Rules';
-- ----------------------------
-- Records of crm_workflow_rules
-- ----------------------------
-- ----------------------------

CREATE INDEX "idx_crm_ai_customer_profiles_customer_id" ON "crm_ai_customer_profiles" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_deleted_id" ON "crm_ai_customer_profiles" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_deleted_time" ON "crm_ai_customer_profiles" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_dept_id" ON "crm_ai_customer_profiles" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_is_deleted" ON "crm_ai_customer_profiles" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_owner_id" ON "crm_ai_customer_profiles" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_profiles_customer" ON "crm_ai_customer_profiles" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_profiles_score" ON "crm_ai_customer_profiles" USING btree (
"overall_score" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_ai_customer_profiles" ADD CONSTRAINT "crm_ai_customer_profiles_customer_id_key" UNIQUE ("customer_id");
ALTER TABLE "crm_ai_customer_profiles" ADD CONSTRAINT "crm_ai_customer_profiles_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_ai_recommendations_deleted_id" ON "crm_ai_recommendations" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_deleted_time" ON "crm_ai_recommendations" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_dept_id" ON "crm_ai_recommendations" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_entity" ON "crm_ai_recommendations" USING btree (
"entity_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"entity_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"created_time" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_ai_recommendations_entity_id" ON "crm_ai_recommendations" USING btree (
"entity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_is_deleted" ON "crm_ai_recommendations" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_owner_id" ON "crm_ai_recommendations" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_type" ON "crm_ai_recommendations" USING btree (
"recommendation_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_ai_recommendations" ADD CONSTRAINT "crm_ai_recommendations_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_ai_tags_deleted_id" ON "crm_ai_tags" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_tags_deleted_time" ON "crm_ai_tags" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_tags_dept_id" ON "crm_ai_tags" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_tags_is_deleted" ON "crm_ai_tags" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_tags_owner_id" ON "crm_ai_tags" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_ai_tags" ADD CONSTRAINT "crm_ai_tags_tag_code_key" UNIQUE ("tag_code");
ALTER TABLE "crm_ai_tags" ADD CONSTRAINT "crm_ai_tags_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_alert_rules_active" ON "crm_alert_rules" USING btree (
"is_active" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_code" ON "crm_alert_rules" USING btree (
"rule_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_dept_id" ON "crm_alert_rules" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_owner_id" ON "crm_alert_rules" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_severity" ON "crm_alert_rules" USING btree (
"severity" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_type" ON "crm_alert_rules" USING btree (
"alert_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_alert_rules" ADD CONSTRAINT "crm_alert_rules_rule_code_key" UNIQUE ("rule_code");
ALTER TABLE "crm_alert_rules" ADD CONSTRAINT "crm_alert_rules_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_approval_records_applicant" ON "crm_approval_records" USING btree (
"applicant_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_approver" ON "crm_approval_records" USING btree (
"current_approver_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_dept_id" ON "crm_approval_records" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_no" ON "crm_approval_records" USING btree (
"approval_no" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_owner_id" ON "crm_approval_records" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_status" ON "crm_approval_records" USING btree (
"approval_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_type" ON "crm_approval_records" USING btree (
"approval_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_approval_records" ADD CONSTRAINT "crm_approval_records_approval_no_key" UNIQUE ("approval_no");
ALTER TABLE "crm_approval_records" ADD CONSTRAINT "crm_approval_records_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_call_records_call_time" ON "crm_call_records" USING btree (
"call_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_call_records_call_type" ON "crm_call_records" USING btree (
"call_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_call_records_customer" ON "crm_call_records" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_call_records_dept_id" ON "crm_call_records" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_call_records_owner_id" ON "crm_call_records" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_call_records" ADD CONSTRAINT "crm_call_records_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_campaign_leads_campaign" ON "crm_campaign_leads" USING btree (
"campaign_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_campaign_leads_converted" ON "crm_campaign_leads" USING btree (
"is_converted" "pg_catalog"."bool_ops" ASC NULLS LAST
) WHERE is_converted = true;
CREATE INDEX "idx_campaign_leads_engagement" ON "crm_campaign_leads" USING btree (
"engagement_score" "pg_catalog"."numeric_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_campaign_leads_lead" ON "crm_campaign_leads" USING btree (
"lead_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_campaign" ON "crm_campaign_leads" USING btree (
"campaign_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_campaign_id" ON "crm_campaign_leads" USING btree (
"campaign_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_converted_customer_id" ON "crm_campaign_leads" USING btree (
"converted_customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_deleted_id" ON "crm_campaign_leads" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_deleted_time" ON "crm_campaign_leads" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_dept_id" ON "crm_campaign_leads" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_is_deleted" ON "crm_campaign_leads" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_lead" ON "crm_campaign_leads" USING btree (
"lead_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_lead_id" ON "crm_campaign_leads" USING btree (
"lead_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_owner_id" ON "crm_campaign_leads" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_campaign_leads" ADD CONSTRAINT "crm_campaign_leads_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_campaigns_code" ON "crm_campaigns" USING btree (
"campaign_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_dates" ON "crm_campaigns" USING btree (
"planned_start_date" "pg_catalog"."date_ops" ASC NULLS LAST,
"planned_end_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_deleted_id" ON "crm_campaigns" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_deleted_time" ON "crm_campaigns" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_department_id" ON "crm_campaigns" USING btree (
"department_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_dept_id" ON "crm_campaigns" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_is_deleted" ON "crm_campaigns" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_owner" ON "crm_campaigns" USING btree (
"owner_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_owner_id" ON "crm_campaigns" USING btree (
"owner_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_related_campaign_id" ON "crm_campaigns" USING btree (
"related_campaign_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_status" ON "crm_campaigns" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_type" ON "crm_campaigns" USING btree (
"campaign_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_campaigns" ADD CONSTRAINT "crm_campaigns_campaign_code_key" UNIQUE ("campaign_code");
ALTER TABLE "crm_campaigns" ADD CONSTRAINT "crm_campaigns_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_competitors_code" ON "crm_competitors" USING btree (
"competitor_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_competitors_dept_id" ON "crm_competitors" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_competitors_owner_id" ON "crm_competitors" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_competitors_threat_level" ON "crm_competitors" USING btree (
"threat_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_competitors" ADD CONSTRAINT "crm_competitors_competitor_code_key" UNIQUE ("competitor_code");
ALTER TABLE "crm_competitors" ADD CONSTRAINT "crm_competitors_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_contact_change_logs_contact" ON "crm_contact_change_logs" USING btree (
"contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"changed_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_contact_change_logs_contact_id" ON "crm_contact_change_logs" USING btree (
"contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_created_by" ON "crm_contact_change_logs" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_customer" ON "crm_contact_change_logs" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_customer_id" ON "crm_contact_change_logs" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_deleted_id" ON "crm_contact_change_logs" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_deleted_time" ON "crm_contact_change_logs" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_dept_id" ON "crm_contact_change_logs" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_is_deleted" ON "crm_contact_change_logs" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_operator_id" ON "crm_contact_change_logs" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_owner_id" ON "crm_contact_change_logs" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_contact_change_logs" ADD CONSTRAINT "crm_contact_change_logs_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_contact_relations_contact" ON "crm_contact_relations" USING btree (
"contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_contact_id" ON "crm_contact_relations" USING btree (
"contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_deleted_id" ON "crm_contact_relations" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_deleted_time" ON "crm_contact_relations" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_dept_id" ON "crm_contact_relations" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_entity" ON "crm_contact_relations" USING btree (
"related_entity_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"related_entity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_owner_id" ON "crm_contact_relations" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_related" ON "crm_contact_relations" USING btree (
"related_contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_related_contact_id" ON "crm_contact_relations" USING btree (
"related_contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_related_entity_id" ON "crm_contact_relations" USING btree (
"related_entity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_type" ON "crm_contact_relations" USING btree (
"relation_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_contact_relations" ADD CONSTRAINT "crm_contact_relations_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_contact_visits_contact" ON "crm_contact_visits" USING btree (
"contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"visit_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_contact_visits_contact_id" ON "crm_contact_visits" USING btree (
"contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_customer" ON "crm_contact_visits" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"visit_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_contact_visits_customer_id" ON "crm_contact_visits" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_deleted_id" ON "crm_contact_visits" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_deleted_time" ON "crm_contact_visits" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_dept_id" ON "crm_contact_visits" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_owner_id" ON "crm_contact_visits" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_visitor" ON "crm_contact_visits" USING btree (
"visitor_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_visitor_id" ON "crm_contact_visits" USING btree (
"visitor_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_contact_visits" ADD CONSTRAINT "crm_contact_visits_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_contacts_customer" ON "crm_contacts" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_customer_id" ON "crm_contacts" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_deleted_id" ON "crm_contacts" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_deleted_time" ON "crm_contacts" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_dept_id" ON "crm_contacts" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_name" ON "crm_contacts" USING btree (
"contact_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_owner_id" ON "crm_contacts" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_primary" ON "crm_contacts" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"is_primary" "pg_catalog"."bool_ops" ASC NULLS LAST
);
ALTER TABLE "crm_contacts" ADD CONSTRAINT "crm_contacts_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_contract_invoices_contract" ON "crm_contract_invoices" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_contract_id" ON "crm_contract_invoices" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_date" ON "crm_contract_invoices" USING btree (
"invoice_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_deleted_id" ON "crm_contract_invoices" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_deleted_time" ON "crm_contract_invoices" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_dept_id" ON "crm_contract_invoices" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_owner_id" ON "crm_contract_invoices" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_payment_plan_id" ON "crm_contract_invoices" USING btree (
"payment_plan_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_status" ON "crm_contract_invoices" USING btree (
"invoice_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_contract_invoices" ADD CONSTRAINT "crm_contract_invoices_invoice_code_key" UNIQUE ("invoice_code");
ALTER TABLE "crm_contract_invoices" ADD CONSTRAINT "crm_contract_invoices_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_contract_items_contract" ON "crm_contract_items" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_contract_id" ON "crm_contract_items" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_created_by" ON "crm_contract_items" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_deleted_id" ON "crm_contract_items" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_deleted_time" ON "crm_contract_items" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_dept_id" ON "crm_contract_items" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_is_deleted" ON "crm_contract_items" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_owner_id" ON "crm_contract_items" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_product" ON "crm_contract_items" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_product_id" ON "crm_contract_items" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_contract_items" ADD CONSTRAINT "crm_contract_items_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_contracts_customer" ON "crm_contracts" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_contracts_opportunity" ON "crm_contracts" USING btree (
"opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_code" ON "crm_contracts" USING btree (
"contract_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_customer" ON "crm_contracts" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_customer_id" ON "crm_contracts" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_dates" ON "crm_contracts" USING btree (
"start_date" "pg_catalog"."date_ops" ASC NULLS LAST,
"end_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_deleted_id" ON "crm_contracts" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_deleted_time" ON "crm_contracts" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_dept_id" ON "crm_contracts" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_opportunity_id" ON "crm_contracts" USING btree (
"opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_owner" ON "crm_contracts" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_owner_id" ON "crm_contracts" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_quotation_id" ON "crm_contracts" USING btree (
"quotation_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_contracts" ADD CONSTRAINT "crm_contracts_contract_code_key" UNIQUE ("contract_code");
ALTER TABLE "crm_contracts" ADD CONSTRAINT "crm_contracts_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_activities_customer" ON "crm_customer_activities" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"activity_date" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_activities_operator" ON "crm_customer_activities" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_activities_type" ON "crm_customer_activities" USING btree (
"activity_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_created_by" ON "crm_customer_activities" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_customer_id" ON "crm_customer_activities" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_deleted_id" ON "crm_customer_activities" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_deleted_time" ON "crm_customer_activities" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_dept_id" ON "crm_customer_activities" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_is_deleted" ON "crm_customer_activities" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_operator_id" ON "crm_customer_activities" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_owner_id" ON "crm_customer_activities" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_related_id" ON "crm_customer_activities" USING btree (
"related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_activities" ADD CONSTRAINT "crm_customer_activities_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_addresses_customer" ON "crm_customer_addresses" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"address_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_customer_id" ON "crm_customer_addresses" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_default" ON "crm_customer_addresses" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"is_default" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_deleted_id" ON "crm_customer_addresses" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_deleted_time" ON "crm_customer_addresses" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_dept_id" ON "crm_customer_addresses" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_owner_id" ON "crm_customer_addresses" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_addresses" ADD CONSTRAINT "crm_customer_addresses_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_attachments_created_by" ON "crm_customer_attachments" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_customer" ON "crm_customer_attachments" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"attachment_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_customer_id" ON "crm_customer_attachments" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_deleted_id" ON "crm_customer_attachments" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_deleted_time" ON "crm_customer_attachments" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_dept_id" ON "crm_customer_attachments" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_owner_id" ON "crm_customer_attachments" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_uploader" ON "crm_customer_attachments" USING btree (
"uploader_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_uploader_id" ON "crm_customer_attachments" USING btree (
"uploader_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_attachments" ADD CONSTRAINT "crm_customer_attachments_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_change_logs_created_by" ON "crm_customer_change_logs" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_customer" ON "crm_customer_change_logs" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"changed_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_customer_change_logs_customer_id" ON "crm_customer_change_logs" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_deleted_id" ON "crm_customer_change_logs" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_deleted_time" ON "crm_customer_change_logs" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_dept_id" ON "crm_customer_change_logs" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_field" ON "crm_customer_change_logs" USING btree (
"field_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_is_deleted" ON "crm_customer_change_logs" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_operator" ON "crm_customer_change_logs" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_operator_id" ON "crm_customer_change_logs" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_owner_id" ON "crm_customer_change_logs" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_change_logs" ADD CONSTRAINT "crm_customer_change_logs_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_duplicate_logs_a" ON "crm_customer_duplicate_logs" USING btree (
"customer_a_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_b" ON "crm_customer_duplicate_logs" USING btree (
"customer_b_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_created_by" ON "crm_customer_duplicate_logs" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_customer_a_id" ON "crm_customer_duplicate_logs" USING btree (
"customer_a_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_customer_b_id" ON "crm_customer_duplicate_logs" USING btree (
"customer_b_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_deleted_id" ON "crm_customer_duplicate_logs" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_deleted_time" ON "crm_customer_duplicate_logs" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_dept_id" ON "crm_customer_duplicate_logs" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_is_deleted" ON "crm_customer_duplicate_logs" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_owner_id" ON "crm_customer_duplicate_logs" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_type" ON "crm_customer_duplicate_logs" USING btree (
"collision_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_duplicate_logs" ADD CONSTRAINT "crm_customer_duplicate_logs_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_health_created_by" ON "crm_customer_health" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_customer_id" ON "crm_customer_health" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_deleted_id" ON "crm_customer_health" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_deleted_time" ON "crm_customer_health" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_dept_id" ON "crm_customer_health" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_is_deleted" ON "crm_customer_health" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_owner_id" ON "crm_customer_health" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_health_customer" ON "crm_customer_health" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_health_level" ON "crm_customer_health" USING btree (
"health_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_health_renewal" ON "crm_customer_health" USING btree (
"renewal_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"contract_end_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_health_score" ON "crm_customer_health" USING btree (
"health_score" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_health" ADD CONSTRAINT "crm_customer_health_customer_id_key" UNIQUE ("customer_id");
ALTER TABLE "crm_customer_health" ADD CONSTRAINT "crm_customer_health_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_health_scores_customer" ON "crm_customer_health_scores" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_customer_id" ON "crm_customer_health_scores" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_date" ON "crm_customer_health_scores" USING btree (
"score_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_deleted_id" ON "crm_customer_health_scores" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_deleted_time" ON "crm_customer_health_scores" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_dept_id" ON "crm_customer_health_scores" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_is_deleted" ON "crm_customer_health_scores" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_level" ON "crm_customer_health_scores" USING btree (
"health_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_owner_id" ON "crm_customer_health_scores" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_health_scores" ADD CONSTRAINT "crm_customer_health_scores_customer_id_score_date_key" UNIQUE ("customer_id", "score_date");
ALTER TABLE "crm_customer_health_scores" ADD CONSTRAINT "crm_customer_health_scores_overall_score_check" CHECK (overall_score >= 0 AND overall_score <= 100);
ALTER TABLE "crm_customer_health_scores" ADD CONSTRAINT "crm_customer_health_scores_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_pool_logs_action" ON "crm_customer_pool_logs" USING btree (
"action_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_created_by" ON "crm_customer_pool_logs" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_customer" ON "crm_customer_pool_logs" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_customer_id" ON "crm_customer_pool_logs" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_date" ON "crm_customer_pool_logs" USING btree (
"action_date" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_deleted_id" ON "crm_customer_pool_logs" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_deleted_time" ON "crm_customer_pool_logs" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_from_dept_id" ON "crm_customer_pool_logs" USING btree (
"from_dept_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_from_user" ON "crm_customer_pool_logs" USING btree (
"from_user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_from_user_id" ON "crm_customer_pool_logs" USING btree (
"from_user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_is_deleted" ON "crm_customer_pool_logs" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_operator_id" ON "crm_customer_pool_logs" USING btree (
"operator_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_to_dept_id" ON "crm_customer_pool_logs" USING btree (
"to_dept_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_to_user" ON "crm_customer_pool_logs" USING btree (
"to_user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_to_user_id" ON "crm_customer_pool_logs" USING btree (
"to_user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_pool_logs" ADD CONSTRAINT "crm_customer_pool_logs_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_profiles_churn" ON "crm_customer_profiles" USING btree (
"churn_probability" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_customer" ON "crm_customer_profiles" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_customer_id" ON "crm_customer_profiles" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_deleted_id" ON "crm_customer_profiles" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_deleted_time" ON "crm_customer_profiles" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_dept_id" ON "crm_customer_profiles" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_is_deleted" ON "crm_customer_profiles" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_ltv" ON "crm_customer_profiles" USING btree (
"lifetime_value" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_owner_id" ON "crm_customer_profiles" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_profiles" ADD CONSTRAINT "crm_customer_profiles_customer_id_key" UNIQUE ("customer_id");
ALTER TABLE "crm_customer_profiles" ADD CONSTRAINT "crm_customer_profiles_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_satisfaction_surveys_contact_id" ON "crm_customer_satisfaction_surveys" USING btree (
"contact_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_customer" ON "crm_customer_satisfaction_surveys" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_customer_id" ON "crm_customer_satisfaction_surveys" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_dates" ON "crm_customer_satisfaction_surveys" USING btree (
"sent_date" "pg_catalog"."date_ops" ASC NULLS LAST,
"completed_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_deleted_id" ON "crm_customer_satisfaction_surveys" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_deleted_time" ON "crm_customer_satisfaction_surveys" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_dept_id" ON "crm_customer_satisfaction_surveys" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_is_deleted" ON "crm_customer_satisfaction_surveys" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_nps" ON "crm_customer_satisfaction_surveys" USING btree (
"nps_score" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_order_id" ON "crm_customer_satisfaction_surveys" USING btree (
"order_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_owner_id" ON "crm_customer_satisfaction_surveys" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_project_id" ON "crm_customer_satisfaction_surveys" USING btree (
"project_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_type" ON "crm_customer_satisfaction_surveys" USING btree (
"survey_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_satisfaction_surveys" ADD CONSTRAINT "crm_customer_satisfaction_surveys_survey_code_key" UNIQUE ("survey_code");
ALTER TABLE "crm_customer_satisfaction_surveys" ADD CONSTRAINT "crm_customer_satisfaction_surveys_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_tags_customer" ON "crm_customer_tags" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_customer_id" ON "crm_customer_tags" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_deleted_id" ON "crm_customer_tags" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_deleted_time" ON "crm_customer_tags" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_dept_id" ON "crm_customer_tags" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_owner_id" ON "crm_customer_tags" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_source" ON "crm_customer_tags" USING btree (
"tag_source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_tag" ON "crm_customer_tags" USING btree (
"tag_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_tag_id" ON "crm_customer_tags" USING btree (
"tag_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_tags" ADD CONSTRAINT "crm_customer_tags_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customer_timeline_customer" ON "crm_customer_timeline" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"created_time" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_customer_timeline_customer_id" ON "crm_customer_timeline" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_deleted_id" ON "crm_customer_timeline" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_deleted_time" ON "crm_customer_timeline" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_dept_id" ON "crm_customer_timeline" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_is_deleted" ON "crm_customer_timeline" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_operator_id" ON "crm_customer_timeline" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_owner_id" ON "crm_customer_timeline" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_related" ON "crm_customer_timeline" USING btree (
"related_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_related_id" ON "crm_customer_timeline" USING btree (
"related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_type" ON "crm_customer_timeline" USING btree (
"event_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customer_timeline" ADD CONSTRAINT "crm_customer_timeline_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_customers_churn" ON "crm_customers" USING btree (
"churn_risk" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_deleted_id" ON "crm_customers" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_deleted_time" ON "crm_customers" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_department_id" ON "crm_customers" USING btree (
"department_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_dept" ON "crm_customers" USING btree (
"department_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_dept_id" ON "crm_customers" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_health" ON "crm_customers" USING btree (
"health_score" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_is_deleted" ON "crm_customers" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_lead_id" ON "crm_customers" USING btree (
"lead_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_level" ON "crm_customers" USING btree (
"customer_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_owner" ON "crm_customers" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_owner_id" ON "crm_customers" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_parent" ON "crm_customers" USING btree (
"parent_customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_protection" ON "crm_customers" USING btree (
"protection_deadline" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_scale" ON "crm_customers" USING btree (
"scale" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_segment" ON "crm_customers" USING btree (
"customer_segment" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_status" ON "crm_customers" USING btree (
"customer_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_customers_lead" ON "crm_customers" USING btree (
"lead_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_customers_owner" ON "crm_customers" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_customers" ADD CONSTRAINT "crm_customers_customer_code_key" UNIQUE ("customer_code");
ALTER TABLE "crm_customers" ADD CONSTRAINT "crm_customers_rating_check" CHECK (rating >= 1 AND rating <= 5);
ALTER TABLE "crm_customers" ADD CONSTRAINT "crm_customers_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_deliveries_code" ON "crm_deliveries" USING btree (
"delivery_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_date" ON "crm_deliveries" USING btree (
"delivery_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_deleted_id" ON "crm_deliveries" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_deleted_time" ON "crm_deliveries" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_dept_id" ON "crm_deliveries" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_is_deleted" ON "crm_deliveries" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_order" ON "crm_deliveries" USING btree (
"order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_order_id" ON "crm_deliveries" USING btree (
"order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_owner_id" ON "crm_deliveries" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_status" ON "crm_deliveries" USING btree (
"delivery_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_deliveries" ADD CONSTRAINT "crm_deliveries_delivery_code_key" UNIQUE ("delivery_code");
ALTER TABLE "crm_deliveries" ADD CONSTRAINT "crm_deliveries_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_follow_records_contact_id" ON "crm_follow_records" USING btree (
"contact_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_customer" ON "crm_follow_records" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_customer_id" ON "crm_follow_records" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_date" ON "crm_follow_records" USING btree (
"created_time" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_deleted_id" ON "crm_follow_records" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_deleted_time" ON "crm_follow_records" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_dept_id" ON "crm_follow_records" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_is_deleted" ON "crm_follow_records" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_opportunity" ON "crm_follow_records" USING btree (
"opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_opportunity_id" ON "crm_follow_records" USING btree (
"opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_owner" ON "crm_follow_records" USING btree (
"created_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_owner_id" ON "crm_follow_records" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_type" ON "crm_follow_records" USING btree (
"follow_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_follow_records" ADD CONSTRAINT "crm_follow_records_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_followups_contact_id" ON "crm_followups" USING btree (
"contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_creator" ON "crm_followups" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_customer" ON "crm_followups" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"followup_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_followups_customer_id" ON "crm_followups" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_date" ON "crm_followups" USING btree (
"followup_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_deleted_id" ON "crm_followups" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_deleted_time" ON "crm_followups" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_dept_id" ON "crm_followups" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_owner_id" ON "crm_followups" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_type" ON "crm_followups" USING btree (
"followup_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_followups" ADD CONSTRAINT "crm_followups_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_import_records_creator" ON "crm_import_records" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"created_time" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_import_records_deleted_id" ON "crm_import_records" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_deleted_time" ON "crm_import_records" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_dept_id" ON "crm_import_records" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_is_deleted" ON "crm_import_records" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_owner_id" ON "crm_import_records" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_status" ON "crm_import_records" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_type" ON "crm_import_records" USING btree (
"import_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"created_time" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
ALTER TABLE "crm_import_records" ADD CONSTRAINT "crm_import_records_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_invoices_contract_id" ON "crm_invoices" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_customer_id" ON "crm_invoices" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_deleted_id" ON "crm_invoices" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_deleted_time" ON "crm_invoices" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_dept_id" ON "crm_invoices" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_is_deleted" ON "crm_invoices" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_order_id" ON "crm_invoices" USING btree (
"order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_owner_id" ON "crm_invoices" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_invoices_contract" ON "crm_invoices" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_invoices_customer" ON "crm_invoices" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_invoices" ADD CONSTRAINT "crm_invoices_invoice_code_key" UNIQUE ("invoice_code");
ALTER TABLE "crm_invoices" ADD CONSTRAINT "crm_invoices_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_joint_followups_deleted_id" ON "crm_joint_followups" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_deleted_time" ON "crm_joint_followups" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_dept_id" ON "crm_joint_followups" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_is_deleted" ON "crm_joint_followups" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_opportunity" ON "crm_joint_followups" USING btree (
"opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_opportunity_id" ON "crm_joint_followups" USING btree (
"opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_owner_id" ON "crm_joint_followups" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_user" ON "crm_joint_followups" USING btree (
"user_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_user_id" ON "crm_joint_followups" USING btree (
"user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_joint_followups_opportunity" ON "crm_joint_followups" USING btree (
"opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_joint_followups_role" ON "crm_joint_followups" USING btree (
"role_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_joint_followups_status" ON "crm_joint_followups" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_joint_followups_user" ON "crm_joint_followups" USING btree (
"user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
ALTER TABLE "crm_joint_followups" ADD CONSTRAINT "crm_joint_followups_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_lead_scores_created_by" ON "crm_lead_scores" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_deleted_id" ON "crm_lead_scores" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_deleted_time" ON "crm_lead_scores" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_dept_id" ON "crm_lead_scores" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_grade" ON "crm_lead_scores" USING btree (
"score_grade" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_is_deleted" ON "crm_lead_scores" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_lead" ON "crm_lead_scores" USING btree (
"lead_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_lead_id" ON "crm_lead_scores" USING btree (
"lead_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_owner_id" ON "crm_lead_scores" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_qualified" ON "crm_lead_scores" USING btree (
"is_qualified" "pg_catalog"."bool_ops" ASC NULLS LAST,
"qualified_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_total" ON "crm_lead_scores" USING btree (
"total_score" "pg_catalog"."int4_ops" DESC NULLS FIRST
);
ALTER TABLE "crm_lead_scores" ADD CONSTRAINT "crm_lead_scores_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_leads_campaign_id" ON "crm_leads" USING btree (
"campaign_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_code" ON "crm_leads" USING btree (
"lead_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_converted_customer_id" ON "crm_leads" USING btree (
"converted_customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_deleted_id" ON "crm_leads" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_deleted_time" ON "crm_leads" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_dept_id" ON "crm_leads" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_duplicate" ON "crm_leads" USING btree (
"duplicate_check_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_owner" ON "crm_leads" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_owner_id" ON "crm_leads" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_score" ON "crm_leads" USING btree (
"score" "pg_catalog"."int4_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_leads_source" ON "crm_leads" USING btree (
"source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_status" ON "crm_leads" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
ALTER TABLE "crm_leads" ADD CONSTRAINT "crm_leads_lead_code_key" UNIQUE ("lead_code");
ALTER TABLE "crm_leads" ADD CONSTRAINT "crm_leads_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_marketing_campaigns_deleted_id" ON "crm_marketing_campaigns" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_campaigns_deleted_time" ON "crm_marketing_campaigns" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_campaigns_dept_id" ON "crm_marketing_campaigns" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_campaigns_owner_id" ON "crm_marketing_campaigns" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_marketing_campaigns" ADD CONSTRAINT "crm_marketing_campaigns_campaign_code_key" UNIQUE ("campaign_code");
ALTER TABLE "crm_marketing_campaigns" ADD CONSTRAINT "crm_marketing_campaigns_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_marketing_channels_deleted_id" ON "crm_marketing_channels" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_deleted_time" ON "crm_marketing_channels" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_dept_id" ON "crm_marketing_channels" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_is_deleted" ON "crm_marketing_channels" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_owner_id" ON "crm_marketing_channels" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_parent" ON "crm_marketing_channels" USING btree (
"parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_parent_id" ON "crm_marketing_channels" USING btree (
"parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_type" ON "crm_marketing_channels" USING btree (
"channel_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_marketing_channels" ADD CONSTRAINT "crm_marketing_channels_channel_code_key" UNIQUE ("channel_code");
ALTER TABLE "crm_marketing_channels" ADD CONSTRAINT "crm_marketing_channels_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_notifications_created_by" ON "crm_notifications" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_deleted_id" ON "crm_notifications" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_deleted_time" ON "crm_notifications" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_dept_id" ON "crm_notifications" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_is_deleted" ON "crm_notifications" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_owner_id" ON "crm_notifications" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_related_id" ON "crm_notifications" USING btree (
"related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_type" ON "crm_notifications" USING btree (
"notification_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_user" ON "crm_notifications" USING btree (
"user_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"is_read" "pg_catalog"."bool_ops" ASC NULLS LAST,
"sent_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_notifications_user_id" ON "crm_notifications" USING btree (
"user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_notifications" ADD CONSTRAINT "crm_notifications_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_operation_logs_created_by" ON "crm_operation_logs" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_deleted_id" ON "crm_operation_logs" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_deleted_time" ON "crm_operation_logs" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_dept_id" ON "crm_operation_logs" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_is_deleted" ON "crm_operation_logs" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_module" ON "crm_operation_logs" USING btree (
"module" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"action" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_owner_id" ON "crm_operation_logs" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_status" ON "crm_operation_logs" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_target" ON "crm_operation_logs" USING btree (
"target_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"target_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_target_id" ON "crm_operation_logs" USING btree (
"target_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_time" ON "crm_operation_logs" USING btree (
"operated_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_operation_logs_user" ON "crm_operation_logs" USING btree (
"user_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"operated_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_operation_logs_user_id" ON "crm_operation_logs" USING btree (
"user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_operation_logs" ADD CONSTRAINT "crm_operation_logs_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_opportunities_close_date" ON "crm_opportunities" USING btree (
"expected_close_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_code" ON "crm_opportunities" USING btree (
"opportunity_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_customer" ON "crm_opportunities" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_customer_id" ON "crm_opportunities" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_deleted_id" ON "crm_opportunities" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_deleted_time" ON "crm_opportunities" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_dept_id" ON "crm_opportunities" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_owner" ON "crm_opportunities" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_owner_id" ON "crm_opportunities" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_stage" ON "crm_opportunities" USING btree (
"stage" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opportunities_customer" ON "crm_opportunities" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_opportunities" ADD CONSTRAINT "crm_opportunities_opportunity_code_key" UNIQUE ("opportunity_code");
ALTER TABLE "crm_opportunities" ADD CONSTRAINT "crm_opportunities_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_opportunity_products_deleted_id" ON "crm_opportunity_products" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_deleted_time" ON "crm_opportunity_products" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_dept_id" ON "crm_opportunity_products" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_is_deleted" ON "crm_opportunity_products" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_opportunity" ON "crm_opportunity_products" USING btree (
"opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_opportunity_id" ON "crm_opportunity_products" USING btree (
"opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_owner_id" ON "crm_opportunity_products" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_product" ON "crm_opportunity_products" USING btree (
"product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_product_id" ON "crm_opportunity_products" USING btree (
"product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opp_products_amount" ON "crm_opportunity_products" USING btree (
"estimated_amount" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opp_products_opportunity" ON "crm_opportunity_products" USING btree (
"opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opp_products_product" ON "crm_opportunity_products" USING btree (
"product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
ALTER TABLE "crm_opportunity_products" ADD CONSTRAINT "crm_opportunity_products_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_opportunity_stages_deleted_id" ON "crm_opportunity_stages" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_deleted_time" ON "crm_opportunity_stages" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_dept_id" ON "crm_opportunity_stages" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_is_deleted" ON "crm_opportunity_stages" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_owner_id" ON "crm_opportunity_stages" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_sequence" ON "crm_opportunity_stages" USING btree (
"stage_sequence" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_status" ON "crm_opportunity_stages" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_opportunity_stages" ADD CONSTRAINT "crm_opportunity_stages_stage_code_key" UNIQUE ("stage_code");
ALTER TABLE "crm_opportunity_stages" ADD CONSTRAINT "crm_opportunity_stages_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_order_items_deleted_id" ON "crm_order_items" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_deleted_time" ON "crm_order_items" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_delivery" ON "crm_order_items" USING btree (
"delivery_date" "pg_catalog"."date_ops" ASC NULLS LAST,
"production_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_dept_id" ON "crm_order_items" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_order" ON "crm_order_items" USING btree (
"order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_order_id" ON "crm_order_items" USING btree (
"order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_owner_id" ON "crm_order_items" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_product" ON "crm_order_items" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_product_id" ON "crm_order_items" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_sku" ON "crm_order_items" USING btree (
"sku_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_sku_id" ON "crm_order_items" USING btree (
"sku_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_order_items" ADD CONSTRAINT "crm_order_items_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_orders_code" ON "crm_orders" USING btree (
"order_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_contract" ON "crm_orders" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_contract_id" ON "crm_orders" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_customer" ON "crm_orders" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"order_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_orders_customer_id" ON "crm_orders" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_deleted_id" ON "crm_orders" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_deleted_time" ON "crm_orders" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_dept_id" ON "crm_orders" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_owner_id" ON "crm_orders" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_status" ON "crm_orders" USING btree (
"order_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"payment_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_orders_contract" ON "crm_orders" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_orders_customer" ON "crm_orders" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_orders" ADD CONSTRAINT "crm_orders_order_code_key" UNIQUE ("order_code");
ALTER TABLE "crm_orders" ADD CONSTRAINT "crm_orders_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_payments_code" ON "crm_payments" USING btree (
"payment_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_contract" ON "crm_payments" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"payment_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_payments_contract_id" ON "crm_payments" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_customer" ON "crm_payments" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"payment_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_payments_customer_id" ON "crm_payments" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_date" ON "crm_payments" USING btree (
"payment_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_deleted_id" ON "crm_payments" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_deleted_time" ON "crm_payments" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_dept_id" ON "crm_payments" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_invoice_id" ON "crm_payments" USING btree (
"invoice_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_method" ON "crm_payments" USING btree (
"payment_method" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_order" ON "crm_payments" USING btree (
"order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_order_id" ON "crm_payments" USING btree (
"order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_owner_id" ON "crm_payments" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_payment_plan_id" ON "crm_payments" USING btree (
"payment_plan_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_plan" ON "crm_payments" USING btree (
"payment_plan_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_status" ON "crm_payments" USING btree (
"payment_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_payments_order" ON "crm_payments" USING btree (
"order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_payments" ADD CONSTRAINT "crm_payments_payment_code_key" UNIQUE ("payment_code");
ALTER TABLE "crm_payments" ADD CONSTRAINT "crm_payments_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_pool_transfers_created_by" ON "crm_pool_transfers" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_customer" ON "crm_pool_transfers" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_customer_id" ON "crm_pool_transfers" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_deleted_id" ON "crm_pool_transfers" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_deleted_time" ON "crm_pool_transfers" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_from_owner_id" ON "crm_pool_transfers" USING btree (
"from_owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_is_deleted" ON "crm_pool_transfers" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_operator" ON "crm_pool_transfers" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_operator_id" ON "crm_pool_transfers" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_time" ON "crm_pool_transfers" USING btree (
"transferred_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_pool_transfers_to_owner_id" ON "crm_pool_transfers" USING btree (
"to_owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_pool_transfers" ADD CONSTRAINT "crm_pool_transfers_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_price_tiers_code" ON "crm_price_tiers" USING btree (
"tier_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_deleted_id" ON "crm_price_tiers" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_deleted_time" ON "crm_price_tiers" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_dept_id" ON "crm_price_tiers" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_is_deleted" ON "crm_price_tiers" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_level" ON "crm_price_tiers" USING btree (
"customer_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_owner_id" ON "crm_price_tiers" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_price_tiers" ADD CONSTRAINT "crm_price_tiers_tier_code_key" UNIQUE ("tier_code");
ALTER TABLE "crm_price_tiers" ADD CONSTRAINT "crm_price_tiers_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_product_categories_deleted_id" ON "crm_product_categories" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_deleted_time" ON "crm_product_categories" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_dept_id" ON "crm_product_categories" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_is_deleted" ON "crm_product_categories" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_level" ON "crm_product_categories" USING btree (
"level" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_owner_id" ON "crm_product_categories" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_parent" ON "crm_product_categories" USING btree (
"parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_parent_id" ON "crm_product_categories" USING btree (
"parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_product_categories" ADD CONSTRAINT "crm_product_categories_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_product_documents_deleted_id" ON "crm_product_documents" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_deleted_time" ON "crm_product_documents" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_dept_id" ON "crm_product_documents" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_owner_id" ON "crm_product_documents" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_product" ON "crm_product_documents" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"is_latest" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_product_id" ON "crm_product_documents" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_sku_id" ON "crm_product_documents" USING btree (
"sku_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_type" ON "crm_product_documents" USING btree (
"doc_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_product_documents" ADD CONSTRAINT "crm_product_documents_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_product_price_history_created_by" ON "crm_product_price_history" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_deleted_id" ON "crm_product_price_history" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_deleted_time" ON "crm_product_price_history" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_dept_id" ON "crm_product_price_history" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_is_deleted" ON "crm_product_price_history" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_operator" ON "crm_product_price_history" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_operator_id" ON "crm_product_price_history" USING btree (
"operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_owner_id" ON "crm_product_price_history" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_product" ON "crm_product_price_history" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"effective_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_product_price_history_product_id" ON "crm_product_price_history" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_product_price_history" ADD CONSTRAINT "crm_product_price_history_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_product_price_policies_customer" ON "crm_product_price_policies" USING btree (
"customer_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_customer_id" ON "crm_product_price_policies" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_deleted_id" ON "crm_product_price_policies" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_deleted_time" ON "crm_product_price_policies" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_dept_id" ON "crm_product_price_policies" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_owner_id" ON "crm_product_price_policies" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_product" ON "crm_product_price_policies" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_product_id" ON "crm_product_price_policies" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_sku_id" ON "crm_product_price_policies" USING btree (
"sku_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_type" ON "crm_product_price_policies" USING btree (
"policy_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_product_price_policies" ADD CONSTRAINT "crm_product_price_policies_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_product_prices_customer" ON "crm_product_prices" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_customer_id" ON "crm_product_prices" USING btree (
"customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_deleted_id" ON "crm_product_prices" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_deleted_time" ON "crm_product_prices" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_dept_id" ON "crm_product_prices" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_effective" ON "crm_product_prices" USING btree (
"effective_from" "pg_catalog"."timestamptz_ops" ASC NULLS LAST,
"effective_to" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_is_deleted" ON "crm_product_prices" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_owner_id" ON "crm_product_prices" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_product" ON "crm_product_prices" USING btree (
"product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_product_id" ON "crm_product_prices" USING btree (
"product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_sku" ON "crm_product_prices" USING btree (
"sku_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_sku_id" ON "crm_product_prices" USING btree (
"sku_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_type" ON "crm_product_prices" USING btree (
"price_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_product_prices" ADD CONSTRAINT "crm_product_prices_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_product_skus_code" ON "crm_product_skus" USING btree (
"sku_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_deleted_id" ON "crm_product_skus" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_deleted_time" ON "crm_product_skus" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_dept_id" ON "crm_product_skus" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_owner_id" ON "crm_product_skus" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_product" ON "crm_product_skus" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_product_id" ON "crm_product_skus" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_product_skus" ADD CONSTRAINT "crm_product_skus_sku_code_key" UNIQUE ("sku_code");
ALTER TABLE "crm_product_skus" ADD CONSTRAINT "crm_product_skus_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_products_category" ON "crm_products" USING btree (
"category_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_category_id" ON "crm_products" USING btree (
"category_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_code" ON "crm_products" USING btree (
"product_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_deleted_id" ON "crm_products" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_deleted_time" ON "crm_products" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_dept_id" ON "crm_products" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_name" ON "crm_products" USING btree (
"product_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_owner_id" ON "crm_products" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_type" ON "crm_products" USING btree (
"product_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_products" ADD CONSTRAINT "crm_products_product_code_key" UNIQUE ("product_code");
ALTER TABLE "crm_products" ADD CONSTRAINT "crm_products_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_quotation_items_deleted_id" ON "crm_quotation_items" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_deleted_time" ON "crm_quotation_items" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_dept_id" ON "crm_quotation_items" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_is_deleted" ON "crm_quotation_items" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_owner_id" ON "crm_quotation_items" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_product_id" ON "crm_quotation_items" USING btree (
"product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_quotation" ON "crm_quotation_items" USING btree (
"quotation_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_quotation_id" ON "crm_quotation_items" USING btree (
"quotation_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_quotation_items" ADD CONSTRAINT "crm_quotation_items_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_quotations_code" ON "crm_quotations" USING btree (
"quotation_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_converted_contract_id" ON "crm_quotations" USING btree (
"converted_contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_customer" ON "crm_quotations" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_customer_id" ON "crm_quotations" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_deleted_id" ON "crm_quotations" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_deleted_time" ON "crm_quotations" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_dept_id" ON "crm_quotations" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_opportunity_id" ON "crm_quotations" USING btree (
"opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_owner_id" ON "crm_quotations" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_status" ON "crm_quotations" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_quotations" ADD CONSTRAINT "crm_quotations_quotation_code_key" UNIQUE ("quotation_code");
ALTER TABLE "crm_quotations" ADD CONSTRAINT "crm_quotations_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_renewals_current_contract_id" ON "crm_renewals" USING btree (
"current_contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_customer" ON "crm_renewals" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_customer_id" ON "crm_renewals" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_dates" ON "crm_renewals" USING btree (
"contract_end_date" "pg_catalog"."date_ops" ASC NULLS LAST,
"renewal_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_deleted_id" ON "crm_renewals" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_deleted_time" ON "crm_renewals" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_new_contract_id" ON "crm_renewals" USING btree (
"new_contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_owner_id" ON "crm_renewals" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_status" ON "crm_renewals" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_renewals" ADD CONSTRAINT "crm_renewals_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_report_instances_created_by" ON "crm_report_instances" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_creator" ON "crm_report_instances" USING btree (
"generated_by" "pg_catalog"."int4_ops" ASC NULLS LAST,
"generated_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_report_instances_deleted_id" ON "crm_report_instances" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_deleted_time" ON "crm_report_instances" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_dept_id" ON "crm_report_instances" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_is_deleted" ON "crm_report_instances" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_owner_id" ON "crm_report_instances" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_template" ON "crm_report_instances" USING btree (
"template_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"generated_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_report_instances_template_id" ON "crm_report_instances" USING btree (
"template_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_report_instances" ADD CONSTRAINT "crm_report_instances_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_report_templates_created_by" ON "crm_report_templates" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_templates_deleted_id" ON "crm_report_templates" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_templates_deleted_time" ON "crm_report_templates" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_templates_is_deleted" ON "crm_report_templates" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_templates_owner_id" ON "crm_report_templates" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_report_templates" ADD CONSTRAINT "crm_report_templates_template_code_key" UNIQUE ("template_code");
ALTER TABLE "crm_report_templates" ADD CONSTRAINT "crm_report_templates_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_sales_activities_contact_id" ON "crm_sales_activities" USING btree (
"contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_creator" ON "crm_sales_activities" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"activity_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_sales_activities_customer" ON "crm_sales_activities" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"activity_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_sales_activities_customer_id" ON "crm_sales_activities" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_deleted_id" ON "crm_sales_activities" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_deleted_time" ON "crm_sales_activities" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_dept_id" ON "crm_sales_activities" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_opportunity_id" ON "crm_sales_activities" USING btree (
"opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_owner_id" ON "crm_sales_activities" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_related_customer_id" ON "crm_sales_activities" USING btree (
"related_customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_type" ON "crm_sales_activities" USING btree (
"activity_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_sales_activities" ADD CONSTRAINT "crm_sales_activities_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_sales_targets_deleted_id" ON "crm_sales_targets" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_targets_deleted_time" ON "crm_sales_targets" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_targets_is_deleted" ON "crm_sales_targets" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_targets_owner_id" ON "crm_sales_targets" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_targets_owner" ON "crm_sales_targets" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"target_year" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_targets_period" ON "crm_sales_targets" USING btree (
"target_year" "pg_catalog"."int4_ops" ASC NULLS LAST,
"target_quarter" "pg_catalog"."int4_ops" ASC NULLS LAST,
"target_month" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_sales_targets" ADD CONSTRAINT "crm_sales_targets_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_satisfaction_surveys_customer" ON "crm_satisfaction_surveys" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"survey_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_satisfaction_surveys_customer_id" ON "crm_satisfaction_surveys" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_date" ON "crm_satisfaction_surveys" USING btree (
"survey_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_deleted_id" ON "crm_satisfaction_surveys" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_deleted_time" ON "crm_satisfaction_surveys" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_dept_id" ON "crm_satisfaction_surveys" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_owner_id" ON "crm_satisfaction_surveys" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_satisfaction_surveys" ADD CONSTRAINT "crm_satisfaction_surveys_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_service_tickets_assignee" ON "crm_service_tickets" USING btree (
"assignee_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_customer" ON "crm_service_tickets" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_dept_id" ON "crm_service_tickets" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_no" ON "crm_service_tickets" USING btree (
"ticket_no" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_owner_id" ON "crm_service_tickets" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_priority" ON "crm_service_tickets" USING btree (
"priority" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_status" ON "crm_service_tickets" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_service_tickets" ADD CONSTRAINT "crm_service_tickets_ticket_no_key" UNIQUE ("ticket_no");
ALTER TABLE "crm_service_tickets" ADD CONSTRAINT "crm_service_tickets_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_tag_definitions_category" ON "crm_tag_definitions" USING btree (
"category" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_code" ON "crm_tag_definitions" USING btree (
"tag_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_deleted_id" ON "crm_tag_definitions" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_deleted_time" ON "crm_tag_definitions" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_dept_id" ON "crm_tag_definitions" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_is_deleted" ON "crm_tag_definitions" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_owner_id" ON "crm_tag_definitions" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_type" ON "crm_tag_definitions" USING btree (
"tag_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_tag_definitions" ADD CONSTRAINT "crm_tag_definitions_tag_code_key" UNIQUE ("tag_code");
ALTER TABLE "crm_tag_definitions" ADD CONSTRAINT "crm_tag_definitions_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_tags_category" ON "crm_tags" USING btree (
"tag_category" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_deleted_id" ON "crm_tags" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_deleted_time" ON "crm_tags" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_dept_id" ON "crm_tags" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_is_deleted" ON "crm_tags" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_name" ON "crm_tags" USING btree (
"tag_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_owner_id" ON "crm_tags" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_tags" ADD CONSTRAINT "crm_tags_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_tasks_assignee" ON "crm_tasks" USING btree (
"assignee_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"due_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_assignee_id" ON "crm_tasks" USING btree (
"assignee_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_assigner_id" ON "crm_tasks" USING btree (
"assigner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_contact_id" ON "crm_tasks" USING btree (
"contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_contract_id" ON "crm_tasks" USING btree (
"contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_customer" ON "crm_tasks" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_customer_id" ON "crm_tasks" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_deleted_id" ON "crm_tasks" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_deleted_time" ON "crm_tasks" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_dept_id" ON "crm_tasks" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_due" ON "crm_tasks" USING btree (
"due_date" "pg_catalog"."date_ops" ASC NULLS LAST,
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_opportunity_id" ON "crm_tasks" USING btree (
"opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_owner_id" ON "crm_tasks" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_tasks" ADD CONSTRAINT "crm_tasks_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_test_monitor_report_deleted_time" ON "crm_test_monitor_report" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_test_monitor_report_is_deleted" ON "crm_test_monitor_report" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_created_id" ON "crm_test_monitor_report" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_created_time" ON "crm_test_monitor_report" USING btree (
"created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_id" ON "crm_test_monitor_report" USING btree (
"id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_status" ON "crm_test_monitor_report" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_updated_id" ON "crm_test_monitor_report" USING btree (
"updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_updated_time" ON "crm_test_monitor_report" USING btree (
"updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
ALTER TABLE "crm_test_monitor_report" ADD CONSTRAINT "crm_test_monitor_report_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_user_extensions_deleted_id" ON "crm_user_extensions" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_deleted_time" ON "crm_user_extensions" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_dept_id" ON "crm_user_extensions" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_is_deleted" ON "crm_user_extensions" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_manager_id" ON "crm_user_extensions" USING btree (
"manager_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_owner_id" ON "crm_user_extensions" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_sales_area" ON "crm_user_extensions" USING btree (
"sales_area" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_team_id" ON "crm_user_extensions" USING btree (
"team_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_user_id" ON "crm_user_extensions" USING btree (
"user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_user_extensions" ADD CONSTRAINT "crm_user_extensions_user_id_key" UNIQUE ("user_id");
ALTER TABLE "crm_user_extensions" ADD CONSTRAINT "crm_user_extensions_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_visit_records_customer" ON "crm_visit_records" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_visit_records_date" ON "crm_visit_records" USING btree (
"visit_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_visit_records_dept_id" ON "crm_visit_records" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_visit_records_owner_id" ON "crm_visit_records" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_visit_records_type" ON "crm_visit_records" USING btree (
"visit_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "crm_visit_records" ADD CONSTRAINT "crm_visit_records_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_approvals_initiator" ON "crm_workflow_approvals" USING btree (
"initiator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approvals_status" ON "crm_workflow_approvals" USING btree (
"status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approvals_type" ON "crm_workflow_approvals" USING btree (
"workflow_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_deleted_id" ON "crm_workflow_approvals" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_deleted_time" ON "crm_workflow_approvals" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_dept_id" ON "crm_workflow_approvals" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_initiator_id" ON "crm_workflow_approvals" USING btree (
"initiator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_is_deleted" ON "crm_workflow_approvals" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_owner_id" ON "crm_workflow_approvals" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_related_id" ON "crm_workflow_approvals" USING btree (
"related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_workflow_approvals" ADD CONSTRAINT "crm_workflow_approvals_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_workflow_logs_created_by" ON "crm_workflow_logs" USING btree (
"created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_customer" ON "crm_workflow_logs" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_customer_id" ON "crm_workflow_logs" USING btree (
"customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_deleted_id" ON "crm_workflow_logs" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_deleted_time" ON "crm_workflow_logs" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_dept_id" ON "crm_workflow_logs" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_is_deleted" ON "crm_workflow_logs" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_opportunity_id" ON "crm_workflow_logs" USING btree (
"opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_owner_id" ON "crm_workflow_logs" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_result" ON "crm_workflow_logs" USING btree (
"execution_result" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_rule" ON "crm_workflow_logs" USING btree (
"rule_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
"executed_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_workflow_logs_rule_id" ON "crm_workflow_logs" USING btree (
"rule_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
ALTER TABLE "crm_workflow_logs" ADD CONSTRAINT "crm_workflow_logs_pkey" PRIMARY KEY ("id");
CREATE INDEX "idx_crm_workflow_rules_deleted_id" ON "crm_workflow_rules" USING btree (
"deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_deleted_time" ON "crm_workflow_rules" USING btree (
"deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_dept_id" ON "crm_workflow_rules" USING btree (
"dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_event" ON "crm_workflow_rules" USING btree (
"trigger_event" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_is_deleted" ON "crm_workflow_rules" USING btree (
"is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_owner_id" ON "crm_workflow_rules" USING btree (
"owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_type" ON "crm_workflow_rules" USING btree (
"rule_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
"enabled" "pg_catalog"."bool_ops" ASC NULLS LAST
);
ALTER TABLE "crm_workflow_rules" ADD CONSTRAINT "crm_workflow_rules_pkey" PRIMARY KEY ("id");
-- ----------------------------
COMMIT;
