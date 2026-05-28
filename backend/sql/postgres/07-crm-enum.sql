/*
 Navicat Premium Dump SQL

 Source Server         : CRM客户管理
 Source Server Type    : PostgreSQL
*/

-- ----------------------------
-- Records of apscheduler_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_ai_customer_profiles
-- ----------------------------

COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."overall_score" IS '综合评分';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."purchase_power" IS '购买力评分';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."decision_speed" IS '决策速度评分';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."tags" IS '标签';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."interests" IS '兴趣标签';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."pain_points" IS '痛点分析';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."engagement_level" IS '参与度等级 [crm_ai_customer_profiles_engagement_level]';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."preferred_contact_method" IS '首选联系方式 [crm_ai_customer_profiles_preferred_contact_method]';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."best_contact_time" IS '最佳联系时间';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."churn_risk" IS '流失风险等级';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."upsell_probability" IS '增购概率';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."next_best_action" IS '下一步最佳行动';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."summary" IS '摘要';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."generated_at" IS '生成时间';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_ai_customer_profiles" IS 'Ai Customer Profiles';

-- ----------------------------
-- Records of crm_ai_customer_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for crm_ai_recommendations
-- ----------------------------

COMMENT ON COLUMN "public"."crm_ai_recommendations"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."entity_type" IS '实体类型 [crm_ai_recommendations_entity_type]';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."entity_id" IS '实体ID';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."recommendation_type" IS '推荐类型 [crm_ai_recommendations_recommendation_type]';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."recommendation_content" IS '推荐内容';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."ai_model" IS 'AI模型';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."confidence" IS '置信度';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."reasoning" IS '推理依据';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."user_feedback" IS '用户反馈';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."feedback_at" IS '反馈时间';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_ai_recommendations" IS 'Ai Recommendations';

-- ----------------------------
-- Records of crm_ai_recommendations
-- ----------------------------

-- ----------------------------
-- Table structure for crm_ai_tags
-- ----------------------------
COMMENT ON COLUMN "public"."crm_ai_tags"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_ai_tags"."tag_code" IS '标签编号';
COMMENT ON COLUMN "public"."crm_ai_tags"."tag_name" IS '标签名称';
COMMENT ON COLUMN "public"."crm_ai_tags"."ai_model" IS 'AI模型';
COMMENT ON COLUMN "public"."crm_ai_tags"."ai_prompt" IS 'AI提示词';
COMMENT ON COLUMN "public"."crm_ai_tags"."confidence_threshold" IS '置信度阈值';
COMMENT ON COLUMN "public"."crm_ai_tags"."applicable_entities" IS '适用实体';
COMMENT ON COLUMN "public"."crm_ai_tags"."usage_count" IS '使用次数';
COMMENT ON COLUMN "public"."crm_ai_tags"."accuracy_rate" IS '准确率比率';
COMMENT ON COLUMN "public"."crm_ai_tags"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_ai_tags_status]';
COMMENT ON COLUMN "public"."crm_ai_tags"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_ai_tags"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_ai_tags"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_ai_tags" IS 'Ai Tags';

-- ----------------------------
-- Records of crm_ai_tags
-- ----------------------------

-- ----------------------------
-- Table structure for crm_campaign_leads
-- ----------------------------
COMMENT ON COLUMN "public"."crm_campaign_leads"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_campaign_leads"."campaign_id" IS '活动ID';
COMMENT ON COLUMN "public"."crm_campaign_leads"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "public"."crm_campaign_leads"."participation_type" IS '参与类型 [crm_campaign_leads_participation_type]';
COMMENT ON COLUMN "public"."crm_campaign_leads"."registration_date" IS '注册日期';
COMMENT ON COLUMN "public"."crm_campaign_leads"."attendance_status" IS '出席状态 [crm_campaign_leads_attendance_status]';
COMMENT ON COLUMN "public"."crm_campaign_leads"."lead_source_detail" IS '线索来源详情';
COMMENT ON COLUMN "public"."crm_campaign_leads"."channel" IS '渠道';
COMMENT ON COLUMN "public"."crm_campaign_leads"."is_converted" IS '是否已转化:0-否,1-是 [crm_campaign_leads_is_converted]';
COMMENT ON COLUMN "public"."crm_campaign_leads"."converted_customer_id" IS '转化后客户ID';
COMMENT ON COLUMN "public"."crm_campaign_leads"."interaction_count" IS '互动次数';
COMMENT ON COLUMN "public"."crm_campaign_leads"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "public"."crm_campaign_leads"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_campaign_leads"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_campaign_leads"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_campaign_leads"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_campaign_leads"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_campaign_leads"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_campaign_leads"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_campaign_leads" IS 'Campaign Leads';

-- ----------------------------
-- Records of crm_campaign_leads
-- ----------------------------

-- ----------------------------
-- Table structure for crm_campaigns
-- ----------------------------
COMMENT ON COLUMN "public"."crm_campaigns"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_campaigns"."campaign_code" IS '活动编号';
COMMENT ON COLUMN "public"."crm_campaigns"."campaign_name" IS '活动名称';
COMMENT ON COLUMN "public"."crm_campaigns"."campaign_type" IS '活动类型 [crm_campaigns_campaign_type]';
COMMENT ON COLUMN "public"."crm_campaigns"."campaign_subtype" IS '活动子类型';
COMMENT ON COLUMN "public"."crm_campaigns"."planned_start_date" IS '计划开始日期';
COMMENT ON COLUMN "public"."crm_campaigns"."planned_end_date" IS '计划结束日期';
COMMENT ON COLUMN "public"."crm_campaigns"."actual_start_date" IS '实际开始日期';
COMMENT ON COLUMN "public"."crm_campaigns"."actual_end_date" IS '实际结束日期';
COMMENT ON COLUMN "public"."crm_campaigns"."budget" IS '预算金额';
COMMENT ON COLUMN "public"."crm_campaigns"."actual_cost" IS '实际成本';
COMMENT ON COLUMN "public"."crm_campaigns"."cost_currency" IS '成本币种';
COMMENT ON COLUMN "public"."crm_campaigns"."objectives" IS '活动目标';
COMMENT ON COLUMN "public"."crm_campaigns"."target_participants" IS '目标参与人数';
COMMENT ON COLUMN "public"."crm_campaigns"."actual_participants" IS '实际参与人数';
COMMENT ON COLUMN "public"."crm_campaigns"."target_leads" IS '目标线索数';
COMMENT ON COLUMN "public"."crm_campaigns"."actual_leads" IS '实际线索数';
COMMENT ON COLUMN "public"."crm_campaigns"."target_conversions" IS '目标转化数';
COMMENT ON COLUMN "public"."crm_campaigns"."actual_conversions" IS '实际转化数';
COMMENT ON COLUMN "public"."crm_campaigns"."expected_roi" IS '预期投资回报率';
COMMENT ON COLUMN "public"."crm_campaigns"."actual_roi" IS '实际投资回报率';
COMMENT ON COLUMN "public"."crm_campaigns"."channels" IS '渠道列表';
COMMENT ON COLUMN "public"."crm_campaigns"."channel_ids" IS '渠道ID列表';
COMMENT ON COLUMN "public"."crm_campaigns"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_campaigns"."department_id" IS '所属部门ID,关联sys_dept';
COMMENT ON COLUMN "public"."crm_campaigns"."team_members" IS '团队成员';
COMMENT ON COLUMN "public"."crm_campaigns"."related_campaign_id" IS 'relatedcampaignID,关联对应表';
COMMENT ON COLUMN "public"."crm_campaigns"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_campaigns"."content_plan" IS '内容计划';
COMMENT ON COLUMN "public"."crm_campaigns"."landing_page_url" IS '落地页URL';
COMMENT ON COLUMN "public"."crm_campaigns"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_campaigns_status]';
COMMENT ON COLUMN "public"."crm_campaigns"."phase" IS '阶段';
COMMENT ON COLUMN "public"."crm_campaigns"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_campaigns"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_campaigns"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_campaigns"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_campaigns"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_campaigns"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_campaigns" IS 'Campaigns';

-- ----------------------------
-- Records of crm_campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contact_change_logs
-- ----------------------------
COMMENT ON COLUMN "public"."crm_contact_change_logs"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."field_name" IS '字段名称';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."field_label" IS '字段标签';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."old_value" IS '旧值';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."new_value" IS '新值';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."change_type" IS '变更类型 [crm_contact_change_logs_change_type]';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."changed_at" IS '变更时间';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_contact_change_logs" IS 'Contact Change Logs';

-- ----------------------------
-- Records of crm_contact_change_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contact_relations
-- ----------------------------
COMMENT ON COLUMN "public"."crm_contact_relations"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_contact_relations"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_relations"."related_contact_id" IS '关联联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_relations"."related_entity_type" IS '关联实体类型 [crm_contact_relations_related_entity_type]';
COMMENT ON COLUMN "public"."crm_contact_relations"."related_entity_id" IS '关联实体ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_relations"."relation_type" IS '关系类型 [crm_contact_relations_relation_type]';
COMMENT ON COLUMN "public"."crm_contact_relations"."relation_desc" IS '关系描述';
COMMENT ON COLUMN "public"."crm_contact_relations"."importance" IS '重要性';
COMMENT ON COLUMN "public"."crm_contact_relations"."decision_role" IS '决策角色 [crm_contact_relations_decision_role]';
COMMENT ON COLUMN "public"."crm_contact_relations"."influence_level" IS '影响力等级 [crm_contact_relations_influence_level]';
COMMENT ON COLUMN "public"."crm_contact_relations"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_contact_relations_status]';
COMMENT ON COLUMN "public"."crm_contact_relations"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_contact_relations"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contact_relations"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_contact_relations"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contact_relations"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_contact_relations_is_deleted]';
COMMENT ON TABLE "public"."crm_contact_relations" IS 'Contact Relations';

-- ----------------------------
-- Records of crm_contact_relations
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contact_visits
-- ----------------------------
COMMENT ON COLUMN "public"."crm_contact_visits"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_contact_visits"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_visits"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_visits"."visit_date" IS '拜访日期';
COMMENT ON COLUMN "public"."crm_contact_visits"."visit_type" IS '拜访类型:1-首次拜访,2-常规拜访,3-回访,4-线上沟通,5-会议 [crm_contact_visits_visit_type]';
COMMENT ON COLUMN "public"."crm_contact_visits"."visit_location" IS '拜访地点';
COMMENT ON COLUMN "public"."crm_contact_visits"."visit_duration" IS '拜访时长';
COMMENT ON COLUMN "public"."crm_contact_visits"."visitor_id" IS '拜访人ID';
COMMENT ON COLUMN "public"."crm_contact_visits"."visitor_name" IS '拜访人姓名';
COMMENT ON COLUMN "public"."crm_contact_visits"."attendees" IS '参与人';
COMMENT ON COLUMN "public"."crm_contact_visits"."visit_content" IS '拜访内容';
COMMENT ON COLUMN "public"."crm_contact_visits"."visit_result" IS '拜访结果';
COMMENT ON COLUMN "public"."crm_contact_visits"."follow_up_action" IS '跟进动作';
COMMENT ON COLUMN "public"."crm_contact_visits"."next_visit_date" IS '下次拜访日期';
COMMENT ON COLUMN "public"."crm_contact_visits"."attachments" IS '附件';
COMMENT ON COLUMN "public"."crm_contact_visits"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contact_visits"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contact_visits"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_contact_visits_is_deleted]';
COMMENT ON TABLE "public"."crm_contact_visits" IS 'Contact Visits';

-- ----------------------------
-- Records of crm_contact_visits
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contacts
-- ----------------------------
COMMENT ON COLUMN "public"."crm_contacts"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_contacts"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contacts"."contact_name" IS '联系人姓名';
COMMENT ON COLUMN "public"."crm_contacts"."gender" IS '性别:0-未知,1-男,2-女';
COMMENT ON COLUMN "public"."crm_contacts"."position" IS '职位';
COMMENT ON COLUMN "public"."crm_contacts"."department" IS '部门';
COMMENT ON COLUMN "public"."crm_contacts"."mobile" IS '手机';
COMMENT ON COLUMN "public"."crm_contacts"."phone" IS '电话';
COMMENT ON COLUMN "public"."crm_contacts"."email" IS '邮箱';
COMMENT ON COLUMN "public"."crm_contacts"."wechat" IS '微信';
COMMENT ON COLUMN "public"."crm_contacts"."qq" IS 'QQ号';
COMMENT ON COLUMN "public"."crm_contacts"."is_primary" IS '是否主要联系人:0-否,1-是';
COMMENT ON COLUMN "public"."crm_contacts"."relationship" IS '关系';
COMMENT ON COLUMN "public"."crm_contacts"."influence_level" IS '影响力等级 [crm_contacts_influence_level]';
COMMENT ON COLUMN "public"."crm_contacts"."birthday" IS '生日';
COMMENT ON COLUMN "public"."crm_contacts"."anniversary_date" IS '纪念日';
COMMENT ON COLUMN "public"."crm_contacts"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_contacts"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_contacts"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contacts"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_contacts"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contacts"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_contacts_is_deleted]';
COMMENT ON TABLE "public"."crm_contacts" IS 'Contacts';

-- ----------------------------
-- Records of crm_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contract_invoices
-- ----------------------------
COMMENT ON COLUMN "public"."crm_contract_invoices"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_contract_invoices"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contract_invoices"."payment_plan_id" IS '付款计划ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_code" IS '发票编号';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_number" IS '发票号码';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_type" IS '发票类型:1-增值税专票,2-增值税普票,3-普通发票 [crm_contract_invoices_invoice_type]';
COMMENT ON COLUMN "public"."crm_contract_invoices"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_contract_invoices"."tax_rate" IS '税率';
COMMENT ON COLUMN "public"."crm_contract_invoices"."tax_amount" IS '税额';
COMMENT ON COLUMN "public"."crm_contract_invoices"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_date" IS '开票日期';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_status" IS '发票状态:1-草稿,2-已开具,3-已发送,4-已收款,5-已作废 [crm_contract_invoices_invoice_status]';
COMMENT ON COLUMN "public"."crm_contract_invoices"."issued_by" IS '开具人ID';
COMMENT ON COLUMN "public"."crm_contract_invoices"."issued_at" IS '开具时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_file_url" IS '发票文件URL';
COMMENT ON COLUMN "public"."crm_contract_invoices"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_contract_invoices"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_contract_invoices"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_contract_invoices_is_deleted]';
COMMENT ON TABLE "public"."crm_contract_invoices" IS 'Contract Invoices';

-- ----------------------------
-- Records of crm_contract_invoices
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contract_items
-- ----------------------------
COMMENT ON COLUMN "public"."crm_contract_items"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_contract_items"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contract_items"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_contract_items"."product_name" IS '产品名称';
COMMENT ON COLUMN "public"."crm_contract_items"."product_code" IS '产品编号';
COMMENT ON COLUMN "public"."crm_contract_items"."quantity" IS '数量';
COMMENT ON COLUMN "public"."crm_contract_items"."unit_price" IS '单价';
COMMENT ON COLUMN "public"."crm_contract_items"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "public"."crm_contract_items"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_contract_items"."delivery_date" IS '交付日期';
COMMENT ON COLUMN "public"."crm_contract_items"."delivery_address" IS '收货地址';
COMMENT ON COLUMN "public"."crm_contract_items"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_contract_items"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_contract_items"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_contract_items" IS 'Contract Items';

-- ----------------------------
-- Records of crm_contract_items
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contracts
-- ----------------------------
COMMENT ON COLUMN "public"."crm_contracts"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_contracts"."contract_code" IS '合同编号';
COMMENT ON COLUMN "public"."crm_contracts"."contract_name" IS '合同名称';
COMMENT ON COLUMN "public"."crm_contracts"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contracts"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contracts"."quotation_id" IS '报价ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contracts"."contract_type" IS '合同类型:1-销售合同,2-服务合同,3-框架协议,4-续签合同,5-变更协议,6-终止协议 [crm_contracts_contract_type]';
COMMENT ON COLUMN "public"."crm_contracts"."start_date" IS '开始日期';
COMMENT ON COLUMN "public"."crm_contracts"."end_date" IS '结束日期';
COMMENT ON COLUMN "public"."crm_contracts"."currency" IS '币种:CNY-人民币,USD-美元,EUR-欧元';
COMMENT ON COLUMN "public"."crm_contracts"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_contracts"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "public"."crm_contracts"."unpaid_amount" IS '未付金额';
COMMENT ON COLUMN "public"."crm_contracts"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_contracts_status]';
COMMENT ON COLUMN "public"."crm_contracts"."approval_status" IS '审批状态:1-待审批,2-审批中,3-已通过,4-已拒绝,5-已撤销 [crm_contracts_approval_status]';
COMMENT ON COLUMN "public"."crm_contracts"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_contracts"."approved_at" IS '审批时间';
COMMENT ON COLUMN "public"."crm_contracts"."signed_date" IS '签约日期';
COMMENT ON COLUMN "public"."crm_contracts"."signed_by_customer" IS '客户签字人';
COMMENT ON COLUMN "public"."crm_contracts"."signed_by_company" IS '公司签字人';
COMMENT ON COLUMN "public"."crm_contracts"."contract_file_url" IS '合同文件URL';
COMMENT ON COLUMN "public"."crm_contracts"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_contracts"."terms_conditions" IS '条款条件';
COMMENT ON COLUMN "public"."crm_contracts"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_contracts"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_contracts"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contracts"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_contracts"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contracts"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_contracts_is_deleted]';
COMMENT ON TABLE "public"."crm_contracts" IS 'Contracts';

-- ----------------------------
-- Records of crm_contracts
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_activities
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_activities"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_activities"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_activities"."activity_type" IS '活动类型:1-电话,2-邮件,3-拜访,4-会议,5-培训,6-展会 [crm_customer_activities_activity_type]';
COMMENT ON COLUMN "public"."crm_customer_activities"."activity_title" IS '活动标题';
COMMENT ON COLUMN "public"."crm_customer_activities"."activity_content" IS '活动内容';
COMMENT ON COLUMN "public"."crm_customer_activities"."related_type" IS '关联类型 [crm_customer_activities_related_type]';
COMMENT ON COLUMN "public"."crm_customer_activities"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_activities"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_customer_activities"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "public"."crm_customer_activities"."activity_date" IS '活动日期';
COMMENT ON COLUMN "public"."crm_customer_activities"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_customer_activities" IS 'Customer Activities';

-- ----------------------------
-- Records of crm_customer_activities
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_addresses
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_addresses"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_addresses"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_addresses"."address_type" IS '地址类型 [crm_customer_addresses_address_type]';
COMMENT ON COLUMN "public"."crm_customer_addresses"."address_name" IS '地址名称';
COMMENT ON COLUMN "public"."crm_customer_addresses"."province" IS '省份';
COMMENT ON COLUMN "public"."crm_customer_addresses"."city" IS '城市';
COMMENT ON COLUMN "public"."crm_customer_addresses"."district" IS '区县';
COMMENT ON COLUMN "public"."crm_customer_addresses"."detail_address" IS '详细地址';
COMMENT ON COLUMN "public"."crm_customer_addresses"."postal_code" IS '邮编';
COMMENT ON COLUMN "public"."crm_customer_addresses"."latitude" IS '纬度';
COMMENT ON COLUMN "public"."crm_customer_addresses"."longitude" IS '经度';
COMMENT ON COLUMN "public"."crm_customer_addresses"."contact_person" IS '联系人';
COMMENT ON COLUMN "public"."crm_customer_addresses"."contact_phone" IS '联系电话';
COMMENT ON COLUMN "public"."crm_customer_addresses"."is_default" IS '是否默认:0-否,1-是';
COMMENT ON COLUMN "public"."crm_customer_addresses"."is_active" IS '是否启用:0-否,1-是';
COMMENT ON COLUMN "public"."crm_customer_addresses"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_customer_addresses"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_addresses"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_addresses"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_customer_addresses_is_deleted]';
COMMENT ON TABLE "public"."crm_customer_addresses" IS 'Customer Addresses';

-- ----------------------------
-- Records of crm_customer_addresses
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_attachments
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_attachments"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_attachments"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_attachments"."file_name" IS '文件名';
COMMENT ON COLUMN "public"."crm_customer_attachments"."file_path" IS '文件路径';
COMMENT ON COLUMN "public"."crm_customer_attachments"."file_type" IS '文件类型 [crm_customer_attachments_file_type]';
COMMENT ON COLUMN "public"."crm_customer_attachments"."mime_type" IS 'MIME类型 [crm_customer_attachments_mime_type]';
COMMENT ON COLUMN "public"."crm_customer_attachments"."file_size" IS '文件大小';
COMMENT ON COLUMN "public"."crm_customer_attachments"."attachment_type" IS '附件类型 [crm_customer_attachments_attachment_type]';
COMMENT ON COLUMN "public"."crm_customer_attachments"."uploader_id" IS '上传人ID';
COMMENT ON COLUMN "public"."crm_customer_attachments"."uploaded_at" IS '上传时间';
COMMENT ON COLUMN "public"."crm_customer_attachments"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_attachments"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_customer_attachments_is_deleted]';
COMMENT ON TABLE "public"."crm_customer_attachments" IS 'Customer Attachments';

-- ----------------------------
-- Records of crm_customer_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_change_logs
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_change_logs"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."field_name" IS '字段名称';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."field_label" IS '字段标签';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."old_value" IS '旧值';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."new_value" IS '新值';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."change_type" IS '变更类型 [crm_customer_change_logs_change_type]';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."change_reason" IS '变更原因';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."changed_at" IS '变更时间';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_customer_change_logs" IS 'Customer Change Logs';

-- ----------------------------
-- Records of crm_customer_change_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_duplicate_logs
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."customer_a_id" IS '客户A ID';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."customer_b_id" IS '客户B ID';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."similarity" IS '相似度';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."collision_type" IS '冲突类型 [crm_customer_duplicate_logs_collision_type]';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."handled_by" IS '处理人ID';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."handled_at" IS '处理时间';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."result" IS '结果';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_customer_duplicate_logs" IS 'Customer Duplicate Logs';

-- ----------------------------
-- Records of crm_customer_duplicate_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_health
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_health"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_health"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_health"."health_score" IS '健康度评分';
COMMENT ON COLUMN "public"."crm_customer_health"."health_level" IS '健康等级 [crm_customer_health_health_level]';
COMMENT ON COLUMN "public"."crm_customer_health"."product_usage_score" IS '产品使用评分';
COMMENT ON COLUMN "public"."crm_customer_health"."support_tickets_score" IS '支持工单评分';
COMMENT ON COLUMN "public"."crm_customer_health"."payment_score" IS '付款评分';
COMMENT ON COLUMN "public"."crm_customer_health"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "public"."crm_customer_health"."satisfaction_score" IS '满意度评分';
COMMENT ON COLUMN "public"."crm_customer_health"."risk_factors" IS '风险因素';
COMMENT ON COLUMN "public"."crm_customer_health"."risk_level" IS '风险等级 [crm_customer_health_risk_level]';
COMMENT ON COLUMN "public"."crm_customer_health"."contract_end_date" IS '合同结束日期';
COMMENT ON COLUMN "public"."crm_customer_health"."renewal_probability" IS '续约概率';
COMMENT ON COLUMN "public"."crm_customer_health"."renewal_status" IS '续约状态 [crm_customer_health_renewal_status]';
COMMENT ON COLUMN "public"."crm_customer_health"."assessed_at" IS '评估时间';
COMMENT ON COLUMN "public"."crm_customer_health"."next_assessment_date" IS '下次评估日期';
COMMENT ON COLUMN "public"."crm_customer_health"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_customer_health" IS 'Customer Health';

-- ----------------------------
-- Records of crm_customer_health
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_health_scores
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_health_scores"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."score_date" IS '评分日期';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."overall_score" IS '综合评分';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."health_level" IS '健康等级 [crm_customer_health_scores_health_level]';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."dimension_scores" IS '维度评分';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."product_usage" IS '产品使用情况';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."adoption_rate" IS '采用率';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."avg_contact_frequency" IS '平均联系频率';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."last_interaction_date" IS '最后互动日期';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."payment_score" IS '付款评分';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."revenue_trend" IS '收入趋势';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."arpu" IS 'ARPU';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."satisfaction_score" IS '满意度评分';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."nps_score" IS 'NPS评分';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."last_survey_date" IS '最后调查日期';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."risk_indicators" IS '风险指标';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."churn_signals" IS '流失信号';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."churn_probability" IS '流失概率';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."expansion_probability" IS '扩展概率';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."ai_insights" IS 'AI洞察';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_customer_health_scores" IS 'Customer Health Scores';

-- ----------------------------
-- Records of crm_customer_health_scores
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_pool_logs
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."action_type" IS '操作类型 [crm_customer_pool_logs_action_type]';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."action_date" IS '操作日期';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."from_user_id" IS '原负责人ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."from_dept_id" IS '原部门ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."to_user_id" IS '目标负责人ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."to_dept_id" IS '目标部门ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."reason" IS '原因';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."transfer_type" IS '转移类型 [crm_customer_pool_logs_transfer_type]';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_customer_pool_logs" IS 'Customer Pool Logs';

-- ----------------------------
-- Records of crm_customer_pool_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_profiles
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_profiles"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_profiles"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_profiles"."basic_profile" IS '基础画像';
COMMENT ON COLUMN "public"."crm_customer_profiles"."behavior_profile" IS '行为画像';
COMMENT ON COLUMN "public"."crm_customer_profiles"."preference_profile" IS '偏好画像';
COMMENT ON COLUMN "public"."crm_customer_profiles"."value_profile" IS '价值画像';
COMMENT ON COLUMN "public"."crm_customer_profiles"."purchase_patterns" IS '购买模式';
COMMENT ON COLUMN "public"."crm_customer_profiles"."preferred_products" IS '首选产品';
COMMENT ON COLUMN "public"."crm_customer_profiles"."price_sensitivity" IS '价格敏感度';
COMMENT ON COLUMN "public"."crm_customer_profiles"."buying_stages" IS '购买阶段';
COMMENT ON COLUMN "public"."crm_customer_profiles"."communication_prefs" IS '沟通偏好';
COMMENT ON COLUMN "public"."crm_customer_profiles"."best_contact_times" IS '最佳联系时段';
COMMENT ON COLUMN "public"."crm_customer_profiles"."preferred_channels" IS '首选渠道';
COMMENT ON COLUMN "public"."crm_customer_profiles"."lifetime_value" IS '生命周期价值';
COMMENT ON COLUMN "public"."crm_customer_profiles"."churn_probability" IS '流失概率';
COMMENT ON COLUMN "public"."crm_customer_profiles"."upsell_probability" IS '增购概率';
COMMENT ON COLUMN "public"."crm_customer_profiles"."referral_probability" IS '推荐概率';
COMMENT ON COLUMN "public"."crm_customer_profiles"."personas" IS '角色';
COMMENT ON COLUMN "public"."crm_customer_profiles"."tags" IS '标签';
COMMENT ON COLUMN "public"."crm_customer_profiles"."analysis_count" IS '分析次数';
COMMENT ON COLUMN "public"."crm_customer_profiles"."last_analysis_at" IS '最后分析时间';
COMMENT ON COLUMN "public"."crm_customer_profiles"."model_version" IS '模型版本';
COMMENT ON COLUMN "public"."crm_customer_profiles"."confidence_score" IS '置信度评分';
COMMENT ON COLUMN "public"."crm_customer_profiles"."data_completeness" IS '数据完整度';
COMMENT ON COLUMN "public"."crm_customer_profiles"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_profiles"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_profiles"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_customer_profiles" IS 'Customer Profiles';

-- ----------------------------
-- Records of crm_customer_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_satisfaction_surveys
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."survey_code" IS '调查编号';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."survey_name" IS '调查名称';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."survey_type" IS '调查类型 [crm_customer_satisfaction_surveys_survey_type]';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."project_id" IS '项目ID';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."sent_date" IS '发送日期';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."completed_date" IS '完成日期';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."overall_score" IS '综合评分';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."nps_score" IS 'NPS评分';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."csat_score" IS 'CSAT评分';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."ces_score" IS 'CES评分';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."dimension_scores" IS '维度评分';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."feedback" IS '反馈';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."positive_feedback" IS '正面反馈';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."negative_feedback" IS '负面反馈';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."follow_up_required" IS '需要跟进';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."follow_up_status" IS '跟进状态 [crm_customer_satisfaction_surveys_follow_up_status]';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."follow_up_by" IS '跟进人ID';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."follow_up_date" IS '跟进日期';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."follow_up_notes" IS '跟进备注';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."channel" IS '渠道';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."respondent_email" IS '受访者邮箱';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_customer_satisfaction_surveys" IS 'Customer Satisfaction Surveys';

-- ----------------------------
-- Records of crm_customer_satisfaction_surveys
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_tags
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_tags"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_tags"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_tags"."tag_id" IS '标签ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_tags"."tag_source" IS '标签来源 [crm_customer_tags_tag_source]';
COMMENT ON COLUMN "public"."crm_customer_tags"."confidence" IS '置信度';
COMMENT ON COLUMN "public"."crm_customer_tags"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_customer_tags"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_tags"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_customer_tags_is_deleted]';
COMMENT ON TABLE "public"."crm_customer_tags" IS 'Customer Tags';

-- ----------------------------
-- Records of crm_customer_tags
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_timeline
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customer_timeline"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customer_timeline"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_timeline"."event_type" IS '事件类型 [crm_customer_timeline_event_type]';
COMMENT ON COLUMN "public"."crm_customer_timeline"."event_category" IS '事件分类 [crm_customer_timeline_event_category]';
COMMENT ON COLUMN "public"."crm_customer_timeline"."title" IS '职位';
COMMENT ON COLUMN "public"."crm_customer_timeline"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_customer_timeline"."related_type" IS '关联类型 [crm_customer_timeline_related_type]';
COMMENT ON COLUMN "public"."crm_customer_timeline"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_timeline"."related_name" IS '关联名称';
COMMENT ON COLUMN "public"."crm_customer_timeline"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_customer_timeline"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "public"."crm_customer_timeline"."attachments" IS '附件';
COMMENT ON COLUMN "public"."crm_customer_timeline"."extra_data" IS '扩展数据';
COMMENT ON COLUMN "public"."crm_customer_timeline"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_customer_timeline" IS 'Customer Timeline';

-- ----------------------------
-- Records of crm_customer_timeline
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customers
-- ----------------------------
COMMENT ON COLUMN "public"."crm_customers"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_customers"."customer_code" IS '客户编号';
COMMENT ON COLUMN "public"."crm_customers"."customer_name" IS '客户名称';
COMMENT ON COLUMN "public"."crm_customers"."customer_type" IS '客户类型:1-企业客户,2-个人客户,3-政府机构,4-事业单位,5-合作伙伴 [crm_customers_customer_type]';
COMMENT ON COLUMN "public"."crm_customers"."industry" IS '所属行业';
COMMENT ON COLUMN "public"."crm_customers"."source" IS '来源:1-自主开发,2-市场活动,3-转介绍,4-网络推广,5-合作伙伴,6-招投标 [crm_customers_source]';
COMMENT ON COLUMN "public"."crm_customers"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_customers_status]';
COMMENT ON COLUMN "public"."crm_customers"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_customers"."department_id" IS '所属部门ID,关联sys_dept';
COMMENT ON COLUMN "public"."crm_customers"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "public"."crm_customers"."pool_status" IS '公海池状态:1-私有,2-公海 [crm_customers_pool_status]';
COMMENT ON COLUMN "public"."crm_customers"."last_followup_at" IS '最后跟进时间';
COMMENT ON COLUMN "public"."crm_customers"."next_followup_at" IS '下次跟进时间';
COMMENT ON COLUMN "public"."crm_customers"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customers"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customers"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_customers"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_customers"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_customers"."customer_short_name" IS '客户简称';
COMMENT ON COLUMN "public"."crm_customers"."customer_level" IS '客户等级:A/B/C/D [crm_customers_customer_level]';
COMMENT ON COLUMN "public"."crm_customers"."scale" IS '企业规模:SME/中大型/大型/集团';
COMMENT ON COLUMN "public"."crm_customers"."registration_no" IS '工商注册号';
COMMENT ON COLUMN "public"."crm_customers"."tax_no" IS '税号';
COMMENT ON COLUMN "public"."crm_customers"."legal_person" IS '法人代表';
COMMENT ON COLUMN "public"."crm_customers"."established_date" IS '成立日期';
COMMENT ON COLUMN "public"."crm_customers"."registered_capital" IS '注册资本';
COMMENT ON COLUMN "public"."crm_customers"."paid_capital" IS '实缴资本';
COMMENT ON COLUMN "public"."crm_customers"."website" IS '公司网站';
COMMENT ON COLUMN "public"."crm_customers"."main_phone" IS '主联系电话';
COMMENT ON COLUMN "public"."crm_customers"."main_email" IS '主联系邮箱';
COMMENT ON COLUMN "public"."crm_customers"."country" IS '国家';
COMMENT ON COLUMN "public"."crm_customers"."province" IS '省份';
COMMENT ON COLUMN "public"."crm_customers"."city" IS '城市';
COMMENT ON COLUMN "public"."crm_customers"."district" IS '区县';
COMMENT ON COLUMN "public"."crm_customers"."address" IS '详细地址';
COMMENT ON COLUMN "public"."crm_customers"."rating" IS '客户评分:1-5分';
COMMENT ON COLUMN "public"."crm_customers"."territory" IS '所属区域';
COMMENT ON COLUMN "public"."crm_customers"."customer_since" IS '成为客户时间';
COMMENT ON COLUMN "public"."crm_customers"."first_order_date" IS '首单日期';
COMMENT ON COLUMN "public"."crm_customers"."last_order_date" IS '最后订单日期';
COMMENT ON COLUMN "public"."crm_customers"."total_revenue" IS '总营收';
COMMENT ON COLUMN "public"."crm_customers"."total_orders" IS '总订单数';
COMMENT ON COLUMN "public"."crm_customers"."credit_limit" IS '信用额度';
COMMENT ON COLUMN "public"."crm_customers"."outstanding_amount" IS '欠款金额';
COMMENT ON COLUMN "public"."crm_customers"."payment_days" IS '账期天数';
COMMENT ON COLUMN "public"."crm_customers"."parent_customer_id" IS '父客户ID(集团客户)';
COMMENT ON COLUMN "public"."crm_customers"."is_parent" IS '是否父客户(集团总部)';
COMMENT ON COLUMN "public"."crm_customers"."customer_segment" IS '客户分群';
COMMENT ON COLUMN "public"."crm_customers"."churn_risk" IS '流失风险(high/medium/low)';
COMMENT ON COLUMN "public"."crm_customers"."description" IS '客户描述';
COMMENT ON COLUMN "public"."crm_customers"."extra_data" IS '扩展数据(JSONB)';
COMMENT ON COLUMN "public"."crm_customers"."version" IS '版本号(乐观锁)';
COMMENT ON COLUMN "public"."crm_customers"."protection_deadline" IS '保护期截止时间(公海池)';
COMMENT ON COLUMN "public"."crm_customers"."claim_time" IS '领取时间(公海池)';
COMMENT ON COLUMN "public"."crm_customers"."health_score" IS '健康度评分';
COMMENT ON COLUMN "public"."crm_customers"."duplicate_check_key" IS '查重键(防止重复客户)';
COMMENT ON TABLE "public"."crm_customers" IS 'Customers';

-- ----------------------------
-- Records of crm_customers
-- ----------------------------

-- ----------------------------
-- Table structure for crm_data_dicts
-- ----------------------------
COMMENT ON COLUMN "public"."crm_data_dicts"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_type" IS '字典类型 [crm_data_dicts_dict_type]';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_code" IS '字典编码';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_label" IS '字典标签';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_value" IS '字典值';
COMMENT ON COLUMN "public"."crm_data_dicts"."parent_id" IS '父级ID';
COMMENT ON COLUMN "public"."crm_data_dicts"."level" IS '级别';
COMMENT ON COLUMN "public"."crm_data_dicts"."is_leaf" IS '是否叶子节点:0-否,1-是';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_sort" IS '字典排序';
COMMENT ON COLUMN "public"."crm_data_dicts"."css_class" IS 'CSS类名';
COMMENT ON COLUMN "public"."crm_data_dicts"."list_class" IS '列表类名';
COMMENT ON COLUMN "public"."crm_data_dicts"."color_class" IS '颜色类名';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_status" IS '字典状态 [crm_data_dicts_dict_status]';
COMMENT ON COLUMN "public"."crm_data_dicts"."is_default" IS '是否默认:0-否,1-是';
COMMENT ON COLUMN "public"."crm_data_dicts"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_data_dicts"."extra_data" IS '扩展数据';
COMMENT ON COLUMN "public"."crm_data_dicts"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_data_dicts"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_data_dicts"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_data_dicts"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_data_dicts"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_data_dicts_is_deleted]';
COMMENT ON TABLE "public"."crm_data_dicts" IS 'Data Dicts';

-- ----------------------------
-- Records of crm_data_dicts
-- ----------------------------

-- ----------------------------
-- Table structure for crm_deliveries
-- ----------------------------
COMMENT ON COLUMN "public"."crm_deliveries"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_deliveries"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "public"."crm_deliveries"."delivery_code" IS '配送编号';
COMMENT ON COLUMN "public"."crm_deliveries"."delivery_date" IS '交付日期';
COMMENT ON COLUMN "public"."crm_deliveries"."delivery_method" IS '交付方式 [crm_deliveries_delivery_method]';
COMMENT ON COLUMN "public"."crm_deliveries"."logistics_company" IS '物流公司';
COMMENT ON COLUMN "public"."crm_deliveries"."tracking_number" IS '运单号';
COMMENT ON COLUMN "public"."crm_deliveries"."receiver_name" IS '收货人姓名';
COMMENT ON COLUMN "public"."crm_deliveries"."receiver_signature" IS '签收人';
COMMENT ON COLUMN "public"."crm_deliveries"."signed_at" IS '签收时间';
COMMENT ON COLUMN "public"."crm_deliveries"."delivery_status" IS '物流状态 [crm_deliveries_delivery_status]';
COMMENT ON COLUMN "public"."crm_deliveries"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_deliveries"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_deliveries"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_deliveries"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_deliveries" IS 'Deliveries';

-- ----------------------------
-- Records of crm_deliveries
-- ----------------------------

-- ----------------------------
-- Table structure for crm_follow_records
-- ----------------------------
COMMENT ON COLUMN "public"."crm_follow_records"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_follow_records"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_follow_records"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_follow_records"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_follow_records"."follow_type" IS '跟进方式:1-电话,2-邮件,3-拜访,4-微信,5-其他 [crm_follow_records_follow_type]';
COMMENT ON COLUMN "public"."crm_follow_records"."subject" IS '主题';
COMMENT ON COLUMN "public"."crm_follow_records"."content" IS '内容';
COMMENT ON COLUMN "public"."crm_follow_records"."contact_mode" IS '联系方式 [crm_follow_records_contact_mode]';
COMMENT ON COLUMN "public"."crm_follow_records"."duration_minutes" IS '用时(分钟)';
COMMENT ON COLUMN "public"."crm_follow_records"."participants" IS '参与人';
COMMENT ON COLUMN "public"."crm_follow_records"."location" IS '地点';
COMMENT ON COLUMN "public"."crm_follow_records"."outcome" IS '结果';
COMMENT ON COLUMN "public"."crm_follow_records"."next_action" IS '下一步行动';
COMMENT ON COLUMN "public"."crm_follow_records"."next_follow_date" IS '下次跟进日期';
COMMENT ON COLUMN "public"."crm_follow_records"."attachments" IS '附件';
COMMENT ON COLUMN "public"."crm_follow_records"."sentiment" IS '情感倾向';
COMMENT ON COLUMN "public"."crm_follow_records"."key_points" IS '要点';
COMMENT ON COLUMN "public"."crm_follow_records"."action_items" IS '行动项';
COMMENT ON COLUMN "public"."crm_follow_records"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_follow_records"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_follow_records"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_follow_records"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_follow_records"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_follow_records"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_follow_records" IS 'Follow Records';

-- ----------------------------
-- Records of crm_follow_records
-- ----------------------------

-- ----------------------------
-- Table structure for crm_followups
-- ----------------------------
COMMENT ON COLUMN "public"."crm_followups"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_followups"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_followups"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_followups"."followup_type" IS '跟进类型 [crm_followups_followup_type]';
COMMENT ON COLUMN "public"."crm_followups"."followup_date" IS '跟进日期';
COMMENT ON COLUMN "public"."crm_followups"."followup_time" IS '跟进时间';
COMMENT ON COLUMN "public"."crm_followups"."duration" IS '时长';
COMMENT ON COLUMN "public"."crm_followups"."content" IS '内容';
COMMENT ON COLUMN "public"."crm_followups"."result" IS '结果';
COMMENT ON COLUMN "public"."crm_followups"."next_followup_date" IS '下次跟进日期';
COMMENT ON COLUMN "public"."crm_followups"."next_followup_content" IS '下次跟进内容';
COMMENT ON COLUMN "public"."crm_followups"."location" IS '地点';
COMMENT ON COLUMN "public"."crm_followups"."participants" IS '参与人';
COMMENT ON COLUMN "public"."crm_followups"."attachments" IS '附件';
COMMENT ON COLUMN "public"."crm_followups"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_followups"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_followups"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_followups"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_followups_is_deleted]';
COMMENT ON TABLE "public"."crm_followups" IS 'Followups';

-- ----------------------------
-- Records of crm_followups
-- ----------------------------

-- ----------------------------
-- Table structure for crm_import_records
-- ----------------------------
COMMENT ON COLUMN "public"."crm_import_records"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_import_records"."import_type" IS '导入类型 [crm_import_records_import_type]';
COMMENT ON COLUMN "public"."crm_import_records"."file_name" IS '文件名';
COMMENT ON COLUMN "public"."crm_import_records"."file_url" IS '文件URL';
COMMENT ON COLUMN "public"."crm_import_records"."file_size" IS '文件大小';
COMMENT ON COLUMN "public"."crm_import_records"."total_rows" IS '总行数';
COMMENT ON COLUMN "public"."crm_import_records"."success_rows" IS '成功行数';
COMMENT ON COLUMN "public"."crm_import_records"."failed_rows" IS '失败行数';
COMMENT ON COLUMN "public"."crm_import_records"."duplicate_rows" IS '重复行数';
COMMENT ON COLUMN "public"."crm_import_records"."error_log" IS '错误日志';
COMMENT ON COLUMN "public"."crm_import_records"."failed_data" IS '失败数据';
COMMENT ON COLUMN "public"."crm_import_records"."success_ids" IS '成功ID列表';
COMMENT ON COLUMN "public"."crm_import_records"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_import_records_status]';
COMMENT ON COLUMN "public"."crm_import_records"."started_at" IS '开始时间';
COMMENT ON COLUMN "public"."crm_import_records"."completed_at" IS '完成时间';
COMMENT ON COLUMN "public"."crm_import_records"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_import_records"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_import_records" IS 'Import Records';

-- ----------------------------
-- Records of crm_import_records
-- ----------------------------

-- ----------------------------
-- Table structure for crm_invoices
-- ----------------------------
COMMENT ON COLUMN "public"."crm_invoices"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_invoices"."invoice_code" IS '发票编号';
COMMENT ON COLUMN "public"."crm_invoices"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_invoices"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "public"."crm_invoices"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_invoices"."invoice_type" IS '发票类型:1-增值税专票,2-增值税普票,3-普通发票 [crm_invoices_invoice_type]';
COMMENT ON COLUMN "public"."crm_invoices"."invoice_date" IS '开票日期';
COMMENT ON COLUMN "public"."crm_invoices"."due_date" IS '到期日期';
COMMENT ON COLUMN "public"."crm_invoices"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_invoices"."tax_amount" IS '税额';
COMMENT ON COLUMN "public"."crm_invoices"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_invoices"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_invoices_status]';
COMMENT ON COLUMN "public"."crm_invoices"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "public"."crm_invoices"."payment_date" IS '付款日期';
COMMENT ON COLUMN "public"."crm_invoices"."notes" IS '备注说明';
COMMENT ON COLUMN "public"."crm_invoices"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_invoices"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_invoices"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_invoices"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_invoices"."deleted_at" IS '删除时间(软删除)';
COMMENT ON TABLE "public"."crm_invoices" IS 'Invoices';

-- ----------------------------
-- Records of crm_invoices
-- ----------------------------

-- ----------------------------
-- Table structure for crm_joint_followups
-- ----------------------------
COMMENT ON COLUMN "public"."crm_joint_followups"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_joint_followups"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_joint_followups"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_joint_followups"."role_type" IS '角色类型 [crm_joint_followups_role_type]';
COMMENT ON COLUMN "public"."crm_joint_followups"."responsibility" IS '职责';
COMMENT ON COLUMN "public"."crm_joint_followups"."can_edit" IS '是否可编辑:0-否,1-是';
COMMENT ON COLUMN "public"."crm_joint_followups"."can_view_sensitive" IS '是否可查看敏感信息:0-否,1-是';
COMMENT ON COLUMN "public"."crm_joint_followups"."followup_count" IS '跟进次数';
COMMENT ON COLUMN "public"."crm_joint_followups"."last_followup_date" IS '最后跟进日期';
COMMENT ON COLUMN "public"."crm_joint_followups"."contribution_score" IS '贡献评分';
COMMENT ON COLUMN "public"."crm_joint_followups"."assigned_date" IS '分配日期';
COMMENT ON COLUMN "public"."crm_joint_followups"."assigned_by" IS '分配人ID';
COMMENT ON COLUMN "public"."crm_joint_followups"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_joint_followups_status]';
COMMENT ON COLUMN "public"."crm_joint_followups"."end_date" IS '结束日期';
COMMENT ON COLUMN "public"."crm_joint_followups"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_joint_followups"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_joint_followups"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_joint_followups"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_joint_followups"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_joint_followups"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_joint_followups"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_joint_followups" IS 'Joint Followups';

-- ----------------------------
-- Records of crm_joint_followups
-- ----------------------------

-- ----------------------------
-- Table structure for crm_lead_scores
-- ----------------------------
COMMENT ON COLUMN "public"."crm_lead_scores"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_lead_scores"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "public"."crm_lead_scores"."total_score" IS '总分';
COMMENT ON COLUMN "public"."crm_lead_scores"."demographic_score" IS '人口统计评分';
COMMENT ON COLUMN "public"."crm_lead_scores"."behavior_score" IS '行为评分';
COMMENT ON COLUMN "public"."crm_lead_scores"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "public"."crm_lead_scores"."score_grade" IS '评分等级';
COMMENT ON COLUMN "public"."crm_lead_scores"."score_level" IS '评分等级 [crm_lead_scores_score_level]';
COMMENT ON COLUMN "public"."crm_lead_scores"."score_details" IS '评分详情';
COMMENT ON COLUMN "public"."crm_lead_scores"."last_scored_at" IS '最后评分时间';
COMMENT ON COLUMN "public"."crm_lead_scores"."next_score_date" IS '下次评分日期';
COMMENT ON COLUMN "public"."crm_lead_scores"."is_qualified" IS '是否合格';
COMMENT ON COLUMN "public"."crm_lead_scores"."qualified_at" IS '合格时间';
COMMENT ON COLUMN "public"."crm_lead_scores"."converted_to_opportunity" IS '是否转商机';
COMMENT ON COLUMN "public"."crm_lead_scores"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_lead_scores"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_lead_scores" IS 'Lead Scores';

-- ----------------------------
-- Records of crm_lead_scores
-- ----------------------------

-- ----------------------------
-- Table structure for crm_leads
-- ----------------------------
COMMENT ON COLUMN "public"."crm_leads"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_leads"."lead_code" IS '线索编号';
COMMENT ON COLUMN "public"."crm_leads"."lead_name" IS '线索名称';
COMMENT ON COLUMN "public"."crm_leads"."source" IS '来源:1-自主开发,2-市场活动,3-转介绍,4-网络推广,5-合作伙伴,6-招投标 [crm_leads_source]';
COMMENT ON COLUMN "public"."crm_leads"."campaign_id" IS '活动ID';
COMMENT ON COLUMN "public"."crm_leads"."channel" IS '渠道';
COMMENT ON COLUMN "public"."crm_leads"."phone" IS '电话';
COMMENT ON COLUMN "public"."crm_leads"."email" IS '邮箱';
COMMENT ON COLUMN "public"."crm_leads"."company" IS '公司名称';
COMMENT ON COLUMN "public"."crm_leads"."position" IS '职位';
COMMENT ON COLUMN "public"."crm_leads"."score" IS '评分';
COMMENT ON COLUMN "public"."crm_leads"."grade" IS '等级';
COMMENT ON COLUMN "public"."crm_leads"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_leads_status]';
COMMENT ON COLUMN "public"."crm_leads"."converted_customer_id" IS '转化后客户ID';
COMMENT ON COLUMN "public"."crm_leads"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_leads"."assigned_at" IS '分配时间';
COMMENT ON COLUMN "public"."crm_leads"."nurturing_stage" IS '培育阶段 [crm_leads_nurturing_stage]';
COMMENT ON COLUMN "public"."crm_leads"."last_nurturing_date" IS '最后培育日期';
COMMENT ON COLUMN "public"."crm_leads"."duplicate_check_key" IS '查重键';
COMMENT ON COLUMN "public"."crm_leads"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_leads"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_leads"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_leads"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_leads"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_leads_is_deleted]';
COMMENT ON TABLE "public"."crm_leads" IS 'Leads';

-- ----------------------------
-- Records of crm_leads
-- ----------------------------

-- ----------------------------
-- Table structure for crm_marketing_campaigns
-- ----------------------------
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."campaign_code" IS '活动编号';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."campaign_name" IS '活动名称';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."campaign_type" IS '活动类型 [crm_marketing_campaigns_campaign_type]';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."start_date" IS '开始日期';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."end_date" IS '结束日期';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."location" IS '地点';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."budget" IS '预算金额';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."actual_cost" IS '实际成本';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."target_leads" IS '目标线索数';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."target_customers" IS '目标客户';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_marketing_campaigns_status]';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_marketing_campaigns_is_deleted]';
COMMENT ON TABLE "public"."crm_marketing_campaigns" IS 'Marketing Campaigns';

-- ----------------------------
-- Records of crm_marketing_campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for crm_marketing_channels
-- ----------------------------
COMMENT ON COLUMN "public"."crm_marketing_channels"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_marketing_channels"."channel_code" IS '渠道编号';
COMMENT ON COLUMN "public"."crm_marketing_channels"."channel_name" IS '渠道名称';
COMMENT ON COLUMN "public"."crm_marketing_channels"."channel_type" IS '渠道类型 [crm_marketing_channels_channel_type]';
COMMENT ON COLUMN "public"."crm_marketing_channels"."channel_category" IS '渠道分类 [crm_marketing_channels_channel_category]';
COMMENT ON COLUMN "public"."crm_marketing_channels"."parent_id" IS '父级ID';
COMMENT ON COLUMN "public"."crm_marketing_channels"."cost_per_lead" IS '单线索成本';
COMMENT ON COLUMN "public"."crm_marketing_channels"."monthly_budget" IS '月度预算';
COMMENT ON COLUMN "public"."crm_marketing_channels"."actual_cost" IS '实际成本';
COMMENT ON COLUMN "public"."crm_marketing_channels"."total_leads" IS '总线索数';
COMMENT ON COLUMN "public"."crm_marketing_channels"."qualified_leads" IS '合格线索数';
COMMENT ON COLUMN "public"."crm_marketing_channels"."converted_customers" IS '转化客户数';
COMMENT ON COLUMN "public"."crm_marketing_channels"."total_revenue" IS '总收入';
COMMENT ON COLUMN "public"."crm_marketing_channels"."conversion_rate" IS '转化率';
COMMENT ON COLUMN "public"."crm_marketing_channels"."roi" IS '投资回报率';
COMMENT ON COLUMN "public"."crm_marketing_channels"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_marketing_channels_status]';
COMMENT ON COLUMN "public"."crm_marketing_channels"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_marketing_channels"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_marketing_channels"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_marketing_channels" IS 'Marketing Channels';

-- ----------------------------
-- Records of crm_marketing_channels
-- ----------------------------

-- ----------------------------
-- Table structure for crm_notifications
-- ----------------------------
COMMENT ON COLUMN "public"."crm_notifications"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_notifications"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_notifications"."notification_type" IS '通知类型:1-系统通知,2-审批通知,3-提醒通知,4-公告 [crm_notifications_notification_type]';
COMMENT ON COLUMN "public"."crm_notifications"."title" IS '职位';
COMMENT ON COLUMN "public"."crm_notifications"."content" IS '内容';
COMMENT ON COLUMN "public"."crm_notifications"."related_type" IS '关联类型 [crm_notifications_related_type]';
COMMENT ON COLUMN "public"."crm_notifications"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "public"."crm_notifications"."is_read" IS '是否已读:0-未读,1-已读';
COMMENT ON COLUMN "public"."crm_notifications"."read_at" IS '阅读时间';
COMMENT ON COLUMN "public"."crm_notifications"."priority" IS '优先级:1-低,2-中,3-高,4-紧急 [crm_notifications_priority]';
COMMENT ON COLUMN "public"."crm_notifications"."sent_at" IS '发送时间';
COMMENT ON COLUMN "public"."crm_notifications"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_notifications" IS 'Notifications';

-- ----------------------------
-- Records of crm_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for crm_operation_logs
-- ----------------------------
COMMENT ON COLUMN "public"."crm_operation_logs"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_operation_logs"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_operation_logs"."username" IS '用户名';
COMMENT ON COLUMN "public"."crm_operation_logs"."module" IS '模块';
COMMENT ON COLUMN "public"."crm_operation_logs"."action" IS '行动';
COMMENT ON COLUMN "public"."crm_operation_logs"."target_type" IS '目标类型 [crm_operation_logs_target_type]';
COMMENT ON COLUMN "public"."crm_operation_logs"."target_id" IS '目标ID,关联对应表';
COMMENT ON COLUMN "public"."crm_operation_logs"."target_name" IS '目标名称';
COMMENT ON COLUMN "public"."crm_operation_logs"."old_value" IS '旧值';
COMMENT ON COLUMN "public"."crm_operation_logs"."new_value" IS '新值';
COMMENT ON COLUMN "public"."crm_operation_logs"."changed_fields" IS '变更字段';
COMMENT ON COLUMN "public"."crm_operation_logs"."ip_address" IS 'IP地址';
COMMENT ON COLUMN "public"."crm_operation_logs"."user_agent" IS '用户代理';
COMMENT ON COLUMN "public"."crm_operation_logs"."request_method" IS '请求方法 [crm_operation_logs_request_method]';
COMMENT ON COLUMN "public"."crm_operation_logs"."request_url" IS '请求URL';
COMMENT ON COLUMN "public"."crm_operation_logs"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_operation_logs_status]';
COMMENT ON COLUMN "public"."crm_operation_logs"."error_message" IS '错误信息';
COMMENT ON COLUMN "public"."crm_operation_logs"."execution_time" IS '执行时间';
COMMENT ON COLUMN "public"."crm_operation_logs"."operated_at" IS '操作时间';
COMMENT ON COLUMN "public"."crm_operation_logs"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_operation_logs" IS 'Operation Logs';

-- ----------------------------
-- Records of crm_operation_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_opportunities
-- ----------------------------
COMMENT ON COLUMN "public"."crm_opportunities"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_opportunities"."opportunity_code" IS '商机编号';
COMMENT ON COLUMN "public"."crm_opportunities"."opportunity_name" IS '商机名称';
COMMENT ON COLUMN "public"."crm_opportunities"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_opportunities"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_opportunities"."currency" IS '币种:CNY-人民币,USD-美元,EUR-欧元';
COMMENT ON COLUMN "public"."crm_opportunities"."probability" IS '赢单概率';
COMMENT ON COLUMN "public"."crm_opportunities"."expected_close_date" IS '预计成交日期';
COMMENT ON COLUMN "public"."crm_opportunities"."stage" IS '阶段:1-初步接触,2-需求分析,3-方案设计,4-报价谈判,5-赢单,6-输单,7-暂停 [crm_opportunities_stage]';
COMMENT ON COLUMN "public"."crm_opportunities"."stage_updated_at" IS '阶段更新时间';
COMMENT ON COLUMN "public"."crm_opportunities"."product_ids" IS '产品IDs';
COMMENT ON COLUMN "public"."crm_opportunities"."source" IS '来源:1-自主开发,2-市场活动,3-转介绍,4-网络推广,5-合作伙伴,6-招投标 [crm_opportunities_source]';
COMMENT ON COLUMN "public"."crm_opportunities"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_opportunities"."lost_reason" IS '输单原因';
COMMENT ON COLUMN "public"."crm_opportunities"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_opportunities"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_opportunities"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_opportunities"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_opportunities"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_opportunities_is_deleted]';
COMMENT ON TABLE "public"."crm_opportunities" IS 'Opportunities';

-- ----------------------------
-- Records of crm_opportunities
-- ----------------------------

-- ----------------------------
-- Table structure for crm_opportunity_products
-- ----------------------------
COMMENT ON COLUMN "public"."crm_opportunity_products"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_opportunity_products"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_opportunity_products"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_opportunity_products"."product_name" IS '产品名称';
COMMENT ON COLUMN "public"."crm_opportunity_products"."quantity" IS '数量';
COMMENT ON COLUMN "public"."crm_opportunity_products"."unit_price" IS '单价';
COMMENT ON COLUMN "public"."crm_opportunity_products"."estimated_amount" IS '预计金额';
COMMENT ON COLUMN "public"."crm_opportunity_products"."is_preferred" IS '是否首选:0-否,1-是';
COMMENT ON COLUMN "public"."crm_opportunity_products"."win_rate" IS '赢单率';
COMMENT ON COLUMN "public"."crm_opportunity_products"."competitor_product" IS '竞品';
COMMENT ON COLUMN "public"."crm_opportunity_products"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_opportunity_products"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_opportunity_products"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_opportunity_products"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_opportunity_products"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_opportunity_products"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_opportunity_products"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_opportunity_products" IS 'Opportunity Products';

-- ----------------------------
-- Records of crm_opportunity_products
-- ----------------------------

-- ----------------------------
-- Table structure for crm_opportunity_stages
-- ----------------------------
COMMENT ON COLUMN "public"."crm_opportunity_stages"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stage_code" IS '阶段编号';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stage_name" IS '阶段名称';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stage_sequence" IS '阶段顺序';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."probability" IS '赢单概率';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."color" IS '颜色';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stay_limit" IS '停留限制(天)';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stay_limit_action" IS '超时动作';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."required_fields" IS '必填字段';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_opportunity_stages_status]';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."is_system" IS '是否系统内置';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."is_final" IS '是否终态';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."final_result" IS '最终结果';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_opportunity_stages" IS 'Opportunity Stages';

-- ----------------------------
-- Records of crm_opportunity_stages
-- ----------------------------
INSERT INTO "public"."crm_opportunity_stages" VALUES (1, 'LEAD', '初步接触', 1, 10, 'info', 7, NULL, NULL, 'active', 'f', 'f', NULL, NULL, 0, '2026-04-17 22:33:22.097147', '2026-04-17 22:33:22.097147', NULL, NULL, NULL);
INSERT INTO "public"."crm_opportunity_stages" VALUES (2, 'QUALIFY', '需求确认', 2, 25, 'primary', 14, NULL, NULL, 'active', 'f', 'f', NULL, NULL, 0, '2026-04-17 22:33:22.097147', '2026-04-17 22:33:22.097147', NULL, NULL, NULL);
INSERT INTO "public"."crm_opportunity_stages" VALUES (3, 'PROPOSAL', '方案报价', 3, 50, 'warning', 21, NULL, NULL, 'active', 'f', 'f', NULL, NULL, 0, '2026-04-17 22:33:22.097147', '2026-04-17 22:33:22.097147', NULL, NULL, NULL);
INSERT INTO "public"."crm_opportunity_stages" VALUES (4, 'NEGOTIATE', '谈判签约', 4, 75, 'warning', 14, NULL, NULL, 'active', 'f', 'f', NULL, NULL, 0, '2026-04-17 22:33:22.097147', '2026-04-17 22:33:22.097147', NULL, NULL, NULL);
INSERT INTO "public"."crm_opportunity_stages" VALUES (5, 'WON', '赢单', 5, 100, 'success', NULL, NULL, NULL, 'active', 'f', 'f', NULL, NULL, 0, '2026-04-17 22:33:22.097147', '2026-04-17 22:33:22.097147', NULL, NULL, NULL);
INSERT INTO "public"."crm_opportunity_stages" VALUES (6, 'LOST', '输单', 6, 0, 'danger', NULL, NULL, NULL, 'active', 'f', 'f', NULL, NULL, 0, '2026-04-17 22:33:22.097147', '2026-04-17 22:33:22.097147', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for crm_order_items
-- ----------------------------
COMMENT ON COLUMN "public"."crm_order_items"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_order_items"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "public"."crm_order_items"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_order_items"."product_code" IS '产品编号';
COMMENT ON COLUMN "public"."crm_order_items"."product_name" IS '产品名称';
COMMENT ON COLUMN "public"."crm_order_items"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "public"."crm_order_items"."sku_code" IS 'SKU编号';
COMMENT ON COLUMN "public"."crm_order_items"."quantity" IS '数量';
COMMENT ON COLUMN "public"."crm_order_items"."unit_price" IS '单价';
COMMENT ON COLUMN "public"."crm_order_items"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "public"."crm_order_items"."discount_amount" IS '折扣金额';
COMMENT ON COLUMN "public"."crm_order_items"."tax_rate" IS '税率';
COMMENT ON COLUMN "public"."crm_order_items"."tax_amount" IS '税额';
COMMENT ON COLUMN "public"."crm_order_items"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_order_items"."delivery_date" IS '交付日期';
COMMENT ON COLUMN "public"."crm_order_items"."delivery_address" IS '收货地址';
COMMENT ON COLUMN "public"."crm_order_items"."delivered_quantity" IS '已交付数量';
COMMENT ON COLUMN "public"."crm_order_items"."pending_quantity" IS '待交付数量';
COMMENT ON COLUMN "public"."crm_order_items"."production_status" IS '生产状态 [crm_order_items_production_status]';
COMMENT ON COLUMN "public"."crm_order_items"."production_note" IS '生产备注';
COMMENT ON COLUMN "public"."crm_order_items"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_order_items"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_order_items"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_order_items"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_order_items"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_order_items"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_order_items_is_deleted]';
COMMENT ON TABLE "public"."crm_order_items" IS 'Order Items';

-- ----------------------------
-- Records of crm_order_items
-- ----------------------------

-- ----------------------------
-- Table structure for crm_orders
-- ----------------------------
COMMENT ON COLUMN "public"."crm_orders"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_orders"."order_code" IS '订单编号';
COMMENT ON COLUMN "public"."crm_orders"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_orders"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_orders"."order_date" IS '订单日期';
COMMENT ON COLUMN "public"."crm_orders"."expected_delivery_date" IS '预计交付日期';
COMMENT ON COLUMN "public"."crm_orders"."actual_delivery_date" IS '实际交付日期';
COMMENT ON COLUMN "public"."crm_orders"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_orders"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "public"."crm_orders"."unpaid_amount" IS '未付金额';
COMMENT ON COLUMN "public"."crm_orders"."order_status" IS '订单状态:1-待确认,2-已确认,3-生产中,4-已发货,5-已完成,6-已取消 [crm_orders_order_status]';
COMMENT ON COLUMN "public"."crm_orders"."payment_status" IS '付款状态:1-未付款,2-部分付款,3-已付款,4-退款中,5-已退款 [crm_orders_payment_status]';
COMMENT ON COLUMN "public"."crm_orders"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_orders"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_orders"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_orders"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_orders"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_orders_is_deleted]';
COMMENT ON TABLE "public"."crm_orders" IS 'Orders';

-- ----------------------------
-- Records of crm_orders
-- ----------------------------

-- ----------------------------
-- Table structure for crm_payments
-- ----------------------------
COMMENT ON COLUMN "public"."crm_payments"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_payments"."payment_code" IS '收款编号';
COMMENT ON COLUMN "public"."crm_payments"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."payment_plan_id" IS '付款计划ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."payment_amount" IS '收款金额';
COMMENT ON COLUMN "public"."crm_payments"."payment_method" IS '付款方式 [crm_payments_payment_method]';
COMMENT ON COLUMN "public"."crm_payments"."payment_date" IS '付款日期';
COMMENT ON COLUMN "public"."crm_payments"."bank_name" IS '银行名称';
COMMENT ON COLUMN "public"."crm_payments"."bank_account" IS '银行账号';
COMMENT ON COLUMN "public"."crm_payments"."account_name" IS '账户名称';
COMMENT ON COLUMN "public"."crm_payments"."receipt_number" IS '收款单号';
COMMENT ON COLUMN "public"."crm_payments"."receipt_file_url" IS '收款凭证URL';
COMMENT ON COLUMN "public"."crm_payments"."invoice_id" IS '发票ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."is_invoiced" IS '是否已开票';
COMMENT ON COLUMN "public"."crm_payments"."payment_status" IS '付款状态:1-未付款,2-部分付款,3-已付款,4-退款中,5-已退款 [crm_payments_payment_status]';
COMMENT ON COLUMN "public"."crm_payments"."confirmed_by" IS '确认人ID';
COMMENT ON COLUMN "public"."crm_payments"."confirmed_at" IS '确认时间';
COMMENT ON COLUMN "public"."crm_payments"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_payments"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_payments"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_payments"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_payments"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_payments"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_payments_is_deleted]';
COMMENT ON TABLE "public"."crm_payments" IS 'Payments';

-- ----------------------------
-- Records of crm_payments
-- ----------------------------

-- ----------------------------
-- Table structure for crm_pool_transfers
-- ----------------------------
COMMENT ON COLUMN "public"."crm_pool_transfers"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_pool_transfers"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_pool_transfers"."from_pool" IS '来源公海';
COMMENT ON COLUMN "public"."crm_pool_transfers"."to_pool" IS '目标公海';
COMMENT ON COLUMN "public"."crm_pool_transfers"."from_owner_id" IS '原负责人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_pool_transfers"."to_owner_id" IS '新负责人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_pool_transfers"."transfer_reason" IS '转移原因';
COMMENT ON COLUMN "public"."crm_pool_transfers"."transfer_type" IS '转移类型 [crm_pool_transfers_transfer_type]';
COMMENT ON COLUMN "public"."crm_pool_transfers"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_pool_transfers"."transferred_at" IS '转移时间';
COMMENT ON COLUMN "public"."crm_pool_transfers"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_pool_transfers" IS 'Pool Transfers';

-- ----------------------------
-- Records of crm_pool_transfers
-- ----------------------------

-- ----------------------------
-- Table structure for crm_price_tiers
-- ----------------------------
COMMENT ON COLUMN "public"."crm_price_tiers"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_price_tiers"."tier_code" IS '层级编号';
COMMENT ON COLUMN "public"."crm_price_tiers"."tier_name" IS '层级名称';
COMMENT ON COLUMN "public"."crm_price_tiers"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "public"."crm_price_tiers"."min_amount" IS '最小金额';
COMMENT ON COLUMN "public"."crm_price_tiers"."max_amount" IS '最大金额';
COMMENT ON COLUMN "public"."crm_price_tiers"."customer_level" IS '客户等级:A-战略客户,B-重要客户,C-普通客户,D-潜在客户 [crm_price_tiers_customer_level]';
COMMENT ON COLUMN "public"."crm_price_tiers"."annual_revenue_min" IS '最低年营业额';
COMMENT ON COLUMN "public"."crm_price_tiers"."order_count_min" IS '最低订单数';
COMMENT ON COLUMN "public"."crm_price_tiers"."benefits" IS '权益说明';
COMMENT ON COLUMN "public"."crm_price_tiers"."priority" IS '优先级:1-低,2-中,3-高,4-紧急 [crm_price_tiers_priority]';
COMMENT ON COLUMN "public"."crm_price_tiers"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_price_tiers_status]';
COMMENT ON COLUMN "public"."crm_price_tiers"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_price_tiers"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_price_tiers"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_price_tiers" IS 'Price Tiers';

-- ----------------------------
-- Records of crm_price_tiers
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_categories
-- ----------------------------
COMMENT ON COLUMN "public"."crm_product_categories"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_product_categories"."category_name" IS '分类名称';
COMMENT ON COLUMN "public"."crm_product_categories"."parent_id" IS '父级ID';
COMMENT ON COLUMN "public"."crm_product_categories"."level" IS '级别';
COMMENT ON COLUMN "public"."crm_product_categories"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_product_categories"."icon" IS '图标';
COMMENT ON COLUMN "public"."crm_product_categories"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_product_categories"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_product_categories_status]';
COMMENT ON COLUMN "public"."crm_product_categories"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_categories"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_product_categories" IS 'Product Categories';

-- ----------------------------
-- Records of crm_product_categories
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_documents
-- ----------------------------
COMMENT ON COLUMN "public"."crm_product_documents"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_product_documents"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_documents"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "public"."crm_product_documents"."doc_name" IS '文档名称';
COMMENT ON COLUMN "public"."crm_product_documents"."doc_type" IS '文档类型 [crm_product_documents_doc_type]';
COMMENT ON COLUMN "public"."crm_product_documents"."file_path" IS '文件路径';
COMMENT ON COLUMN "public"."crm_product_documents"."file_size" IS '文件大小';
COMMENT ON COLUMN "public"."crm_product_documents"."mime_type" IS 'MIME类型 [crm_product_documents_mime_type]';
COMMENT ON COLUMN "public"."crm_product_documents"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_product_documents"."is_latest" IS '是否最新版本';
COMMENT ON COLUMN "public"."crm_product_documents"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_product_documents_status]';
COMMENT ON COLUMN "public"."crm_product_documents"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_product_documents"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_documents"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_product_documents_is_deleted]';
COMMENT ON TABLE "public"."crm_product_documents" IS 'Product Documents';

-- ----------------------------
-- Records of crm_product_documents
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_price_history
-- ----------------------------
COMMENT ON COLUMN "public"."crm_product_price_history"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_product_price_history"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_price_history"."old_price" IS '原价';
COMMENT ON COLUMN "public"."crm_product_price_history"."new_price" IS '新价';
COMMENT ON COLUMN "public"."crm_product_price_history"."price_type" IS '价格类型 [crm_product_price_history_price_type]';
COMMENT ON COLUMN "public"."crm_product_price_history"."change_reason" IS '变更原因';
COMMENT ON COLUMN "public"."crm_product_price_history"."approval_status" IS '审批状态:1-待审批,2-审批中,3-已通过,4-已拒绝,5-已撤销 [crm_product_price_history_approval_status]';
COMMENT ON COLUMN "public"."crm_product_price_history"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_product_price_history"."effective_date" IS '生效日期';
COMMENT ON COLUMN "public"."crm_product_price_history"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_product_price_history"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_product_price_history" IS 'Product Price History';

-- ----------------------------
-- Records of crm_product_price_history
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_price_policies
-- ----------------------------
COMMENT ON COLUMN "public"."crm_product_price_policies"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_product_price_policies"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_price_policies"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "public"."crm_product_price_policies"."policy_type" IS '策略类型 [crm_product_price_policies_policy_type]';
COMMENT ON COLUMN "public"."crm_product_price_policies"."policy_name" IS '策略名称';
COMMENT ON COLUMN "public"."crm_product_price_policies"."customer_level" IS '客户等级:A-战略客户,B-重要客户,C-普通客户,D-潜在客户 [crm_product_price_policies_customer_level]';
COMMENT ON COLUMN "public"."crm_product_price_policies"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_product_price_policies"."min_quantity" IS '最小数量';
COMMENT ON COLUMN "public"."crm_product_price_policies"."max_quantity" IS '最大数量';
COMMENT ON COLUMN "public"."crm_product_price_policies"."price" IS '价格';
COMMENT ON COLUMN "public"."crm_product_price_policies"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "public"."crm_product_price_policies"."valid_from" IS '生效日期';
COMMENT ON COLUMN "public"."crm_product_price_policies"."valid_to" IS '失效日期';
COMMENT ON COLUMN "public"."crm_product_price_policies"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_product_price_policies_status]';
COMMENT ON COLUMN "public"."crm_product_price_policies"."priority" IS '优先级:1-低,2-中,3-高,4-紧急 [crm_product_price_policies_priority]';
COMMENT ON COLUMN "public"."crm_product_price_policies"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_product_price_policies"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_price_policies"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_price_policies"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_product_price_policies_is_deleted]';
COMMENT ON TABLE "public"."crm_product_price_policies" IS 'Product Price Policies';

-- ----------------------------
-- Records of crm_product_price_policies
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_prices
-- ----------------------------
COMMENT ON COLUMN "public"."crm_product_prices"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_product_prices"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_prices"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "public"."crm_product_prices"."price_type" IS '价格类型 [crm_product_prices_price_type]';
COMMENT ON COLUMN "public"."crm_product_prices"."price_name" IS '价格名称';
COMMENT ON COLUMN "public"."crm_product_prices"."unit_price" IS '单价';
COMMENT ON COLUMN "public"."crm_product_prices"."min_quantity" IS '最小数量';
COMMENT ON COLUMN "public"."crm_product_prices"."max_quantity" IS '最大数量';
COMMENT ON COLUMN "public"."crm_product_prices"."effective_from" IS '生效日期';
COMMENT ON COLUMN "public"."crm_product_prices"."effective_to" IS '失效日期';
COMMENT ON COLUMN "public"."crm_product_prices"."is_active" IS '是否启用:0-否,1-是';
COMMENT ON COLUMN "public"."crm_product_prices"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_product_prices"."customer_level" IS '客户等级:A-战略客户,B-重要客户,C-普通客户,D-潜在客户 [crm_product_prices_customer_level]';
COMMENT ON COLUMN "public"."crm_product_prices"."quantity_prices" IS '阶梯价格';
COMMENT ON COLUMN "public"."crm_product_prices"."approval_status" IS '审批状态:1-待审批,2-审批中,3-已通过,4-已拒绝,5-已撤销 [crm_product_prices_approval_status]';
COMMENT ON COLUMN "public"."crm_product_prices"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_product_prices"."approved_at" IS '审批时间';
COMMENT ON COLUMN "public"."crm_product_prices"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_prices"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_prices"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_product_prices"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_product_prices"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_product_prices"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_product_prices" IS 'Product Prices';

-- ----------------------------
-- Records of crm_product_prices
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_skus
-- ----------------------------
COMMENT ON COLUMN "public"."crm_product_skus"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_product_skus"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_skus"."sku_code" IS 'SKU编号';
COMMENT ON COLUMN "public"."crm_product_skus"."sku_name" IS 'SKU名称';
COMMENT ON COLUMN "public"."crm_product_skus"."specifications" IS '规格参数';
COMMENT ON COLUMN "public"."crm_product_skus"."standard_price" IS '标准价';
COMMENT ON COLUMN "public"."crm_product_skus"."cost_price" IS '成本价';
COMMENT ON COLUMN "public"."crm_product_skus"."stock_quantity" IS '库存数量';
COMMENT ON COLUMN "public"."crm_product_skus"."min_stock" IS '最低库存';
COMMENT ON COLUMN "public"."crm_product_skus"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_product_skus_status]';
COMMENT ON COLUMN "public"."crm_product_skus"."is_default" IS '是否默认:0-否,1-是';
COMMENT ON COLUMN "public"."crm_product_skus"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_product_skus"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_skus"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_skus"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_product_skus_is_deleted]';
COMMENT ON TABLE "public"."crm_product_skus" IS 'Product Skus';

-- ----------------------------
-- Records of crm_product_skus
-- ----------------------------

-- ----------------------------
-- Table structure for crm_products
-- ----------------------------
COMMENT ON COLUMN "public"."crm_products"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_products"."product_code" IS '产品编号';
COMMENT ON COLUMN "public"."crm_products"."product_name" IS '产品名称';
COMMENT ON COLUMN "public"."crm_products"."category_id" IS '分类ID';
COMMENT ON COLUMN "public"."crm_products"."product_type" IS '产品类型:1-硬件,2-软件,3-服务 [crm_products_product_type]';
COMMENT ON COLUMN "public"."crm_products"."standard_price" IS '标准价';
COMMENT ON COLUMN "public"."crm_products"."cost_price" IS '成本价';
COMMENT ON COLUMN "public"."crm_products"."min_price" IS '最低价';
COMMENT ON COLUMN "public"."crm_products"."currency" IS '币种:CNY-人民币,USD-美元,EUR-欧元';
COMMENT ON COLUMN "public"."crm_products"."unit" IS '单位';
COMMENT ON COLUMN "public"."crm_products"."specifications" IS '规格参数';
COMMENT ON COLUMN "public"."crm_products"."stock_quantity" IS '库存数量';
COMMENT ON COLUMN "public"."crm_products"."min_stock" IS '最低库存';
COMMENT ON COLUMN "public"."crm_products"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_products_status]';
COMMENT ON COLUMN "public"."crm_products"."is_featured" IS '是否推荐';
COMMENT ON COLUMN "public"."crm_products"."image_url" IS '图片URL';
COMMENT ON COLUMN "public"."crm_products"."document_urls" IS '文档链接';
COMMENT ON COLUMN "public"."crm_products"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_products"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_products"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_products"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_products"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_products_is_deleted]';
COMMENT ON TABLE "public"."crm_products" IS 'Products';

-- ----------------------------
-- Records of crm_products
-- ----------------------------

-- ----------------------------
-- Table structure for crm_quotation_items
-- ----------------------------
COMMENT ON COLUMN "public"."crm_quotation_items"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_quotation_items"."quotation_id" IS '报价ID,关联对应表';
COMMENT ON COLUMN "public"."crm_quotation_items"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_quotation_items"."product_name" IS '产品名称';
COMMENT ON COLUMN "public"."crm_quotation_items"."product_code" IS '产品编号';
COMMENT ON COLUMN "public"."crm_quotation_items"."quantity" IS '数量';
COMMENT ON COLUMN "public"."crm_quotation_items"."unit_price" IS '单价';
COMMENT ON COLUMN "public"."crm_quotation_items"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "public"."crm_quotation_items"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_quotation_items"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_quotation_items"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_quotation_items"."created_at" IS '创建时间';
COMMENT ON TABLE "public"."crm_quotation_items" IS 'Quotation Items';

-- ----------------------------
-- Records of crm_quotation_items
-- ----------------------------

-- ----------------------------
-- Table structure for crm_quotations
-- ----------------------------
COMMENT ON COLUMN "public"."crm_quotations"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_quotations"."quotation_code" IS '报价编号';
COMMENT ON COLUMN "public"."crm_quotations"."quotation_name" IS '报价名称';
COMMENT ON COLUMN "public"."crm_quotations"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_quotations"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_quotations"."valid_until" IS '有效期至';
COMMENT ON COLUMN "public"."crm_quotations"."currency" IS '币种:CNY-人民币,USD-美元,EUR-欧元';
COMMENT ON COLUMN "public"."crm_quotations"."exchange_rate" IS '汇率';
COMMENT ON COLUMN "public"."crm_quotations"."subtotal" IS '小计';
COMMENT ON COLUMN "public"."crm_quotations"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "public"."crm_quotations"."discount_amount" IS '折扣金额';
COMMENT ON COLUMN "public"."crm_quotations"."tax_rate" IS '税率';
COMMENT ON COLUMN "public"."crm_quotations"."tax_amount" IS '税额';
COMMENT ON COLUMN "public"."crm_quotations"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_quotations"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_quotations_status]';
COMMENT ON COLUMN "public"."crm_quotations"."approval_status" IS '审批状态:1-待审批,2-审批中,3-已通过,4-已拒绝,5-已撤销 [crm_quotations_approval_status]';
COMMENT ON COLUMN "public"."crm_quotations"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_quotations"."approved_at" IS '审批时间';
COMMENT ON COLUMN "public"."crm_quotations"."converted_contract_id" IS '转化合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_quotations"."terms_conditions" IS '条款条件';
COMMENT ON COLUMN "public"."crm_quotations"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_quotations"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_quotations"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_quotations"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_quotations"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_quotations"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_quotations_is_deleted]';
COMMENT ON TABLE "public"."crm_quotations" IS 'Quotations';

-- ----------------------------
-- Records of crm_quotations
-- ----------------------------

-- ----------------------------
-- Table structure for crm_renewals
-- ----------------------------
COMMENT ON COLUMN "public"."crm_renewals"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_renewals"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_renewals"."renewal_type" IS '续约类型 [crm_renewals_renewal_type]';
COMMENT ON COLUMN "public"."crm_renewals"."current_contract_id" IS '当前合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_renewals"."new_contract_id" IS '新合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_renewals"."current_amount" IS '当前金额';
COMMENT ON COLUMN "public"."crm_renewals"."new_amount" IS '新金额';
COMMENT ON COLUMN "public"."crm_renewals"."increase_amount" IS '增加金额';
COMMENT ON COLUMN "public"."crm_renewals"."contract_start_date" IS '合同开始日期';
COMMENT ON COLUMN "public"."crm_renewals"."contract_end_date" IS '合同结束日期';
COMMENT ON COLUMN "public"."crm_renewals"."renewal_date" IS '续约日期';
COMMENT ON COLUMN "public"."crm_renewals"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_renewals_status]';
COMMENT ON COLUMN "public"."crm_renewals"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_renewals"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_renewals"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_renewals"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_renewals"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_renewals"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_renewals"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_renewals_is_deleted]';
COMMENT ON TABLE "public"."crm_renewals" IS 'Renewals';

-- ----------------------------
-- Records of crm_renewals
-- ----------------------------

-- ----------------------------
-- Table structure for crm_report_instances
-- ----------------------------
COMMENT ON COLUMN "public"."crm_report_instances"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_report_instances"."template_id" IS '模板ID';
COMMENT ON COLUMN "public"."crm_report_instances"."generated_by" IS '生成人ID';
COMMENT ON COLUMN "public"."crm_report_instances"."generated_at" IS '生成时间';
COMMENT ON COLUMN "public"."crm_report_instances"."filter_params" IS '过滤参数';
COMMENT ON COLUMN "public"."crm_report_instances"."result_data" IS '结果数据';
COMMENT ON COLUMN "public"."crm_report_instances"."total_rows" IS '总行数';
COMMENT ON COLUMN "public"."crm_report_instances"."file_url" IS '文件URL';
COMMENT ON COLUMN "public"."crm_report_instances"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_report_instances_status]';
COMMENT ON COLUMN "public"."crm_report_instances"."error_message" IS '错误信息';
COMMENT ON COLUMN "public"."crm_report_instances"."execution_time" IS '执行时间';
COMMENT ON TABLE "public"."crm_report_instances" IS 'Report Instances';

-- ----------------------------
-- Records of crm_report_instances
-- ----------------------------

-- ----------------------------
-- Table structure for crm_report_templates
-- ----------------------------
COMMENT ON COLUMN "public"."crm_report_templates"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_report_templates"."template_code" IS '模板编号';
COMMENT ON COLUMN "public"."crm_report_templates"."template_name" IS '模板名称';
COMMENT ON COLUMN "public"."crm_report_templates"."report_type" IS '报表类型 [crm_report_templates_report_type]';
COMMENT ON COLUMN "public"."crm_report_templates"."query_config" IS '查询配置';
COMMENT ON COLUMN "public"."crm_report_templates"."chart_config" IS '图表配置';
COMMENT ON COLUMN "public"."crm_report_templates"."columns_config" IS '列配置';
COMMENT ON COLUMN "public"."crm_report_templates"."filter_config" IS '过滤配置';
COMMENT ON COLUMN "public"."crm_report_templates"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_report_templates"."is_public" IS '是否公开';
COMMENT ON COLUMN "public"."crm_report_templates"."shared_roles" IS '共享角色';
COMMENT ON COLUMN "public"."crm_report_templates"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_report_templates_status]';
COMMENT ON COLUMN "public"."crm_report_templates"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_report_templates"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_report_templates"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_report_templates" IS 'Report Templates';

-- ----------------------------
-- Records of crm_report_templates
-- ----------------------------

-- ----------------------------
-- Table structure for crm_sales_activities
-- ----------------------------
COMMENT ON COLUMN "public"."crm_sales_activities"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_sales_activities"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_sales_activities"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_sales_activities"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_sales_activities"."activity_type" IS '活动类型:1-电话,2-邮件,3-拜访,4-会议,5-培训,6-展会 [crm_sales_activities_activity_type]';
COMMENT ON COLUMN "public"."crm_sales_activities"."subject" IS '主题';
COMMENT ON COLUMN "public"."crm_sales_activities"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_sales_activities"."activity_date" IS '活动日期';
COMMENT ON COLUMN "public"."crm_sales_activities"."start_time" IS '开始时间';
COMMENT ON COLUMN "public"."crm_sales_activities"."end_time" IS '结束时间';
COMMENT ON COLUMN "public"."crm_sales_activities"."duration_minutes" IS '用时(分钟)';
COMMENT ON COLUMN "public"."crm_sales_activities"."participants" IS '参与人';
COMMENT ON COLUMN "public"."crm_sales_activities"."outcome" IS '结果';
COMMENT ON COLUMN "public"."crm_sales_activities"."next_step" IS '下一步行动';
COMMENT ON COLUMN "public"."crm_sales_activities"."next_follow_date" IS '下次跟进日期';
COMMENT ON COLUMN "public"."crm_sales_activities"."related_customer_id" IS '关联客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_sales_activities"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_sales_activities"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_sales_activities"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_sales_activities"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_sales_activities_is_deleted]';
COMMENT ON TABLE "public"."crm_sales_activities" IS 'Sales Activities';

-- ----------------------------
-- Records of crm_sales_activities
-- ----------------------------

-- ----------------------------
-- Table structure for crm_sales_targets
-- ----------------------------
COMMENT ON COLUMN "public"."crm_sales_targets"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_sales_targets"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_sales_targets"."target_year" IS '目标年份';
COMMENT ON COLUMN "public"."crm_sales_targets"."target_quarter" IS '目标季度';
COMMENT ON COLUMN "public"."crm_sales_targets"."target_month" IS '目标月份';
COMMENT ON COLUMN "public"."crm_sales_targets"."target_amount" IS '目标金额';
COMMENT ON COLUMN "public"."crm_sales_targets"."target_deals" IS '目标成交数';
COMMENT ON COLUMN "public"."crm_sales_targets"."target_new_customers" IS '目标新客数';
COMMENT ON COLUMN "public"."crm_sales_targets"."actual_amount" IS '实际金额';
COMMENT ON COLUMN "public"."crm_sales_targets"."actual_deals" IS '实际成交数';
COMMENT ON COLUMN "public"."crm_sales_targets"."actual_new_customers" IS '实际新客数';
COMMENT ON COLUMN "public"."crm_sales_targets"."completion_rate" IS '完成比率';
COMMENT ON COLUMN "public"."crm_sales_targets"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_sales_targets"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_sales_targets"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_sales_targets" IS 'Sales Targets';

-- ----------------------------
-- Records of crm_sales_targets
-- ----------------------------

-- ----------------------------
-- Table structure for crm_satisfaction_surveys
-- ----------------------------
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."survey_type" IS '调查类型 [crm_satisfaction_surveys_survey_type]';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."survey_date" IS '调查日期';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."overall_score" IS '综合评分';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."product_quality_score" IS '产品质量评分';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."service_score" IS '服务评分';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."delivery_score" IS '交付评分';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."communication_score" IS '沟通评分';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."strengths" IS '优势分析';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."weaknesses" IS '劣势分析';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."suggestions" IS '改进建议';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."nps_score" IS 'NPS评分';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_satisfaction_surveys_status]';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_satisfaction_surveys_is_deleted]';
COMMENT ON TABLE "public"."crm_satisfaction_surveys" IS 'Satisfaction Surveys';

-- ----------------------------
-- Records of crm_satisfaction_surveys
-- ----------------------------

-- ----------------------------
-- Table structure for crm_tag_definitions
-- ----------------------------
COMMENT ON COLUMN "public"."crm_tag_definitions"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_tag_definitions"."tag_code" IS '标签编号';
COMMENT ON COLUMN "public"."crm_tag_definitions"."tag_name" IS '标签名称';
COMMENT ON COLUMN "public"."crm_tag_definitions"."tag_type" IS '标签类型 [crm_tag_definitions_tag_type]';
COMMENT ON COLUMN "public"."crm_tag_definitions"."category" IS '分类';
COMMENT ON COLUMN "public"."crm_tag_definitions"."color" IS '颜色';
COMMENT ON COLUMN "public"."crm_tag_definitions"."icon" IS '图标';
COMMENT ON COLUMN "public"."crm_tag_definitions"."applicable_types" IS '适用类型';
COMMENT ON COLUMN "public"."crm_tag_definitions"."is_multi_select" IS '是否多选';
COMMENT ON COLUMN "public"."crm_tag_definitions"."is_required" IS '是否必填';
COMMENT ON COLUMN "public"."crm_tag_definitions"."validation_rule" IS '验证规则';
COMMENT ON COLUMN "public"."crm_tag_definitions"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_tag_definitions_status]';
COMMENT ON COLUMN "public"."crm_tag_definitions"."sort_order" IS '排序';
COMMENT ON COLUMN "public"."crm_tag_definitions"."usage_count" IS '使用次数';
COMMENT ON COLUMN "public"."crm_tag_definitions"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_tag_definitions"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_tag_definitions"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_tag_definitions"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_tag_definitions"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_tag_definitions"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_tag_definitions" IS 'Tag Definitions';

-- ----------------------------
-- Records of crm_tag_definitions
-- ----------------------------

-- ----------------------------
-- Table structure for crm_tags
-- ----------------------------
COMMENT ON COLUMN "public"."crm_tags"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_tags"."tag_name" IS '标签名称';
COMMENT ON COLUMN "public"."crm_tags"."tag_category" IS '标签分类 [crm_tags_tag_category]';
COMMENT ON COLUMN "public"."crm_tags"."tag_color" IS '标签颜色';
COMMENT ON COLUMN "public"."crm_tags"."tag_icon" IS '标签图标';
COMMENT ON COLUMN "public"."crm_tags"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_tags"."ai_accuracy" IS 'AI准确率';
COMMENT ON COLUMN "public"."crm_tags"."usage_count" IS '使用次数';
COMMENT ON COLUMN "public"."crm_tags"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_tags_status]';
COMMENT ON COLUMN "public"."crm_tags"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_tags"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_tags"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_tags" IS 'Tags';

-- ----------------------------
-- Records of crm_tags
-- ----------------------------

-- ----------------------------
-- Table structure for crm_tasks
-- ----------------------------
COMMENT ON COLUMN "public"."crm_tasks"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_tasks"."task_type" IS '任务类型 [crm_tasks_task_type]';
COMMENT ON COLUMN "public"."crm_tasks"."title" IS '职位';
COMMENT ON COLUMN "public"."crm_tasks"."description" IS '描述';
COMMENT ON COLUMN "public"."crm_tasks"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."assignee_id" IS '接收人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."assigner_id" IS '分配人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."due_date" IS '到期日期';
COMMENT ON COLUMN "public"."crm_tasks"."priority" IS '优先级:1-低,2-中,3-高,4-紧急 [crm_tasks_priority]';
COMMENT ON COLUMN "public"."crm_tasks"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_tasks_status]';
COMMENT ON COLUMN "public"."crm_tasks"."completed_at" IS '完成时间';
COMMENT ON COLUMN "public"."crm_tasks"."remind_enabled" IS '是否启用提醒';
COMMENT ON COLUMN "public"."crm_tasks"."remind_before_minutes" IS '提前提醒分钟数';
COMMENT ON COLUMN "public"."crm_tasks"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_tasks"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_tasks"."is_deleted" IS '逻辑删除标记:0-未删除,1-已删除 [crm_tasks_is_deleted]';
COMMENT ON TABLE "public"."crm_tasks" IS 'Tasks';

-- ----------------------------
-- Records of crm_tasks
-- ----------------------------

-- ----------------------------
-- Table structure for crm_test_monitor_report
-- ----------------------------
COMMENT ON COLUMN "public"."crm_test_monitor_report"."report_name" IS '报告名称';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."test_type" IS '测试类型(api/ui/all) [crm_test_monitor_report_test_type]';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."total_tests" IS '总测试数';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."passed_count" IS '通过数';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."failed_count" IS '失败数';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."error_count" IS '错误数';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."skipped_count" IS '跳过数';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."pass_rate" IS '通过率(%)';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."start_time" IS '开始时间';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."end_time" IS '结束时间';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."duration" IS '执行时长(秒)';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."report_file" IS '报告文件路径';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."log_file" IS '日志文件路径';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."file_size" IS '文件大小';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."error_message" IS '错误信息';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."test_summary" IS '测试摘要';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."environment" IS '测试环境';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."is_completed" IS '是否完成(0否/1是)';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."deleted_at" IS '删除时间';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."updated_id" IS '更新人ID';
COMMENT ON TABLE "public"."crm_test_monitor_report" IS 'CRM监控报告';

-- ----------------------------
-- Records of crm_test_monitor_report
-- ----------------------------

-- ----------------------------
-- Table structure for crm_user_extensions
-- ----------------------------

COMMENT ON COLUMN "public"."crm_user_extensions"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_user_extensions"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_user_extensions"."sales_area" IS '销售区域';
COMMENT ON COLUMN "public"."crm_user_extensions"."team_id" IS '团队ID';
COMMENT ON COLUMN "public"."crm_user_extensions"."territory" IS '领土';
COMMENT ON COLUMN "public"."crm_user_extensions"."sales_targets" IS '销售目标';
COMMENT ON COLUMN "public"."crm_user_extensions"."commission_rate" IS '佣金比率';
COMMENT ON COLUMN "public"."crm_user_extensions"."max_discount" IS '最大折扣';
COMMENT ON COLUMN "public"."crm_user_extensions"."manager_id" IS '经理ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_user_extensions"."max_customers" IS '最大客户数';
COMMENT ON COLUMN "public"."crm_user_extensions"."auto_assign_enabled" IS '自动分配启用:0-否,1-是';
COMMENT ON COLUMN "public"."crm_user_extensions"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_user_extensions"."updated_at" IS '更新时间';
COMMENT ON COLUMN "public"."crm_user_extensions"."created_by" IS '创建人ID';
COMMENT ON COLUMN "public"."crm_user_extensions"."updated_by" IS '更新人ID';
COMMENT ON COLUMN "public"."crm_user_extensions"."deleted_at" IS '删除时间(软删除)';
COMMENT ON COLUMN "public"."crm_user_extensions"."version" IS '版本号';
COMMENT ON TABLE "public"."crm_user_extensions" IS 'User Extensions';

-- ----------------------------
-- Records of crm_user_extensions
-- ----------------------------

-- ----------------------------
-- Table structure for crm_workflow_approvals
-- ----------------------------
COMMENT ON COLUMN "public"."crm_workflow_approvals"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."workflow_type" IS '工作流类型 [crm_workflow_approvals_workflow_type]';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."related_type" IS '关联类型 [crm_workflow_approvals_related_type]';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."current_step" IS '当前步骤';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."total_steps" IS '总步骤数';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."status" IS '状态:1-潜在,2-意向,3-正式,4-休眠,5-流失 [crm_workflow_approvals_status]';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."initiator_id" IS '发起人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."initiated_at" IS '发起时间';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_workflow_approvals" IS 'Workflow Approvals';

-- ----------------------------
-- Records of crm_workflow_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for crm_workflow_logs
-- ----------------------------
COMMENT ON COLUMN "public"."crm_workflow_logs"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_workflow_logs"."rule_id" IS '规则ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_logs"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_logs"."trigger_data" IS '触发数据';
COMMENT ON COLUMN "public"."crm_workflow_logs"."execution_result" IS '执行结果';
COMMENT ON COLUMN "public"."crm_workflow_logs"."error_message" IS '错误信息';
COMMENT ON COLUMN "public"."crm_workflow_logs"."executed_at" IS '执行时间';
COMMENT ON TABLE "public"."crm_workflow_logs" IS 'Workflow Logs';

-- ----------------------------
-- Records of crm_workflow_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_workflow_rules
-- ----------------------------
COMMENT ON COLUMN "public"."crm_workflow_rules"."id" IS '主键ID';
COMMENT ON COLUMN "public"."crm_workflow_rules"."rule_name" IS '规则名称';
COMMENT ON COLUMN "public"."crm_workflow_rules"."rule_type" IS '规则类型 [crm_workflow_rules_rule_type]';
COMMENT ON COLUMN "public"."crm_workflow_rules"."trigger_event" IS '触发事件';
COMMENT ON COLUMN "public"."crm_workflow_rules"."trigger_condition" IS '触发条件';
COMMENT ON COLUMN "public"."crm_workflow_rules"."action_type" IS '操作类型 [crm_workflow_rules_action_type]';
COMMENT ON COLUMN "public"."crm_workflow_rules"."action_config" IS '动作配置';
COMMENT ON COLUMN "public"."crm_workflow_rules"."enabled" IS '是否启用:0-否,1-是';
COMMENT ON COLUMN "public"."crm_workflow_rules"."priority" IS '优先级:1-低,2-中,3-高,4-紧急 [crm_workflow_rules_priority]';
COMMENT ON COLUMN "public"."crm_workflow_rules"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."crm_workflow_rules"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."crm_workflow_rules" IS 'Workflow Rules';

