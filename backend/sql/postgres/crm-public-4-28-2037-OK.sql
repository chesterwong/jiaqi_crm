/*
 Navicat Premium Dump SQL

 Source Server         : CRM
 Source Server Type    : PostgreSQL
 Source Server Version : 160013 (160013)
 Source Host           : localhost:5432
 Source Catalog        : fastapiadmin
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160013 (160013)
 File Encoding         : 65001

 Date: 28/04/2026 20:37:12
*/


-- ----------------------------
-- Sequence structure for app_portal_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."app_portal_id_seq";
CREATE SEQUENCE "public"."app_portal_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_ai_customer_profiles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_ai_customer_profiles_id_seq";
CREATE SEQUENCE "public"."crm_ai_customer_profiles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_ai_recommendations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_ai_recommendations_id_seq";
CREATE SEQUENCE "public"."crm_ai_recommendations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_ai_tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_ai_tags_id_seq";
CREATE SEQUENCE "public"."crm_ai_tags_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_alert_rules_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_alert_rules_id_seq";
CREATE SEQUENCE "public"."crm_alert_rules_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_approval_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_approval_records_id_seq";
CREATE SEQUENCE "public"."crm_approval_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_call_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_call_records_id_seq";
CREATE SEQUENCE "public"."crm_call_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_campaign_leads_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_campaign_leads_id_seq";
CREATE SEQUENCE "public"."crm_campaign_leads_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_campaigns_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_campaigns_id_seq";
CREATE SEQUENCE "public"."crm_campaigns_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_competitors_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_competitors_id_seq";
CREATE SEQUENCE "public"."crm_competitors_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contact_change_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contact_change_logs_id_seq";
CREATE SEQUENCE "public"."crm_contact_change_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contact_relations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contact_relations_id_seq";
CREATE SEQUENCE "public"."crm_contact_relations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contact_visits_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contact_visits_id_seq";
CREATE SEQUENCE "public"."crm_contact_visits_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contacts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contacts_id_seq";
CREATE SEQUENCE "public"."crm_contacts_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contract_invoices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contract_invoices_id_seq";
CREATE SEQUENCE "public"."crm_contract_invoices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contract_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contract_items_id_seq";
CREATE SEQUENCE "public"."crm_contract_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contracts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contracts_id_seq";
CREATE SEQUENCE "public"."crm_contracts_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_activities_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_activities_id_seq";
CREATE SEQUENCE "public"."crm_customer_activities_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_addresses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_addresses_id_seq";
CREATE SEQUENCE "public"."crm_customer_addresses_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_attachments_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_attachments_id_seq";
CREATE SEQUENCE "public"."crm_customer_attachments_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_change_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_change_logs_id_seq";
CREATE SEQUENCE "public"."crm_customer_change_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_duplicate_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_duplicate_logs_id_seq";
CREATE SEQUENCE "public"."crm_customer_duplicate_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_health_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_health_id_seq";
CREATE SEQUENCE "public"."crm_customer_health_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_health_scores_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_health_scores_id_seq";
CREATE SEQUENCE "public"."crm_customer_health_scores_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_pool_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_pool_logs_id_seq";
CREATE SEQUENCE "public"."crm_customer_pool_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_profiles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_profiles_id_seq";
CREATE SEQUENCE "public"."crm_customer_profiles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_satisfaction_surveys_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_satisfaction_surveys_id_seq";
CREATE SEQUENCE "public"."crm_customer_satisfaction_surveys_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_tags_id_seq";
CREATE SEQUENCE "public"."crm_customer_tags_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_timeline_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_timeline_id_seq";
CREATE SEQUENCE "public"."crm_customer_timeline_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customers_id_seq";
CREATE SEQUENCE "public"."crm_customers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_data_dicts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_data_dicts_id_seq";
CREATE SEQUENCE "public"."crm_data_dicts_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_deliveries_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_deliveries_id_seq";
CREATE SEQUENCE "public"."crm_deliveries_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_follow_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_follow_records_id_seq";
CREATE SEQUENCE "public"."crm_follow_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_followups_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_followups_id_seq";
CREATE SEQUENCE "public"."crm_followups_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_import_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_import_records_id_seq";
CREATE SEQUENCE "public"."crm_import_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_invoices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_invoices_id_seq";
CREATE SEQUENCE "public"."crm_invoices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_joint_followups_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_joint_followups_id_seq";
CREATE SEQUENCE "public"."crm_joint_followups_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_lead_scores_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_lead_scores_id_seq";
CREATE SEQUENCE "public"."crm_lead_scores_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_leads_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_leads_id_seq";
CREATE SEQUENCE "public"."crm_leads_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_marketing_campaigns_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_marketing_campaigns_id_seq";
CREATE SEQUENCE "public"."crm_marketing_campaigns_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_marketing_channels_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_marketing_channels_id_seq";
CREATE SEQUENCE "public"."crm_marketing_channels_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_notifications_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_notifications_id_seq";
CREATE SEQUENCE "public"."crm_notifications_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_operation_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_operation_logs_id_seq";
CREATE SEQUENCE "public"."crm_operation_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_opportunities_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_opportunities_id_seq";
CREATE SEQUENCE "public"."crm_opportunities_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_opportunity_products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_opportunity_products_id_seq";
CREATE SEQUENCE "public"."crm_opportunity_products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_opportunity_stages_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_opportunity_stages_id_seq";
CREATE SEQUENCE "public"."crm_opportunity_stages_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_order_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_order_items_id_seq";
CREATE SEQUENCE "public"."crm_order_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_orders_id_seq";
CREATE SEQUENCE "public"."crm_orders_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_payments_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_payments_id_seq";
CREATE SEQUENCE "public"."crm_payments_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_pool_transfers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_pool_transfers_id_seq";
CREATE SEQUENCE "public"."crm_pool_transfers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_price_tiers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_price_tiers_id_seq";
CREATE SEQUENCE "public"."crm_price_tiers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_categories_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_categories_id_seq";
CREATE SEQUENCE "public"."crm_product_categories_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_documents_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_documents_id_seq";
CREATE SEQUENCE "public"."crm_product_documents_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_price_history_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_price_history_id_seq";
CREATE SEQUENCE "public"."crm_product_price_history_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_price_policies_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_price_policies_id_seq";
CREATE SEQUENCE "public"."crm_product_price_policies_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_prices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_prices_id_seq";
CREATE SEQUENCE "public"."crm_product_prices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_skus_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_skus_id_seq";
CREATE SEQUENCE "public"."crm_product_skus_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_products_id_seq";
CREATE SEQUENCE "public"."crm_products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_quotation_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_quotation_items_id_seq";
CREATE SEQUENCE "public"."crm_quotation_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_quotations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_quotations_id_seq";
CREATE SEQUENCE "public"."crm_quotations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_renewals_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_renewals_id_seq";
CREATE SEQUENCE "public"."crm_renewals_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_report_instances_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_report_instances_id_seq";
CREATE SEQUENCE "public"."crm_report_instances_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_report_templates_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_report_templates_id_seq";
CREATE SEQUENCE "public"."crm_report_templates_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_sales_activities_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_sales_activities_id_seq";
CREATE SEQUENCE "public"."crm_sales_activities_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_sales_targets_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_sales_targets_id_seq";
CREATE SEQUENCE "public"."crm_sales_targets_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_satisfaction_surveys_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_satisfaction_surveys_id_seq";
CREATE SEQUENCE "public"."crm_satisfaction_surveys_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_service_tickets_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_service_tickets_id_seq";
CREATE SEQUENCE "public"."crm_service_tickets_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_tag_definitions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_tag_definitions_id_seq";
CREATE SEQUENCE "public"."crm_tag_definitions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_tags_id_seq";
CREATE SEQUENCE "public"."crm_tags_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_tasks_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_tasks_id_seq";
CREATE SEQUENCE "public"."crm_tasks_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_test_monitor_report_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_test_monitor_report_id_seq";
CREATE SEQUENCE "public"."crm_test_monitor_report_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_user_extensions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_user_extensions_id_seq";
CREATE SEQUENCE "public"."crm_user_extensions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_visit_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_visit_records_id_seq";
CREATE SEQUENCE "public"."crm_visit_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_workflow_approvals_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_workflow_approvals_id_seq";
CREATE SEQUENCE "public"."crm_workflow_approvals_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_workflow_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_workflow_logs_id_seq";
CREATE SEQUENCE "public"."crm_workflow_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_workflow_rules_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_workflow_rules_id_seq";
CREATE SEQUENCE "public"."crm_workflow_rules_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for gen_demo01_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_demo01_id_seq";
CREATE SEQUENCE "public"."gen_demo01_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for gen_demo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_demo_id_seq";
CREATE SEQUENCE "public"."gen_demo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for gen_table_column_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_table_column_id_seq";
CREATE SEQUENCE "public"."gen_table_column_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for gen_table_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_table_id_seq";
CREATE SEQUENCE "public"."gen_table_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_dept_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dept_id_seq";
CREATE SEQUENCE "public"."sys_dept_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_dict_data_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dict_data_id_seq";
CREATE SEQUENCE "public"."sys_dict_data_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_dict_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dict_type_id_seq";
CREATE SEQUENCE "public"."sys_dict_type_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_log_id_seq";
CREATE SEQUENCE "public"."sys_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_menu_id_seq";
CREATE SEQUENCE "public"."sys_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_notice_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_notice_id_seq";
CREATE SEQUENCE "public"."sys_notice_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_param_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_param_id_seq";
CREATE SEQUENCE "public"."sys_param_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_position_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_position_id_seq";
CREATE SEQUENCE "public"."sys_position_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_role_id_seq";
CREATE SEQUENCE "public"."sys_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_tenant_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_tenant_id_seq";
CREATE SEQUENCE "public"."sys_tenant_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sys_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_user_id_seq";
CREATE SEQUENCE "public"."sys_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for task_job_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_job_id_seq";
CREATE SEQUENCE "public"."task_job_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for task_node_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_node_id_seq";
CREATE SEQUENCE "public"."task_node_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for task_workflow_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_workflow_id_seq";
CREATE SEQUENCE "public"."task_workflow_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for task_workflow_node_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_workflow_node_type_id_seq";
CREATE SEQUENCE "public"."task_workflow_node_type_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for app_portal
-- ----------------------------
DROP TABLE IF EXISTS "public"."app_portal";
CREATE TABLE "public"."app_portal" (
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "access_url" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "icon_url" varchar(300) COLLATE "pg_catalog"."default",
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "tenant_id" int4 NOT NULL,
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."app_portal"."name" IS '应用名称';
COMMENT ON COLUMN "public"."app_portal"."access_url" IS '访问地址';
COMMENT ON COLUMN "public"."app_portal"."icon_url" IS '应用图标URL';
COMMENT ON COLUMN "public"."app_portal"."id" IS '主键ID';
COMMENT ON COLUMN "public"."app_portal"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."app_portal"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."app_portal"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."app_portal"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."app_portal"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."app_portal"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."app_portal"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."app_portal"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."app_portal"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."app_portal"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."app_portal"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."app_portal" IS '门户应用';

-- ----------------------------
-- Records of app_portal
-- ----------------------------

-- ----------------------------
-- Table structure for apscheduler_jobs
-- ----------------------------
DROP TABLE IF EXISTS "public"."apscheduler_jobs";
CREATE TABLE "public"."apscheduler_jobs" (
  "id" varchar(191) COLLATE "pg_catalog"."default" NOT NULL,
  "next_run_time" float8,
  "job_state" bytea NOT NULL
)
;

-- ----------------------------
-- Records of apscheduler_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_ai_customer_profiles
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_ai_customer_profiles";
CREATE TABLE "public"."crm_ai_customer_profiles" (
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
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."overall_score" IS '综合评分';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."purchase_power" IS '购买力评分';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."decision_speed" IS '决策速度评分';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."tags" IS '标签';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."interests" IS '兴趣标签';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."pain_points" IS '痛点分析';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."engagement_level" IS '参与度等级';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."preferred_contact_method" IS '首选联系方式';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."best_contact_time" IS '最佳联系时间';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."churn_risk" IS '流失风险等级';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."upsell_probability" IS '增购概率';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."next_best_action" IS '下一步最佳行动';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."summary" IS '摘要';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."generated_at" IS '生成时间';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_ai_customer_profiles"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_ai_customer_profiles" IS 'Ai Customer Profiles';

-- ----------------------------
-- Records of crm_ai_customer_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for crm_ai_recommendations
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_ai_recommendations";
CREATE TABLE "public"."crm_ai_recommendations" (
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
COMMENT ON COLUMN "public"."crm_ai_recommendations"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."entity_type" IS '实体类型';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."entity_id" IS '实体ID';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."recommendation_type" IS '推荐类型';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."recommendation_content" IS '推荐内容';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."ai_model" IS 'AI模型';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."confidence" IS '置信度';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."reasoning" IS '推理依据';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."user_feedback" IS '用户反馈';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."feedback_at" IS '反馈时间';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_ai_recommendations"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_ai_recommendations" IS 'Ai Recommendations';

-- ----------------------------
-- Records of crm_ai_recommendations
-- ----------------------------

-- ----------------------------
-- Table structure for crm_ai_tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_ai_tags";
CREATE TABLE "public"."crm_ai_tags" (
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
COMMENT ON COLUMN "public"."crm_ai_tags"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_ai_tags"."tag_code" IS '标签编号';
COMMENT ON COLUMN "public"."crm_ai_tags"."tag_name" IS '标签名称';
COMMENT ON COLUMN "public"."crm_ai_tags"."ai_model" IS 'AI模型';
COMMENT ON COLUMN "public"."crm_ai_tags"."ai_prompt" IS 'AI提示词';
COMMENT ON COLUMN "public"."crm_ai_tags"."confidence_threshold" IS '置信度阈值';
COMMENT ON COLUMN "public"."crm_ai_tags"."applicable_entities" IS '适用实体';
COMMENT ON COLUMN "public"."crm_ai_tags"."usage_count" IS '使用次数';
COMMENT ON COLUMN "public"."crm_ai_tags"."accuracy_rate" IS '准确率比率';
COMMENT ON COLUMN "public"."crm_ai_tags"."status" IS '[crm_ai_tags_status]';
COMMENT ON COLUMN "public"."crm_ai_tags"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_ai_tags"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_ai_tags"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_ai_tags"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_ai_tags"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_ai_tags"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_ai_tags"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_ai_tags"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_ai_tags"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_ai_tags"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_ai_tags"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_ai_tags" IS 'Ai Tags';

-- ----------------------------
-- Records of crm_ai_tags
-- ----------------------------

-- ----------------------------
-- Table structure for crm_alert_rules
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_alert_rules";
CREATE TABLE "public"."crm_alert_rules" (
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
COMMENT ON COLUMN "public"."crm_alert_rules"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_alert_rules"."rule_name" IS '规则名称';
COMMENT ON COLUMN "public"."crm_alert_rules"."rule_code" IS '规则编码';
COMMENT ON COLUMN "public"."crm_alert_rules"."alert_type" IS '预警类型(contract_expire/customer_churn/overdue_followup/health_decline/opportunity_stuck/other)';
COMMENT ON COLUMN "public"."crm_alert_rules"."trigger_condition" IS '触发条件(JSON表达式或SQL)';
COMMENT ON COLUMN "public"."crm_alert_rules"."trigger_frequency" IS '触发频率(once/daily/hourly/realtime)';
COMMENT ON COLUMN "public"."crm_alert_rules"."severity" IS '严重程度(critical/high/medium/low)';
COMMENT ON COLUMN "public"."crm_alert_rules"."is_active" IS '是否启用';
COMMENT ON COLUMN "public"."crm_alert_rules"."notify_channels" IS '通知渠道(JSON数组:system/email/sms/wechat)';
COMMENT ON COLUMN "public"."crm_alert_rules"."notify_users" IS '通知用户ID列表(JSON)';
COMMENT ON COLUMN "public"."crm_alert_rules"."notify_roles" IS '通知角色列表(JSON)';
COMMENT ON COLUMN "public"."crm_alert_rules"."template_id" IS '通知模板ID';
COMMENT ON COLUMN "public"."crm_alert_rules"."escalation_rule" IS '升级规则(JSON)';
COMMENT ON COLUMN "public"."crm_alert_rules"."suppress_hours" IS '静默期(小时)';
COMMENT ON COLUMN "public"."crm_alert_rules"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_alert_rules"."sort_order" IS '排序号';
COMMENT ON COLUMN "public"."crm_alert_rules"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_alert_rules"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_alert_rules"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_alert_rules"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_alert_rules"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_alert_rules"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_alert_rules"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_alert_rules"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_alert_rules"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_alert_rules"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_alert_rules" IS '预警规则配置表';

-- ----------------------------
-- Records of crm_alert_rules
-- ----------------------------

-- ----------------------------
-- Table structure for crm_approval_records
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_approval_records";
CREATE TABLE "public"."crm_approval_records" (
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
COMMENT ON COLUMN "public"."crm_approval_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_approval_records"."approval_no" IS '审批编号(格式:APP-YYYYMMDD-XXXX)';
COMMENT ON COLUMN "public"."crm_approval_records"."approval_type" IS '审批类型(contract/quotation/discount/expense/other)';
COMMENT ON COLUMN "public"."crm_approval_records"."related_table" IS '关联表名(如crm_contracts/crm_quotations)';
COMMENT ON COLUMN "public"."crm_approval_records"."related_id" IS '关联记录ID';
COMMENT ON COLUMN "public"."crm_approval_records"."title" IS '审批标题';
COMMENT ON COLUMN "public"."crm_approval_records"."description" IS '审批说明';
COMMENT ON COLUMN "public"."crm_approval_records"."applicant_id" IS '申请人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_approval_records"."applicant_dept_id" IS '申请人部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_approval_records"."approval_status" IS '审批状态(pending/approving/approved/rejected/cancelled)';
COMMENT ON COLUMN "public"."crm_approval_records"."current_approver_id" IS '当前审批人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_approval_records"."current_step" IS '当前审批步骤';
COMMENT ON COLUMN "public"."crm_approval_records"."total_steps" IS '总审批步骤';
COMMENT ON COLUMN "public"."crm_approval_records"."priority" IS '审批优先级(normal/urgent)';
COMMENT ON COLUMN "public"."crm_approval_records"."deadline" IS '审批截止时间';
COMMENT ON COLUMN "public"."crm_approval_records"."approved_time" IS '审批通过时间';
COMMENT ON COLUMN "public"."crm_approval_records"."approval_notes" IS '审批备注';
COMMENT ON COLUMN "public"."crm_approval_records"."rejection_reason" IS '拒绝原因';
COMMENT ON COLUMN "public"."crm_approval_records"."cc_users" IS '抄送用户ID列表(JSON)';
COMMENT ON COLUMN "public"."crm_approval_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_approval_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_approval_records"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_approval_records"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_approval_records"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_approval_records"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_approval_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_approval_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_approval_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_approval_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_approval_records" IS '审批记录表';

-- ----------------------------
-- Records of crm_approval_records
-- ----------------------------

-- ----------------------------
-- Table structure for crm_call_records
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_call_records";
CREATE TABLE "public"."crm_call_records" (
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
COMMENT ON COLUMN "public"."crm_call_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_call_records"."customer_id" IS '客户ID(关联crm_customers.id)';
COMMENT ON COLUMN "public"."crm_call_records"."contact_id" IS '联系人ID(关联crm_contacts.id)';
COMMENT ON COLUMN "public"."crm_call_records"."call_type" IS '通话类型(sales_followup/after_sales/negotiation/other)';
COMMENT ON COLUMN "public"."crm_call_records"."direction" IS '通话方向(inbound:呼入/outbound:呼出)';
COMMENT ON COLUMN "public"."crm_call_records"."phone_number" IS '通话号码';
COMMENT ON COLUMN "public"."crm_call_records"."duration_seconds" IS '通话时长(秒)';
COMMENT ON COLUMN "public"."crm_call_records"."call_time" IS '通话时间';
COMMENT ON COLUMN "public"."crm_call_records"."summary" IS '通话摘要';
COMMENT ON COLUMN "public"."crm_call_records"."follow_up_action" IS '后续跟进动作';
COMMENT ON COLUMN "public"."crm_call_records"."follow_up_time" IS '计划跟进时间';
COMMENT ON COLUMN "public"."crm_call_records"."sentiment" IS '客户情绪(positive/neutral/negative)';
COMMENT ON COLUMN "public"."crm_call_records"."quality_score" IS '通话质量评分';
COMMENT ON COLUMN "public"."crm_call_records"."is_recorded" IS '是否录音';
COMMENT ON COLUMN "public"."crm_call_records"."recording_url" IS '录音文件URL';
COMMENT ON COLUMN "public"."crm_call_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_call_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_call_records"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_call_records"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_call_records"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_call_records"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_call_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_call_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_call_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_call_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_call_records" IS '通话记录表';

-- ----------------------------
-- Records of crm_call_records
-- ----------------------------

-- ----------------------------
-- Table structure for crm_campaign_leads
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_campaign_leads";
CREATE TABLE "public"."crm_campaign_leads" (
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
COMMENT ON COLUMN "public"."crm_campaign_leads"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_campaign_leads"."campaign_id" IS '活动ID';
COMMENT ON COLUMN "public"."crm_campaign_leads"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "public"."crm_campaign_leads"."participation_type" IS '参与类型';
COMMENT ON COLUMN "public"."crm_campaign_leads"."registration_date" IS '注册日期';
COMMENT ON COLUMN "public"."crm_campaign_leads"."attendance_status" IS '出席状态';
COMMENT ON COLUMN "public"."crm_campaign_leads"."lead_source_detail" IS '线索来源详情';
COMMENT ON COLUMN "public"."crm_campaign_leads"."channel" IS '渠道';
COMMENT ON COLUMN "public"."crm_campaign_leads"."is_converted" IS '[crm_campaign_leads_is_converted]';
COMMENT ON COLUMN "public"."crm_campaign_leads"."converted_customer_id" IS '转化后客户ID';
COMMENT ON COLUMN "public"."crm_campaign_leads"."interaction_count" IS '互动次数';
COMMENT ON COLUMN "public"."crm_campaign_leads"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "public"."crm_campaign_leads"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_campaign_leads"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_campaign_leads"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_campaign_leads"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_campaign_leads"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_campaign_leads"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_campaign_leads"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_campaign_leads"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_campaign_leads"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_campaign_leads"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_campaign_leads"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_campaign_leads"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_campaign_leads"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_campaign_leads" IS 'Campaign Leads';

-- ----------------------------
-- Records of crm_campaign_leads
-- ----------------------------

-- ----------------------------
-- Table structure for crm_campaigns
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_campaigns";
CREATE TABLE "public"."crm_campaigns" (
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
COMMENT ON COLUMN "public"."crm_campaigns"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_campaigns"."campaign_code" IS '活动编号';
COMMENT ON COLUMN "public"."crm_campaigns"."campaign_name" IS '活动名称';
COMMENT ON COLUMN "public"."crm_campaigns"."campaign_type" IS '活动类型';
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
COMMENT ON COLUMN "public"."crm_campaigns"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_campaigns"."department_id" IS '所属部门ID,关联sys_dept';
COMMENT ON COLUMN "public"."crm_campaigns"."team_members" IS '团队成员';
COMMENT ON COLUMN "public"."crm_campaigns"."related_campaign_id" IS 'relatedcampaignID,关联对应表';
COMMENT ON COLUMN "public"."crm_campaigns"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_campaigns"."content_plan" IS '内容计划';
COMMENT ON COLUMN "public"."crm_campaigns"."landing_page_url" IS '落地页URL';
COMMENT ON COLUMN "public"."crm_campaigns"."status" IS '[crm_campaigns_status]';
COMMENT ON COLUMN "public"."crm_campaigns"."phase" IS '阶段';
COMMENT ON COLUMN "public"."crm_campaigns"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_campaigns"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_campaigns"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_campaigns"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_campaigns"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_campaigns"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_campaigns"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_campaigns"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_campaigns"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_campaigns"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_campaigns" IS 'Campaigns';

-- ----------------------------
-- Records of crm_campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for crm_competitors
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_competitors";
CREATE TABLE "public"."crm_competitors" (
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
COMMENT ON COLUMN "public"."crm_competitors"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_competitors"."competitor_name" IS '竞争对手名称';
COMMENT ON COLUMN "public"."crm_competitors"."competitor_code" IS '竞争对手编码';
COMMENT ON COLUMN "public"."crm_competitors"."industry" IS '所属行业';
COMMENT ON COLUMN "public"."crm_competitors"."company_size" IS '公司规模';
COMMENT ON COLUMN "public"."crm_competitors"."headquarters" IS '总部所在地';
COMMENT ON COLUMN "public"."crm_competitors"."website" IS '公司网址';
COMMENT ON COLUMN "public"."crm_competitors"."phone" IS '联系电话';
COMMENT ON COLUMN "public"."crm_competitors"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_competitors"."strengths" IS '优势';
COMMENT ON COLUMN "public"."crm_competitors"."weaknesses" IS '劣势';
COMMENT ON COLUMN "public"."crm_competitors"."market_share" IS '市场份额(%)';
COMMENT ON COLUMN "public"."crm_competitors"."threat_level" IS '威胁级别(high/medium/low)';
COMMENT ON COLUMN "public"."crm_competitors"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_competitors"."sort_order" IS '排序号';
COMMENT ON COLUMN "public"."crm_competitors"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_competitors"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_competitors"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_competitors"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_competitors"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_competitors"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_competitors"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_competitors"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_competitors"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_competitors"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_competitors" IS '竞争对手管理表';

-- ----------------------------
-- Records of crm_competitors
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contact_change_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_contact_change_logs";
CREATE TABLE "public"."crm_contact_change_logs" (
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
COMMENT ON COLUMN "public"."crm_contact_change_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."field_name" IS '字段名称';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."field_label" IS '字段标签';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."old_value" IS '旧值';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."new_value" IS '新值';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."change_type" IS '变更类型';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."changed_at" IS '变更时间';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_contact_change_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_contact_change_logs" IS 'Contact Change Logs';

-- ----------------------------
-- Records of crm_contact_change_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contact_relations
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_contact_relations";
CREATE TABLE "public"."crm_contact_relations" (
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
COMMENT ON COLUMN "public"."crm_contact_relations"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_contact_relations"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_relations"."related_contact_id" IS '关联联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_relations"."related_entity_type" IS '关联实体类型';
COMMENT ON COLUMN "public"."crm_contact_relations"."related_entity_id" IS '关联实体ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_relations"."relation_type" IS '关系类型';
COMMENT ON COLUMN "public"."crm_contact_relations"."relation_desc" IS '关系描述';
COMMENT ON COLUMN "public"."crm_contact_relations"."importance" IS '重要性';
COMMENT ON COLUMN "public"."crm_contact_relations"."decision_role" IS '决策角色';
COMMENT ON COLUMN "public"."crm_contact_relations"."influence_level" IS '影响力等级';
COMMENT ON COLUMN "public"."crm_contact_relations"."status" IS '[crm_contact_relations_status]';
COMMENT ON COLUMN "public"."crm_contact_relations"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_relations"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contact_relations"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_relations"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contact_relations"."is_deleted" IS '[crm_contact_relations_is_deleted]';
COMMENT ON COLUMN "public"."crm_contact_relations"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_contact_relations"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_contact_relations"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_relations"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_contact_relations"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_contact_relations"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_contact_relations" IS 'Contact Relations';

-- ----------------------------
-- Records of crm_contact_relations
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contact_visits
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_contact_visits";
CREATE TABLE "public"."crm_contact_visits" (
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
COMMENT ON COLUMN "public"."crm_contact_visits"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_contact_visits"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_visits"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contact_visits"."visit_date" IS '拜访日期';
COMMENT ON COLUMN "public"."crm_contact_visits"."visit_type" IS '[crm_contact_visits_visit_type]';
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
COMMENT ON COLUMN "public"."crm_contact_visits"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contact_visits"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contact_visits"."is_deleted" IS '[crm_contact_visits_is_deleted]';
COMMENT ON COLUMN "public"."crm_contact_visits"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_visits"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_visits"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_contact_visits"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_contact_visits"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_visits"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_contact_visits"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_contact_visits"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_contact_visits" IS 'Contact Visits';

-- ----------------------------
-- Records of crm_contact_visits
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contacts
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_contacts";
CREATE TABLE "public"."crm_contacts" (
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
COMMENT ON COLUMN "public"."crm_contacts"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_contacts"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contacts"."contact_name" IS '联系人姓名';
COMMENT ON COLUMN "public"."crm_contacts"."gender" IS '[crm_contacts_gender]';
COMMENT ON COLUMN "public"."crm_contacts"."position" IS '职位';
COMMENT ON COLUMN "public"."crm_contacts"."department" IS '部门';
COMMENT ON COLUMN "public"."crm_contacts"."mobile" IS '手机';
COMMENT ON COLUMN "public"."crm_contacts"."phone" IS '电话';
COMMENT ON COLUMN "public"."crm_contacts"."email" IS '邮箱';
COMMENT ON COLUMN "public"."crm_contacts"."wechat" IS '微信';
COMMENT ON COLUMN "public"."crm_contacts"."qq" IS 'QQ号';
COMMENT ON COLUMN "public"."crm_contacts"."is_primary" IS '[crm_contacts_is_primary]';
COMMENT ON COLUMN "public"."crm_contacts"."relationship" IS '关系';
COMMENT ON COLUMN "public"."crm_contacts"."influence_level" IS '影响力等级';
COMMENT ON COLUMN "public"."crm_contacts"."birthday" IS '生日';
COMMENT ON COLUMN "public"."crm_contacts"."anniversary_date" IS '纪念日';
COMMENT ON COLUMN "public"."crm_contacts"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_contacts"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contacts"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contacts"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contacts"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contacts"."is_deleted" IS '[crm_contacts_is_deleted]';
COMMENT ON COLUMN "public"."crm_contacts"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_contacts"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_contacts"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contacts"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_contacts"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_contacts"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_contacts" IS 'Contacts';

-- ----------------------------
-- Records of crm_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contract_invoices
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_contract_invoices";
CREATE TABLE "public"."crm_contract_invoices" (
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
COMMENT ON COLUMN "public"."crm_contract_invoices"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_contract_invoices"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contract_invoices"."payment_plan_id" IS '付款计划ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_code" IS '发票编号';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_number" IS '发票号码';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_type" IS '[crm_contract_invoices_invoice_type]';
COMMENT ON COLUMN "public"."crm_contract_invoices"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_contract_invoices"."tax_rate" IS '税率';
COMMENT ON COLUMN "public"."crm_contract_invoices"."tax_amount" IS '税额';
COMMENT ON COLUMN "public"."crm_contract_invoices"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_date" IS '开票日期';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_status" IS '[crm_contract_invoices_invoice_status]';
COMMENT ON COLUMN "public"."crm_contract_invoices"."issued_by" IS '开具人ID';
COMMENT ON COLUMN "public"."crm_contract_invoices"."issued_at" IS '开具时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_file_url" IS '发票文件URL';
COMMENT ON COLUMN "public"."crm_contract_invoices"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_contract_invoices"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contract_invoices"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."is_deleted" IS '[crm_contract_invoices_is_deleted]';
COMMENT ON COLUMN "public"."crm_contract_invoices"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contract_invoices"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_contract_invoices"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contract_invoices"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_contract_invoices"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_contract_invoices"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_contract_invoices" IS 'Contract Invoices';

-- ----------------------------
-- Records of crm_contract_invoices
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contract_items
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_contract_items";
CREATE TABLE "public"."crm_contract_items" (
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
COMMENT ON COLUMN "public"."crm_contract_items"."id" IS '主键ID（自增）';
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
COMMENT ON COLUMN "public"."crm_contract_items"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contract_items"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contract_items"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contract_items"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contract_items"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_contract_items"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_contract_items"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_contract_items"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contract_items"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_contract_items"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_contract_items"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_contract_items" IS 'Contract Items';

-- ----------------------------
-- Records of crm_contract_items
-- ----------------------------

-- ----------------------------
-- Table structure for crm_contracts
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_contracts";
CREATE TABLE "public"."crm_contracts" (
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
COMMENT ON COLUMN "public"."crm_contracts"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_contracts"."contract_code" IS '合同编号';
COMMENT ON COLUMN "public"."crm_contracts"."contract_name" IS '合同名称';
COMMENT ON COLUMN "public"."crm_contracts"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contracts"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contracts"."quotation_id" IS '报价ID,关联对应表';
COMMENT ON COLUMN "public"."crm_contracts"."contract_type" IS '[crm_contracts_contract_type]';
COMMENT ON COLUMN "public"."crm_contracts"."start_date" IS '开始日期';
COMMENT ON COLUMN "public"."crm_contracts"."end_date" IS '结束日期';
COMMENT ON COLUMN "public"."crm_contracts"."currency" IS '币种';
COMMENT ON COLUMN "public"."crm_contracts"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_contracts"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "public"."crm_contracts"."unpaid_amount" IS '未付金额';
COMMENT ON COLUMN "public"."crm_contracts"."status" IS '[crm_contracts_status]';
COMMENT ON COLUMN "public"."crm_contracts"."approval_status" IS '[crm_contracts_approval_status]';
COMMENT ON COLUMN "public"."crm_contracts"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_contracts"."approved_at" IS '审批时间';
COMMENT ON COLUMN "public"."crm_contracts"."signed_date" IS '签约日期';
COMMENT ON COLUMN "public"."crm_contracts"."signed_by_customer" IS '客户签字人';
COMMENT ON COLUMN "public"."crm_contracts"."signed_by_company" IS '公司签字人';
COMMENT ON COLUMN "public"."crm_contracts"."contract_file_url" IS '合同文件URL';
COMMENT ON COLUMN "public"."crm_contracts"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_contracts"."terms_conditions" IS '条款条件';
COMMENT ON COLUMN "public"."crm_contracts"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_contracts"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contracts"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contracts"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contracts"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contracts"."is_deleted" IS '[crm_contracts_is_deleted]';
COMMENT ON COLUMN "public"."crm_contracts"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_contracts"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_contracts"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contracts"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_contracts"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_contracts" IS 'Contracts';

-- ----------------------------
-- Records of crm_contracts
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_activities
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_activities";
CREATE TABLE "public"."crm_customer_activities" (
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
COMMENT ON COLUMN "public"."crm_customer_activities"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_activities"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_activities"."activity_type" IS '[crm_customer_activities_activity_type]';
COMMENT ON COLUMN "public"."crm_customer_activities"."activity_title" IS '活动标题';
COMMENT ON COLUMN "public"."crm_customer_activities"."activity_content" IS '活动内容';
COMMENT ON COLUMN "public"."crm_customer_activities"."related_type" IS '关联类型';
COMMENT ON COLUMN "public"."crm_customer_activities"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_activities"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_customer_activities"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "public"."crm_customer_activities"."activity_date" IS '活动日期';
COMMENT ON COLUMN "public"."crm_customer_activities"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_activities"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_activities"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_activities"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_activities"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customer_activities"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_activities"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_activities"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_activities"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_activities"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_activities"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_activities" IS 'Customer Activities';

-- ----------------------------
-- Records of crm_customer_activities
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_addresses
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_addresses";
CREATE TABLE "public"."crm_customer_addresses" (
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
COMMENT ON COLUMN "public"."crm_customer_addresses"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_addresses"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_addresses"."address_type" IS '地址类型';
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
COMMENT ON COLUMN "public"."crm_customer_addresses"."is_default" IS '[crm_customer_addresses_is_default]';
COMMENT ON COLUMN "public"."crm_customer_addresses"."is_active" IS '[crm_customer_addresses_is_active]';
COMMENT ON COLUMN "public"."crm_customer_addresses"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_addresses"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_addresses"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_addresses"."is_deleted" IS '[crm_customer_addresses_is_deleted]';
COMMENT ON COLUMN "public"."crm_customer_addresses"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_addresses"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_addresses"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_addresses"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_addresses"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_addresses"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_addresses" IS 'Customer Addresses';

-- ----------------------------
-- Records of crm_customer_addresses
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_attachments
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_attachments";
CREATE TABLE "public"."crm_customer_attachments" (
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
COMMENT ON COLUMN "public"."crm_customer_attachments"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_attachments"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_attachments"."file_name" IS '文件名';
COMMENT ON COLUMN "public"."crm_customer_attachments"."file_path" IS '文件路径';
COMMENT ON COLUMN "public"."crm_customer_attachments"."file_type" IS '文件类型';
COMMENT ON COLUMN "public"."crm_customer_attachments"."mime_type" IS 'MIME类型';
COMMENT ON COLUMN "public"."crm_customer_attachments"."file_size" IS '文件大小';
COMMENT ON COLUMN "public"."crm_customer_attachments"."attachment_type" IS '附件类型';
COMMENT ON COLUMN "public"."crm_customer_attachments"."uploader_id" IS '上传人ID';
COMMENT ON COLUMN "public"."crm_customer_attachments"."uploaded_at" IS '上传时间';
COMMENT ON COLUMN "public"."crm_customer_attachments"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_attachments"."is_deleted" IS '[crm_customer_attachments_is_deleted]';
COMMENT ON COLUMN "public"."crm_customer_attachments"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_attachments"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_attachments"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_attachments"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_attachments"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_attachments"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_attachments"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_attachments"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_attachments"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_attachments" IS 'Customer Attachments';

-- ----------------------------
-- Records of crm_customer_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_change_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_change_logs";
CREATE TABLE "public"."crm_customer_change_logs" (
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
COMMENT ON COLUMN "public"."crm_customer_change_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."field_name" IS '字段名称';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."field_label" IS '字段标签';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."old_value" IS '旧值';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."new_value" IS '新值';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."change_type" IS '变更类型';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."change_reason" IS '变更原因';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."changed_at" IS '变更时间';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_change_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_change_logs" IS 'Customer Change Logs';

-- ----------------------------
-- Records of crm_customer_change_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_duplicate_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_duplicate_logs";
CREATE TABLE "public"."crm_customer_duplicate_logs" (
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
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."customer_a_id" IS '客户A ID';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."customer_b_id" IS '客户B ID';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."similarity" IS '相似度';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."collision_type" IS '冲突类型';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."handled_by" IS '处理人ID';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."handled_at" IS '处理时间';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."result" IS '结果';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_duplicate_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_duplicate_logs" IS 'Customer Duplicate Logs';

-- ----------------------------
-- Records of crm_customer_duplicate_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_health
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_health";
CREATE TABLE "public"."crm_customer_health" (
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
COMMENT ON COLUMN "public"."crm_customer_health"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_health"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_health"."health_score" IS '健康度评分';
COMMENT ON COLUMN "public"."crm_customer_health"."health_level" IS '健康等级';
COMMENT ON COLUMN "public"."crm_customer_health"."product_usage_score" IS '产品使用评分';
COMMENT ON COLUMN "public"."crm_customer_health"."support_tickets_score" IS '支持工单评分';
COMMENT ON COLUMN "public"."crm_customer_health"."payment_score" IS '付款评分';
COMMENT ON COLUMN "public"."crm_customer_health"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "public"."crm_customer_health"."satisfaction_score" IS '满意度评分';
COMMENT ON COLUMN "public"."crm_customer_health"."risk_factors" IS '风险因素';
COMMENT ON COLUMN "public"."crm_customer_health"."risk_level" IS '风险等级';
COMMENT ON COLUMN "public"."crm_customer_health"."contract_end_date" IS '合同结束日期';
COMMENT ON COLUMN "public"."crm_customer_health"."renewal_probability" IS '续约概率';
COMMENT ON COLUMN "public"."crm_customer_health"."renewal_status" IS '续约状态';
COMMENT ON COLUMN "public"."crm_customer_health"."assessed_at" IS '评估时间';
COMMENT ON COLUMN "public"."crm_customer_health"."next_assessment_date" IS '下次评估日期';
COMMENT ON COLUMN "public"."crm_customer_health"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_health"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_health"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_health"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_health"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customer_health"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_health"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_health"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_health"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_health"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_health"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_health" IS 'Customer Health';

-- ----------------------------
-- Records of crm_customer_health
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_health_scores
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_health_scores";
CREATE TABLE "public"."crm_customer_health_scores" (
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
COMMENT ON COLUMN "public"."crm_customer_health_scores"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."score_date" IS '评分日期';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."overall_score" IS '综合评分';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."health_level" IS '健康等级';
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
COMMENT ON COLUMN "public"."crm_customer_health_scores"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_health_scores"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_health_scores" IS 'Customer Health Scores';

-- ----------------------------
-- Records of crm_customer_health_scores
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_pool_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_pool_logs";
CREATE TABLE "public"."crm_customer_pool_logs" (
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
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."action_type" IS '操作类型';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."action_date" IS '操作日期';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."from_user_id" IS '原负责人ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."from_dept_id" IS '原部门ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."to_user_id" IS '目标负责人ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."to_dept_id" IS '目标部门ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."reason" IS '原因';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."transfer_type" IS '转移类型';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_pool_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_pool_logs" IS 'Customer Pool Logs';

-- ----------------------------
-- Records of crm_customer_pool_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_profiles
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_profiles";
CREATE TABLE "public"."crm_customer_profiles" (
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
COMMENT ON COLUMN "public"."crm_customer_profiles"."id" IS '主键ID（自增）';
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
COMMENT ON COLUMN "public"."crm_customer_profiles"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_profiles"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_profiles"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_customer_profiles"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_profiles"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_profiles"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customer_profiles"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_profiles"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_profiles"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_profiles"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_profiles"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_profiles"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_profiles" IS 'Customer Profiles';

-- ----------------------------
-- Records of crm_customer_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_satisfaction_surveys
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_satisfaction_surveys";
CREATE TABLE "public"."crm_customer_satisfaction_surveys" (
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
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."survey_code" IS '调查编号';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."survey_name" IS '调查名称';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."survey_type" IS '调查类型';
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
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."follow_up_status" IS '跟进状态';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."follow_up_by" IS '跟进人ID';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."follow_up_date" IS '跟进日期';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."follow_up_notes" IS '跟进备注';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."channel" IS '渠道';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."respondent_email" IS '受访者邮箱';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_satisfaction_surveys"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_satisfaction_surveys" IS 'Customer Satisfaction Surveys';

-- ----------------------------
-- Records of crm_customer_satisfaction_surveys
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_tags";
CREATE TABLE "public"."crm_customer_tags" (
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
COMMENT ON COLUMN "public"."crm_customer_tags"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_tags"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_tags"."tag_id" IS '标签ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_tags"."tag_source" IS '标签来源';
COMMENT ON COLUMN "public"."crm_customer_tags"."confidence" IS '置信度';
COMMENT ON COLUMN "public"."crm_customer_tags"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_tags"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_tags"."is_deleted" IS '[crm_customer_tags_is_deleted]';
COMMENT ON COLUMN "public"."crm_customer_tags"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_tags"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_tags"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_tags"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_tags"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_tags"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_tags"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_tags" IS 'Customer Tags';

-- ----------------------------
-- Records of crm_customer_tags
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customer_timeline
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customer_timeline";
CREATE TABLE "public"."crm_customer_timeline" (
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
COMMENT ON COLUMN "public"."crm_customer_timeline"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customer_timeline"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_timeline"."event_type" IS '事件类型';
COMMENT ON COLUMN "public"."crm_customer_timeline"."event_category" IS '事件分类';
COMMENT ON COLUMN "public"."crm_customer_timeline"."title" IS '职位';
COMMENT ON COLUMN "public"."crm_customer_timeline"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customer_timeline"."related_type" IS '关联类型';
COMMENT ON COLUMN "public"."crm_customer_timeline"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "public"."crm_customer_timeline"."related_name" IS '关联名称';
COMMENT ON COLUMN "public"."crm_customer_timeline"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_customer_timeline"."operator_name" IS '操作人名称';
COMMENT ON COLUMN "public"."crm_customer_timeline"."attachments" IS '附件';
COMMENT ON COLUMN "public"."crm_customer_timeline"."extra_data" IS '扩展数据';
COMMENT ON COLUMN "public"."crm_customer_timeline"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_timeline"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_timeline"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_timeline"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customer_timeline"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customer_timeline"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customer_timeline"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_timeline"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_customer_timeline"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_customer_timeline" IS 'Customer Timeline';

-- ----------------------------
-- Records of crm_customer_timeline
-- ----------------------------

-- ----------------------------
-- Table structure for crm_customers
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_customers";
CREATE TABLE "public"."crm_customers" (
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
COMMENT ON COLUMN "public"."crm_customers"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_customers"."customer_code" IS '客户编号';
COMMENT ON COLUMN "public"."crm_customers"."customer_name" IS '客户名称';
COMMENT ON COLUMN "public"."crm_customers"."customer_type" IS '[crm_customers_customer_type]';
COMMENT ON COLUMN "public"."crm_customers"."industry" IS '所属行业';
COMMENT ON COLUMN "public"."crm_customers"."source" IS '[crm_customers_source]';
COMMENT ON COLUMN "public"."crm_customers"."customer_status" IS '客户状态';
COMMENT ON COLUMN "public"."crm_customers"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_customers"."department_id" IS '所属部门ID,关联sys_dept';
COMMENT ON COLUMN "public"."crm_customers"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "public"."crm_customers"."pool_status" IS '[crm_customers_pool_status]';
COMMENT ON COLUMN "public"."crm_customers"."last_followup_at" IS '最后跟进时间';
COMMENT ON COLUMN "public"."crm_customers"."next_followup_at" IS '下次跟进时间';
COMMENT ON COLUMN "public"."crm_customers"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customers"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customers"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_customers"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_customers"."customer_short_name" IS '客户简称';
COMMENT ON COLUMN "public"."crm_customers"."customer_level" IS '客户等级';
COMMENT ON COLUMN "public"."crm_customers"."scale" IS '企业规模';
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
COMMENT ON COLUMN "public"."crm_customers"."rating" IS '[crm_customers_rating]';
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
COMMENT ON COLUMN "public"."crm_customers"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_customers"."extra_data" IS '扩展数据(JSONB)';
COMMENT ON COLUMN "public"."crm_customers"."version" IS '版本号(乐观锁)';
COMMENT ON COLUMN "public"."crm_customers"."protection_deadline" IS '保护期截止时间(公海池)';
COMMENT ON COLUMN "public"."crm_customers"."claim_time" IS '领取时间(公海池)';
COMMENT ON COLUMN "public"."crm_customers"."health_score" IS '健康度评分';
COMMENT ON COLUMN "public"."crm_customers"."duplicate_check_key" IS '查重键(防止重复客户)';
COMMENT ON COLUMN "public"."crm_customers"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_customers"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_customers"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_customers"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_customers"."status" IS '[crm_customers_status]';
COMMENT ON COLUMN "public"."crm_customers"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_customers" IS 'Customers';

-- ----------------------------
-- Records of crm_customers
-- ----------------------------

-- ----------------------------
-- Table structure for crm_data_dicts
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_data_dicts";
CREATE TABLE "public"."crm_data_dicts" (
  "id" int4 NOT NULL DEFAULT nextval('crm_data_dicts_id_seq'::regclass),
  "dict_type" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_label" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_value" varchar(255) COLLATE "pg_catalog"."default",
  "parent_id" int4 DEFAULT 0,
  "level" int4 DEFAULT 1,
  "is_leaf" bool DEFAULT true,
  "dict_sort" int4 DEFAULT 0,
  "css_class" varchar(100) COLLATE "pg_catalog"."default",
  "list_class" varchar(100) COLLATE "pg_catalog"."default",
  "color_class" varchar(50) COLLATE "pg_catalog"."default",
  "dict_status" varchar(20) COLLATE "pg_catalog"."default" DEFAULT 'active'::character varying,
  "is_default" bool DEFAULT false,
  "remark" varchar(500) COLLATE "pg_catalog"."default",
  "extra_data" json,
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
COMMENT ON COLUMN "public"."crm_data_dicts"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_type" IS '字典类型';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_code" IS '字典编码';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_label" IS '字典标签';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_value" IS '字典值';
COMMENT ON COLUMN "public"."crm_data_dicts"."parent_id" IS '父级ID';
COMMENT ON COLUMN "public"."crm_data_dicts"."level" IS '级别';
COMMENT ON COLUMN "public"."crm_data_dicts"."is_leaf" IS '[crm_data_dicts_is_leaf]';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_sort" IS '字典排序';
COMMENT ON COLUMN "public"."crm_data_dicts"."css_class" IS 'CSS类名';
COMMENT ON COLUMN "public"."crm_data_dicts"."list_class" IS '列表类名';
COMMENT ON COLUMN "public"."crm_data_dicts"."color_class" IS '颜色类名';
COMMENT ON COLUMN "public"."crm_data_dicts"."dict_status" IS '字典状态';
COMMENT ON COLUMN "public"."crm_data_dicts"."is_default" IS '[crm_data_dicts_is_default]';
COMMENT ON COLUMN "public"."crm_data_dicts"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_data_dicts"."extra_data" IS '扩展数据';
COMMENT ON COLUMN "public"."crm_data_dicts"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_data_dicts"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_data_dicts"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_data_dicts"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_data_dicts"."is_deleted" IS '[crm_data_dicts_is_deleted]';
COMMENT ON COLUMN "public"."crm_data_dicts"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_data_dicts"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_data_dicts"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_data_dicts"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_data_dicts"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_data_dicts"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_data_dicts" IS 'Data Dicts';

-- ----------------------------
-- Records of crm_data_dicts
-- ----------------------------

-- ----------------------------
-- Table structure for crm_deliveries
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_deliveries";
CREATE TABLE "public"."crm_deliveries" (
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
COMMENT ON COLUMN "public"."crm_deliveries"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_deliveries"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "public"."crm_deliveries"."delivery_code" IS '配送编号';
COMMENT ON COLUMN "public"."crm_deliveries"."delivery_date" IS '交付日期';
COMMENT ON COLUMN "public"."crm_deliveries"."delivery_method" IS '交付方式';
COMMENT ON COLUMN "public"."crm_deliveries"."logistics_company" IS '物流公司';
COMMENT ON COLUMN "public"."crm_deliveries"."tracking_number" IS '运单号';
COMMENT ON COLUMN "public"."crm_deliveries"."receiver_name" IS '收货人姓名';
COMMENT ON COLUMN "public"."crm_deliveries"."receiver_signature" IS '签收人';
COMMENT ON COLUMN "public"."crm_deliveries"."signed_at" IS '签收时间';
COMMENT ON COLUMN "public"."crm_deliveries"."delivery_status" IS '物流状态';
COMMENT ON COLUMN "public"."crm_deliveries"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_deliveries"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_deliveries"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_deliveries"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_deliveries"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_deliveries"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_deliveries"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_deliveries"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_deliveries"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_deliveries"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_deliveries"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_deliveries"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_deliveries" IS 'Deliveries';

-- ----------------------------
-- Records of crm_deliveries
-- ----------------------------

-- ----------------------------
-- Table structure for crm_follow_records
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_follow_records";
CREATE TABLE "public"."crm_follow_records" (
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
COMMENT ON COLUMN "public"."crm_follow_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_follow_records"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_follow_records"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_follow_records"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_follow_records"."follow_type" IS '[crm_follow_records_follow_type]';
COMMENT ON COLUMN "public"."crm_follow_records"."subject" IS '主题';
COMMENT ON COLUMN "public"."crm_follow_records"."content" IS '内容';
COMMENT ON COLUMN "public"."crm_follow_records"."contact_mode" IS '联系方式';
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
COMMENT ON COLUMN "public"."crm_follow_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_follow_records"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_follow_records"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_follow_records"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_follow_records"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_follow_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_follow_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_follow_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_follow_records"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_follow_records"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_follow_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_follow_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_follow_records" IS 'Follow Records';

-- ----------------------------
-- Records of crm_follow_records
-- ----------------------------

-- ----------------------------
-- Table structure for crm_followups
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_followups";
CREATE TABLE "public"."crm_followups" (
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
COMMENT ON COLUMN "public"."crm_followups"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_followups"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_followups"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_followups"."followup_type" IS '跟进类型';
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
COMMENT ON COLUMN "public"."crm_followups"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_followups"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_followups"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_followups"."is_deleted" IS '[crm_followups_is_deleted]';
COMMENT ON COLUMN "public"."crm_followups"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_followups"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_followups"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_followups"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_followups"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_followups"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_followups" IS 'Followups';

-- ----------------------------
-- Records of crm_followups
-- ----------------------------

-- ----------------------------
-- Table structure for crm_import_records
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_import_records";
CREATE TABLE "public"."crm_import_records" (
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
COMMENT ON COLUMN "public"."crm_import_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_import_records"."import_type" IS '导入类型';
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
COMMENT ON COLUMN "public"."crm_import_records"."status" IS '[crm_import_records_status]';
COMMENT ON COLUMN "public"."crm_import_records"."started_at" IS '开始时间';
COMMENT ON COLUMN "public"."crm_import_records"."completed_at" IS '完成时间';
COMMENT ON COLUMN "public"."crm_import_records"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_import_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_import_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_import_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_import_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_import_records"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_import_records"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_import_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_import_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_import_records" IS 'Import Records';

-- ----------------------------
-- Records of crm_import_records
-- ----------------------------

-- ----------------------------
-- Table structure for crm_invoices
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_invoices";
CREATE TABLE "public"."crm_invoices" (
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
COMMENT ON COLUMN "public"."crm_invoices"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_invoices"."invoice_code" IS '发票编号';
COMMENT ON COLUMN "public"."crm_invoices"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_invoices"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "public"."crm_invoices"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_invoices"."invoice_type" IS '[crm_invoices_invoice_type]';
COMMENT ON COLUMN "public"."crm_invoices"."invoice_date" IS '开票日期';
COMMENT ON COLUMN "public"."crm_invoices"."due_date" IS '到期日期';
COMMENT ON COLUMN "public"."crm_invoices"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_invoices"."tax_amount" IS '税额';
COMMENT ON COLUMN "public"."crm_invoices"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_invoices"."status" IS '[crm_invoices_status]';
COMMENT ON COLUMN "public"."crm_invoices"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "public"."crm_invoices"."payment_date" IS '付款日期';
COMMENT ON COLUMN "public"."crm_invoices"."notes" IS '备注说明';
COMMENT ON COLUMN "public"."crm_invoices"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_invoices"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_invoices"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_invoices"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_invoices"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_invoices"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_invoices"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_invoices"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_invoices"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_invoices"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_invoices"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_invoices" IS 'Invoices';

-- ----------------------------
-- Records of crm_invoices
-- ----------------------------

-- ----------------------------
-- Table structure for crm_joint_followups
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_joint_followups";
CREATE TABLE "public"."crm_joint_followups" (
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
COMMENT ON COLUMN "public"."crm_joint_followups"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_joint_followups"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_joint_followups"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_joint_followups"."role_type" IS '角色类型';
COMMENT ON COLUMN "public"."crm_joint_followups"."responsibility" IS '职责';
COMMENT ON COLUMN "public"."crm_joint_followups"."can_edit" IS '[crm_joint_followups_can_edit]';
COMMENT ON COLUMN "public"."crm_joint_followups"."can_view_sensitive" IS '[crm_joint_followups_can_view_sensitive]';
COMMENT ON COLUMN "public"."crm_joint_followups"."followup_count" IS '跟进次数';
COMMENT ON COLUMN "public"."crm_joint_followups"."last_followup_date" IS '最后跟进日期';
COMMENT ON COLUMN "public"."crm_joint_followups"."contribution_score" IS '贡献评分';
COMMENT ON COLUMN "public"."crm_joint_followups"."assigned_date" IS '分配日期';
COMMENT ON COLUMN "public"."crm_joint_followups"."assigned_by" IS '分配人ID';
COMMENT ON COLUMN "public"."crm_joint_followups"."status" IS '[crm_joint_followups_status]';
COMMENT ON COLUMN "public"."crm_joint_followups"."end_date" IS '结束日期';
COMMENT ON COLUMN "public"."crm_joint_followups"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_joint_followups"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_joint_followups"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_joint_followups"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_joint_followups"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_joint_followups"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_joint_followups"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_joint_followups"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_joint_followups"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_joint_followups"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_joint_followups"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_joint_followups"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_joint_followups"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_joint_followups" IS 'Joint Followups';

-- ----------------------------
-- Records of crm_joint_followups
-- ----------------------------

-- ----------------------------
-- Table structure for crm_lead_scores
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_lead_scores";
CREATE TABLE "public"."crm_lead_scores" (
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
COMMENT ON COLUMN "public"."crm_lead_scores"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_lead_scores"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "public"."crm_lead_scores"."total_score" IS '总分';
COMMENT ON COLUMN "public"."crm_lead_scores"."demographic_score" IS '人口统计评分';
COMMENT ON COLUMN "public"."crm_lead_scores"."behavior_score" IS '行为评分';
COMMENT ON COLUMN "public"."crm_lead_scores"."engagement_score" IS '参与度评分';
COMMENT ON COLUMN "public"."crm_lead_scores"."score_grade" IS '评分等级';
COMMENT ON COLUMN "public"."crm_lead_scores"."score_level" IS '评分等级';
COMMENT ON COLUMN "public"."crm_lead_scores"."score_details" IS '评分详情';
COMMENT ON COLUMN "public"."crm_lead_scores"."last_scored_at" IS '最后评分时间';
COMMENT ON COLUMN "public"."crm_lead_scores"."next_score_date" IS '下次评分日期';
COMMENT ON COLUMN "public"."crm_lead_scores"."is_qualified" IS '是否合格';
COMMENT ON COLUMN "public"."crm_lead_scores"."qualified_at" IS '合格时间';
COMMENT ON COLUMN "public"."crm_lead_scores"."converted_to_opportunity" IS '是否转商机';
COMMENT ON COLUMN "public"."crm_lead_scores"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_lead_scores"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_lead_scores"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_lead_scores"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_lead_scores"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_lead_scores"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_lead_scores"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_lead_scores"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_lead_scores"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_lead_scores"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_lead_scores"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_lead_scores" IS 'Lead Scores';

-- ----------------------------
-- Records of crm_lead_scores
-- ----------------------------

-- ----------------------------
-- Table structure for crm_leads
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_leads";
CREATE TABLE "public"."crm_leads" (
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
COMMENT ON COLUMN "public"."crm_leads"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_leads"."lead_code" IS '线索编号';
COMMENT ON COLUMN "public"."crm_leads"."lead_name" IS '线索名称';
COMMENT ON COLUMN "public"."crm_leads"."source" IS '[crm_leads_source]';
COMMENT ON COLUMN "public"."crm_leads"."campaign_id" IS '活动ID';
COMMENT ON COLUMN "public"."crm_leads"."channel" IS '渠道';
COMMENT ON COLUMN "public"."crm_leads"."phone" IS '电话';
COMMENT ON COLUMN "public"."crm_leads"."email" IS '邮箱';
COMMENT ON COLUMN "public"."crm_leads"."company" IS '公司名称';
COMMENT ON COLUMN "public"."crm_leads"."position" IS '职位';
COMMENT ON COLUMN "public"."crm_leads"."score" IS '评分';
COMMENT ON COLUMN "public"."crm_leads"."grade" IS '等级';
COMMENT ON COLUMN "public"."crm_leads"."status" IS '[crm_leads_status]';
COMMENT ON COLUMN "public"."crm_leads"."converted_customer_id" IS '转化后客户ID';
COMMENT ON COLUMN "public"."crm_leads"."owner_id" IS '负责人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_leads"."assigned_at" IS '分配时间';
COMMENT ON COLUMN "public"."crm_leads"."nurturing_stage" IS '培育阶段';
COMMENT ON COLUMN "public"."crm_leads"."last_nurturing_date" IS '最后培育日期';
COMMENT ON COLUMN "public"."crm_leads"."duplicate_check_key" IS '查重键';
COMMENT ON COLUMN "public"."crm_leads"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_leads"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_leads"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_leads"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_leads"."is_deleted" IS '[crm_leads_is_deleted]';
COMMENT ON COLUMN "public"."crm_leads"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_leads"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_leads"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_leads"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_leads"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_leads" IS 'Leads';

-- ----------------------------
-- Records of crm_leads
-- ----------------------------

-- ----------------------------
-- Table structure for crm_marketing_campaigns
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_marketing_campaigns";
CREATE TABLE "public"."crm_marketing_campaigns" (
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
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."campaign_code" IS '活动编号';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."campaign_name" IS '活动名称';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."campaign_type" IS '活动类型';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."start_date" IS '开始日期';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."end_date" IS '结束日期';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."location" IS '地点';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."budget" IS '预算金额';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."actual_cost" IS '实际成本';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."target_leads" IS '目标线索数';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."target_customers" IS '目标客户';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."status" IS '[crm_marketing_campaigns_status]';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."is_deleted" IS '[crm_marketing_campaigns_is_deleted]';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_marketing_campaigns" IS 'Marketing Campaigns';

-- ----------------------------
-- Records of crm_marketing_campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for crm_marketing_channels
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_marketing_channels";
CREATE TABLE "public"."crm_marketing_channels" (
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
COMMENT ON COLUMN "public"."crm_marketing_channels"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_marketing_channels"."channel_code" IS '渠道编号';
COMMENT ON COLUMN "public"."crm_marketing_channels"."channel_name" IS '渠道名称';
COMMENT ON COLUMN "public"."crm_marketing_channels"."channel_type" IS '渠道类型';
COMMENT ON COLUMN "public"."crm_marketing_channels"."channel_category" IS '渠道分类';
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
COMMENT ON COLUMN "public"."crm_marketing_channels"."status" IS '[crm_marketing_channels_status]';
COMMENT ON COLUMN "public"."crm_marketing_channels"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_marketing_channels"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_marketing_channels"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_marketing_channels"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_marketing_channels"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_marketing_channels"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_marketing_channels"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_marketing_channels"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_marketing_channels"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_marketing_channels"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_marketing_channels"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_marketing_channels" IS 'Marketing Channels';

-- ----------------------------
-- Records of crm_marketing_channels
-- ----------------------------

-- ----------------------------
-- Table structure for crm_notifications
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_notifications";
CREATE TABLE "public"."crm_notifications" (
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
COMMENT ON COLUMN "public"."crm_notifications"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_notifications"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_notifications"."notification_type" IS '[crm_notifications_notification_type]';
COMMENT ON COLUMN "public"."crm_notifications"."title" IS '职位';
COMMENT ON COLUMN "public"."crm_notifications"."content" IS '内容';
COMMENT ON COLUMN "public"."crm_notifications"."related_type" IS '关联类型';
COMMENT ON COLUMN "public"."crm_notifications"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "public"."crm_notifications"."is_read" IS '[crm_notifications_is_read]';
COMMENT ON COLUMN "public"."crm_notifications"."read_at" IS '阅读时间';
COMMENT ON COLUMN "public"."crm_notifications"."priority" IS '[crm_notifications_priority]';
COMMENT ON COLUMN "public"."crm_notifications"."sent_at" IS '发送时间';
COMMENT ON COLUMN "public"."crm_notifications"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_notifications"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_notifications"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_notifications"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_notifications"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_notifications"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_notifications"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_notifications"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_notifications"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_notifications"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_notifications"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_notifications" IS 'Notifications';

-- ----------------------------
-- Records of crm_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for crm_operation_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_operation_logs";
CREATE TABLE "public"."crm_operation_logs" (
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
COMMENT ON COLUMN "public"."crm_operation_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_operation_logs"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_operation_logs"."username" IS '用户名';
COMMENT ON COLUMN "public"."crm_operation_logs"."module" IS '模块';
COMMENT ON COLUMN "public"."crm_operation_logs"."action" IS '行动';
COMMENT ON COLUMN "public"."crm_operation_logs"."target_type" IS '目标类型';
COMMENT ON COLUMN "public"."crm_operation_logs"."target_id" IS '目标ID,关联对应表';
COMMENT ON COLUMN "public"."crm_operation_logs"."target_name" IS '目标名称';
COMMENT ON COLUMN "public"."crm_operation_logs"."old_value" IS '旧值';
COMMENT ON COLUMN "public"."crm_operation_logs"."new_value" IS '新值';
COMMENT ON COLUMN "public"."crm_operation_logs"."changed_fields" IS '变更字段';
COMMENT ON COLUMN "public"."crm_operation_logs"."ip_address" IS 'IP地址';
COMMENT ON COLUMN "public"."crm_operation_logs"."user_agent" IS '用户代理';
COMMENT ON COLUMN "public"."crm_operation_logs"."request_method" IS '请求方法';
COMMENT ON COLUMN "public"."crm_operation_logs"."request_url" IS '请求URL';
COMMENT ON COLUMN "public"."crm_operation_logs"."status" IS '[crm_operation_logs_status]';
COMMENT ON COLUMN "public"."crm_operation_logs"."error_message" IS '错误信息';
COMMENT ON COLUMN "public"."crm_operation_logs"."execution_time" IS '执行时间';
COMMENT ON COLUMN "public"."crm_operation_logs"."operated_at" IS '操作时间';
COMMENT ON COLUMN "public"."crm_operation_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_operation_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_operation_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_operation_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_operation_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_operation_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_operation_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_operation_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_operation_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_operation_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_operation_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_operation_logs" IS 'Operation Logs';

-- ----------------------------
-- Records of crm_operation_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_opportunities
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_opportunities";
CREATE TABLE "public"."crm_opportunities" (
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
COMMENT ON COLUMN "public"."crm_opportunities"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_opportunities"."opportunity_code" IS '商机编号';
COMMENT ON COLUMN "public"."crm_opportunities"."opportunity_name" IS '商机名称';
COMMENT ON COLUMN "public"."crm_opportunities"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_opportunities"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_opportunities"."currency" IS '币种';
COMMENT ON COLUMN "public"."crm_opportunities"."probability" IS '赢单概率';
COMMENT ON COLUMN "public"."crm_opportunities"."expected_close_date" IS '预计成交日期';
COMMENT ON COLUMN "public"."crm_opportunities"."stage" IS '[crm_opportunities_stage]';
COMMENT ON COLUMN "public"."crm_opportunities"."stage_updated_at" IS '阶段更新时间';
COMMENT ON COLUMN "public"."crm_opportunities"."product_ids" IS '产品IDs';
COMMENT ON COLUMN "public"."crm_opportunities"."source" IS '[crm_opportunities_source]';
COMMENT ON COLUMN "public"."crm_opportunities"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_opportunities"."lost_reason" IS '输单原因';
COMMENT ON COLUMN "public"."crm_opportunities"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunities"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_opportunities"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunities"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_opportunities"."is_deleted" IS '[crm_opportunities_is_deleted]';
COMMENT ON COLUMN "public"."crm_opportunities"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_opportunities"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_opportunities"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunities"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_opportunities"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_opportunities" IS 'Opportunities';

-- ----------------------------
-- Records of crm_opportunities
-- ----------------------------

-- ----------------------------
-- Table structure for crm_opportunity_products
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_opportunity_products";
CREATE TABLE "public"."crm_opportunity_products" (
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
COMMENT ON COLUMN "public"."crm_opportunity_products"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_opportunity_products"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_opportunity_products"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_opportunity_products"."product_name" IS '产品名称';
COMMENT ON COLUMN "public"."crm_opportunity_products"."quantity" IS '数量';
COMMENT ON COLUMN "public"."crm_opportunity_products"."unit_price" IS '单价';
COMMENT ON COLUMN "public"."crm_opportunity_products"."estimated_amount" IS '预计金额';
COMMENT ON COLUMN "public"."crm_opportunity_products"."is_preferred" IS '[crm_opportunity_products_is_preferred]';
COMMENT ON COLUMN "public"."crm_opportunity_products"."win_rate" IS '赢单率';
COMMENT ON COLUMN "public"."crm_opportunity_products"."competitor_product" IS '竞品';
COMMENT ON COLUMN "public"."crm_opportunity_products"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_opportunity_products"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_opportunity_products"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_opportunity_products"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunity_products"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunity_products"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_opportunity_products"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_opportunity_products"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_opportunity_products"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_opportunity_products"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunity_products"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_opportunity_products"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_opportunity_products"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_opportunity_products" IS 'Opportunity Products';

-- ----------------------------
-- Records of crm_opportunity_products
-- ----------------------------

-- ----------------------------
-- Table structure for crm_opportunity_stages
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_opportunity_stages";
CREATE TABLE "public"."crm_opportunity_stages" (
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
COMMENT ON COLUMN "public"."crm_opportunity_stages"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stage_code" IS '阶段编号';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stage_name" IS '阶段名称';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stage_sequence" IS '阶段顺序';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."probability" IS '赢单概率';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."color" IS '颜色';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stay_limit" IS '停留限制(天)';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."stay_limit_action" IS '超时动作';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."required_fields" IS '必填字段';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."status" IS '[crm_opportunity_stages_status]';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."is_system" IS '是否系统内置';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."is_final" IS '是否终态';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."final_result" IS '最终结果';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_opportunity_stages"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_opportunity_stages" IS 'Opportunity Stages';

-- ----------------------------
-- Records of crm_opportunity_stages
-- ----------------------------

-- ----------------------------
-- Table structure for crm_order_items
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_order_items";
CREATE TABLE "public"."crm_order_items" (
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
COMMENT ON COLUMN "public"."crm_order_items"."id" IS '主键ID（自增）';
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
COMMENT ON COLUMN "public"."crm_order_items"."production_status" IS '生产状态';
COMMENT ON COLUMN "public"."crm_order_items"."production_note" IS '生产备注';
COMMENT ON COLUMN "public"."crm_order_items"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_order_items"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_order_items"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_order_items"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_order_items"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_order_items"."is_deleted" IS '[crm_order_items_is_deleted]';
COMMENT ON COLUMN "public"."crm_order_items"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_order_items"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_order_items"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_order_items"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_order_items"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_order_items"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_order_items" IS 'Order Items';

-- ----------------------------
-- Records of crm_order_items
-- ----------------------------

-- ----------------------------
-- Table structure for crm_orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_orders";
CREATE TABLE "public"."crm_orders" (
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
COMMENT ON COLUMN "public"."crm_orders"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_orders"."order_code" IS '订单编号';
COMMENT ON COLUMN "public"."crm_orders"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_orders"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_orders"."order_date" IS '订单日期';
COMMENT ON COLUMN "public"."crm_orders"."expected_delivery_date" IS '预计交付日期';
COMMENT ON COLUMN "public"."crm_orders"."actual_delivery_date" IS '实际交付日期';
COMMENT ON COLUMN "public"."crm_orders"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_orders"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "public"."crm_orders"."unpaid_amount" IS '未付金额';
COMMENT ON COLUMN "public"."crm_orders"."order_status" IS '[crm_orders_order_status]';
COMMENT ON COLUMN "public"."crm_orders"."payment_status" IS '[crm_orders_payment_status]';
COMMENT ON COLUMN "public"."crm_orders"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_orders"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_orders"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_orders"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_orders"."is_deleted" IS '[crm_orders_is_deleted]';
COMMENT ON COLUMN "public"."crm_orders"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_orders"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_orders"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_orders"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_orders"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_orders" IS 'Orders';

-- ----------------------------
-- Records of crm_orders
-- ----------------------------

-- ----------------------------
-- Table structure for crm_payments
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_payments";
CREATE TABLE "public"."crm_payments" (
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
COMMENT ON COLUMN "public"."crm_payments"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_payments"."payment_code" IS '收款编号';
COMMENT ON COLUMN "public"."crm_payments"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."order_id" IS '订单ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."payment_plan_id" IS '付款计划ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."payment_amount" IS '收款金额';
COMMENT ON COLUMN "public"."crm_payments"."payment_method" IS '付款方式';
COMMENT ON COLUMN "public"."crm_payments"."payment_date" IS '付款日期';
COMMENT ON COLUMN "public"."crm_payments"."bank_name" IS '银行名称';
COMMENT ON COLUMN "public"."crm_payments"."bank_account" IS '银行账号';
COMMENT ON COLUMN "public"."crm_payments"."account_name" IS '账户名称';
COMMENT ON COLUMN "public"."crm_payments"."receipt_number" IS '收款单号';
COMMENT ON COLUMN "public"."crm_payments"."receipt_file_url" IS '收款凭证URL';
COMMENT ON COLUMN "public"."crm_payments"."invoice_id" IS '发票ID,关联对应表';
COMMENT ON COLUMN "public"."crm_payments"."is_invoiced" IS '是否已开票';
COMMENT ON COLUMN "public"."crm_payments"."payment_status" IS '[crm_payments_payment_status]';
COMMENT ON COLUMN "public"."crm_payments"."confirmed_by" IS '确认人ID';
COMMENT ON COLUMN "public"."crm_payments"."confirmed_at" IS '确认时间';
COMMENT ON COLUMN "public"."crm_payments"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_payments"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_payments"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_payments"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_payments"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_payments"."is_deleted" IS '[crm_payments_is_deleted]';
COMMENT ON COLUMN "public"."crm_payments"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_payments"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_payments"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_payments"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_payments"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_payments"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_payments" IS 'Payments';

-- ----------------------------
-- Records of crm_payments
-- ----------------------------

-- ----------------------------
-- Table structure for crm_pool_transfers
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_pool_transfers";
CREATE TABLE "public"."crm_pool_transfers" (
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
COMMENT ON COLUMN "public"."crm_pool_transfers"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_pool_transfers"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_pool_transfers"."from_pool" IS '来源公海';
COMMENT ON COLUMN "public"."crm_pool_transfers"."to_pool" IS '目标公海';
COMMENT ON COLUMN "public"."crm_pool_transfers"."from_owner_id" IS '原负责人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_pool_transfers"."to_owner_id" IS '新负责人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_pool_transfers"."transfer_reason" IS '转移原因';
COMMENT ON COLUMN "public"."crm_pool_transfers"."transfer_type" IS '转移类型';
COMMENT ON COLUMN "public"."crm_pool_transfers"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_pool_transfers"."transferred_at" IS '转移时间';
COMMENT ON COLUMN "public"."crm_pool_transfers"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_pool_transfers"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_pool_transfers"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_pool_transfers"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_pool_transfers"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_pool_transfers"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_pool_transfers"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_pool_transfers"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_pool_transfers"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_pool_transfers"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_pool_transfers"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_pool_transfers" IS 'Pool Transfers';

-- ----------------------------
-- Records of crm_pool_transfers
-- ----------------------------

-- ----------------------------
-- Table structure for crm_price_tiers
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_price_tiers";
CREATE TABLE "public"."crm_price_tiers" (
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
COMMENT ON COLUMN "public"."crm_price_tiers"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_price_tiers"."tier_code" IS '层级编号';
COMMENT ON COLUMN "public"."crm_price_tiers"."tier_name" IS '层级名称';
COMMENT ON COLUMN "public"."crm_price_tiers"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "public"."crm_price_tiers"."min_amount" IS '最小金额';
COMMENT ON COLUMN "public"."crm_price_tiers"."max_amount" IS '最大金额';
COMMENT ON COLUMN "public"."crm_price_tiers"."customer_level" IS '客户等级';
COMMENT ON COLUMN "public"."crm_price_tiers"."annual_revenue_min" IS '最低年营业额';
COMMENT ON COLUMN "public"."crm_price_tiers"."order_count_min" IS '最低订单数';
COMMENT ON COLUMN "public"."crm_price_tiers"."benefits" IS '权益说明';
COMMENT ON COLUMN "public"."crm_price_tiers"."priority" IS '[crm_price_tiers_priority]';
COMMENT ON COLUMN "public"."crm_price_tiers"."status" IS '[crm_price_tiers_status]';
COMMENT ON COLUMN "public"."crm_price_tiers"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_price_tiers"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_price_tiers"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_price_tiers"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_price_tiers"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_price_tiers"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_price_tiers"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_price_tiers"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_price_tiers"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_price_tiers"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_price_tiers"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_price_tiers" IS 'Price Tiers';

-- ----------------------------
-- Records of crm_price_tiers
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_categories
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_product_categories";
CREATE TABLE "public"."crm_product_categories" (
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
COMMENT ON COLUMN "public"."crm_product_categories"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_product_categories"."category_name" IS '分类名称';
COMMENT ON COLUMN "public"."crm_product_categories"."parent_id" IS '父级ID';
COMMENT ON COLUMN "public"."crm_product_categories"."level" IS '级别';
COMMENT ON COLUMN "public"."crm_product_categories"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_product_categories"."icon" IS '图标';
COMMENT ON COLUMN "public"."crm_product_categories"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_product_categories"."status" IS '[crm_product_categories_status]';
COMMENT ON COLUMN "public"."crm_product_categories"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_categories"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_categories"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_categories"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_categories"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_product_categories"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_product_categories"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_product_categories"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_categories"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_product_categories"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_product_categories" IS 'Product Categories';

-- ----------------------------
-- Records of crm_product_categories
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_documents
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_product_documents";
CREATE TABLE "public"."crm_product_documents" (
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
COMMENT ON COLUMN "public"."crm_product_documents"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_product_documents"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_documents"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "public"."crm_product_documents"."doc_name" IS '文档名称';
COMMENT ON COLUMN "public"."crm_product_documents"."doc_type" IS '文档类型';
COMMENT ON COLUMN "public"."crm_product_documents"."file_path" IS '文件路径';
COMMENT ON COLUMN "public"."crm_product_documents"."file_size" IS '文件大小';
COMMENT ON COLUMN "public"."crm_product_documents"."mime_type" IS 'MIME类型';
COMMENT ON COLUMN "public"."crm_product_documents"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_product_documents"."is_latest" IS '是否最新版本';
COMMENT ON COLUMN "public"."crm_product_documents"."status" IS '[crm_product_documents_status]';
COMMENT ON COLUMN "public"."crm_product_documents"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_documents"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_documents"."is_deleted" IS '[crm_product_documents_is_deleted]';
COMMENT ON COLUMN "public"."crm_product_documents"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_documents"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_product_documents"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_product_documents"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_documents"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_product_documents"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_product_documents"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_product_documents" IS 'Product Documents';

-- ----------------------------
-- Records of crm_product_documents
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_price_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_product_price_history";
CREATE TABLE "public"."crm_product_price_history" (
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
COMMENT ON COLUMN "public"."crm_product_price_history"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_product_price_history"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_price_history"."old_price" IS '原价';
COMMENT ON COLUMN "public"."crm_product_price_history"."new_price" IS '新价';
COMMENT ON COLUMN "public"."crm_product_price_history"."price_type" IS '价格类型';
COMMENT ON COLUMN "public"."crm_product_price_history"."change_reason" IS '变更原因';
COMMENT ON COLUMN "public"."crm_product_price_history"."approval_status" IS '[crm_product_price_history_approval_status]';
COMMENT ON COLUMN "public"."crm_product_price_history"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_product_price_history"."effective_date" IS '生效日期';
COMMENT ON COLUMN "public"."crm_product_price_history"."operator_id" IS '操作人ID';
COMMENT ON COLUMN "public"."crm_product_price_history"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_price_history"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_price_history"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_price_history"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_price_history"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_product_price_history"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_product_price_history"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_product_price_history"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_price_history"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_product_price_history"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_product_price_history"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_product_price_history" IS 'Product Price History';

-- ----------------------------
-- Records of crm_product_price_history
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_price_policies
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_product_price_policies";
CREATE TABLE "public"."crm_product_price_policies" (
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
COMMENT ON COLUMN "public"."crm_product_price_policies"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_product_price_policies"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_price_policies"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "public"."crm_product_price_policies"."policy_type" IS '策略类型';
COMMENT ON COLUMN "public"."crm_product_price_policies"."policy_name" IS '策略名称';
COMMENT ON COLUMN "public"."crm_product_price_policies"."customer_level" IS '客户等级';
COMMENT ON COLUMN "public"."crm_product_price_policies"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_product_price_policies"."min_quantity" IS '最小数量';
COMMENT ON COLUMN "public"."crm_product_price_policies"."max_quantity" IS '最大数量';
COMMENT ON COLUMN "public"."crm_product_price_policies"."price" IS '价格';
COMMENT ON COLUMN "public"."crm_product_price_policies"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "public"."crm_product_price_policies"."valid_from" IS '生效日期';
COMMENT ON COLUMN "public"."crm_product_price_policies"."valid_to" IS '失效日期';
COMMENT ON COLUMN "public"."crm_product_price_policies"."status" IS '[crm_product_price_policies_status]';
COMMENT ON COLUMN "public"."crm_product_price_policies"."priority" IS '[crm_product_price_policies_priority]';
COMMENT ON COLUMN "public"."crm_product_price_policies"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_price_policies"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_price_policies"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_price_policies"."is_deleted" IS '[crm_product_price_policies_is_deleted]';
COMMENT ON COLUMN "public"."crm_product_price_policies"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_product_price_policies"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_product_price_policies"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_price_policies"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_product_price_policies"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_product_price_policies"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_product_price_policies" IS 'Product Price Policies';

-- ----------------------------
-- Records of crm_product_price_policies
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_prices
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_product_prices";
CREATE TABLE "public"."crm_product_prices" (
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
COMMENT ON COLUMN "public"."crm_product_prices"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_product_prices"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_prices"."sku_id" IS 'SKU ID';
COMMENT ON COLUMN "public"."crm_product_prices"."price_type" IS '价格类型';
COMMENT ON COLUMN "public"."crm_product_prices"."price_name" IS '价格名称';
COMMENT ON COLUMN "public"."crm_product_prices"."unit_price" IS '单价';
COMMENT ON COLUMN "public"."crm_product_prices"."min_quantity" IS '最小数量';
COMMENT ON COLUMN "public"."crm_product_prices"."max_quantity" IS '最大数量';
COMMENT ON COLUMN "public"."crm_product_prices"."effective_from" IS '生效日期';
COMMENT ON COLUMN "public"."crm_product_prices"."effective_to" IS '失效日期';
COMMENT ON COLUMN "public"."crm_product_prices"."is_active" IS '[crm_product_prices_is_active]';
COMMENT ON COLUMN "public"."crm_product_prices"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_product_prices"."customer_level" IS '客户等级';
COMMENT ON COLUMN "public"."crm_product_prices"."quantity_prices" IS '阶梯价格';
COMMENT ON COLUMN "public"."crm_product_prices"."approval_status" IS '[crm_product_prices_approval_status]';
COMMENT ON COLUMN "public"."crm_product_prices"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_product_prices"."approved_at" IS '审批时间';
COMMENT ON COLUMN "public"."crm_product_prices"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_prices"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_prices"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_prices"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_prices"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_product_prices"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_product_prices"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_product_prices"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_product_prices"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_prices"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_product_prices"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_product_prices"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_product_prices" IS 'Product Prices';

-- ----------------------------
-- Records of crm_product_prices
-- ----------------------------

-- ----------------------------
-- Table structure for crm_product_skus
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_product_skus";
CREATE TABLE "public"."crm_product_skus" (
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
COMMENT ON COLUMN "public"."crm_product_skus"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_product_skus"."product_id" IS '产品ID';
COMMENT ON COLUMN "public"."crm_product_skus"."sku_code" IS 'SKU编号';
COMMENT ON COLUMN "public"."crm_product_skus"."sku_name" IS 'SKU名称';
COMMENT ON COLUMN "public"."crm_product_skus"."specifications" IS '规格参数';
COMMENT ON COLUMN "public"."crm_product_skus"."standard_price" IS '标准价';
COMMENT ON COLUMN "public"."crm_product_skus"."cost_price" IS '成本价';
COMMENT ON COLUMN "public"."crm_product_skus"."stock_quantity" IS '库存数量';
COMMENT ON COLUMN "public"."crm_product_skus"."min_stock" IS '最低库存';
COMMENT ON COLUMN "public"."crm_product_skus"."status" IS '[crm_product_skus_status]';
COMMENT ON COLUMN "public"."crm_product_skus"."is_default" IS '[crm_product_skus_is_default]';
COMMENT ON COLUMN "public"."crm_product_skus"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_skus"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_skus"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_skus"."is_deleted" IS '[crm_product_skus_is_deleted]';
COMMENT ON COLUMN "public"."crm_product_skus"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_product_skus"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_product_skus"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_skus"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_product_skus"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_product_skus"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_product_skus" IS 'Product Skus';

-- ----------------------------
-- Records of crm_product_skus
-- ----------------------------

-- ----------------------------
-- Table structure for crm_products
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_products";
CREATE TABLE "public"."crm_products" (
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
COMMENT ON COLUMN "public"."crm_products"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_products"."product_code" IS '产品编号';
COMMENT ON COLUMN "public"."crm_products"."product_name" IS '产品名称';
COMMENT ON COLUMN "public"."crm_products"."category_id" IS '分类ID';
COMMENT ON COLUMN "public"."crm_products"."product_type" IS '[crm_products_product_type]';
COMMENT ON COLUMN "public"."crm_products"."standard_price" IS '标准价';
COMMENT ON COLUMN "public"."crm_products"."cost_price" IS '成本价';
COMMENT ON COLUMN "public"."crm_products"."min_price" IS '最低价';
COMMENT ON COLUMN "public"."crm_products"."currency" IS '币种';
COMMENT ON COLUMN "public"."crm_products"."unit" IS '单位';
COMMENT ON COLUMN "public"."crm_products"."specifications" IS '规格参数';
COMMENT ON COLUMN "public"."crm_products"."stock_quantity" IS '库存数量';
COMMENT ON COLUMN "public"."crm_products"."min_stock" IS '最低库存';
COMMENT ON COLUMN "public"."crm_products"."status" IS '[crm_products_status]';
COMMENT ON COLUMN "public"."crm_products"."is_featured" IS '是否推荐';
COMMENT ON COLUMN "public"."crm_products"."image_url" IS '图片URL';
COMMENT ON COLUMN "public"."crm_products"."document_urls" IS '文档链接';
COMMENT ON COLUMN "public"."crm_products"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_products"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_products"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_products"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_products"."is_deleted" IS '[crm_products_is_deleted]';
COMMENT ON COLUMN "public"."crm_products"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_products"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_products"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_products"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_products"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_products"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_products" IS 'Products';

-- ----------------------------
-- Records of crm_products
-- ----------------------------

-- ----------------------------
-- Table structure for crm_quotation_items
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_quotation_items";
CREATE TABLE "public"."crm_quotation_items" (
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
COMMENT ON COLUMN "public"."crm_quotation_items"."id" IS '主键ID（自增）';
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
COMMENT ON COLUMN "public"."crm_quotation_items"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_quotation_items"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_quotation_items"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_quotation_items"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_quotation_items"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_quotation_items"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_quotation_items"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_quotation_items"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_quotation_items"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_quotation_items"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_quotation_items" IS 'Quotation Items';

-- ----------------------------
-- Records of crm_quotation_items
-- ----------------------------

-- ----------------------------
-- Table structure for crm_quotations
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_quotations";
CREATE TABLE "public"."crm_quotations" (
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
COMMENT ON COLUMN "public"."crm_quotations"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_quotations"."quotation_code" IS '报价编号';
COMMENT ON COLUMN "public"."crm_quotations"."quotation_name" IS '报价名称';
COMMENT ON COLUMN "public"."crm_quotations"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_quotations"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_quotations"."valid_until" IS '有效期至';
COMMENT ON COLUMN "public"."crm_quotations"."currency" IS '币种';
COMMENT ON COLUMN "public"."crm_quotations"."exchange_rate" IS '汇率';
COMMENT ON COLUMN "public"."crm_quotations"."subtotal" IS '小计';
COMMENT ON COLUMN "public"."crm_quotations"."discount_rate" IS '折扣率';
COMMENT ON COLUMN "public"."crm_quotations"."discount_amount" IS '折扣金额';
COMMENT ON COLUMN "public"."crm_quotations"."tax_rate" IS '税率';
COMMENT ON COLUMN "public"."crm_quotations"."tax_amount" IS '税额';
COMMENT ON COLUMN "public"."crm_quotations"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_quotations"."status" IS '[crm_quotations_status]';
COMMENT ON COLUMN "public"."crm_quotations"."approval_status" IS '[crm_quotations_approval_status]';
COMMENT ON COLUMN "public"."crm_quotations"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_quotations"."approved_at" IS '审批时间';
COMMENT ON COLUMN "public"."crm_quotations"."converted_contract_id" IS '转化合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_quotations"."terms_conditions" IS '条款条件';
COMMENT ON COLUMN "public"."crm_quotations"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_quotations"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_quotations"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_quotations"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_quotations"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_quotations"."is_deleted" IS '[crm_quotations_is_deleted]';
COMMENT ON COLUMN "public"."crm_quotations"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_quotations"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_quotations"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_quotations"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_quotations"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_quotations"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_quotations" IS 'Quotations';

-- ----------------------------
-- Records of crm_quotations
-- ----------------------------

-- ----------------------------
-- Table structure for crm_renewals
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_renewals";
CREATE TABLE "public"."crm_renewals" (
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
COMMENT ON COLUMN "public"."crm_renewals"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_renewals"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_renewals"."renewal_type" IS '续约类型';
COMMENT ON COLUMN "public"."crm_renewals"."current_contract_id" IS '当前合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_renewals"."new_contract_id" IS '新合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_renewals"."current_amount" IS '当前金额';
COMMENT ON COLUMN "public"."crm_renewals"."new_amount" IS '新金额';
COMMENT ON COLUMN "public"."crm_renewals"."increase_amount" IS '增加金额';
COMMENT ON COLUMN "public"."crm_renewals"."contract_start_date" IS '合同开始日期';
COMMENT ON COLUMN "public"."crm_renewals"."contract_end_date" IS '合同结束日期';
COMMENT ON COLUMN "public"."crm_renewals"."renewal_date" IS '续约日期';
COMMENT ON COLUMN "public"."crm_renewals"."status" IS '[crm_renewals_status]';
COMMENT ON COLUMN "public"."crm_renewals"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_renewals"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_renewals"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_renewals"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_renewals"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_renewals"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_renewals"."is_deleted" IS '[crm_renewals_is_deleted]';
COMMENT ON COLUMN "public"."crm_renewals"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_renewals"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_renewals"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_renewals"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_renewals"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_renewals" IS 'Renewals';

-- ----------------------------
-- Records of crm_renewals
-- ----------------------------

-- ----------------------------
-- Table structure for crm_report_instances
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_report_instances";
CREATE TABLE "public"."crm_report_instances" (
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
COMMENT ON COLUMN "public"."crm_report_instances"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_report_instances"."template_id" IS '模板ID';
COMMENT ON COLUMN "public"."crm_report_instances"."generated_by" IS '生成人ID';
COMMENT ON COLUMN "public"."crm_report_instances"."generated_at" IS '生成时间';
COMMENT ON COLUMN "public"."crm_report_instances"."filter_params" IS '过滤参数';
COMMENT ON COLUMN "public"."crm_report_instances"."result_data" IS '结果数据';
COMMENT ON COLUMN "public"."crm_report_instances"."total_rows" IS '总行数';
COMMENT ON COLUMN "public"."crm_report_instances"."file_url" IS '文件URL';
COMMENT ON COLUMN "public"."crm_report_instances"."status" IS '[crm_report_instances_status]';
COMMENT ON COLUMN "public"."crm_report_instances"."error_message" IS '错误信息';
COMMENT ON COLUMN "public"."crm_report_instances"."execution_time" IS '执行时间';
COMMENT ON COLUMN "public"."crm_report_instances"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_report_instances"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_report_instances"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_report_instances"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_report_instances"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_report_instances"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_report_instances"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_report_instances"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_report_instances"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_report_instances"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_report_instances"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_report_instances" IS 'Report Instances';

-- ----------------------------
-- Records of crm_report_instances
-- ----------------------------

-- ----------------------------
-- Table structure for crm_report_templates
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_report_templates";
CREATE TABLE "public"."crm_report_templates" (
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
COMMENT ON COLUMN "public"."crm_report_templates"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_report_templates"."template_code" IS '模板编号';
COMMENT ON COLUMN "public"."crm_report_templates"."template_name" IS '模板名称';
COMMENT ON COLUMN "public"."crm_report_templates"."report_type" IS '报表类型';
COMMENT ON COLUMN "public"."crm_report_templates"."query_config" IS '查询配置';
COMMENT ON COLUMN "public"."crm_report_templates"."chart_config" IS '图表配置';
COMMENT ON COLUMN "public"."crm_report_templates"."columns_config" IS '列配置';
COMMENT ON COLUMN "public"."crm_report_templates"."filter_config" IS '过滤配置';
COMMENT ON COLUMN "public"."crm_report_templates"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_report_templates"."is_public" IS '是否公开';
COMMENT ON COLUMN "public"."crm_report_templates"."shared_roles" IS '共享角色';
COMMENT ON COLUMN "public"."crm_report_templates"."status" IS '[crm_report_templates_status]';
COMMENT ON COLUMN "public"."crm_report_templates"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_report_templates"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_report_templates"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_report_templates"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_report_templates"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_report_templates"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_report_templates"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_report_templates"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_report_templates"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_report_templates"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_report_templates" IS 'Report Templates';

-- ----------------------------
-- Records of crm_report_templates
-- ----------------------------

-- ----------------------------
-- Table structure for crm_sales_activities
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_sales_activities";
CREATE TABLE "public"."crm_sales_activities" (
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
COMMENT ON COLUMN "public"."crm_sales_activities"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_sales_activities"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_sales_activities"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_sales_activities"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_sales_activities"."activity_type" IS '[crm_sales_activities_activity_type]';
COMMENT ON COLUMN "public"."crm_sales_activities"."subject" IS '主题';
COMMENT ON COLUMN "public"."crm_sales_activities"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_sales_activities"."activity_date" IS '活动日期';
COMMENT ON COLUMN "public"."crm_sales_activities"."start_time" IS '开始时间';
COMMENT ON COLUMN "public"."crm_sales_activities"."end_time" IS '结束时间';
COMMENT ON COLUMN "public"."crm_sales_activities"."duration_minutes" IS '用时(分钟)';
COMMENT ON COLUMN "public"."crm_sales_activities"."participants" IS '参与人';
COMMENT ON COLUMN "public"."crm_sales_activities"."outcome" IS '结果';
COMMENT ON COLUMN "public"."crm_sales_activities"."next_step" IS '下一步行动';
COMMENT ON COLUMN "public"."crm_sales_activities"."next_follow_date" IS '下次跟进日期';
COMMENT ON COLUMN "public"."crm_sales_activities"."related_customer_id" IS '关联客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_sales_activities"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_sales_activities"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_sales_activities"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_sales_activities"."is_deleted" IS '[crm_sales_activities_is_deleted]';
COMMENT ON COLUMN "public"."crm_sales_activities"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_sales_activities"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_sales_activities"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_sales_activities"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_sales_activities"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_sales_activities" IS 'Sales Activities';

-- ----------------------------
-- Records of crm_sales_activities
-- ----------------------------

-- ----------------------------
-- Table structure for crm_sales_targets
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_sales_targets";
CREATE TABLE "public"."crm_sales_targets" (
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
COMMENT ON COLUMN "public"."crm_sales_targets"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_sales_targets"."owner_id" IS '负责人ID(关联sys_user.id)';
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
COMMENT ON COLUMN "public"."crm_sales_targets"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_sales_targets"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_sales_targets"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_sales_targets"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_sales_targets"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_sales_targets"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_sales_targets"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_sales_targets"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_sales_targets"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_sales_targets" IS 'Sales Targets';

-- ----------------------------
-- Records of crm_sales_targets
-- ----------------------------

-- ----------------------------
-- Table structure for crm_satisfaction_surveys
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_satisfaction_surveys";
CREATE TABLE "public"."crm_satisfaction_surveys" (
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
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."survey_type" IS '调查类型';
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
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."status" IS '[crm_satisfaction_surveys_status]';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."is_deleted" IS '[crm_satisfaction_surveys_is_deleted]';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_satisfaction_surveys" IS 'Satisfaction Surveys';

-- ----------------------------
-- Records of crm_satisfaction_surveys
-- ----------------------------

-- ----------------------------
-- Table structure for crm_service_tickets
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_service_tickets";
CREATE TABLE "public"."crm_service_tickets" (
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
COMMENT ON COLUMN "public"."crm_service_tickets"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_service_tickets"."ticket_no" IS '工单编号(格式:TKT-YYYYMMDD-XXXX)';
COMMENT ON COLUMN "public"."crm_service_tickets"."customer_id" IS '客户ID(关联crm_customers.id)';
COMMENT ON COLUMN "public"."crm_service_tickets"."contact_id" IS '联系人ID(关联crm_contacts.id)';
COMMENT ON COLUMN "public"."crm_service_tickets"."contract_id" IS '合同ID(关联crm_contracts.id)';
COMMENT ON COLUMN "public"."crm_service_tickets"."ticket_type" IS '工单类型(repair:报修/consultation:咨询/complaint:投诉/other:其他)';
COMMENT ON COLUMN "public"."crm_service_tickets"."priority" IS '优先级(urgent:紧急/high:高/medium:中/low:低)';
COMMENT ON COLUMN "public"."crm_service_tickets"."title" IS '工单标题';
COMMENT ON COLUMN "public"."crm_service_tickets"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_service_tickets"."status" IS '工单状态(open:待处理/processing:处理中/resolved:已解决/closed:已关闭)';
COMMENT ON COLUMN "public"."crm_service_tickets"."assignee_id" IS '处理人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_service_tickets"."reporter_id" IS '报备人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_service_tickets"."source" IS '工单来源';
COMMENT ON COLUMN "public"."crm_service_tickets"."category" IS '工单分类';
COMMENT ON COLUMN "public"."crm_service_tickets"."expected_resolution_time" IS '预期解决时间';
COMMENT ON COLUMN "public"."crm_service_tickets"."actual_resolution_time" IS '实际解决时间';
COMMENT ON COLUMN "public"."crm_service_tickets"."resolution_notes" IS '解决备注';
COMMENT ON COLUMN "public"."crm_service_tickets"."customer_satisfaction" IS '客户满意度(1-5分)';
COMMENT ON COLUMN "public"."crm_service_tickets"."sla_hours" IS 'SLA时效(小时)';
COMMENT ON COLUMN "public"."crm_service_tickets"."is_overdue" IS '是否超时';
COMMENT ON COLUMN "public"."crm_service_tickets"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_service_tickets"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_service_tickets"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_service_tickets"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_service_tickets"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_service_tickets"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_service_tickets"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_service_tickets"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_service_tickets"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_service_tickets"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_service_tickets" IS '服务工单管理表';

-- ----------------------------
-- Records of crm_service_tickets
-- ----------------------------

-- ----------------------------
-- Table structure for crm_tag_definitions
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_tag_definitions";
CREATE TABLE "public"."crm_tag_definitions" (
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
COMMENT ON COLUMN "public"."crm_tag_definitions"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_tag_definitions"."tag_code" IS '标签编号';
COMMENT ON COLUMN "public"."crm_tag_definitions"."tag_name" IS '标签名称';
COMMENT ON COLUMN "public"."crm_tag_definitions"."tag_type" IS '标签类型';
COMMENT ON COLUMN "public"."crm_tag_definitions"."category" IS '分类';
COMMENT ON COLUMN "public"."crm_tag_definitions"."color" IS '颜色';
COMMENT ON COLUMN "public"."crm_tag_definitions"."icon" IS '图标';
COMMENT ON COLUMN "public"."crm_tag_definitions"."applicable_types" IS '适用类型';
COMMENT ON COLUMN "public"."crm_tag_definitions"."is_multi_select" IS '是否多选';
COMMENT ON COLUMN "public"."crm_tag_definitions"."is_required" IS '是否必填';
COMMENT ON COLUMN "public"."crm_tag_definitions"."validation_rule" IS '验证规则';
COMMENT ON COLUMN "public"."crm_tag_definitions"."status" IS '[crm_tag_definitions_status]';
COMMENT ON COLUMN "public"."crm_tag_definitions"."sort_order" IS '排序';
COMMENT ON COLUMN "public"."crm_tag_definitions"."usage_count" IS '使用次数';
COMMENT ON COLUMN "public"."crm_tag_definitions"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_tag_definitions"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_tag_definitions"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_tag_definitions"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_tag_definitions"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_tag_definitions"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_tag_definitions"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_tag_definitions"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_tag_definitions"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_tag_definitions"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_tag_definitions"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_tag_definitions"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_tag_definitions" IS 'Tag Definitions';

-- ----------------------------
-- Records of crm_tag_definitions
-- ----------------------------

-- ----------------------------
-- Table structure for crm_tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_tags";
CREATE TABLE "public"."crm_tags" (
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
COMMENT ON COLUMN "public"."crm_tags"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_tags"."tag_name" IS '标签名称';
COMMENT ON COLUMN "public"."crm_tags"."tag_category" IS '标签分类';
COMMENT ON COLUMN "public"."crm_tags"."tag_color" IS '标签颜色';
COMMENT ON COLUMN "public"."crm_tags"."tag_icon" IS '标签图标';
COMMENT ON COLUMN "public"."crm_tags"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_tags"."ai_accuracy" IS 'AI准确率';
COMMENT ON COLUMN "public"."crm_tags"."usage_count" IS '使用次数';
COMMENT ON COLUMN "public"."crm_tags"."status" IS '[crm_tags_status]';
COMMENT ON COLUMN "public"."crm_tags"."sort" IS '排序';
COMMENT ON COLUMN "public"."crm_tags"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_tags"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_tags"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_tags"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_tags"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_tags"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_tags"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_tags"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_tags"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_tags"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_tags" IS 'Tags';

-- ----------------------------
-- Records of crm_tags
-- ----------------------------

-- ----------------------------
-- Table structure for crm_tasks
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_tasks";
CREATE TABLE "public"."crm_tasks" (
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
COMMENT ON COLUMN "public"."crm_tasks"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_tasks"."task_type" IS '任务类型';
COMMENT ON COLUMN "public"."crm_tasks"."title" IS '职位';
COMMENT ON COLUMN "public"."crm_tasks"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_tasks"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."contact_id" IS '联系人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."contract_id" IS '合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."assignee_id" IS '接收人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."assigner_id" IS '分配人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_tasks"."due_date" IS '到期日期';
COMMENT ON COLUMN "public"."crm_tasks"."priority" IS '[crm_tasks_priority]';
COMMENT ON COLUMN "public"."crm_tasks"."status" IS '[crm_tasks_status]';
COMMENT ON COLUMN "public"."crm_tasks"."completed_at" IS '完成时间';
COMMENT ON COLUMN "public"."crm_tasks"."remind_enabled" IS '是否启用提醒';
COMMENT ON COLUMN "public"."crm_tasks"."remind_before_minutes" IS '提前提醒分钟数';
COMMENT ON COLUMN "public"."crm_tasks"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_tasks"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_tasks"."is_deleted" IS '[crm_tasks_is_deleted]';
COMMENT ON COLUMN "public"."crm_tasks"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_tasks"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_tasks"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_tasks"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_tasks"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_tasks"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_tasks"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_tasks" IS 'Tasks';

-- ----------------------------
-- Records of crm_tasks
-- ----------------------------

-- ----------------------------
-- Table structure for crm_test_monitor_report
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_test_monitor_report";
CREATE TABLE "public"."crm_test_monitor_report" (
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
COMMENT ON COLUMN "public"."crm_test_monitor_report"."report_name" IS '报告名称';
COMMENT ON COLUMN "public"."crm_test_monitor_report"."test_type" IS '测试类型(api/ui/all)';
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
COMMENT ON COLUMN "public"."crm_test_monitor_report"."status" IS '状态(0';
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
DROP TABLE IF EXISTS "public"."crm_user_extensions";
CREATE TABLE "public"."crm_user_extensions" (
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
COMMENT ON COLUMN "public"."crm_user_extensions"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_user_extensions"."user_id" IS '用户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_user_extensions"."sales_area" IS '销售区域';
COMMENT ON COLUMN "public"."crm_user_extensions"."team_id" IS '团队ID';
COMMENT ON COLUMN "public"."crm_user_extensions"."territory" IS '领土';
COMMENT ON COLUMN "public"."crm_user_extensions"."sales_targets" IS '销售目标';
COMMENT ON COLUMN "public"."crm_user_extensions"."commission_rate" IS '佣金比率';
COMMENT ON COLUMN "public"."crm_user_extensions"."max_discount" IS '最大折扣';
COMMENT ON COLUMN "public"."crm_user_extensions"."manager_id" IS '经理ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_user_extensions"."max_customers" IS '最大客户数';
COMMENT ON COLUMN "public"."crm_user_extensions"."auto_assign_enabled" IS '[crm_user_extensions_auto_assign_enabled]';
COMMENT ON COLUMN "public"."crm_user_extensions"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_user_extensions"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_user_extensions"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_user_extensions"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_user_extensions"."version" IS '版本号';
COMMENT ON COLUMN "public"."crm_user_extensions"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_user_extensions"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_user_extensions"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_user_extensions"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_user_extensions"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_user_extensions"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_user_extensions"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_user_extensions" IS 'User Extensions';

-- ----------------------------
-- Records of crm_user_extensions
-- ----------------------------

-- ----------------------------
-- Table structure for crm_visit_records
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_visit_records";
CREATE TABLE "public"."crm_visit_records" (
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
COMMENT ON COLUMN "public"."crm_visit_records"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_visit_records"."customer_id" IS '客户ID(关联crm_customers.id)';
COMMENT ON COLUMN "public"."crm_visit_records"."contact_id" IS '联系人ID(关联crm_contacts.id)';
COMMENT ON COLUMN "public"."crm_visit_records"."opportunity_id" IS '商机ID(关联crm_opportunities.id)';
COMMENT ON COLUMN "public"."crm_visit_records"."visit_type" IS '拜访类型(first_visit/requirement/demo/negotiation/return_visit/other)';
COMMENT ON COLUMN "public"."crm_visit_records"."visit_date" IS '拜访日期';
COMMENT ON COLUMN "public"."crm_visit_records"."start_time" IS '开始时间';
COMMENT ON COLUMN "public"."crm_visit_records"."end_time" IS '结束时间';
COMMENT ON COLUMN "public"."crm_visit_records"."duration_minutes" IS '拜访时长(分钟)';
COMMENT ON COLUMN "public"."crm_visit_records"."location" IS '拜访地点';
COMMENT ON COLUMN "public"."crm_visit_records"."purpose" IS '拜访目的';
COMMENT ON COLUMN "public"."crm_visit_records"."participants" IS '参与人员';
COMMENT ON COLUMN "public"."crm_visit_records"."summary" IS '拜访总结';
COMMENT ON COLUMN "public"."crm_visit_records"."outcome" IS '拜访结果';
COMMENT ON COLUMN "public"."crm_visit_records"."next_action" IS '后续行动';
COMMENT ON COLUMN "public"."crm_visit_records"."next_visit_date" IS '下次拜访日期';
COMMENT ON COLUMN "public"."crm_visit_records"."expense_amount" IS '拜访费用(元)';
COMMENT ON COLUMN "public"."crm_visit_records"."mileage" IS '拜访里程(公里)';
COMMENT ON COLUMN "public"."crm_visit_records"."transport_type" IS '出行方式';
COMMENT ON COLUMN "public"."crm_visit_records"."is_successful" IS '是否成功';
COMMENT ON COLUMN "public"."crm_visit_records"."rating" IS '拜访评分(1-5)';
COMMENT ON COLUMN "public"."crm_visit_records"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_visit_records"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_visit_records"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_visit_records"."created_id" IS '创建人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_visit_records"."updated_id" IS '更新人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_visit_records"."deleted_id" IS '删除人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_visit_records"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_visit_records"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_visit_records"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_visit_records"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_visit_records" IS '拜访记录表';

-- ----------------------------
-- Records of crm_visit_records
-- ----------------------------

-- ----------------------------
-- Table structure for crm_workflow_approvals
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_workflow_approvals";
CREATE TABLE "public"."crm_workflow_approvals" (
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
COMMENT ON COLUMN "public"."crm_workflow_approvals"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."workflow_type" IS '工作流类型';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."related_type" IS '关联类型';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."current_step" IS '当前步骤';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."total_steps" IS '总步骤数';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."status" IS '[crm_workflow_approvals_status]';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."initiator_id" IS '发起人ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."initiated_at" IS '发起时间';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_workflow_approvals"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_workflow_approvals" IS 'Workflow Approvals';

-- ----------------------------
-- Records of crm_workflow_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for crm_workflow_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_workflow_logs";
CREATE TABLE "public"."crm_workflow_logs" (
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
COMMENT ON COLUMN "public"."crm_workflow_logs"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_workflow_logs"."rule_id" IS '规则ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_logs"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_logs"."opportunity_id" IS '商机ID,关联对应表';
COMMENT ON COLUMN "public"."crm_workflow_logs"."trigger_data" IS '触发数据';
COMMENT ON COLUMN "public"."crm_workflow_logs"."execution_result" IS '执行结果';
COMMENT ON COLUMN "public"."crm_workflow_logs"."error_message" IS '错误信息';
COMMENT ON COLUMN "public"."crm_workflow_logs"."executed_at" IS '执行时间';
COMMENT ON COLUMN "public"."crm_workflow_logs"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_workflow_logs"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_workflow_logs"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_workflow_logs"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_workflow_logs"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_workflow_logs"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_workflow_logs"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_workflow_logs"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_workflow_logs"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_workflow_logs"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_workflow_logs"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_workflow_logs" IS 'Workflow Logs';

-- ----------------------------
-- Records of crm_workflow_logs
-- ----------------------------

-- ----------------------------
-- Table structure for crm_workflow_rules
-- ----------------------------
DROP TABLE IF EXISTS "public"."crm_workflow_rules";
CREATE TABLE "public"."crm_workflow_rules" (
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
COMMENT ON COLUMN "public"."crm_workflow_rules"."id" IS '主键ID（自增）';
COMMENT ON COLUMN "public"."crm_workflow_rules"."rule_name" IS '规则名称';
COMMENT ON COLUMN "public"."crm_workflow_rules"."rule_type" IS '规则类型';
COMMENT ON COLUMN "public"."crm_workflow_rules"."trigger_event" IS '触发事件';
COMMENT ON COLUMN "public"."crm_workflow_rules"."trigger_condition" IS '触发条件';
COMMENT ON COLUMN "public"."crm_workflow_rules"."action_type" IS '操作类型';
COMMENT ON COLUMN "public"."crm_workflow_rules"."action_config" IS '动作配置';
COMMENT ON COLUMN "public"."crm_workflow_rules"."enabled" IS '[crm_workflow_rules_enabled]';
COMMENT ON COLUMN "public"."crm_workflow_rules"."priority" IS '[crm_workflow_rules_priority]';
COMMENT ON COLUMN "public"."crm_workflow_rules"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_workflow_rules"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_workflow_rules"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_workflow_rules"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_workflow_rules"."is_deleted" IS '是否已删除(false:否 true:是)';
COMMENT ON COLUMN "public"."crm_workflow_rules"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."crm_workflow_rules"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."crm_workflow_rules"."deleted_id" IS '删除人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_workflow_rules"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."crm_workflow_rules"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON COLUMN "public"."crm_workflow_rules"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON TABLE "public"."crm_workflow_rules" IS 'Workflow Rules';

-- ----------------------------
-- Records of crm_workflow_rules
-- ----------------------------

-- ----------------------------
-- Table structure for gen_demo
-- ----------------------------
DROP TABLE IF EXISTS "public"."gen_demo";
CREATE TABLE "public"."gen_demo" (
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "a" int4,
  "b" int8,
  "c" float8,
  "d" bool NOT NULL,
  "e" date,
  "f" time(6),
  "g" timestamp(6),
  "h" text COLLATE "pg_catalog"."default",
  "i" json,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."gen_demo"."name" IS '名称';
COMMENT ON COLUMN "public"."gen_demo"."a" IS '整数';
COMMENT ON COLUMN "public"."gen_demo"."b" IS '大整数';
COMMENT ON COLUMN "public"."gen_demo"."c" IS '浮点数';
COMMENT ON COLUMN "public"."gen_demo"."d" IS '布尔型';
COMMENT ON COLUMN "public"."gen_demo"."e" IS '日期';
COMMENT ON COLUMN "public"."gen_demo"."f" IS '时间';
COMMENT ON COLUMN "public"."gen_demo"."g" IS '日期时间';
COMMENT ON COLUMN "public"."gen_demo"."h" IS '长文本';
COMMENT ON COLUMN "public"."gen_demo"."i" IS '元数据(JSON格式)';
COMMENT ON COLUMN "public"."gen_demo"."id" IS '主键ID';
COMMENT ON COLUMN "public"."gen_demo"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."gen_demo"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."gen_demo"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."gen_demo"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."gen_demo"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."gen_demo"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."gen_demo"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."gen_demo"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."gen_demo"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."gen_demo"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."gen_demo" IS '示例表';

-- ----------------------------
-- Records of gen_demo
-- ----------------------------

-- ----------------------------
-- Table structure for gen_demo01
-- ----------------------------
DROP TABLE IF EXISTS "public"."gen_demo01";
CREATE TABLE "public"."gen_demo01" (
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."gen_demo01"."name" IS '名称';
COMMENT ON COLUMN "public"."gen_demo01"."id" IS '主键ID';
COMMENT ON COLUMN "public"."gen_demo01"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."gen_demo01"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."gen_demo01"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."gen_demo01"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."gen_demo01"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."gen_demo01"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."gen_demo01"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."gen_demo01"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."gen_demo01"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."gen_demo01"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."gen_demo01" IS '示例1表';

-- ----------------------------
-- Records of gen_demo01
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."gen_table";
CREATE TABLE "public"."gen_table" (
  "table_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "table_comment" varchar(500) COLLATE "pg_catalog"."default",
  "class_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "package_name" varchar(100) COLLATE "pg_catalog"."default",
  "module_name" varchar(30) COLLATE "pg_catalog"."default",
  "business_name" varchar(30) COLLATE "pg_catalog"."default",
  "function_name" varchar(100) COLLATE "pg_catalog"."default",
  "sub_table_name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sub_table_fk_name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "parent_menu_id" int4,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."gen_table"."table_name" IS '表名称';
COMMENT ON COLUMN "public"."gen_table"."table_comment" IS '表描述';
COMMENT ON COLUMN "public"."gen_table"."class_name" IS '实体类名称';
COMMENT ON COLUMN "public"."gen_table"."package_name" IS '生成包路径';
COMMENT ON COLUMN "public"."gen_table"."module_name" IS '生成模块名';
COMMENT ON COLUMN "public"."gen_table"."business_name" IS '生成业务名';
COMMENT ON COLUMN "public"."gen_table"."function_name" IS '生成功能名';
COMMENT ON COLUMN "public"."gen_table"."sub_table_name" IS '关联子表的表名';
COMMENT ON COLUMN "public"."gen_table"."sub_table_fk_name" IS '子表关联的外键名';
COMMENT ON COLUMN "public"."gen_table"."parent_menu_id" IS '父菜单ID';
COMMENT ON COLUMN "public"."gen_table"."id" IS '主键ID';
COMMENT ON COLUMN "public"."gen_table"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."gen_table"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."gen_table"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."gen_table"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."gen_table"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."gen_table"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."gen_table"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."gen_table"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."gen_table"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."gen_table"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."gen_table" IS '代码生成表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS "public"."gen_table_column";
CREATE TABLE "public"."gen_table_column" (
  "column_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "column_comment" varchar(500) COLLATE "pg_catalog"."default",
  "column_type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "column_length" varchar(50) COLLATE "pg_catalog"."default",
  "column_default" varchar(200) COLLATE "pg_catalog"."default",
  "is_pk" bool NOT NULL DEFAULT false,
  "is_increment" bool NOT NULL DEFAULT false,
  "is_nullable" bool NOT NULL DEFAULT true,
  "is_unique" bool NOT NULL DEFAULT false,
  "python_type" varchar(100) COLLATE "pg_catalog"."default",
  "python_field" varchar(200) COLLATE "pg_catalog"."default",
  "is_insert" bool NOT NULL DEFAULT true,
  "is_edit" bool NOT NULL DEFAULT true,
  "is_list" bool NOT NULL DEFAULT true,
  "is_query" bool NOT NULL DEFAULT false,
  "query_type" varchar(50) COLLATE "pg_catalog"."default",
  "html_type" varchar(100) COLLATE "pg_catalog"."default",
  "dict_type" varchar(200) COLLATE "pg_catalog"."default",
  "sort" int4 NOT NULL,
  "table_id" int4 NOT NULL,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."gen_table_column"."column_name" IS '列名称';
COMMENT ON COLUMN "public"."gen_table_column"."column_comment" IS '列描述';
COMMENT ON COLUMN "public"."gen_table_column"."column_type" IS '列类型';
COMMENT ON COLUMN "public"."gen_table_column"."column_length" IS '列长度';
COMMENT ON COLUMN "public"."gen_table_column"."column_default" IS '列默认值';
COMMENT ON COLUMN "public"."gen_table_column"."is_pk" IS '是否主键';
COMMENT ON COLUMN "public"."gen_table_column"."is_increment" IS '是否自增';
COMMENT ON COLUMN "public"."gen_table_column"."is_nullable" IS '是否允许为空';
COMMENT ON COLUMN "public"."gen_table_column"."is_unique" IS '是否唯一';
COMMENT ON COLUMN "public"."gen_table_column"."python_type" IS 'Python类型';
COMMENT ON COLUMN "public"."gen_table_column"."python_field" IS 'Python字段名';
COMMENT ON COLUMN "public"."gen_table_column"."is_insert" IS '是否为新增字段';
COMMENT ON COLUMN "public"."gen_table_column"."is_edit" IS '是否编辑字段';
COMMENT ON COLUMN "public"."gen_table_column"."is_list" IS '是否列表字段';
COMMENT ON COLUMN "public"."gen_table_column"."is_query" IS '是否查询字段';
COMMENT ON COLUMN "public"."gen_table_column"."query_type" IS '查询方式';
COMMENT ON COLUMN "public"."gen_table_column"."html_type" IS '显示类型';
COMMENT ON COLUMN "public"."gen_table_column"."dict_type" IS '字典类型';
COMMENT ON COLUMN "public"."gen_table_column"."sort" IS '排序';
COMMENT ON COLUMN "public"."gen_table_column"."table_id" IS '归属表编号';
COMMENT ON COLUMN "public"."gen_table_column"."id" IS '主键ID';
COMMENT ON COLUMN "public"."gen_table_column"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."gen_table_column"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."gen_table_column"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."gen_table_column"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."gen_table_column"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."gen_table_column"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."gen_table_column"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."gen_table_column"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."gen_table_column"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."gen_table_column"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."gen_table_column" IS '代码生成表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "order" int4 NOT NULL,
  "code" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "leader" varchar(32) COLLATE "pg_catalog"."default",
  "phone" varchar(11) COLLATE "pg_catalog"."default",
  "email" varchar(64) COLLATE "pg_catalog"."default",
  "parent_id" int4,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_dept"."name" IS '部门名称';
COMMENT ON COLUMN "public"."sys_dept"."order" IS '显示排序';
COMMENT ON COLUMN "public"."sys_dept"."code" IS '部门编码';
COMMENT ON COLUMN "public"."sys_dept"."leader" IS '部门负责人';
COMMENT ON COLUMN "public"."sys_dept"."phone" IS '手机';
COMMENT ON COLUMN "public"."sys_dept"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_dept"."parent_id" IS '父级部门ID';
COMMENT ON COLUMN "public"."sys_dept"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_dept"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_dept"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_dept"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_dept"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dept"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dept"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_dept"."deleted_time" IS '删除时间';
COMMENT ON TABLE "public"."sys_dept" IS '部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "public"."sys_dept" VALUES ('集团总公司', 1, 'GROUP', '部门负责人', '1582112620', 'deptadmin@example.com', NULL, 1, '88e7e8f7-5bfd-49c2-8f37-621719589365', '0', '集团总公司', '2026-04-26 13:46:59.114446', '2026-04-26 13:46:59.114446', 'f', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_data";
CREATE TABLE "public"."sys_dict_data" (
  "dict_sort" int4 NOT NULL,
  "dict_label" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "css_class" varchar(255) COLLATE "pg_catalog"."default",
  "list_class" varchar(255) COLLATE "pg_catalog"."default",
  "is_default" bool NOT NULL,
  "dict_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_type_id" int4 NOT NULL,
  "id" int4 NOT NULL DEFAULT nextval('sys_dict_data_id_seq'::regclass),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_dict_data"."dict_sort" IS '字典排序';
COMMENT ON COLUMN "public"."sys_dict_data"."dict_label" IS '字典标签';
COMMENT ON COLUMN "public"."sys_dict_data"."dict_value" IS '字典键值';
COMMENT ON COLUMN "public"."sys_dict_data"."css_class" IS '样式属性（其他样式扩展）';
COMMENT ON COLUMN "public"."sys_dict_data"."list_class" IS '表格回显样式';
COMMENT ON COLUMN "public"."sys_dict_data"."is_default" IS '是否默认（True是 False否）';
COMMENT ON COLUMN "public"."sys_dict_data"."dict_type" IS '字典类型';
COMMENT ON COLUMN "public"."sys_dict_data"."dict_type_id" IS '字典类型ID';
COMMENT ON COLUMN "public"."sys_dict_data"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_dict_data"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_dict_data"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_dict_data"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_dict_data"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_data"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict_data"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_dict_data"."deleted_time" IS '删除时间';
COMMENT ON TABLE "public"."sys_dict_data" IS '字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO "public"."sys_dict_data" VALUES (1, '男', '0', 'blue', NULL, 'f', 'sys_user_sex', 1, 1, 'd5598e94-c0aa-46eb-9bb0-d4d68d27f356', '0', '性别男', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '女', '1', 'pink', NULL, 'f', 'sys_user_sex', 1, 2, '530f84dd-334e-4cfb-a892-0bfe58027f75', '0', '性别女', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '未知', '2', 'red', NULL, 'f', 'sys_user_sex', 1, 3, '8eb2666e-9fdb-42af-beda-20eec1bde241', '0', '性别未知', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '是', '1', '', 'primary', 'f', 'sys_yes_no', 2, 4, 'd51bde65-2f23-40f0-83c0-bcaf8473201d', '0', '是', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '否', '0', '', 'danger', 'f', 'sys_yes_no', 2, 5, '80387a11-acbb-4bb5-b783-438d3a1d0721', '0', '否', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '启用', '1', '', 'primary', 'f', 'sys_common_status', 3, 6, 'b7058787-f63e-4622-83ec-f86415b950f5', '0', '启用状态', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '停用', '0', '', 'danger', 'f', 'sys_common_status', 3, 7, '631649f0-9eb2-44e9-ae30-0a4ae52c091f', '0', '停用状态', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '通知', '1', 'blue', 'warning', 'f', 'sys_notice_type', 4, 8, '20940436-eaca-4ea0-810e-2efa4d367c20', '0', '通知', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '公告', '2', 'orange', 'success', 'f', 'sys_notice_type', 4, 9, 'f6ae749c-b08b-41ff-9cc3-a810cd5e8689', '0', '公告', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (99, '其他', '0', '', 'info', 'f', 'sys_oper_type', 5, 10, '8052b90e-ad0b-43cb-8a06-66562ee79269', '0', '其他操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '新增', '1', '', 'info', 'f', 'sys_oper_type', 5, 11, 'cbe9d4dd-afad-40e0-a734-245a81e46a1d', '0', '新增操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '修改', '2', '', 'info', 'f', 'sys_oper_type', 5, 12, '406b252a-2d94-4376-8fa2-cb64bb4266c0', '0', '修改操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '删除', '3', '', 'danger', 'f', 'sys_oper_type', 5, 13, 'dfa9de01-31f8-44ed-9422-702d07b6ad82', '0', '删除操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '分配权限', '4', '', 'primary', 'f', 'sys_oper_type', 5, 14, 'ed8eca7b-edcd-4ba1-b072-a714a4a09780', '0', '授权操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '导出', '5', '', 'warning', 'f', 'sys_oper_type', 5, 15, 'cf8b86bf-f72f-4532-a2c0-cf4d390cef97', '0', '导出操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '导入', '6', '', 'warning', 'f', 'sys_oper_type', 5, 16, 'bba45ec6-412f-41eb-ae01-b112bd17035b', '0', '导入操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (7, '强退', '7', '', 'danger', 'f', 'sys_oper_type', 5, 17, 'e436dbf7-b597-459c-ae13-990ca5d3be1f', '0', '强退操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (8, '生成代码', '8', '', 'warning', 'f', 'sys_oper_type', 5, 18, 'ae57f734-c908-40ae-8779-aa1f95221baf', '0', '生成操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (9, '清空数据', '9', '', 'danger', 'f', 'sys_oper_type', 5, 19, '4b807681-2690-42e7-a777-0f2e5f3934b4', '0', '清空操作', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '默认(Memory)', 'default', '', NULL, 'f', 'sys_job_store', 6, 20, '81d80b81-bbbc-4d7e-8190-bb666ddf664d', '0', '默认分组', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '数据库(Sqlalchemy)', 'sqlalchemy', '', NULL, 'f', 'sys_job_store', 6, 21, '10957b73-04c3-4792-9181-5077b928e7cb', '0', '数据库分组', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '数据库(Redis)', 'redis', '', NULL, 'f', 'sys_job_store', 6, 22, '7c75832c-7572-4e68-af7a-d427004b3368', '0', 'reids分组', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '线程池', 'default', '', NULL, 'f', 'sys_job_executor', 7, 23, 'e5290941-19a6-43f3-894e-1e7edd2fac5b', '0', '线程池', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '进程池', 'processpool', '', NULL, 'f', 'sys_job_executor', 7, 24, 'a667d475-deb6-4f25-8405-b573cb692bce', '0', '进程池', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '演示函数', 'scheduler_test.job', '', NULL, 'f', 'sys_job_function', 8, 25, '3504cd76-cfa9-4a49-b5b9-c778db3a10f4', '0', '演示函数', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '指定日期(date)', 'date', '', NULL, 'f', 'sys_job_trigger', 9, 26, 'ba9cfd2e-7ec7-4c87-bcb2-2b9e00e8ff18', '0', '指定日期任务触发器', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '间隔触发器(interval)', 'interval', '', NULL, 'f', 'sys_job_trigger', 9, 27, '292d6ee1-48df-482a-8259-80e992e5806e', '0', '间隔触发器任务触发器', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, 'cron表达式', 'cron', '', NULL, 'f', 'sys_job_trigger', 9, 28, '22807660-52da-4205-85ba-5394e82956c7', '0', '间隔触发器任务触发器', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '默认(default)', 'default', '', NULL, 'f', 'sys_list_class', 10, 29, '287fd071-34c3-4174-b6f7-4836eabf8c87', '0', '默认表格回显样式', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '主要(primary)', 'primary', '', NULL, 'f', 'sys_list_class', 10, 30, '7ffd87fd-e50a-4aee-b556-cef8c4268228', '0', '主要表格回显样式', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '成功(success)', 'success', '', NULL, 'f', 'sys_list_class', 10, 31, 'd9b54252-0304-407e-9ac2-8ad7debc2a4e', '0', '成功表格回显样式', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '信息(info)', 'info', '', NULL, 'f', 'sys_list_class', 10, 32, 'e1e4d0be-9de7-4341-a58f-450c7ecbdd2a', '0', '信息表格回显样式', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '警告(warning)', 'warning', '', NULL, 'f', 'sys_list_class', 10, 33, '5c210299-9fa2-44d9-be62-28f45116b674', '0', '警告表格回显样式', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '危险(danger)', 'danger', '', NULL, 'f', 'sys_list_class', 10, 34, '64f48272-ee8a-4ca2-8842-dc54274aef07', '0', '危险表格回显样式', '2026-04-26 13:46:59.183014', '2026-04-26 13:46:59.183014', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_ai_tags_status', 11, 35, 'a5fa0ff9-502a-46d7-b3b2-ff2450b9c8b6', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_ai_tags_status', 11, 36, '00de5110-5b6f-4e9d-8c01-d56c749704c4', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_ai_tags_status', 11, 37, '179fb45d-73f4-448a-9d20-c70045a42b20', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_ai_tags_status', 11, 38, '809696d3-883c-4e27-844d-7ac894c87f0d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_ai_tags_status', 11, 39, 'c4acd302-2337-4342-a8db-573aae336742', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_campaign_leads_is_converted', 12, 40, 'f3d37561-e7f6-4a79-8244-b289778a449b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_campaign_leads_is_converted', 12, 41, '4e4b9568-68fd-4126-813d-e7992ff979ce', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_campaigns_status', 13, 42, 'b4aadd6b-e34b-42e9-90bd-95d4972fe406', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_campaigns_status', 13, 43, '9237986a-4123-4d72-bb1a-02cd269f74eb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_campaigns_status', 13, 44, 'aec38433-4543-4a40-ae6e-d077598ac8eb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_campaigns_status', 13, 45, '00e9ef87-5644-4f34-ab76-d195830caf02', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_campaigns_status', 13, 46, 'a05df104-7a23-46ee-8245-e5289f469cb1', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_contact_relations_is_deleted', 14, 47, '8266bafb-2b2c-4a37-b1dc-e6f8ec79b2fb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_contact_relations_is_deleted', 14, 48, 'd1cb47fd-094e-4a2f-b6e9-53b48462a152', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_contact_relations_status', 15, 49, '2f3fda7a-ef9e-4954-a4d6-b5b63466b6eb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_contact_relations_status', 15, 50, 'b60fcb07-3387-4cbb-92a2-2c0d62454490', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_contact_relations_status', 15, 51, '9c4a7ce7-7bbe-4d1a-8bb5-2af214b1a4e5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_contact_relations_status', 15, 52, 'c86cf098-86f3-4d69-b04a-aaee831caae4', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_contact_relations_status', 15, 53, '9affbceb-d172-4af9-8ee3-fdee6d53cb70', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_contact_visits_is_deleted', 16, 54, 'cf7a0b3c-bd5a-4e90-b1c7-75884543dbed', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_contact_visits_is_deleted', 16, 55, '2e52e119-2520-4af3-a600-377ba9c5f603', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '首次拜访', '1', NULL, NULL, 'f', 'crm_contact_visits_visit_type', 17, 56, 'ccf2e991-76e9-455c-95d3-991c9f2ac7e3', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '常规拜访', '2', NULL, NULL, 'f', 'crm_contact_visits_visit_type', 17, 57, 'b821139c-7c24-421b-a0b5-115de0fa46b7', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '回访', '3', NULL, NULL, 'f', 'crm_contact_visits_visit_type', 17, 58, 'f89fe995-c66f-4c2c-a71e-0e6ee973544d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '线上沟通', '4', NULL, NULL, 'f', 'crm_contact_visits_visit_type', 17, 59, 'e19e49e8-f90f-4c1f-b5ed-37e74c46f035', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '会议', '5', NULL, NULL, 'f', 'crm_contact_visits_visit_type', 17, 60, '784b6890-1f6f-4975-afa4-33524581a779', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未知', '0', NULL, NULL, 'f', 'crm_contacts_gender', 18, 61, '8f6c7170-aef3-49f6-9a08-7424a2aa30be', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '男', '1', NULL, NULL, 'f', 'crm_contacts_gender', 18, 62, 'aa0cb0ee-a9c5-454d-9449-0a1300e1cdbc', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '女', '2', NULL, NULL, 'f', 'crm_contacts_gender', 18, 63, '0b9ba66b-439b-4326-8ead-0437ef5baa24', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_contacts_is_deleted', 19, 64, '5f84bec0-c904-4d51-8740-0a25f0ca61f5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_contacts_is_deleted', 19, 65, 'fb73bfde-1832-4c69-9d62-3ea159f13ef5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_contacts_is_primary', 20, 66, '6ae87ff5-4e5f-407c-9b6b-9b38c56597a5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_contacts_is_primary', 20, 67, '6412ceb0-8d2a-4cfe-a3ea-3fb87f691c37', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '草稿', '1', NULL, NULL, 'f', 'crm_contract_invoices_invoice_status', 21, 68, 'd769a33d-4e43-48a5-9cf6-e3332c87b364', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已开具', '2', NULL, NULL, 'f', 'crm_contract_invoices_invoice_status', 21, 69, 'd61fc914-0e7a-40d2-89cd-16e0f2d622cf', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '已发送', '3', NULL, NULL, 'f', 'crm_contract_invoices_invoice_status', 21, 70, '69692594-0071-4f2b-9c5f-500e362dfd71', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '已收款', '4', NULL, NULL, 'f', 'crm_contract_invoices_invoice_status', 21, 71, '54983812-5f90-4f38-aaaa-62412f4bfcb9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '已作废', '5', NULL, NULL, 'f', 'crm_contract_invoices_invoice_status', 21, 72, '9769750c-566e-4ed6-949a-cf0cf1f7d194', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '增值税专票', '1', NULL, NULL, 'f', 'crm_contract_invoices_invoice_type', 22, 73, '015f3a83-8d79-4a8a-84f5-fbefb0cda3c1', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '增值税普票', '2', NULL, NULL, 'f', 'crm_contract_invoices_invoice_type', 22, 74, '883314df-fa5a-49a0-ac59-1f32b2d64ead', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '普通发票', '3', NULL, NULL, 'f', 'crm_contract_invoices_invoice_type', 22, 75, 'e43c3a31-a794-4082-9f6d-9ce2f4f48acd', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_contract_invoices_is_deleted', 23, 76, '924a6875-323f-4e48-bda4-e52b05b14b04', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_contract_invoices_is_deleted', 23, 77, '3a9abcfc-625c-48e3-817e-a97888e4328d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '待审批', '1', NULL, NULL, 'f', 'crm_contracts_approval_status', 24, 78, '709a8f87-39cc-4b1d-af5d-69be23038346', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '审批中', '2', NULL, NULL, 'f', 'crm_contracts_approval_status', 24, 79, 'daf820b9-fb66-4a79-9a95-13fc42cac868', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '已通过', '3', NULL, NULL, 'f', 'crm_contracts_approval_status', 24, 80, '99075fe7-db45-40b4-9589-21f653b1842e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '已拒绝', '4', NULL, NULL, 'f', 'crm_contracts_approval_status', 24, 81, '5aca36d7-7188-4786-86a4-c89f39c3ffd8', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '已撤销', '5', NULL, NULL, 'f', 'crm_contracts_approval_status', 24, 82, 'da04daff-66b2-4b20-a5bd-8e10947ece90', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '销售合同', '1', NULL, NULL, 'f', 'crm_contracts_contract_type', 25, 83, 'ef682566-f84f-4641-b040-2d90c2541a55', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '服务合同', '2', NULL, NULL, 'f', 'crm_contracts_contract_type', 25, 84, '912c7edb-7f46-4aed-8398-bb07c32c23be', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '框架协议', '3', NULL, NULL, 'f', 'crm_contracts_contract_type', 25, 85, 'a3afef5e-dbec-4165-9743-ecce21b296e1', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '续签合同', '4', NULL, NULL, 'f', 'crm_contracts_contract_type', 25, 86, '88974a69-506d-4905-b26a-d309eaf5c2d6', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '变更协议', '5', NULL, NULL, 'f', 'crm_contracts_contract_type', 25, 87, 'b8c57417-2805-49d1-8f9e-3dbf8038b46e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '终止协议', '6', NULL, NULL, 'f', 'crm_contracts_contract_type', 25, 88, 'bc12a6e5-b131-41a1-98e3-060e46658eea', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_contracts_is_deleted', 26, 89, 'f0f1e9f1-64da-4c86-b975-dce2f56d05d5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_contracts_is_deleted', 26, 90, '7b22baea-2a1c-441e-aa89-128f00189910', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_contracts_status', 27, 91, '5e59c1cf-9a42-4b00-9e1f-7ae5e1359e6e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_contracts_status', 27, 92, '4b9d1bcf-97a1-44f7-96ee-d0258e34d980', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_contracts_status', 27, 93, '2df8a554-ca52-4fbe-997f-49c354c38b0d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_contracts_status', 27, 94, '0983f5f8-cc10-4598-9578-107c94091992', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_contracts_status', 27, 95, 'e2740c24-9353-4ada-b0f5-d3e3983a33fc', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '电话', '1', NULL, NULL, 'f', 'crm_customer_activities_activity_type', 28, 96, '73accfa3-c24e-4251-87bf-f617b28a1ce0', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '邮件', '2', NULL, NULL, 'f', 'crm_customer_activities_activity_type', 28, 97, '5dbacbdf-8b7e-4bbd-b44c-63fab746c94c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '拜访', '3', NULL, NULL, 'f', 'crm_customer_activities_activity_type', 28, 98, 'ace31bd6-1b09-4837-858a-17833335faae', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '会议', '4', NULL, NULL, 'f', 'crm_customer_activities_activity_type', 28, 99, '64536b6c-9b3f-4c6d-bd4e-4b27917f8fb4', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '培训', '5', NULL, NULL, 'f', 'crm_customer_activities_activity_type', 28, 100, '22d1475e-1194-4239-b012-59530ff8b29d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '展会', '6', NULL, NULL, 'f', 'crm_customer_activities_activity_type', 28, 101, 'ec1faa2a-0088-4852-b88b-2278b1faa75f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_customer_addresses_is_active', 29, 102, 'e0110b9b-ca2b-4d94-b504-d253c9f68a89', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_customer_addresses_is_active', 29, 103, '529be806-e664-4459-a0d2-7ea20fbc67da', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_customer_addresses_is_default', 30, 104, 'ec18c9c2-6271-4ad0-b24c-2b50211d1d6c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_customer_addresses_is_default', 30, 105, 'ade4f7f3-2298-4ad1-a08d-c124e83b1067', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_customer_addresses_is_deleted', 31, 106, 'eadff99c-fc15-4295-bdc2-1cf9f791e262', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_customer_addresses_is_deleted', 31, 107, '0f172502-8621-4683-8b1f-2a24c29fb48d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_customer_attachments_is_deleted', 32, 108, 'e539f5c1-7a98-45f0-b87a-0a62b3eff4b4', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_customer_attachments_is_deleted', 32, 109, 'e6be9e73-bf46-4475-ac79-2695ada38286', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_customer_tags_is_deleted', 33, 110, 'c55968d9-50b6-4cff-829c-3ec415c9e21e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_customer_tags_is_deleted', 33, 111, '15c05e66-14a4-4598-a12c-34302044839c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '企业客户', '1', NULL, NULL, 'f', 'crm_customers_customer_type', 34, 112, '195ee200-0a58-4bdb-9db8-69b38986ac57', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '个人客户', '2', NULL, NULL, 'f', 'crm_customers_customer_type', 34, 113, '8aadda97-d8a9-4476-80fb-3a6c049bd207', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '政府机构', '3', NULL, NULL, 'f', 'crm_customers_customer_type', 34, 114, '1689d29c-ecc8-4cb4-81a4-d9e97da6face', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '事业单位', '4', NULL, NULL, 'f', 'crm_customers_customer_type', 34, 115, 'ee2acd2f-1537-4c11-bbb4-5ae1b6f760b2', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '合作伙伴', '5', NULL, NULL, 'f', 'crm_customers_customer_type', 34, 116, 'bb77af7d-02e9-42f9-b353-695b566fa042', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '私有', '1', NULL, NULL, 'f', 'crm_customers_pool_status', 35, 117, 'a3fca4db-30f3-471a-9288-4ffdb8cb9a6e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '公海', '2', NULL, NULL, 'f', 'crm_customers_pool_status', 35, 118, 'ff0cd4e8-dd15-4027-bb2d-0b6a6f5dde76', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '5分', '1', NULL, NULL, 'f', 'crm_customers_rating', 36, 119, '458ee5be-ee16-4f2e-a4eb-fde03c2bd9b2', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '自主开发', '1', NULL, NULL, 'f', 'crm_customers_source', 37, 120, '39133bf8-ce77-4b97-a429-69dcb3b82995', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '市场活动', '2', NULL, NULL, 'f', 'crm_customers_source', 37, 121, '9aac0e67-88bd-4923-b672-e96228b077e9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '转介绍', '3', NULL, NULL, 'f', 'crm_customers_source', 37, 122, 'b2302dcd-aae8-4101-b3ab-330faf748fd5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '网络推广', '4', NULL, NULL, 'f', 'crm_customers_source', 37, 123, 'b4448617-7475-4cb0-978d-af61561b360f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '合作伙伴', '5', NULL, NULL, 'f', 'crm_customers_source', 37, 124, '2be83f4d-162a-45f2-b47b-45ff4d09931d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '招投标', '6', NULL, NULL, 'f', 'crm_customers_source', 37, 125, '864260cf-a223-49a9-9c49-29120f069fc1', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_customers_status', 38, 126, '9a9d4714-2ab8-409c-8ee7-e80c0368a1ff', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_customers_status', 38, 127, 'ef59d26c-57a8-4f9c-b1c0-d03e68296467', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_customers_status', 38, 128, '17dc16f5-64ac-4dd7-9148-158c3ac458e9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_customers_status', 38, 129, 'c9cd8538-36e9-47bf-be57-02911cc6b362', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_customers_status', 38, 130, 'a9111962-ca0f-49f2-9eb5-579360751f81', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_data_dicts_is_default', 39, 131, 'cb3b4e8a-b3f5-4dde-a9a4-8dec4d3478dd', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_data_dicts_is_default', 39, 132, 'cd46c70b-aa11-4809-a1d2-15e432658c82', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_data_dicts_is_deleted', 40, 133, '08616fa7-8168-49a9-b355-21469a04fdf9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_data_dicts_is_deleted', 40, 134, '45ce8b1d-49c6-4836-b768-bdf16708b2ca', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_data_dicts_is_leaf', 41, 135, '8bc56fd7-79e6-409d-b47e-ebda15f082b6', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_data_dicts_is_leaf', 41, 136, '5fb0348a-84d6-4323-92d1-a13d10d6f3e7', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '电话', '1', NULL, NULL, 'f', 'crm_follow_records_follow_type', 42, 137, '9f8122c2-da23-4b54-ba2c-49023a168443', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '邮件', '2', NULL, NULL, 'f', 'crm_follow_records_follow_type', 42, 138, '220e66c1-fe2e-471d-a4a5-abf6e2d6b6fd', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '拜访', '3', NULL, NULL, 'f', 'crm_follow_records_follow_type', 42, 139, 'b3be2be9-bcb7-48c7-804d-4fb4134b68f2', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '微信', '4', NULL, NULL, 'f', 'crm_follow_records_follow_type', 42, 140, '89e5fac4-71ba-473c-89b5-8ea45c1de174', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '其他', '5', NULL, NULL, 'f', 'crm_follow_records_follow_type', 42, 141, 'f5695696-3ba2-4176-a751-3661cab85830', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_followups_is_deleted', 43, 142, 'ae96c7fd-7d91-451c-9782-eb31bda35765', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_followups_is_deleted', 43, 143, '61114ada-8b5d-42b2-9b12-2418ee501bbb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_import_records_status', 44, 144, '5502ee61-bd83-4373-aa18-95ef0df80500', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_import_records_status', 44, 145, '0d645921-de4e-45c6-b7d5-9070c1aafa4d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_import_records_status', 44, 146, '77533068-1155-46c9-90f3-6ae10b850ddb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_import_records_status', 44, 147, '73f6cc64-c629-4e69-b9d8-8082ebb67371', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_import_records_status', 44, 148, 'fb378aea-ede5-4d86-b5cf-3f73f39be533', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '增值税专票', '1', NULL, NULL, 'f', 'crm_invoices_invoice_type', 45, 149, 'e7591fe0-6f56-45d4-ba9f-76332b64089c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '增值税普票', '2', NULL, NULL, 'f', 'crm_invoices_invoice_type', 45, 150, 'b1456b36-9c4d-4094-9f43-2ad3cf2b7086', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '普通发票', '3', NULL, NULL, 'f', 'crm_invoices_invoice_type', 45, 151, 'c96031c0-ea6a-456b-a1f2-93e739d3879a', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_invoices_status', 46, 152, 'f40ba4d2-3f63-42e2-8e3b-a915e878653e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_invoices_status', 46, 153, '6d7162d2-6eac-4d5c-874e-c138fc373791', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_invoices_status', 46, 154, '61530089-4715-4def-8797-177f6e70b455', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_invoices_status', 46, 155, '0425a9f0-8fa5-4c3b-9692-7f08daa4300b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_invoices_status', 46, 156, '96cda02f-863f-49ba-b44e-69e2643d22bf', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_joint_followups_can_edit', 47, 157, 'e6343760-834f-4964-9b28-bf52798c393b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_joint_followups_can_edit', 47, 158, '142a4070-cbec-4a37-a262-1f35970a7f98', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_joint_followups_can_view_sensitive', 48, 159, '7f15348a-3919-4606-afd4-e99cc69e14e1', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_joint_followups_can_view_sensitive', 48, 160, '1bb3a847-fc79-421b-8d41-665fd449e4f9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_joint_followups_status', 49, 161, 'e79b4f8b-ebe6-4339-adfa-f61c9609929e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_joint_followups_status', 49, 162, 'fd7a40f8-c14c-42f5-9efb-cc8d477e50d9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_joint_followups_status', 49, 163, '8ba31d65-6a04-44e9-9580-92310c51e0d4', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_joint_followups_status', 49, 164, '537739c8-bb32-4594-8dbb-24fb6624b72b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_joint_followups_status', 49, 165, '9fbcf747-1a2c-4e92-9cb2-5ee5a60f73fe', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_leads_is_deleted', 50, 166, 'ca5ff875-3456-420b-9888-1f51d8e3293f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_leads_is_deleted', 50, 167, 'e20db998-9c41-483e-830a-5f4989255464', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '自主开发', '1', NULL, NULL, 'f', 'crm_leads_source', 51, 168, 'c5e7a754-87aa-4bd5-911b-3b76e504a744', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '市场活动', '2', NULL, NULL, 'f', 'crm_leads_source', 51, 169, '2bcdb8c4-fa9a-42b2-aaaf-ca3661a06b76', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '转介绍', '3', NULL, NULL, 'f', 'crm_leads_source', 51, 170, 'f961bea9-b3c9-4f40-8ac0-012e0313b54f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '网络推广', '4', NULL, NULL, 'f', 'crm_leads_source', 51, 171, 'cec6b7a1-8a92-4ad8-81ec-515458cb90ac', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '合作伙伴', '5', NULL, NULL, 'f', 'crm_leads_source', 51, 172, '753dca94-49cf-4836-9867-ca8d4f681ffb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '招投标', '6', NULL, NULL, 'f', 'crm_leads_source', 51, 173, '016dcf9a-48bc-43db-b023-890c8174effe', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_leads_status', 52, 174, '54f15f3f-cbf0-4b86-bd3f-245e8b703eee', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_leads_status', 52, 175, '8d1fc35e-60c6-458a-9d3e-b7ae67a36603', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_leads_status', 52, 176, 'ef7dbd41-70e6-4ade-8565-1b3fe186611d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_leads_status', 52, 177, '4d6bc42f-d75b-4387-bb83-0d647f4b857f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_leads_status', 52, 178, 'a5b06028-ceab-45c5-8405-3847a765a455', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_marketing_campaigns_is_deleted', 53, 179, '8d733490-d4a8-4686-9ee9-68e2f2b429e5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_marketing_campaigns_is_deleted', 53, 180, '50ee8641-1671-4f3c-91b9-b2a70ce8183d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_marketing_campaigns_status', 54, 181, 'ac389682-6e1f-4685-8a24-1930395ad6be', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_marketing_campaigns_status', 54, 182, '98847621-614f-4c60-a3e0-f981bc114d1e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_marketing_campaigns_status', 54, 183, '480dc6ed-27ee-4750-8333-e5f6d5e2cda9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_marketing_campaigns_status', 54, 184, 'c0f2676f-2a9c-4eec-a0bc-0150c130f21e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_marketing_campaigns_status', 54, 185, '088e2a34-fc8e-4928-981e-bdde44f2e0fb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_marketing_channels_status', 55, 186, '9d928d40-9e95-4e65-9d6d-b57363af4b5a', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_marketing_channels_status', 55, 187, '31c7af10-7749-4892-9f56-203a9046c4bc', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_marketing_channels_status', 55, 188, 'e851104a-3bd6-494a-bcfc-4a20ba08efed', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_marketing_channels_status', 55, 189, 'e594d815-3ca3-4e02-ba5e-3b1578d19202', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_marketing_channels_status', 55, 190, '90000c04-880e-48f5-aa6a-90b948217940', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未读', '0', NULL, NULL, 'f', 'crm_notifications_is_read', 56, 191, '9ba74450-315f-4b4b-9d9c-0965e17c03a6', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已读', '1', NULL, NULL, 'f', 'crm_notifications_is_read', 56, 192, 'b23de995-1f5d-4962-9af0-72b8072af8e5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '系统通知', '1', NULL, NULL, 'f', 'crm_notifications_notification_type', 57, 193, 'b2dd8b01-6175-4755-884e-74b0840371a9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '审批通知', '2', NULL, NULL, 'f', 'crm_notifications_notification_type', 57, 194, 'b4bb1900-3d8d-4f20-8d9a-53ab0f3f1450', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '提醒通知', '3', NULL, NULL, 'f', 'crm_notifications_notification_type', 57, 195, '81353f6b-67c7-4e0a-91de-f5f5fe56a2f6', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '公告', '4', NULL, NULL, 'f', 'crm_notifications_notification_type', 57, 196, '42b95429-c518-496d-90d5-fa4d2721d154', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '低', '1', NULL, NULL, 'f', 'crm_notifications_priority', 58, 197, '1dadb1b2-1610-426e-b7ac-056cbac59438', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '中', '2', NULL, NULL, 'f', 'crm_notifications_priority', 58, 198, '24dfccdd-cf05-4567-a5ad-7a06ef9426e8', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '高', '3', NULL, NULL, 'f', 'crm_notifications_priority', 58, 199, '7e3b74dc-d55b-4a4a-829e-51de2f7f9db8', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '紧急', '4', NULL, NULL, 'f', 'crm_notifications_priority', 58, 200, '242a3e2b-fba5-4ca1-8bc9-6b28d85860f6', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_operation_logs_status', 59, 201, 'f84f20fd-a02f-40c3-9688-88186d07f50f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_operation_logs_status', 59, 202, 'f7cfd170-90f2-4312-8f1d-0e32c1b85258', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_operation_logs_status', 59, 203, '51498275-919d-4646-bff2-ded1d94cbace', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_operation_logs_status', 59, 204, '076f7caf-9c94-41a5-9106-bc7c9a8cb4c8', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_operation_logs_status', 59, 205, 'b3e562a7-1a71-4e3f-b3e0-441d0c72cee0', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_opportunities_is_deleted', 60, 206, '7300b08c-12f1-4dab-93b0-bc2b89f48e30', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_opportunities_is_deleted', 60, 207, 'e2c96b3e-e2b6-491a-a633-e9ec858bcb16', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '自主开发', '1', NULL, NULL, 'f', 'crm_opportunities_source', 61, 208, '6412ad9f-b68e-4465-a773-3796bdfb6983', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '市场活动', '2', NULL, NULL, 'f', 'crm_opportunities_source', 61, 209, '6dfc30ab-eb76-4a26-b0bd-60264fbba311', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '转介绍', '3', NULL, NULL, 'f', 'crm_opportunities_source', 61, 210, '8f0021b6-0359-49f3-97a2-9eac081f8e7a', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '网络推广', '4', NULL, NULL, 'f', 'crm_opportunities_source', 61, 211, '916cf66d-de40-455e-9f99-a575baa569b2', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '合作伙伴', '5', NULL, NULL, 'f', 'crm_opportunities_source', 61, 212, 'fddd4a43-aded-4d21-a775-7b1ede839713', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '招投标', '6', NULL, NULL, 'f', 'crm_opportunities_source', 61, 213, '171d9eaf-1cdc-4242-8369-5864f5f0ee3d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '初步接触', '1', NULL, NULL, 'f', 'crm_opportunities_stage', 62, 214, 'c8308678-9887-44f1-80c8-ce51ed5feb2c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '需求分析', '2', NULL, NULL, 'f', 'crm_opportunities_stage', 62, 215, 'f5949ccd-6754-4cd0-9f05-1b29e0448302', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '方案设计', '3', NULL, NULL, 'f', 'crm_opportunities_stage', 62, 216, 'b351bede-b76d-45f8-8e4b-a3b68296e937', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '报价谈判', '4', NULL, NULL, 'f', 'crm_opportunities_stage', 62, 217, 'd1599790-eac9-47f4-a9e7-1f410f2884b5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '赢单', '5', NULL, NULL, 'f', 'crm_opportunities_stage', 62, 218, '902f7889-2503-4faa-9149-895c3827b4fe', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '输单', '6', NULL, NULL, 'f', 'crm_opportunities_stage', 62, 219, 'c31416dd-3d0d-4dad-aba9-84c68666fbb4', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (7, '暂停', '7', NULL, NULL, 'f', 'crm_opportunities_stage', 62, 220, '1d17826f-bba2-49bc-af87-d1e6c3b09657', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_opportunity_products_is_preferred', 63, 221, 'dd3c3fab-df00-471b-901f-9b9fdb18bb53', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_opportunity_products_is_preferred', 63, 222, 'e12263b4-1a83-47b9-85c1-c0511d01d90d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_opportunity_stages_status', 64, 223, 'e2df8b44-1702-4688-8cd5-c933a2a34972', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_opportunity_stages_status', 64, 224, 'ab5491ac-ac0c-4923-a993-d0b0817d9bb7', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_opportunity_stages_status', 64, 225, '0c2a8708-316d-4504-9448-c80306961431', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_opportunity_stages_status', 64, 226, '187ce627-07d1-4b71-b2cc-45be2bb3587f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_opportunity_stages_status', 64, 227, 'b7476d1b-2825-42d9-8408-266af6eaff1f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_order_items_is_deleted', 65, 228, 'c835eed6-4b59-48f0-82cb-8dbdce8a385b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_order_items_is_deleted', 65, 229, '5d165f16-b068-4f2e-9e62-20057830504e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_orders_is_deleted', 66, 230, 'd358acc4-8fb1-41c3-bf81-a685440e437e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_orders_is_deleted', 66, 231, '586ae2fb-29b5-40dd-ae5c-6045332fc4e6', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '待确认', '1', NULL, NULL, 'f', 'crm_orders_order_status', 67, 232, '2d9f91c6-8275-4583-bf8d-ccbfd1049786', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已确认', '2', NULL, NULL, 'f', 'crm_orders_order_status', 67, 233, '2d922dea-2338-47ea-a473-1914f9540964', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '生产中', '3', NULL, NULL, 'f', 'crm_orders_order_status', 67, 234, '2837c71d-2fd1-4341-a989-5d68a2adf528', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '已发货', '4', NULL, NULL, 'f', 'crm_orders_order_status', 67, 235, '8c4c72ff-e4d6-4670-b4e3-f8518cc3c393', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '已完成', '5', NULL, NULL, 'f', 'crm_orders_order_status', 67, 236, 'd912b3ca-3a2e-48d0-83e4-f3b20bd71b21', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '已取消', '6', NULL, NULL, 'f', 'crm_orders_order_status', 67, 237, '7785246f-d828-46a8-9d3b-9087a28e11b5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未付款', '1', NULL, NULL, 'f', 'crm_orders_payment_status', 68, 238, '89970293-f9b3-4f54-b1bb-2fe8256334db', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '部分付款', '2', NULL, NULL, 'f', 'crm_orders_payment_status', 68, 239, '3efc56be-18da-42ae-bc19-0575c638f09a', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '已付款', '3', NULL, NULL, 'f', 'crm_orders_payment_status', 68, 240, '530b89bb-87c1-4dff-95f2-5ab7cca27f49', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '退款中', '4', NULL, NULL, 'f', 'crm_orders_payment_status', 68, 241, '27526cc1-6892-4c5f-99f8-c07a5095834b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '已退款', '5', NULL, NULL, 'f', 'crm_orders_payment_status', 68, 242, '578efb6d-475a-4d08-8a6a-660cfb74f834', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_payments_is_deleted', 69, 243, 'ac3e20d0-4331-4940-9649-86842d59aa0e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_payments_is_deleted', 69, 244, '06a18325-de21-43dc-b652-16753dfa6780', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未付款', '1', NULL, NULL, 'f', 'crm_payments_payment_status', 70, 245, '77abbf03-6e53-4305-a9d5-ce18185615ff', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '部分付款', '2', NULL, NULL, 'f', 'crm_payments_payment_status', 70, 246, '9f9123ee-355e-4573-ad2c-afc4b833aa9d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '已付款', '3', NULL, NULL, 'f', 'crm_payments_payment_status', 70, 247, '0cb80034-8e67-4403-aa8e-64776bf7bb7a', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '退款中', '4', NULL, NULL, 'f', 'crm_payments_payment_status', 70, 248, 'c0e5ba2b-348c-47ec-9f3b-f047c5ed9a3b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '已退款', '5', NULL, NULL, 'f', 'crm_payments_payment_status', 70, 249, '11857365-627c-492a-a71e-74057baac54d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '低', '1', NULL, NULL, 'f', 'crm_price_tiers_priority', 71, 250, 'b61476b8-7c13-4daa-813c-3c11a85e408a', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '中', '2', NULL, NULL, 'f', 'crm_price_tiers_priority', 71, 251, 'd769fa9f-6005-4960-be7c-ba5a09bb61b3', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '高', '3', NULL, NULL, 'f', 'crm_price_tiers_priority', 71, 252, '50a2569c-e7e1-40b0-9f54-bdba5105d963', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '紧急', '4', NULL, NULL, 'f', 'crm_price_tiers_priority', 71, 253, '19cc4a98-1e06-4b8a-9177-b60d18423421', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_price_tiers_status', 72, 254, '31166567-df1a-4b19-bd0d-c71d0d440bde', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_price_tiers_status', 72, 255, 'a04f5e94-122c-4082-9bd8-65c748e5fa9f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_price_tiers_status', 72, 256, '64632bd2-df73-4137-806f-c94f517dd419', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_price_tiers_status', 72, 257, 'de1c6dea-f96f-4d0c-9ce1-36c4d27e38dc', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_price_tiers_status', 72, 258, 'c7a30312-a05e-46e4-9fd9-538f497ba2e4', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_product_categories_status', 73, 259, 'abf9d64d-f0c7-4c65-b23a-2645d1452d56', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_product_categories_status', 73, 260, '714cf191-46cb-483a-9178-0202173f5505', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_product_categories_status', 73, 261, '91633242-2ffc-4070-a3fb-85962e7b06ae', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_product_categories_status', 73, 262, '57690ac1-17d9-43aa-9a7c-68e6e05760f0', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_product_categories_status', 73, 263, '65f35405-e218-478e-a771-53405ff55d7b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_product_documents_is_deleted', 74, 264, '021086cc-0a9b-4abc-8d32-6bf79a4be0a2', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_product_documents_is_deleted', 74, 265, 'f4d8b1ca-6792-4369-b217-5d29f3b408d1', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_product_documents_status', 75, 266, 'f56507bd-47e9-47b9-8d71-7e496a968dc7', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_product_documents_status', 75, 267, 'f7e47ab9-6b34-4689-942f-156061085bf9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_product_documents_status', 75, 268, '71e521a3-7746-4eda-b757-9a71485f8b69', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_product_documents_status', 75, 269, '016a63f4-7338-4a1b-97ef-592b7e3eb278', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_product_documents_status', 75, 270, '6ba6a73a-bfbb-40a0-ac65-7af9e3dd7d74', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '待审批', '1', NULL, NULL, 'f', 'crm_product_price_history_approval_status', 76, 271, 'd6fa99c1-4750-439d-9b22-c7f03a2c3bdc', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '审批中', '2', NULL, NULL, 'f', 'crm_product_price_history_approval_status', 76, 272, '23a65b3f-2893-4e69-bf1e-f12b862f6649', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '已通过', '3', NULL, NULL, 'f', 'crm_product_price_history_approval_status', 76, 273, '22dc5b23-9fa4-4517-8c7a-5b467efc022f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '已拒绝', '4', NULL, NULL, 'f', 'crm_product_price_history_approval_status', 76, 274, 'fdcc7373-7f28-447f-8be8-5b6728a0061e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '已撤销', '5', NULL, NULL, 'f', 'crm_product_price_history_approval_status', 76, 275, 'ec4be25c-56db-4267-a31e-7628e8432f5d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_product_price_policies_is_deleted', 77, 276, 'bc40f744-ed6e-4e73-b5b5-28883e9e457c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_product_price_policies_is_deleted', 77, 277, '42b13ce1-748c-4487-9972-03c69d427ca6', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '低', '1', NULL, NULL, 'f', 'crm_product_price_policies_priority', 78, 278, 'e4897f12-622c-40e3-a1af-a9c092a8f75f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '中', '2', NULL, NULL, 'f', 'crm_product_price_policies_priority', 78, 279, '42bb014a-5e55-444c-be99-0b55ae50bae8', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '高', '3', NULL, NULL, 'f', 'crm_product_price_policies_priority', 78, 280, '649f4d8e-2dee-41b0-b154-591334d7177c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '紧急', '4', NULL, NULL, 'f', 'crm_product_price_policies_priority', 78, 281, 'f72cca09-5fd4-422a-8e0b-d13e5eb0bc7d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_product_price_policies_status', 79, 282, '562451ab-2614-4105-ba4a-97937264467b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_product_price_policies_status', 79, 283, 'd44d423d-be41-4443-8170-fcecabfc62fa', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_product_price_policies_status', 79, 284, '406d30b6-85b6-4734-8103-872bb6638cd2', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_product_price_policies_status', 79, 285, '4c0a5437-c1a0-4767-ae85-037a11232dd7', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_product_price_policies_status', 79, 286, '29b02fb6-eb02-4b84-b8dc-9799a2da0372', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '待审批', '1', NULL, NULL, 'f', 'crm_product_prices_approval_status', 80, 287, '30e00d9a-d2bd-4ff4-a37f-dd657dc68c79', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '审批中', '2', NULL, NULL, 'f', 'crm_product_prices_approval_status', 80, 288, 'a9a1115c-7046-4ddb-a04e-6ff0dca4f01e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '已通过', '3', NULL, NULL, 'f', 'crm_product_prices_approval_status', 80, 289, '4beb223b-8587-4bc4-a49e-6dcbb34130d1', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '已拒绝', '4', NULL, NULL, 'f', 'crm_product_prices_approval_status', 80, 290, 'b5c22836-919e-4bb0-a854-9bb6ee919f62', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '已撤销', '5', NULL, NULL, 'f', 'crm_product_prices_approval_status', 80, 291, '02440559-173f-4f82-afc2-7013c4217822', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_product_prices_is_active', 81, 292, '1d5c0ea2-9fd3-4157-9dec-58919098d1eb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_product_prices_is_active', 81, 293, 'd76281e2-9e31-4c5f-ab17-65634e466b98', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_product_skus_is_default', 82, 294, '9eb1b60e-e27b-4661-bef2-36ebc5033c9b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_product_skus_is_default', 82, 295, 'd6c1bddb-e3ad-437c-bb16-f1aeb161977b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_product_skus_is_deleted', 83, 296, '27615289-cb94-4b36-b492-2dafcbafe258', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_product_skus_is_deleted', 83, 297, '639cba86-7292-4538-91d3-ab84ae90999b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_product_skus_status', 84, 298, 'd567aa9d-29c5-40f2-8108-0b27730ccba7', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_product_skus_status', 84, 299, '0db4872b-eab4-4528-9745-a849d7ac1fdd', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_product_skus_status', 84, 300, '0c53ecef-4b6d-4089-9d35-af3bf1ee1989', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_product_skus_status', 84, 301, '269aa986-ce99-4c13-a5b6-aeb57f9532ca', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_product_skus_status', 84, 302, '6c258ac6-730a-4c01-abfc-448435f70236', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_products_is_deleted', 85, 303, 'f982c18b-ee00-4749-8d0d-880920108905', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_products_is_deleted', 85, 304, '7506b474-148e-474d-b4cd-a9a3c1e1be0d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '硬件', '1', NULL, NULL, 'f', 'crm_products_product_type', 86, 305, '546c5c3d-707f-47d9-9d0d-ef6f182a2e87', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '软件', '2', NULL, NULL, 'f', 'crm_products_product_type', 86, 306, '3e4d421b-8d67-4b2d-b609-92565342d80c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '服务', '3', NULL, NULL, 'f', 'crm_products_product_type', 86, 307, 'a6444605-8489-4034-bf39-3694fe1f8d5d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_products_status', 87, 308, '04096e96-cc65-4f5a-bc83-0d2a3e546733', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_products_status', 87, 309, 'd871bff5-b9ef-4d41-8422-3a9b896a2bc4', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_products_status', 87, 310, '0843ff94-6428-4352-a07f-6bd2b9efd0e9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_products_status', 87, 311, '48a6690e-98cc-442e-b031-162140b80c72', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_products_status', 87, 312, 'df9a740c-c6f7-4c89-8231-8678449b151f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '待审批', '1', NULL, NULL, 'f', 'crm_quotations_approval_status', 88, 313, 'f217c36a-c5e9-4914-811b-9a4a2d897ac0', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '审批中', '2', NULL, NULL, 'f', 'crm_quotations_approval_status', 88, 314, '7bfa029f-284b-4559-b9e5-be46e1238f7e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '已通过', '3', NULL, NULL, 'f', 'crm_quotations_approval_status', 88, 315, 'a2db1064-7e50-48e8-a428-9cb26745eceb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '已拒绝', '4', NULL, NULL, 'f', 'crm_quotations_approval_status', 88, 316, '2eab45b6-94b0-4625-8415-1efb19a2107e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '已撤销', '5', NULL, NULL, 'f', 'crm_quotations_approval_status', 88, 317, 'e4879b70-da0e-4a30-b569-f88f4bcdcae7', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_quotations_is_deleted', 89, 318, '51bf526d-656a-459c-935b-50386dc45174', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_quotations_is_deleted', 89, 319, '987a7d9d-52cb-4e93-8a1c-793ff4fcf89c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_quotations_status', 90, 320, 'a5cb7b12-5577-4f33-9c63-e18c403ed90e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_quotations_status', 90, 321, '38ec27d0-0a18-4a14-b1c5-d982b02907a9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_quotations_status', 90, 322, '896b9dcb-c3f5-49ea-9334-41e0b70608fa', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_quotations_status', 90, 323, 'dca45e74-b275-4e19-9280-1d4a5b4963b7', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_quotations_status', 90, 324, '18bbf7af-b056-4d4b-8394-6721b8251d56', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_renewals_is_deleted', 91, 325, '829b7c8f-baac-4fdd-8baa-f9c7aa33464c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_renewals_is_deleted', 91, 326, 'cea28a80-0ffb-4351-941b-beebfd673e28', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '待续约', '1', NULL, NULL, 'f', 'crm_renewals_status', 92, 327, 'e4b6454c-f664-4772-aed6-f95034c3aa30', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '续约中', '2', NULL, NULL, 'f', 'crm_renewals_status', 92, 328, 'ad3298fd-0885-491f-8a03-a1fada01c08c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '已续约', '3', NULL, NULL, 'f', 'crm_renewals_status', 92, 329, '88b5fe37-ba18-4606-9de0-f9fb6f58858b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '已流失', '4', NULL, NULL, 'f', 'crm_renewals_status', 92, 330, '122251bc-74e4-4cb0-abb8-b27dd1bed4d7', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '已取消', '5', NULL, NULL, 'f', 'crm_renewals_status', 92, 331, '8e3a30d9-e0da-49d1-b000-ab05a8ca9fb3', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_report_instances_status', 93, 332, 'fd29c37f-364e-40a5-b4e2-e8d96ea42536', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_report_instances_status', 93, 333, '07088c42-4c32-4b5a-9b3d-d8c1f953c369', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_report_instances_status', 93, 334, 'ecb584ad-e7d7-4cb0-9583-311d2d888696', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_report_instances_status', 93, 335, '3137ac23-6463-46dc-90eb-20bc4e1cbe63', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_report_instances_status', 93, 336, '8c2db8a5-14d5-4bec-bbcd-2713926449c5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_report_templates_status', 94, 337, '55c2768e-e788-443b-a8b6-89d62dd6db22', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_report_templates_status', 94, 338, 'aede40c8-130a-4fa7-bbf3-f781ae029db4', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_report_templates_status', 94, 339, 'cf96644a-56ef-4952-b674-b24dc5273780', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_report_templates_status', 94, 340, '9b163f85-7db6-43a5-ba2d-e43ceb54cc97', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_report_templates_status', 94, 341, 'ada83079-9852-4a8a-9f5d-fc7259a88940', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '电话', '1', NULL, NULL, 'f', 'crm_sales_activities_activity_type', 95, 342, '78a7c8bf-3e02-478b-9ee9-c20119ba0299', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '邮件', '2', NULL, NULL, 'f', 'crm_sales_activities_activity_type', 95, 343, '2f3e08ac-a231-42e6-a621-5ba171be85ea', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '拜访', '3', NULL, NULL, 'f', 'crm_sales_activities_activity_type', 95, 344, 'bd77cb42-733b-47bf-bf96-2ae336abe1e1', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '会议', '4', NULL, NULL, 'f', 'crm_sales_activities_activity_type', 95, 345, 'd91ecf0a-2062-4cc3-b9d0-d4d832e784ce', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '培训', '5', NULL, NULL, 'f', 'crm_sales_activities_activity_type', 95, 346, '3acd7e91-3046-4aef-b74a-05cf6e95f837', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '展会', '6', NULL, NULL, 'f', 'crm_sales_activities_activity_type', 95, 347, '66e0d3cd-e6fb-4a25-b5b8-23bc324715af', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_sales_activities_is_deleted', 96, 348, '0ab03a3c-7eec-409a-8c5e-74ea0b8ef55e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_sales_activities_is_deleted', 96, 349, '6fc2c5b4-beb0-4247-bf31-37c74fbdb894', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_satisfaction_surveys_is_deleted', 97, 350, '8df9bd9e-7197-4eab-b62e-8cf91b33b21c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_satisfaction_surveys_is_deleted', 97, 351, '56c43990-3429-4120-82e8-613ab35a8d9e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_satisfaction_surveys_status', 98, 352, 'c64a72ab-1862-41c5-9a78-f005cf2cfe16', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_satisfaction_surveys_status', 98, 353, '7ac7041e-03a8-4329-968c-c1fa17a89218', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_satisfaction_surveys_status', 98, 354, '522f85df-1571-4d9e-8309-7ed8e479af3d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_satisfaction_surveys_status', 98, 355, '83341869-f957-4e41-b176-e981163b024d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_satisfaction_surveys_status', 98, 356, '8bf86a64-628c-4317-8f47-128c983c3278', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_tag_definitions_status', 99, 357, 'f1feb803-c04c-41d3-ab85-af22adc52932', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_tag_definitions_status', 99, 358, '930ceeae-a2ad-4330-811d-86a20a3c7644', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_tag_definitions_status', 99, 359, '5a9c9f9e-4126-4c85-b569-5d4083e460eb', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_tag_definitions_status', 99, 360, '81b06957-59af-44da-85a8-8726137e6acd', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_tag_definitions_status', 99, 361, 'beb8bb48-045a-4ced-ad1b-0f586a636e9b', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_tags_status', 100, 362, '32a9a017-e313-49be-a81b-e0ae170ccc9f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_tags_status', 100, 363, 'fa8a035f-3ab6-4547-8289-1aa05863f06c', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_tags_status', 100, 364, '9a0a448b-f6ff-478a-ad2c-e821254b7ed9', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_tags_status', 100, 365, '98805bf3-d7eb-4bb4-9c31-3b12d75d713e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_tags_status', 100, 366, '02638fd2-8cff-49cd-8dfd-eded4047ce88', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '未删除', '0', NULL, NULL, 'f', 'crm_tasks_is_deleted', 101, 367, '1a2b6974-811a-4b3c-990c-98a1448df416', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '已删除', '1', NULL, NULL, 'f', 'crm_tasks_is_deleted', 101, 368, 'e9decf70-07c9-47fc-aa45-d4893b542513', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '低', '1', NULL, NULL, 'f', 'crm_tasks_priority', 102, 369, '9af33dce-ed85-4989-a149-fc4f7bc8f7db', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '中', '2', NULL, NULL, 'f', 'crm_tasks_priority', 102, 370, '1057a42d-cf53-4a16-a08e-35e971e01eb2', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '高', '3', NULL, NULL, 'f', 'crm_tasks_priority', 102, 371, 'f6a2f1a2-09a5-41d0-bd19-a5786bde1dc8', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '紧急', '4', NULL, NULL, 'f', 'crm_tasks_priority', 102, 372, '4e5d3646-c2e8-4e50-9be6-8732c5fb0ed3', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_tasks_status', 103, 373, '342facb6-d5fb-4eec-8866-b74876192ae5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_tasks_status', 103, 374, '5c51e239-50e3-4e21-bd8b-62c527216814', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_tasks_status', 103, 375, '838bc07d-ca39-4690-9313-7912023f7b16', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_tasks_status', 103, 376, '4147f1de-9d8d-4613-8da7-0830e6c187aa', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_tasks_status', 103, 377, '5c63af4d-0928-452b-96f0-68a7abc919a5', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_user_extensions_auto_assign_enabled', 104, 378, 'add457af-4803-4130-979f-58ab351f5a9d', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_user_extensions_auto_assign_enabled', 104, 379, '2d632e95-5a12-46ed-85d4-03cb48605109', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '潜在', '1', NULL, NULL, 'f', 'crm_workflow_approvals_status', 105, 380, '6c0a8d10-6122-4fd3-b562-d7055ecce2a3', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '意向', '2', NULL, NULL, 'f', 'crm_workflow_approvals_status', 105, 381, 'f4871907-f861-401d-b7a2-0623702eb0c1', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '正式', '3', NULL, NULL, 'f', 'crm_workflow_approvals_status', 105, 382, '8cffe723-e56f-4a91-b3a5-9afae91c5247', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '休眠', '4', NULL, NULL, 'f', 'crm_workflow_approvals_status', 105, 383, '1e6e479a-e96c-47d5-a9a9-3c7c01f29204', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '流失', '5', NULL, NULL, 'f', 'crm_workflow_approvals_status', 105, 384, '325db284-9173-4497-bec8-128b2efea64f', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '否', '0', NULL, NULL, 'f', 'crm_workflow_rules_enabled', 106, 385, '1864114d-7181-415c-ad1e-1bb4f6d5b0d8', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '是', '1', NULL, NULL, 'f', 'crm_workflow_rules_enabled', 106, 386, '759a0ed2-d6d5-4ae7-987a-9aadceb162b0', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '低', '1', NULL, NULL, 'f', 'crm_workflow_rules_priority', 107, 387, '5b246dd2-ce55-4f95-bdfa-24c727e8e2ca', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '中', '2', NULL, NULL, 'f', 'crm_workflow_rules_priority', 107, 388, '4787c21f-76b8-4e31-9a39-707155168417', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '高', '3', NULL, NULL, 'f', 'crm_workflow_rules_priority', 107, 389, '53de9fe3-916c-4178-8a55-f69dc680d3e2', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '紧急', '4', NULL, NULL, 'f', 'crm_workflow_rules_priority', 107, 390, '82ed8774-e872-49da-924c-f5e62745430e', '0', NULL, '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_type";
CREATE TABLE "public"."sys_dict_type" (
  "dict_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" int4 NOT NULL DEFAULT nextval('sys_dict_type_id_seq'::regclass),
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_dict_type"."dict_name" IS '字典名称';
COMMENT ON COLUMN "public"."sys_dict_type"."dict_type" IS '字典类型';
COMMENT ON COLUMN "public"."sys_dict_type"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_dict_type"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_dict_type"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_dict_type"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_dict_type"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_type"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict_type"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_dict_type"."deleted_time" IS '删除时间';
COMMENT ON TABLE "public"."sys_dict_type" IS '字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO "public"."sys_dict_type" VALUES ('用户性别', 'sys_user_sex', 1, '31ad65ad-1fef-49f1-b5c3-d38e39f00c29', '0', '用户性别列表', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('系统是否', 'sys_yes_no', 2, '1d69b91f-52ae-4753-b480-93653ac7232c', '0', '系统是否列表', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('系统状态', 'sys_common_status', 3, '1453a766-6ed1-4685-bea8-a02847b69006', '0', '系统状态', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('通知类型', 'sys_notice_type', 4, 'c0857ae4-1b88-4f50-9e22-dbb07c18c3f9', '0', '通知类型列表', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('操作类型', 'sys_oper_type', 5, 'c7b779fb-3cad-4cf9-8678-4ee4f4ba1bd4', '0', '操作类型列表', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('任务存储器', 'sys_job_store', 6, '08e7a07c-5a4c-4829-9bdd-7c2eaaace9e9', '0', '任务分组列表', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('任务执行器', 'sys_job_executor', 7, '9193dd32-66b4-4d93-b90a-3fd228a6f2d8', '0', '任务执行器列表', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('任务函数', 'sys_job_function', 8, 'a7035860-b011-4268-a4a6-c90e5126e100', '0', '任务函数列表', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('任务触发器', 'sys_job_trigger', 9, '0ee716f2-4625-46da-8882-299edca16a05', '0', '任务触发器列表', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('表格回显样式', 'sys_list_class', 10, '2cadb42d-10e5-4590-90f2-28871a27c757', '0', '表格回显样式列表', '2026-04-26 13:46:59.159741', '2026-04-26 13:46:59.159741', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_ai_tags_status', 11, '75dccd5e-e0ce-458c-bb48-1cc2ffbf71fa', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否已转化', 'crm_campaign_leads_is_converted', 12, '6acd0206-61d0-4a28-ba75-798d2bc4d378', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_campaigns_status', 13, 'f9af488f-15fa-45df-bbb0-2c92c41f94c0', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_contact_relations_is_deleted', 14, '1881eea5-d1a4-45b0-b954-031bbe88785d', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_contact_relations_status', 15, '84aba0ac-3d6b-4885-8aae-971a6369454b', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_contact_visits_is_deleted', 16, '588e851e-3af2-4964-8b3a-ca1a1a77053f', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('拜访类型', 'crm_contact_visits_visit_type', 17, '3e0c445d-2587-4e2d-a4ed-13343da87b15', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('性别', 'crm_contacts_gender', 18, '232dea10-037c-461d-a7a4-84da4ed21544', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_contacts_is_deleted', 19, '399e8414-7fc0-4c8e-af68-abbadaf52083', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否主要联系人', 'crm_contacts_is_primary', 20, '11a971fc-40e3-467b-8209-695531a29ea5', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('发票状态', 'crm_contract_invoices_invoice_status', 21, '2b8137bb-b92e-4319-80a6-d66bc4538b36', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('发票类型', 'crm_contract_invoices_invoice_type', 22, '52e5e2c3-a6ab-480b-8138-c65e79bcd1dc', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_contract_invoices_is_deleted', 23, '597c16ff-9e1a-491b-a7db-a53e1e1533be', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('审批状态', 'crm_contracts_approval_status', 24, 'c5e82819-0346-4db4-a72f-7fe0e8ecb762', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('合同类型', 'crm_contracts_contract_type', 25, '9b5a2ccf-7426-4547-983b-5fd1d361a471', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_contracts_is_deleted', 26, 'bacde2cd-ec8f-4091-b257-cf243ec7be50', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_contracts_status', 27, 'b8e321c9-f225-4c08-8552-c82804f1e104', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('活动类型', 'crm_customer_activities_activity_type', 28, '00e25b23-1d88-4c86-abe7-7587fd76ead1', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否启用', 'crm_customer_addresses_is_active', 29, 'b2548d59-b496-4ac5-ba21-eaf43c077ebd', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否默认', 'crm_customer_addresses_is_default', 30, 'e4e99561-add3-41d4-9ceb-d004dee0bef2', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_customer_addresses_is_deleted', 31, '5652c3b4-711f-42fa-ae3c-baffcc728a70', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_customer_attachments_is_deleted', 32, 'e461c2a1-e5a1-4524-9516-8396c786f20f', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_customer_tags_is_deleted', 33, '60560243-4bbd-4621-a06b-86f5b208de23', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('客户类型', 'crm_customers_customer_type', 34, '2204dea7-d56e-43af-994d-97ccb7c48b34', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('公海池状态', 'crm_customers_pool_status', 35, 'a34b5a3d-e4d6-4a10-a097-8d20f8c61e25', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('客户评分', 'crm_customers_rating', 36, '02273df8-1eb0-423a-91c6-17df6bea209f', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('来源', 'crm_customers_source', 37, '007c609b-aeef-4ef1-989e-0c486f50bf8b', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_customers_status', 38, 'f062314b-6642-4333-9597-caf9e34dc7b5', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否默认', 'crm_data_dicts_is_default', 39, '1633a892-3727-4fa0-8e63-c332be78579b', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_data_dicts_is_deleted', 40, '0856391a-486d-4c3d-b0a8-ba5c4db5efd7', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否叶子节点', 'crm_data_dicts_is_leaf', 41, '60f2d984-1103-4a70-b916-74c23d206811', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('跟进方式', 'crm_follow_records_follow_type', 42, 'e947b308-c662-4e2e-83f9-d7e6fd32e393', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_followups_is_deleted', 43, '4a029d9b-ac01-406e-9294-c6e6ef1579b6', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_import_records_status', 44, '65aa1ba5-f3eb-4e26-ab16-69dffae8f26e', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('发票类型', 'crm_invoices_invoice_type', 45, '38bd61e7-0f0a-41c2-8eb2-c2c6bd0e8ec1', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_invoices_status', 46, '2740a7a6-041c-40b8-897f-6fb1adbe3ab9', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否可编辑', 'crm_joint_followups_can_edit', 47, '1892e6e0-94e5-452a-8eca-4f943fc6e731', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否可查看敏感信息', 'crm_joint_followups_can_view_sensitive', 48, '5a929c84-f169-44f6-86c2-02005f748cd4', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_joint_followups_status', 49, '41532d83-4c5d-4a28-839e-953045d1cc76', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_leads_is_deleted', 50, '97d06409-11b0-4a5a-afa4-66c5c6f074aa', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('来源', 'crm_leads_source', 51, '413d9a7a-316a-4ebb-a829-e2cc053585b3', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_leads_status', 52, '6c72b3bd-ad4f-4454-850a-43eb96e696c2', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_marketing_campaigns_is_deleted', 53, '53f1e4a0-89e4-4d6c-b54a-cf2a235072ef', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_marketing_campaigns_status', 54, '34eaf72e-c451-4d8d-b997-76e300ad3290', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_marketing_channels_status', 55, '4b90b00f-a35e-4176-b612-2ed5ec844cdd', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否已读', 'crm_notifications_is_read', 56, '5d4d69a7-f4c3-4cea-b6ef-23ab6e3bbbf3', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('通知类型', 'crm_notifications_notification_type', 57, 'aed4b8d4-5d4a-4c46-98d7-61eade30836f', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('优先级', 'crm_notifications_priority', 58, '5f81d5df-4fee-4b8c-a812-8267c56c8bbe', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_operation_logs_status', 59, '1e1e67ba-3ff6-4ec1-8ec8-5f6a85105bf4', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_opportunities_is_deleted', 60, '044b64c6-1eca-41ef-a28c-0264e496efae', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('来源', 'crm_opportunities_source', 61, 'd09d9878-42a6-4c33-a0bd-fd8002cd7026', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('阶段', 'crm_opportunities_stage', 62, '8f635920-451b-44ee-8745-8a3d3f29a8a6', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否首选', 'crm_opportunity_products_is_preferred', 63, '1194c24c-52d3-476b-9020-f0ba60d538fd', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_opportunity_stages_status', 64, 'ad85aa87-1b2c-4ab3-8b44-76d3d78807ae', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_order_items_is_deleted', 65, '9fa7838f-230d-48f1-9832-2ec0700ab1ea', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_orders_is_deleted', 66, '6400d623-5233-4dda-acf7-d18408068973', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('订单状态', 'crm_orders_order_status', 67, '2ba2ad99-cc56-4501-b45c-609b2ea110f4', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('付款状态', 'crm_orders_payment_status', 68, '1507d22e-e720-485d-b96a-9eb5ab4ee171', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_payments_is_deleted', 69, '15f512ff-f26f-4e6f-a920-bb265cd7437a', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('付款状态', 'crm_payments_payment_status', 70, 'ba46f087-e7b5-4a8c-bdae-0d7f84d861b6', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('优先级', 'crm_price_tiers_priority', 71, '5f001420-19d5-4384-84d9-4f3d9cbfd6fa', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_price_tiers_status', 72, 'eda8cc01-0d22-4219-a78c-5525d09ccd9d', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_product_categories_status', 73, 'e9852ee2-a608-473a-897e-a4120f45ff33', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_product_documents_is_deleted', 74, '385e7d7d-d98d-4990-b907-4fecc85175c0', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_product_documents_status', 75, 'a82333ab-1cc7-402a-8ca5-0d6ff64d1da2', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('审批状态', 'crm_product_price_history_approval_status', 76, '6d529ad7-b26f-455f-978a-49363b714434', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_product_price_policies_is_deleted', 77, '8ccc9df5-f1ca-42dd-8fe5-e5866770ce0e', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('优先级', 'crm_product_price_policies_priority', 78, '6c8e8f73-cfd2-4567-b349-a87ff3c0c47a', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_product_price_policies_status', 79, 'ab51cec1-e6c3-4357-a7af-514cc7e36c5e', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('审批状态', 'crm_product_prices_approval_status', 80, '8ff24cca-b934-4eb1-9ca6-4ad55b6e1541', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否启用', 'crm_product_prices_is_active', 81, 'c8f12b83-b6d6-4cc4-98df-a35c60699188', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否默认', 'crm_product_skus_is_default', 82, '529be736-0f0b-4b70-9a00-1a5e3b7710bc', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_product_skus_is_deleted', 83, '4de972af-9f1c-4c60-98c3-9e2b0da43c3d', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_product_skus_status', 84, '0e277182-80ab-4b4e-88d5-f583475f9b04', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_products_is_deleted', 85, '60ffbdc5-8467-4d50-836f-a9ba527c8876', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('产品类型', 'crm_products_product_type', 86, '959acb8c-9e5c-477a-b189-99be226e1f67', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_products_status', 87, '93a0f4d0-2908-470d-9a29-d1bc007f91cf', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('审批状态', 'crm_quotations_approval_status', 88, 'edc7bfd6-532d-474b-82ee-9b0beaa15ed7', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_quotations_is_deleted', 89, 'd9e64596-ee1b-4055-aef9-6cd4d36475b0', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_quotations_status', 90, 'd5315b21-6e13-465e-bf48-b88800f945cd', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_renewals_is_deleted', 91, 'eed50f7d-dd41-4df4-ad31-028aa954ec87', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_renewals_status', 92, '606684fd-818d-4e96-abeb-a4de2df9ca20', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_report_instances_status', 93, 'dd57aa86-fdfb-484f-8680-c552c7ae75e3', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_report_templates_status', 94, '067baf00-7e87-4ec9-9cd3-c200dfd59bdf', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('活动类型', 'crm_sales_activities_activity_type', 95, '8110b743-a5bc-4fa7-81dc-631f2e6447e5', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_sales_activities_is_deleted', 96, 'a10e6aba-7328-461a-a085-94cba95d6610', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_satisfaction_surveys_is_deleted', 97, 'a76c6088-8d63-469b-be73-a32fda1b0d47', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_satisfaction_surveys_status', 98, '446ec68d-0e4f-41c8-b174-1b1c3a5a3143', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_tag_definitions_status', 99, '8f86f714-f38b-4c43-9b58-9a0db50972d8', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_tags_status', 100, '6ccbd987-b7b0-415f-9c28-6eb7b6eac081', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('逻辑删除标记', 'crm_tasks_is_deleted', 101, 'dcb33760-8c6f-4288-912f-1638353cac12', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('优先级', 'crm_tasks_priority', 102, '9aa0a06e-0e0c-4d22-8cb5-60ef725db95c', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_tasks_status', 103, '38f0a535-c0fc-4f1b-850f-2fced4fa61e2', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('自动分配启用', 'crm_user_extensions_auto_assign_enabled', 104, 'bf2b03a3-3dbc-4171-8f7b-1738fff5533d', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('状态', 'crm_workflow_approvals_status', 105, 'fbfd6225-4e03-461c-aa10-40d8f26896a1', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('是否启用', 'crm_workflow_rules_enabled', 106, 'e1ba2f15-48a1-42d5-a64e-9246632d0b68', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('优先级', 'crm_workflow_rules_priority', 107, 'b0ded14f-e237-4fae-a111-c4af0180fdcc', '0', 'CRM枚举字典', '2026-04-28 19:56:15.061253', '2026-04-28 19:56:15.061253', 'f', NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log";
CREATE TABLE "public"."sys_log" (
  "type" int4 NOT NULL,
  "request_path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "request_method" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "request_payload" text COLLATE "pg_catalog"."default",
  "request_ip" varchar(50) COLLATE "pg_catalog"."default",
  "login_location" varchar(255) COLLATE "pg_catalog"."default",
  "request_os" varchar(64) COLLATE "pg_catalog"."default",
  "request_browser" varchar(64) COLLATE "pg_catalog"."default",
  "response_code" int4 NOT NULL,
  "response_json" text COLLATE "pg_catalog"."default",
  "process_time" varchar(20) COLLATE "pg_catalog"."default",
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."sys_log"."type" IS '日志类型(1登录日志 2操作日志)';
COMMENT ON COLUMN "public"."sys_log"."request_path" IS '请求路径';
COMMENT ON COLUMN "public"."sys_log"."request_method" IS '请求方式';
COMMENT ON COLUMN "public"."sys_log"."request_payload" IS '请求体';
COMMENT ON COLUMN "public"."sys_log"."request_ip" IS '请求IP地址';
COMMENT ON COLUMN "public"."sys_log"."login_location" IS '登录位置';
COMMENT ON COLUMN "public"."sys_log"."request_os" IS '操作系统';
COMMENT ON COLUMN "public"."sys_log"."request_browser" IS '浏览器';
COMMENT ON COLUMN "public"."sys_log"."response_code" IS '响应状态码';
COMMENT ON COLUMN "public"."sys_log"."response_json" IS '响应体';
COMMENT ON COLUMN "public"."sys_log"."process_time" IS '处理时间';
COMMENT ON COLUMN "public"."sys_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_log"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_log"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_log"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_log"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_log"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_log"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_log"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."sys_log"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_log"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."sys_log"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."sys_log" IS '系统日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO "public"."sys_log" VALUES (1, '/api/v1/system/auth/login', 'POST', 'username: admin
password: 123456
captcha: 56
captcha_key: f1f7838011434833892e6f3b629fe341
remember: true
login_type: PC端', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"登录成功","data":{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCJcdThkODVcdTdlYTdcdTdiYTFcdTc0MDZcdTU0NThcIixcInNlc3Npb25faWRcIjpcIjAwZGRkYjc4LTliOTYtNDBlNC05MTYyLTFjZTg1NzY5MGQ4OFwiLFwidXNlcl9pZFwiOjEsXCJ1c2VyX25hbWVcIjpcImFkbWluXCIsXCJpcGFkZHJcIjpcIjEyNy4wLjAuMVwiLFwibG9naW5fbG9jYXRpb25cIjpcIlx1NTE4NVx1N2Y1MUlQXCIsXCJvc1wiOlwiV2luZG93c1wiLFwiYnJvd3NlclwiOlwiQ2hyb21lXCIsXCJsb2dpbl90aW1lXCI6XCIyMDI2LTA0LTI2IDA1OjQ3OjIwXCIsXCJsb2dpbl90eXBlXCI6XCJQQ1x1N2FlZlwifSIsImlzX3JlZnJlc2giOmZhbHNlLCJleHAiOjE3NzcyMTMwNDB9.VgxaGqyG2s601HZNxmwNhnJJkF-LSdKkVMTIle72mPk","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCJcdThkODVcdTdlYTdcdTdiYTFcdTc0MDZcdTU0NThcIixcInNlc3Npb25faWRcIjpcIjAwZGRkYjc4LTliOTYtNDBlNC05MTYyLTFjZTg1NzY5MGQ4OFwiLFwidXNlcl9pZFwiOjEsXCJ1c2VyX25hbWVcIjpcImFkbWluXCIsXCJpcGFkZHJcIjpcIjEyNy4wLjAuMVwiLFwibG9naW5fbG9jYXRpb25cIjpcIlx1NTE4NVx1N2Y1MUlQXCIsXCJvc1wiOlwiV2luZG93c1wiLFwiYnJvd3NlclwiOlwiQ2hyb21lXCIsXCJsb2dpbl90aW1lXCI6XCIyMDI2LTA0LTI2IDA1OjQ3OjIwXCIsXCJsb2dpbl90eXBlXCI6XCJQQ1x1N2FlZlwifSIsImlzX3JlZnJlc2giOnRydWUsImV4cCI6MTc3NzIxMzA0MH0.mzqfecGokwj_nuZORJMcGl9e3AGK2_FnIGRmcbqoqpg","token_type":"bearer","expires_in":1800},"status_code":200,"success":true}', '0.48s', 1, '6fac4ba5-1b41-4160-9d65-791be4da1c23', '0', '登录', '2026-04-26 13:47:20.684273', '2026-04-26 13:47:20.684273', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/system/param/upload', 'POST', 'file: UploadFile(filename=''logo.png'', size=53402, headers=Headers({''content-disposition'': ''form-data; name="file"; filename="logo.png"'', ''content-type'': ''image/png''}))
type: sys_web_logo', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"上传文件成功","data":{"file_path":"static\\upload\\2026\\04\\26\\logo_20260426134735A387.png","file_name":"logo_20260426134735A387.png","origin_name":"logo.png","file_url":"http://127.0.0.1:8001/api/v1/static\\upload\\2026\\04\\26\\logo_20260426134735A387.png"},"status_code":200,"success":true}', '0.05s', 2, 'c23f509a-12c8-42a4-8fb5-612c155958e5', '0', '上传文件', '2026-04-26 13:47:35.693184', '2026-04-26 13:47:35.693184', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/system/param/upload', 'POST', 'file: UploadFile(filename=''logo.png'', size=53402, headers=Headers({''content-disposition'': ''form-data; name="file"; filename="logo.png"'', ''content-type'': ''image/png''}))
type: sys_web_favicon', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"上传文件成功","data":{"file_path":"static\\upload\\2026\\04\\26\\logo_20260426134737A693.png","file_name":"logo_20260426134737A693.png","origin_name":"logo.png","file_url":"http://127.0.0.1:8001/api/v1/static\\upload\\2026\\04\\26\\logo_20260426134737A693.png"},"status_code":200,"success":true}', '0.04s', 3, '5df2e8ad-8def-4505-a959-543f4039479f', '0', '上传文件', '2026-04-26 13:47:37.534279', '2026-04-26 13:47:37.534279', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/system/param/update/3', 'PUT', '{"body": {"id": 3, "uuid": "bd5148ef-1df9-486c-a9e6-c7d15e9cd424", "status": "0", "description": "初始化数据", "created_time": "2026-04-26 13:46:59", "updated_time": "2026-04-26 13:46:59", "is_deleted": false, "deleted_time": null, "config_name": "网页图标", "config_key": "sys_web_favicon", "config_value": "http://127.0.0.1:8001/api/v1/static\\upload\\2026\\04\\26\\logo_20260426134737A693.png", "config_type": true, "maxFileSize": 5}, "path_params": {"id": "3"}}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"更新参数成功","data":{"id":3,"uuid":"bd5148ef-1df9-486c-a9e6-c7d15e9cd424","status":"0","description":"初始化数据","created_time":"2026-04-26 13:46:59","updated_time":"2026-04-26 13:47:51","is_deleted":false,"deleted_time":null,"config_name":"网页图标","config_key":"sys_web_favicon","config_value":"http://127.0.0.1:8001/api/v1/static\\upload\\2026\\04\\26\\logo_20260426134737A693.png","config_type":true},"status_code":200,"success":true}', '0.11s', 4, '7c135f27-5829-4773-a48f-cd026a825ad2', '0', '修改参数', '2026-04-26 13:47:51.775348', '2026-04-26 13:47:51.775348', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/system/param/update/4', 'PUT', '{"body": {"id": 4, "uuid": "052ae548-fd29-433d-a6cc-3e575dff2dbd", "status": "0", "description": "初始化数据", "created_time": "2026-04-26 13:46:59", "updated_time": "2026-04-26 13:46:59", "is_deleted": false, "deleted_time": null, "config_name": "网站Logo", "config_key": "sys_web_logo", "config_value": "http://127.0.0.1:8001/api/v1/static\\upload\\2026\\04\\26\\logo_20260426134735A387.png", "config_type": true, "maxFileSize": 5}, "path_params": {"id": "4"}}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"更新参数成功","data":{"id":4,"uuid":"052ae548-fd29-433d-a6cc-3e575dff2dbd","status":"0","description":"初始化数据","created_time":"2026-04-26 13:46:59","updated_time":"2026-04-26 13:47:51","is_deleted":false,"deleted_time":null,"config_name":"网站Logo","config_key":"sys_web_logo","config_value":"http://127.0.0.1:8001/api/v1/static\\upload\\2026\\04\\26\\logo_20260426134735A387.png","config_type":true},"status_code":200,"success":true}', '0.12s', 5, '5c8621d6-584c-4e6b-a5d6-03fb3319f600', '0', '修改参数', '2026-04-26 13:47:51.776569', '2026-04-26 13:47:51.776569', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/system/param/update/1', 'PUT', '{"body": {"id": 1, "uuid": "3468bae8-f2fb-4a7b-9c22-c92374741c0b", "status": "0", "description": "初始化数据", "created_time": "2026-04-26 13:46:59", "updated_time": "2026-04-26 13:46:59", "is_deleted": false, "deleted_time": null, "config_name": "网站名称", "config_key": "sys_web_title", "config_value": "CRM客户管理", "config_type": true}, "path_params": {"id": "1"}}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"更新参数成功","data":{"id":1,"uuid":"3468bae8-f2fb-4a7b-9c22-c92374741c0b","status":"0","description":"初始化数据","created_time":"2026-04-26 13:46:59","updated_time":"2026-04-26 13:47:51","is_deleted":false,"deleted_time":null,"config_name":"网站名称","config_key":"sys_web_title","config_value":"CRM客户管理","config_type":true},"status_code":200,"success":true}', '0.20s', 6, '53957ba5-64a8-4197-ae3d-d24ae671875d', '0', '修改参数', '2026-04-26 13:47:51.868408', '2026-04-26 13:47:51.868408', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/system/user/current/avatar/upload', 'POST', 'file: UploadFile(filename=''logo.png'', size=53402, headers=Headers({''content-disposition'': ''form-data; name="file"; filename="logo.png"'', ''content-type'': ''image/png''}))', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"上传头像成功","data":{"file_path":"static\\upload\\2026\\04\\26\\logo_20260426134805A077.png","file_name":"logo_20260426134805A077.png","origin_name":"logo.png","file_url":"http://127.0.0.1:8001/api/v1/static\\upload\\2026\\04\\26\\logo_20260426134805A077.png"},"status_code":200,"success":true}', '0.04s', 7, '3b961c2d-e773-4ed7-bb21-36588ed500c5', '0', '上传当前用户头像', '2026-04-26 13:48:05.629879', '2026-04-26 13:48:05.629879', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/system/user/current/avatar/upload', 'POST', 'file: UploadFile(filename=''logo.png'', size=53402, headers=Headers({''content-disposition'': ''form-data; name="file"; filename="logo.png"'', ''content-type'': ''image/png''}))', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"上传头像成功","data":{"file_path":"static\\upload\\2026\\04\\26\\logo_20260426134839A256.png","file_name":"logo_20260426134839A256.png","origin_name":"logo.png","file_url":"http://127.0.0.1:8001/api/v1/static\\upload\\2026\\04\\26\\logo_20260426134839A256.png"},"status_code":200,"success":true}', '0.04s', 8, '4e2fff52-5a38-4027-8b9e-87a76bbed640', '0', '上传当前用户头像', '2026-04-26 13:48:39.726235', '2026-04-26 13:48:39.726235', 'f', NULL, 1, 1, NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "type" int4 NOT NULL,
  "order" int4 NOT NULL,
  "permission" varchar(100) COLLATE "pg_catalog"."default",
  "icon" varchar(50) COLLATE "pg_catalog"."default",
  "route_name" varchar(100) COLLATE "pg_catalog"."default",
  "route_path" varchar(200) COLLATE "pg_catalog"."default",
  "component_path" varchar(200) COLLATE "pg_catalog"."default",
  "redirect" varchar(200) COLLATE "pg_catalog"."default",
  "hidden" bool NOT NULL,
  "keep_alive" bool NOT NULL,
  "always_show" bool NOT NULL,
  "title" varchar(50) COLLATE "pg_catalog"."default",
  "params" json,
  "affix" bool NOT NULL,
  "parent_id" int4,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_menu"."name" IS '菜单名称';
COMMENT ON COLUMN "public"."sys_menu"."type" IS '菜单类型(1:目录 2:菜单 3:按钮/权限 4:链接)';
COMMENT ON COLUMN "public"."sys_menu"."order" IS '显示排序';
COMMENT ON COLUMN "public"."sys_menu"."permission" IS '权限标识(如:module_system:user:query)';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "public"."sys_menu"."route_name" IS '路由名称';
COMMENT ON COLUMN "public"."sys_menu"."route_path" IS '路由路径';
COMMENT ON COLUMN "public"."sys_menu"."component_path" IS '组件路径';
COMMENT ON COLUMN "public"."sys_menu"."redirect" IS '重定向地址';
COMMENT ON COLUMN "public"."sys_menu"."hidden" IS '是否隐藏(True:隐藏 False:显示)';
COMMENT ON COLUMN "public"."sys_menu"."keep_alive" IS '是否缓存(True:是 False:否)';
COMMENT ON COLUMN "public"."sys_menu"."always_show" IS '是否始终显示(True:是 False:否)';
COMMENT ON COLUMN "public"."sys_menu"."title" IS '菜单标题';
COMMENT ON COLUMN "public"."sys_menu"."params" IS '路由参数(JSON对象)';
COMMENT ON COLUMN "public"."sys_menu"."affix" IS '是否固定标签页(True:是 False:否)';
COMMENT ON COLUMN "public"."sys_menu"."parent_id" IS '父菜单ID';
COMMENT ON COLUMN "public"."sys_menu"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_menu"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_menu"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_menu"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_menu"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_menu"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_menu"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_menu"."deleted_time" IS '删除时间';
COMMENT ON TABLE "public"."sys_menu" IS '菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES ('仪表盘', 1, 1, '', 'client', 'Dashboard', '/dashboard', NULL, '/dashboard/workplace', 'f', 'f', 'f', '仪表盘', 'null', 'f', NULL, 1, 'c0f6b945-c04a-4fc5-bfb1-c27dd9c6e80c', '0', '初始化数据', '2026-04-26 13:46:58.935944', '2026-04-26 13:46:58.935944', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('系统管理', 1, 2, NULL, 'system', 'System', '/system', NULL, '/system/menu', 'f', 'f', 'f', '系统管理', 'null', 'f', NULL, 2, '6901bafe-cb91-4ac6-9bce-b6d19599f6f5', '0', '初始化数据', '2026-04-26 13:46:58.935944', '2026-04-26 13:46:58.935944', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('监控管理', 1, 3, NULL, 'monitor', 'Monitor', '/monitor', NULL, '/monitor/online', 'f', 'f', 'f', '监控管理', 'null', 'f', NULL, 3, '46dc0e89-1953-40bc-a3a0-8fa04b4bd0a8', '0', '初始化数据', '2026-04-26 13:46:58.935944', '2026-04-26 13:46:58.935944', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('接口管理', 1, 4, NULL, 'document', 'Common', '/common', NULL, '/common/docs', 'f', 'f', 'f', '接口管理', 'null', 'f', NULL, 4, '1509e1b8-4150-4a5d-a82b-5616b3497a29', '0', '初始化数据', '2026-04-26 13:46:58.935944', '2026-04-26 13:46:58.935944', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('代码管理', 1, 5, NULL, 'code', 'Generator', '/generator', NULL, '/generator/gencode', 'f', 'f', 'f', '代码管理', 'null', 'f', NULL, 5, '44721fd2-f493-4fb6-8bb4-78608f910a96', '0', '代码管理', '2026-04-26 13:46:58.935944', '2026-04-26 13:46:58.935944', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('应用管理', 1, 6, NULL, 'el-icon-ShoppingBag', 'Application', '/application', NULL, '/application/portal', 'f', 'f', 'f', '应用管理', 'null', 'f', NULL, 6, 'f865a6e9-c6f1-42be-a1e9-b4d5a5a3c270', '0', '初始化数据', '2026-04-26 13:46:58.935944', '2026-04-26 13:46:58.935944', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('AI管理', 1, 7, NULL, 'el-icon-ChatLineSquare', 'AI', '/ai', NULL, '/ai/chat', 'f', 'f', 'f', 'AI管理', 'null', 'f', NULL, 7, '14c3c25e-8791-49d6-9771-947a8fd8f532', '0', 'AI管理', '2026-04-26 13:46:58.935944', '2026-04-26 13:46:58.935944', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('任务管理', 1, 8, NULL, 'el-icon-SetUp', 'Task', '/task', NULL, '/task/cronjob/job', 'f', 'f', 'f', '任务管理', 'null', 'f', NULL, 8, 'b3b3a378-e524-491f-9f82-9067d4928d70', '0', '任务管理', '2026-04-26 13:46:58.935944', '2026-04-26 13:46:58.935944', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('案例管理', 1, 9, NULL, 'menu', 'Example', '/example', NULL, '/example/demo', 'f', 'f', 'f', '案例管理', 'null', 'f', NULL, 9, 'f5cb2e11-16c3-4e23-a7aa-d29daf5c7bb4', '0', '案例管理', '2026-04-26 13:46:58.935944', '2026-04-26 13:46:58.935944', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('工作台', 2, 1, 'dashboard:workplace:query', 'el-icon-PieChart', 'Workplace', '/dashboard/workplace', 'dashboard/workplace', NULL, 'f', 'f', 'f', '工作台', 'null', 'f', 1, 10, '055a97d3-b6ac-4e3f-a699-8a2a0e97b924', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('菜单管理', 2, 1, 'module_system:menu:query', 'menu', 'Menu', '/system/menu', 'module_system/menu/index', NULL, 'f', 'f', 'f', '菜单管理', 'null', 'f', 2, 11, '941ec68a-aff2-4fb7-81e8-58af1d66531e', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('部门管理', 2, 2, 'module_system:dept:query', 'tree', 'Dept', '/system/dept', 'module_system/dept/index', NULL, 'f', 'f', 'f', '部门管理', 'null', 'f', 2, 12, '2fe652f0-7cc1-495b-be2d-be85b6a503c2', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('岗位管理', 2, 3, 'module_system:position:query', 'el-icon-Coordinate', 'Position', '/system/position', 'module_system/position/index', NULL, 'f', 'f', 'f', '岗位管理', 'null', 'f', 2, 13, '7007c8dd-9d67-41c4-baa3-16656215b10e', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('角色管理', 2, 4, 'module_system:role:query', 'role', 'Role', '/system/role', 'module_system/role/index', NULL, 'f', 'f', 'f', '角色管理', 'null', 'f', 2, 14, 'aaedfc0e-eeef-420f-b457-12504c49b197', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('用户管理', 2, 5, 'module_system:user:query', 'el-icon-User', 'User', '/system/user', 'module_system/user/index', NULL, 'f', 'f', 'f', '用户管理', 'null', 'f', 2, 15, '4248fd5e-a4f0-461b-9cf6-fe4d1729beb3', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('日志管理', 2, 6, 'module_system:log:query', 'el-icon-Aim', 'Log', '/system/log', 'module_system/log/index', NULL, 'f', 'f', 'f', '日志管理', 'null', 'f', 2, 16, '3123cd08-e58c-4d1e-a7e9-85dcdb6392d8', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告管理', 2, 7, 'module_system:notice:query', 'bell', 'Notice', '/system/notice', 'module_system/notice/index', NULL, 'f', 'f', 'f', '公告管理', 'null', 'f', 2, 17, '5b4f8f3e-03ff-4c7c-b23f-869f9bb3ecbd', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('参数管理', 2, 8, 'module_system:param:query', 'setting', 'Params', '/system/param', 'module_system/param/index', NULL, 'f', 'f', 'f', '参数管理', 'null', 'f', 2, 18, '5b041e54-74e5-49ee-ad70-2bfee076e00c', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('字典管理', 2, 9, 'module_system:dict_type:query', 'dict', 'Dict', '/system/dict', 'module_system/dict/index', NULL, 'f', 'f', 'f', '字典管理', 'null', 'f', 2, 19, '1634d7ed-16dd-47c8-85c0-ba9f2fd073d7', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('租户管理', 2, 10, 'module_system:tenant:query', 'el-icon-DataBoard', 'Tenant', '/system/tenant', 'module_system/tenant/index', NULL, 'f', 'f', 'f', '租户管理', 'null', 'f', 2, 20, '4915329d-05aa-4982-9551-256e4fbd1151', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('在线用户', 2, 1, 'module_monitor:online:query', 'el-icon-Headset', 'MonitorOnline', '/monitor/online', 'module_monitor/online/index', NULL, 'f', 'f', 'f', '在线用户', 'null', 'f', 3, 21, 'f71ec54c-78b9-43d0-8d41-bd83925b10af', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('服务器监控', 2, 2, 'module_monitor:server:query', 'el-icon-Odometer', 'MonitorServer', '/monitor/server', 'module_monitor/server/index', NULL, 'f', 'f', 'f', '服务器监控', 'null', 'f', 3, 22, 'ebfaf2e9-a790-4fa3-bb9c-d53e9f4c9ff0', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('缓存监控', 2, 3, 'module_monitor:cache:query', 'el-icon-Stopwatch', 'MonitorCache', '/monitor/cache', 'module_monitor/cache/index', NULL, 'f', 'f', 'f', '缓存监控', 'null', 'f', 3, 23, 'a6a219b1-1f9e-495f-8daf-3381da039ee5', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件管理', 2, 4, 'module_monitor:resource:query', 'el-icon-Files', 'Resource', '/monitor/resource', 'module_monitor/resource/index', NULL, 'f', 'f', 'f', '文件管理', 'null', 'f', 3, 24, '89dfd549-d81a-47a9-8a2d-dc00d6ad5d95', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('Swagger文档', 4, 1, 'module_common:docs:query', 'api', 'Docs', '/common/docs', 'module_common/docs/index', NULL, 'f', 'f', 'f', 'Swagger文档', 'null', 'f', 4, 25, '9b957c8f-8198-42eb-a3ad-42274e4714a6', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('Redoc文档', 4, 2, 'module_common:redoc:query', 'el-icon-Document', 'Redoc', '/common/redoc', 'module_common/redoc/index', NULL, 'f', 'f', 'f', 'Redoc文档', 'null', 'f', 4, 26, '8b3fdf73-df8e-47c9-bd25-de355226d528', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('LangJin文档', 4, 3, 'module_common:ljdoc:query', 'el-icon-Document', 'Ljdoc', '/common/ljdoc', 'module_common/ljdoc/index', NULL, 'f', 'f', 'f', 'LangJin文档', 'null', 'f', 4, 27, '89dfb487-2212-4461-a414-2b639c2b5b57', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('代码生成', 2, 1, 'module_generator:gencode:query', 'code', 'GenCode', '/generator/gencode', 'module_generator/gencode/index', NULL, 'f', 'f', 'f', '代码生成', 'null', 'f', 5, 28, '25eef2bf-583c-4fc4-ade2-2c4b1b4eaa42', '0', '代码生成', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('插件市场', 2, 1, 'module_application:portal:query', 'el-icon-ShoppingCartFull', 'PortalApp', '/application/portal', 'module_application/portal/index', NULL, 'f', 'f', 'f', '插件市场', 'null', 'f', 6, 29, 'a4a0db7e-07d7-441e-b297-fff0038041ea', '0', '初始化数据', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('AI智能助手', 2, 1, 'module_ai:chat:query', 'el-icon-ChatDotRound', 'Chat', '/ai/chat', 'module_ai/chat/index', NULL, 'f', 'f', 'f', 'AI智能助手', 'null', 'f', 7, 30, 'c7ca053c-3c73-4d3d-a0b5-3c711557d1af', '0', 'AI智能助手', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('会话记忆', 2, 2, 'module_ai:chat:query', 'el-icon-ChatLineSquare', 'Memory', '/ai/memory', 'module_ai/memory/index', NULL, 'f', 'f', 'f', '会话记忆', 'null', 'f', 7, 31, 'a274f4e8-3beb-4872-966d-b3cb6ce824dd', '0', '会话记忆管理', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('定时任务', 1, 1, NULL, 'el-icon-Timer', 'Cronjob', '/task/cronjob', NULL, '/task/cronjob/job', 'f', 'f', 'f', '定时任务', 'null', 'f', 8, 32, 'b5ceeb67-ed46-49ab-8d2c-2e6c0d6e4b18', '0', 'APScheduler 调度器与任务节点', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('工作流', 1, 2, NULL, 'el-icon-SetUp', 'WorkflowMgr', '/task/workflow-mgr', NULL, '/task/workflow/definition', 'f', 'f', 'f', '工作流', 'null', 'f', 8, 33, '9910a346-d47a-48d9-a2a8-a5c31dde4752', '0', '流程编排与编排节点类型', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('示例管理', 2, 1, 'module_example:demo:query', 'menu', 'Demo', '/example/demo', 'module_example/demo/index', NULL, 'f', 'f', 'f', '示例管理', 'null', 'f', 9, 34, '9a492194-171b-410a-b93d-9b28383853d4', '0', '示例管理', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('二级目录', 1, 2, NULL, 'menu', 'DemoDir', '/example/demo-group', NULL, '/example/demo-group/demo01', 'f', 'f', 'f', '二级目录', 'null', 'f', 9, 35, '9e00ff4b-79f9-414a-9f1f-41401c3ec936', '0', '二级目录（含三级菜单）', '2026-04-26 13:46:58.947793', '2026-04-26 13:46:58.947793', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建菜单', 3, 1, 'module_system:menu:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建菜单', 'null', 'f', 11, 36, '16d93b9a-11d2-4dc0-bf71-525807891d68', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改菜单', 3, 2, 'module_system:menu:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改菜单', 'null', 'f', 11, 37, '9cf8716c-6c4c-4164-b007-88ede3820423', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除菜单', 3, 3, 'module_system:menu:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除菜单', 'null', 'f', 11, 38, '04407c85-83ea-406f-a619-e2fa1061e2d2', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改菜单状态', 3, 4, 'module_system:menu:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改菜单状态', 'null', 'f', 11, 39, '3067485e-2e98-49d9-a9de-9dccd0bc5676', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情菜单', 3, 5, 'module_system:menu:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情菜单', 'null', 'f', 11, 40, '736aa191-ac8d-4543-9c51-0f617a6f8b23', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询菜单', 3, 6, 'module_system:menu:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询菜单', 'null', 'f', 11, 41, 'b3ccea1e-df6e-4b17-a374-348bbb69dea8', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建部门', 3, 1, 'module_system:dept:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建部门', 'null', 'f', 12, 42, '8fd7e0aa-72e6-4094-ad40-2098138bfa9c', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改部门', 3, 2, 'module_system:dept:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改部门', 'null', 'f', 12, 43, '4c855a73-4528-43d4-8a68-26296adbe808', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除部门', 3, 3, 'module_system:dept:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除部门', 'null', 'f', 12, 44, '0b05872d-49c0-4244-9076-31a5c7641d8d', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改部门状态', 3, 4, 'module_system:dept:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改部门状态', 'null', 'f', 12, 45, 'cc3ad2b1-706b-428e-ab5d-4da38fa34255', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情部门', 3, 5, 'module_system:dept:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情部门', 'null', 'f', 12, 46, 'b093a56f-3db2-46bf-83e4-7c1a65f51db7', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询部门', 3, 6, 'module_system:dept:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询部门', 'null', 'f', 12, 47, '4f0178df-d6cc-4162-8f32-14c653d18f7c', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建岗位', 3, 1, 'module_system:position:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建岗位', 'null', 'f', 13, 48, 'b5097431-a4f6-4a26-9b39-1320cb3bd93f', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改岗位', 3, 2, 'module_system:position:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改岗位', 'null', 'f', 13, 49, '5a62c60d-d543-4bb0-85b2-4a5166816c90', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除岗位', 3, 3, 'module_system:position:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改岗位', 'null', 'f', 13, 50, 'd25fc9e5-eaed-43a7-a854-5e63ab0c7a49', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改岗位状态', 3, 4, 'module_system:position:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改岗位状态', 'null', 'f', 13, 51, 'b83d2d3b-307b-4385-b5d9-17b988c8de77', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('岗位导出', 3, 5, 'module_system:position:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '岗位导出', 'null', 'f', 13, 52, '654f06b8-95b9-4e30-9487-04f6fcadc917', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情岗位', 3, 6, 'module_system:position:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情岗位', 'null', 'f', 13, 53, '63c0640a-3cdc-46dc-b96f-5c1b93ea3408', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询岗位', 3, 7, 'module_system:position:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询岗位', 'null', 'f', 13, 54, '5acd9e2b-5dad-4597-b969-d3f11b294954', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建角色', 3, 1, 'module_system:role:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建角色', 'null', 'f', 14, 55, '9b03e41d-21ba-4a0c-8335-af2740db185a', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改角色', 3, 2, 'module_system:role:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改角色', 'null', 'f', 14, 56, '24cc299b-50da-43c7-baec-ef5492c86e6a', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除角色', 3, 3, 'module_system:role:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除角色', 'null', 'f', 14, 57, '986d970c-b349-40ab-9a46-6e27fccbac30', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改角色状态', 3, 4, 'module_system:role:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改角色状态', 'null', 'f', 14, 58, 'cc11d591-b0a3-4dc2-a7e6-856abd31aaa8', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('角色导出', 3, 5, 'module_system:role:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '角色导出', 'null', 'f', 14, 59, '0e8c279c-7604-439f-8dc8-31b5360a51c5', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情角色', 3, 6, 'module_system:role:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情角色', 'null', 'f', 14, 60, '82d7cab3-b05f-4c2b-9401-285b396758ec', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询角色', 3, 7, 'module_system:role:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询角色', 'null', 'f', 14, 61, 'ae3a251f-7da7-4fdb-a452-155c780088c2', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('分配权限', 3, 8, 'module_system:role:permission', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '分配权限', 'null', 'f', 14, 62, 'b3d43d2e-c161-4c21-9dee-d4318d226c72', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建用户', 3, 1, 'module_system:user:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建用户', 'null', 'f', 15, 63, '4d9a7ad8-6146-491a-9898-26c1f02a4a79', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改用户', 3, 2, 'module_system:user:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改用户', 'null', 'f', 15, 64, 'df4f657a-a0ab-4f2e-ae87-d67047cb8569', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除用户', 3, 3, 'module_system:user:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除用户', 'null', 'f', 15, 65, '6f838d09-8a4a-4384-8845-2816b91abd13', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改用户状态', 3, 4, 'module_system:user:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改用户状态', 'null', 'f', 15, 66, '4a33f799-3a2b-4c83-8e37-357b242cb057', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出用户', 3, 5, 'module_system:user:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出用户', 'null', 'f', 15, 67, 'c017d244-7704-4dea-85e1-4f9c67cc16ee', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导入用户', 3, 6, 'module_system:user:import', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导入用户', 'null', 'f', 15, 68, 'e71ab63f-b6b6-43fc-ab9c-c30037c1e977', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('下载用户导入模板', 3, 7, 'module_system:user:download', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '下载用户导入模板', 'null', 'f', 15, 69, '1f75df20-140f-4dfe-b02e-7a3b00505693', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情用户', 3, 8, 'module_system:user:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情用户', 'null', 'f', 15, 70, 'bc170510-cb55-4dfb-92ab-c96e9eb2f5d5', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询用户', 3, 9, 'module_system:user:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询用户', 'null', 'f', 15, 71, '065aa842-20e8-41a1-8db3-0fa8956914c0', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('日志删除', 3, 1, 'module_system:log:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '日志删除', 'null', 'f', 16, 72, '11b7eed3-d6f5-49d0-8536-a43ff5eed183', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('日志导出', 3, 2, 'module_system:log:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '日志导出', 'null', 'f', 16, 73, 'b7d214fb-39f0-45e7-afa6-e92f996a7c9c', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('日志详情', 3, 3, 'module_system:log:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '日志详情', 'null', 'f', 16, 74, '70fd0b18-7c2c-45a2-a209-8d4f713f18d1', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询日志', 3, 4, 'module_system:log:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询日志', 'null', 'f', 16, 75, 'f682d25e-baf3-4409-8bf0-e1efbf702ea5', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告创建', 3, 1, 'module_system:notice:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告创建', 'null', 'f', 17, 76, 'd4296751-2549-46b0-8cf0-03b694927762', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告修改', 3, 2, 'module_system:notice:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改用户', 'null', 'f', 17, 77, 'e1a42198-2f17-4a89-b4e1-8b7f07012fda', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告删除', 3, 3, 'module_system:notice:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告删除', 'null', 'f', 17, 78, 'c8b8463d-3d38-4a36-a1c3-620d0d80124f', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告导出', 3, 4, 'module_system:notice:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告导出', 'null', 'f', 17, 79, '51c4edfc-556a-4b46-a124-42b1e1785388', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告批量修改状态', 3, 5, 'module_system:notice:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告批量修改状态', 'null', 'f', 17, 80, '8b636cce-7d33-4f9f-ab5f-d1e0066bea88', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告详情', 3, 6, 'module_system:notice:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告详情', 'null', 'f', 17, 81, '07fd760b-9d2a-4664-a947-b40f2bd48b0b', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询公告', 3, 5, 'module_system:notice:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询公告', 'null', 'f', 17, 82, 'e90f8913-3349-41ca-a1fc-e84cb0bdd28e', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建参数', 3, 1, 'module_system:param:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建参数', 'null', 'f', 18, 83, 'adc5056e-3502-47fe-8235-33e5e52b2ab7', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改参数', 3, 2, 'module_system:param:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改参数', 'null', 'f', 18, 84, '2eef4e97-17ef-40ab-ad3f-5fc616ee0d6e', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除参数', 3, 3, 'module_system:param:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除参数', 'null', 'f', 18, 85, '41ced023-748b-4063-a23f-4bb1459211ea', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出参数', 3, 4, 'module_system:param:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出参数', 'null', 'f', 18, 86, '0d44f828-7b9a-46ef-ae89-2aa5be63302c', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('参数上传', 3, 5, 'module_system:param:upload', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '参数上传', 'null', 'f', 18, 87, '4900ac88-86cf-4710-8cdd-5242576b1635', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('参数详情', 3, 6, 'module_system:param:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '参数详情', 'null', 'f', 18, 88, 'a9838033-a528-4a65-a005-151a83937909', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询参数', 3, 7, 'module_system:param:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询参数', 'null', 'f', 18, 89, 'b4de326f-de92-48d9-a943-b578356f0276', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建字典类型', 3, 1, 'module_system:dict_type:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建字典类型', 'null', 'f', 19, 90, '768b4b5b-fc4b-448a-ab47-dffb32bf933f', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改字典类型', 3, 2, 'module_system:dict_type:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改字典类型', 'null', 'f', 19, 91, 'b7f154d8-6808-430e-8e74-c3f621e2a965', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除字典类型', 3, 3, 'module_system:dict_type:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除字典类型', 'null', 'f', 19, 92, 'c76cda66-20d2-420c-8f1f-ed6d838990b2', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出字典类型', 3, 4, 'module_system:dict_type:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出字典类型', 'null', 'f', 19, 93, '35a24cb2-6425-4b0c-bbe3-8643d8eb31ab', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改字典状态', 3, 5, 'module_system:dict_type:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出字典类型', 'null', 'f', 19, 94, '2d279a7a-81ea-4304-aa5d-3f5c64049b03', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('字典数据查询', 3, 6, 'module_system:dict_data:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '字典数据查询', 'null', 'f', 19, 95, '4fd99bec-8cec-458d-809a-130d7d2421ad', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建字典数据', 3, 7, 'module_system:dict_data:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建字典数据', 'null', 'f', 19, 96, '9db8707f-804e-4d25-9386-8ec551846a87', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改字典数据', 3, 8, 'module_system:dict_data:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改字典数据', 'null', 'f', 19, 97, '5b64f7a2-1e86-4857-9cbd-401bcf70121a', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除字典数据', 3, 9, 'module_system:dict_data:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除字典数据', 'null', 'f', 19, 98, '57073dfe-c96a-4548-af4c-f8506522e961', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出字典数据', 3, 10, 'module_system:dict_data:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出字典数据', 'null', 'f', 19, 99, 'a00a762b-ed2f-4eb1-9fd6-9be742f01bbe', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改字典数据状态', 3, 11, 'module_system:dict_data:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改字典数据状态', 'null', 'f', 19, 100, 'a5398302-c8ef-4cd0-ae45-67d55f0c3ebe', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情字典类型', 3, 12, 'module_system:dict_type:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情字典类型', 'null', 'f', 19, 101, '279cfbaa-42c6-49d2-ada8-6659cf862a8a', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询字典类型', 3, 13, 'module_system:dict_type:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询字典类型', 'null', 'f', 19, 102, '8a00bae2-97f4-4305-a13d-8de0a7786c14', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情字典数据', 3, 14, 'module_system:dict_data:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情字典数据', 'null', 'f', 19, 103, 'a0194266-2c01-42e9-bbe4-4825226167c2', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建租户', 3, 1, 'module_system:tenant:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建租户', 'null', 'f', 20, 104, 'dc0b2cbd-fb7f-4f35-be4a-6d7ab0123334', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改租户', 3, 2, 'module_system:tenant:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改租户', 'null', 'f', 20, 105, '2973099a-2a92-4154-981e-6046b48fcef1', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除租户', 3, 3, 'module_system:tenant:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除租户', 'null', 'f', 20, 106, '24dfd7e7-63dc-479d-93aa-c16b74402f13', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改租户状态', 3, 4, 'module_system:tenant:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改租户状态', 'null', 'f', 20, 107, 'b1ad5cbc-bb9f-4f34-8dff-31910abca47c', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('租户详情', 3, 5, 'module_system:tenant:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '租户详情', 'null', 'f', 20, 108, 'f82ee377-d592-40a1-b26d-e1f09038be5a', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询租户', 3, 6, 'module_system:tenant:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询租户', 'null', 'f', 20, 109, '0f7537b7-0abc-4622-8875-592bdcc2ec38', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('在线用户强制下线', 3, 1, 'module_monitor:online:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '在线用户强制下线', 'null', 'f', 21, 110, '057be2f1-4462-4592-a44d-a7885d5d7adf', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('清除缓存', 3, 1, 'module_monitor:cache:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '清除缓存', 'null', 'f', 23, 111, '0687e3f2-20f8-47b3-b822-4101b0213c4b', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件上传', 3, 1, 'module_monitor:resource:upload', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件上传', 'null', 'f', 24, 112, 'd9f32352-413b-4da4-806b-a7ad61a23660', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件下载', 3, 2, 'module_monitor:resource:download', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件下载', 'null', 'f', 24, 113, 'e4453a3e-cb99-4251-891f-85b261953d08', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件删除', 3, 3, 'module_monitor:resource:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件删除', 'null', 'f', 24, 114, '3374a225-1c95-4338-bf4f-a825d7dd96fb', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件移动', 3, 4, 'module_monitor:resource:move', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件移动', 'null', 'f', 24, 115, '8d60f588-a36c-47ce-8cbf-1be92e4a9a3b', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件复制', 3, 5, 'module_monitor:resource:copy', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件复制', 'null', 'f', 24, 116, 'a9146a81-422f-4c83-8df9-52c0e7bc230f', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件重命名', 3, 6, 'module_monitor:resource:rename', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件重命名', 'null', 'f', 24, 117, 'd2a6d250-7b85-451f-b0e3-9a2d368c8d9b', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建目录', 3, 7, 'module_monitor:resource:create_dir', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建目录', 'null', 'f', 24, 118, 'bad5178f-7e4a-4933-a045-2f94ecc8a998', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出文件列表', 3, 9, 'module_monitor:resource:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出文件列表', 'null', 'f', 24, 119, '50a9a8bd-7da8-466f-aedf-b91ab3c8dc15', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询代码生成业务表列表', 3, 1, 'module_generator:gencode:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询代码生成业务表列表', 'null', 'f', 28, 120, 'c3d19b8b-b1ac-41e0-8d64-9e8e1fd355ad', '0', '查询代码生成业务表列表', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建表结构', 3, 2, 'module_generator:gencode:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建表结构', 'null', 'f', 28, 121, 'a9ffe030-2991-49db-9993-2c1e3cefb121', '0', '创建表结构', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('编辑业务表信息', 3, 3, 'module_generator:gencode:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '编辑业务表信息', 'null', 'f', 28, 122, 'b2d382a4-1451-45ad-902b-7822ca449669', '0', '编辑业务表信息', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除业务表信息', 3, 4, 'module_generator:gencode:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除业务表信息', 'null', 'f', 28, 123, '9fcf8a37-67ac-470c-bc32-3fc683d1ed13', '0', '删除业务表信息', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导入表结构', 3, 5, 'module_generator:gencode:import', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导入表结构', 'null', 'f', 28, 124, 'b4edd44f-f80e-4fa3-b9cc-4399865d9643', '0', '导入表结构', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量生成代码', 3, 6, 'module_generator:gencode:operate', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量生成代码', 'null', 'f', 28, 125, '7ddb26ab-3dee-4466-b77e-1939e9d7c35e', '0', '批量生成代码', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('生成代码到指定路径', 3, 7, 'module_generator:gencode:code', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '生成代码到指定路径', 'null', 'f', 28, 126, '36ff4033-78ce-4ee8-a4a5-856bfee02101', '0', '生成代码到指定路径', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询数据库表列表', 3, 8, 'module_generator:dblist:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询数据库表列表', 'null', 'f', 28, 127, 'd2acab88-a367-4ec1-ba93-2914547b0611', '0', '查询数据库表列表', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('同步数据库', 3, 9, 'module_generator:db:sync', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '同步数据库', 'null', 'f', 28, 128, '9d5b9b32-cf74-4f9e-92d5-fbdf70707159', '0', '同步数据库', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建插件', 3, 1, 'module_application:portal:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建插件', 'null', 'f', 29, 129, '3c877826-9c3f-4e97-8413-fcc03597cd05', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改插件', 3, 2, 'module_application:portal:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改插件', 'null', 'f', 29, 130, 'e743237d-76be-45bc-a880-9278f8f46b80', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除插件', 3, 3, 'module_application:portal:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除插件', 'null', 'f', 29, 131, '1bd5310d-2cc1-4d67-b4e8-0f06c03de39c', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改插件状态', 3, 4, 'module_application:portal:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改应用状态', 'null', 'f', 29, 132, 'aaf5aea8-bd3f-4376-afdf-36530e2863a5', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情插件', 3, 5, 'module_application:portal:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情插件', 'null', 'f', 29, 133, '2ce5739e-896c-4e71-996e-918c74f613b7', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询插件', 3, 6, 'module_application:portal:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询插件', 'null', 'f', 29, 134, '8ca38d25-b46e-42d5-9d77-7fe1a238233c', '0', '查询插件', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('AI对话', 3, 1, 'module_ai:chat:ws', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', 'AI对话', 'null', 'f', 30, 135, '373b10b7-65a5-4af5-b503-ea0d7215b626', '0', 'AI对话', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询会话', 3, 2, 'module_ai:chat:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询会话', 'null', 'f', 30, 136, 'a7aebb2c-9b97-439a-9ede-754abdc2edcd', '0', '查询会话', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('会话详情', 3, 3, 'module_ai:chat:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '会话详情', 'null', 'f', 30, 137, '29db11cc-25eb-4a1e-b1a6-c0c900138d92', '0', '会话详情', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建会话', 3, 4, 'module_ai:chat:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建会话', 'null', 'f', 30, 138, 'bbaeedfc-026b-4ed8-83b8-4a8a7882a6e2', '0', '创建会话', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('更新会话', 3, 5, 'module_ai:chat:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '更新会话', 'null', 'f', 30, 139, '94d0c186-996e-45b4-8209-25fa5182866a', '0', '更新会话', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除会话', 3, 6, 'module_ai:chat:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除会话', 'null', 'f', 30, 140, 'baef5271-1377-499a-932c-bcfacb623a3d', '0', '删除会话', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询会话记忆', 3, 1, 'module_ai:chat:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询会话记忆', 'null', 'f', 31, 141, 'a3563e94-37be-4ccc-b824-ba2c75f233bd', '0', '查询会话记忆', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('会话记忆详情', 3, 2, 'module_ai:chat:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '会话记忆详情', 'null', 'f', 31, 142, 'c2f54908-ca69-452f-a0c9-0dec9ee1b52e', '0', '会话记忆详情', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除会话记忆', 3, 3, 'module_ai:chat:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除会话记忆', 'null', 'f', 31, 143, '1921f713-b11f-4c9a-97d0-0903c1c48a9c', '0', '删除会话记忆', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('调度器监控', 2, 1, 'module_task:cronjob:job:query', 'el-icon-DataLine', 'Job', '/task/cronjob/job', 'module_task/cronjob/job/index', NULL, 'f', 'f', 'f', '调度器监控', 'null', 'f', 32, 144, '90e80dc0-3cd2-49fd-8a37-91d5ef6c5936', '0', '调度器监控', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('节点管理', 2, 2, 'module_task:cronjob:node:query', 'el-icon-Postcard', 'Node', '/task/cronjob/node', 'module_task/cronjob/node/index', NULL, 'f', 'f', 'f', '节点管理', 'null', 'f', 32, 145, '8580e4a5-e09e-403b-a8d2-1e5b093f9fe8', '0', '节点管理', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('流程编排', 2, 1, 'module_task:workflow:definition:query', 'el-icon-SetUp', 'Workflow', '/task/workflow/definition', 'module_task/workflow/definition/index', NULL, 'f', 'f', 'f', '流程编排', 'null', 'f', 33, 146, 'cc91c85c-3056-4938-a082-3667813eae2f', '0', 'Vue Flow 画布与发布执行', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('编排节点类型', 2, 2, 'module_task:workflow:node-type:query', 'el-icon-Grid', 'WorkflowNodeType', '/task/workflow/node-type', 'module_task/workflow/node-type/index', NULL, 'f', 'f', 'f', '编排节点类型', 'null', 'f', 33, 147, '3416454c-cbeb-4355-9e78-cb81b16c74d7', '0', '画布节点类型与 Prefect 执行逻辑', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建示例', 3, 1, 'module_example:demo:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建示例', 'null', 'f', 34, 148, '575b4a8f-9989-4e81-aeb5-e320b8d1d464', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('更新示例', 3, 2, 'module_example:demo:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '更新示例', 'null', 'f', 34, 149, '3735abee-1dae-4aa1-9b34-7ce4cea4e4d7', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除示例', 3, 3, 'module_example:demo:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除示例', 'null', 'f', 34, 150, '96c4a9fa-7266-4e99-9573-db44d088ad08', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改示例状态', 3, 4, 'module_example:demo:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改示例状态', 'null', 'f', 34, 151, 'af620490-d51b-4120-a300-4581491080e5', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出示例', 3, 5, 'module_example:demo:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出示例', 'null', 'f', 34, 152, '7dd83d69-6289-4d56-a457-7e789751f231', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导入示例', 3, 6, 'module_example:demo:import', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导入示例', 'null', 'f', 34, 153, '9913f22e-91ca-4051-a3e5-d249de1681e2', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('下载导入示例模版', 3, 7, 'module_example:demo:download', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '下载导入示例模版', 'null', 'f', 34, 154, '3a2c3c44-9fb3-41a8-86a0-10b3135d3b7f', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情示例', 3, 8, 'module_example:demo:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情示例', 'null', 'f', 34, 155, 'a08c0b0e-bfe9-4fd9-bda2-cb10a25197cc', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询示例', 3, 9, 'module_example:demo:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询示例', 'null', 'f', 34, 156, '8dba1ea5-5915-4f0c-a840-bb25633fcac3', '0', '初始化数据', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('三级菜单', 2, 1, 'module_example:demo01:query', 'menu', 'Demo01', '/example/demo-group/demo01', 'module_example/demo01/index', NULL, 'f', 'f', 'f', '三级菜单', 'null', 'f', 35, 157, 'e5e34736-907f-4795-977c-101f1bdee371', '0', '示例01管理', '2026-04-26 13:46:58.96005', '2026-04-26 13:46:58.96005', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询调度器', 3, 1, 'module_task:cronjob:job:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询调度器', 'null', 'f', 144, 158, '4a8ca9ab-2409-4072-b541-fb6d6704abbb', '0', '查询调度器', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('控制调度器', 3, 2, 'module_task:cronjob:job:scheduler', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '控制调度器', 'null', 'f', 144, 159, 'c450d596-bd92-4399-9ad1-cab8ea3b358f', '0', '控制调度器', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('操作任务', 3, 3, 'module_task:cronjob:job:task', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '操作任务', 'null', 'f', 144, 160, 'f6cbd557-b1b0-469a-b633-571bd4b4af04', '0', '操作任务', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除执行日志', 3, 4, 'module_task:cronjob:job:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除执行日志', 'null', 'f', 144, 161, 'd5d8ad0a-c239-415c-9d21-8f7a7d209f70', '0', '删除执行日志', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情执行日志', 3, 5, 'module_task:cronjob:job:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情执行日志', 'null', 'f', 144, 162, '20ef86cf-a9be-40f1-9c71-24da7c8a5803', '0', '详情执行日志', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建节点', 3, 1, 'module_task:cronjob:node:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建节点', 'null', 'f', 145, 163, 'dd971b70-8414-487c-b62b-825be0444185', '0', '创建节点', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('调试节点', 3, 2, 'module_task:cronjob:node:execute', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '调试节点', 'null', 'f', 145, 164, '46fb59d0-15c5-4701-9632-ae11c87666e1', '0', '调试节点', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改节点', 3, 3, 'module_task:cronjob:node:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改节点', 'null', 'f', 145, 165, 'bb0559b1-89d8-4e51-920b-97b63880c1f0', '0', '修改节点', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除节点', 3, 4, 'module_task:cronjob:node:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除节点', 'null', 'f', 145, 166, 'c15fcbb3-5a47-4e56-afc2-c5aff269b471', '0', '删除节点', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情节点', 3, 5, 'module_task:cronjob:node:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情节点', 'null', 'f', 145, 167, 'bc9ab943-b987-49b2-b45c-85ac2a38a163', '0', '详情节点', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询节点', 3, 6, 'module_task:cronjob:node:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询节点', 'null', 'f', 145, 168, 'b10aef5a-6d08-4ec9-bb42-803043d4e766', '0', '查询节点', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建流程', 3, 1, 'module_task:workflow:definition:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建流程', 'null', 'f', 146, 169, '6e89971c-4f33-4a15-a2eb-71f05951eaf6', '0', '创建流程', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('执行流程', 3, 2, 'module_task:workflow:definition:execute', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '执行流程', 'null', 'f', 146, 170, '15e007bb-3382-496a-a12c-72d5f545dcab', '0', '执行流程', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改流程', 3, 3, 'module_task:workflow:definition:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改流程', 'null', 'f', 146, 171, 'f7d52b21-cec1-4061-9fa9-df4f9a9acb89', '0', '修改流程', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除流程', 3, 4, 'module_task:workflow:definition:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除流程', 'null', 'f', 146, 172, '520a43c8-e3a3-4f5f-b14f-848f4d944c21', '0', '删除流程', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情流程', 3, 5, 'module_task:workflow:definition:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情流程', 'null', 'f', 146, 173, '13210916-58ae-4875-bfa6-e0b15c17f10c', '0', '详情流程', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询流程', 3, 6, 'module_task:workflow:definition:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询流程', 'null', 'f', 146, 174, '1f5e179c-d234-4118-9238-25e9347937ff', '0', '查询流程', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建编排节点类型', 3, 1, 'module_task:workflow:node-type:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建编排节点类型', 'null', 'f', 147, 175, '8709e22c-3075-4021-99dd-07057ed0ffa1', '0', '创建编排节点类型', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改编排节点类型', 3, 2, 'module_task:workflow:node-type:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改编排节点类型', 'null', 'f', 147, 176, '7f8a12d2-48ca-4414-97e5-08c0fce534df', '0', '修改编排节点类型', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除编排节点类型', 3, 3, 'module_task:workflow:node-type:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除编排节点类型', 'null', 'f', 147, 177, '2062ed71-fc07-4e8d-b6ea-5cac77177c9a', '0', '删除编排节点类型', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情编排节点类型', 3, 4, 'module_task:workflow:node-type:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情编排节点类型', 'null', 'f', 147, 178, '456b1f6f-2558-4ce4-93ea-274c7a38e166', '0', '详情编排节点类型', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询编排节点类型', 3, 5, 'module_task:workflow:node-type:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询编排节点类型', 'null', 'f', 147, 179, 'f4c1b2e6-a329-4c86-8916-208ae26898f0', '0', '查询编排节点类型', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建示例01', 3, 1, 'module_example:demo01:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建示例01', 'null', 'f', 157, 180, '80234f9f-557c-40b9-a336-b765ffdcc65f', '0', '初始化数据', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('更新示例01', 3, 2, 'module_example:demo01:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '更新示例01', 'null', 'f', 157, 181, '1453e268-260b-4d5b-829e-2de2ae97e2c8', '0', '初始化数据', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除示例01', 3, 3, 'module_example:demo01:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除示例01', 'null', 'f', 157, 182, '68cc8a94-56cc-4903-a953-f6de01ef3dd9', '0', '初始化数据', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改示例01状态', 3, 4, 'module_example:demo01:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改示例01状态', 'null', 'f', 157, 183, '78a2ea0a-bed3-4f92-9625-9209d83d278c', '0', '初始化数据', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出示例01', 3, 5, 'module_example:demo01:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出示例01', 'null', 'f', 157, 184, '0613a24d-d1d4-4c9c-96c3-6c4edb4442bf', '0', '初始化数据', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导入示例01', 3, 6, 'module_example:demo01:import', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导入示例01', 'null', 'f', 157, 185, 'fec20702-bb1a-48ee-9be3-ea6f6e392551', '0', '初始化数据', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('下载导入示例01模版', 3, 7, 'module_example:demo01:download', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '下载导入示例01模版', 'null', 'f', 157, 186, '88289711-e340-4c7d-859d-56a2950859bf', '0', '初始化数据', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情示例01', 3, 8, 'module_example:demo01:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情示例01', 'null', 'f', 157, 187, '861cd7f1-3e6e-4ade-a524-39ebd33a2647', '0', '初始化数据', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询示例01', 3, 9, 'module_example:demo01:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询示例01', 'null', 'f', 157, 188, '9763a605-298e-4b04-9322-52fd63b076cd', '0', '初始化数据', '2026-04-26 13:46:59.063447', '2026-04-26 13:46:59.063447', 'f', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice";
CREATE TABLE "public"."sys_notice" (
  "notice_title" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "notice_type" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "notice_content" text COLLATE "pg_catalog"."default",
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."sys_notice"."notice_title" IS '公告标题';
COMMENT ON COLUMN "public"."sys_notice"."notice_type" IS '公告类型(1通知 2公告)';
COMMENT ON COLUMN "public"."sys_notice"."notice_content" IS '公告内容';
COMMENT ON COLUMN "public"."sys_notice"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_notice"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_notice"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_notice"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_notice"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_notice"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_notice"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_notice"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."sys_notice"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_notice"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."sys_notice"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."sys_notice" IS '通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_param";
CREATE TABLE "public"."sys_param" (
  "config_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "config_key" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "config_value" varchar(500) COLLATE "pg_catalog"."default",
  "config_type" bool,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_param"."config_name" IS '参数名称';
COMMENT ON COLUMN "public"."sys_param"."config_key" IS '参数键名';
COMMENT ON COLUMN "public"."sys_param"."config_value" IS '参数键值';
COMMENT ON COLUMN "public"."sys_param"."config_type" IS '系统内置(True:是 False:否)';
COMMENT ON COLUMN "public"."sys_param"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_param"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_param"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_param"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_param"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_param"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_param"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_param"."deleted_time" IS '删除时间';
COMMENT ON TABLE "public"."sys_param" IS '系统参数表';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO "public"."sys_param" VALUES ('网站描述', 'sys_web_description', 'FastApiAdmin 是完全开源的权限管理系统', 'f', 2, '5771adde-7a1c-4f76-b51a-d7da634d8e8d', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('登录背景', 'sys_login_background', 'https://service.fastapiadmin.com/api/v1/static/image/background.svg', 'f', 5, 'cd1c90c1-a1bb-4b56-937a-ee44601556ee', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('版权信息', 'sys_web_copyright', 'Copyright © 2025-2026 service.fastapiadmin.com 版权所有', 'f', 6, '6c014c01-2f8c-4c40-8a7d-d7b41597fa86', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('备案信息', 'sys_keep_record', '陕ICP备2025069493号-1', 'f', 7, '05adce37-dcc5-4e48-bcf3-fbf41b6d09e9', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('帮助文档', 'sys_help_doc', 'https://service.fastapiadmin.com', 'f', 8, '7056e1fc-2046-49dc-b5a7-e7a06d2486dc', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('隐私政策', 'sys_web_privacy', 'https://github.com/fastapiadmin/FastapiAdmin/blob/master/LICENSE', 'f', 9, '6b4c1964-279e-4b12-a257-db60f6d12bf5', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('用户协议', 'sys_web_clause', 'https://github.com/fastapiadmin/FastapiAdmin/blob/master/LICENSE', 'f', 10, 'b3c9cffe-67d9-4b5e-a6b8-5e4fb073484c', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('源码代码', 'sys_git_code', 'https://github.com/fastapiadmin/FastapiAdmin.git', 'f', 11, 'c2791d5d-2877-4751-bee1-28540ea1f6ac', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('项目版本', 'sys_web_version', '2.0.0', 'f', 12, '41729c3e-a96d-4253-9fb1-5118be916b9c', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('演示模式启用', 'demo_enable', 'false', 'f', 13, 'ffc6f239-5021-4c39-ae53-5c74ff2676ee', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('演示访问IP白名单', 'ip_white_list', '["127.0.0.1"]', 'f', 14, 'ac425fa3-7eef-445f-b41e-50333cc47c0d', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('接口白名单', 'white_api_list_path', '["/api/v1/system/auth/login", "/api/v1/system/auth/token/refresh", "/api/v1/system/auth/captcha/get", "/api/v1/system/auth/logout", "/api/v1/system/config/info", "/api/v1/system/user/current/info", "/api/v1/system/notice/available", "/api/v1/system/auth/auto-login/users", "/api/v1/system/auth/auto-login/token", "/api/v1/system/auth/auto-login"]', 'f', 15, '3382317d-a6df-4048-8df4-a5f84dfaa0ee', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('访问IP黑名单', 'ip_black_list', '[]', 'f', 16, '3dd13488-2224-4bae-a1e0-129ee34e7a79', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:46:59.080446', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('网页图标', 'sys_web_favicon', 'http://127.0.0.1:8001/api/v1/static\upload\2026\04\26\logo_20260426134737A693.png', 'f', 3, 'bd5148ef-1df9-486c-a9e6-c7d15e9cd424', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:47:51.757577', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('网站Logo', 'sys_web_logo', 'http://127.0.0.1:8001/api/v1/static\upload\2026\04\26\logo_20260426134735A387.png', 'f', 4, '052ae548-fd29-433d-a6cc-3e575dff2dbd', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:47:51.760864', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('网站名称', 'sys_web_title', 'CRM客户管理', 'f', 1, '3468bae8-f2fb-4a7b-9c22-c92374741c0b', '0', '初始化数据', '2026-04-26 13:46:59.080446', '2026-04-26 13:47:51.854672', 'f', NULL);

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_position";
CREATE TABLE "public"."sys_position" (
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "order" int4 NOT NULL,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."sys_position"."name" IS '岗位名称';
COMMENT ON COLUMN "public"."sys_position"."order" IS '显示排序';
COMMENT ON COLUMN "public"."sys_position"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_position"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_position"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_position"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_position"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_position"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_position"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_position"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."sys_position"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_position"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."sys_position"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."sys_position" IS '岗位表';

-- ----------------------------
-- Records of sys_position
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "order" int4 NOT NULL,
  "data_scope" int4 NOT NULL,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role"."name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."code" IS '角色编码';
COMMENT ON COLUMN "public"."sys_role"."order" IS '显示排序';
COMMENT ON COLUMN "public"."sys_role"."data_scope" IS '数据权限范围(1:仅本人 2:本部门 3:本部门及以下 4:全部 5:自定义)';
COMMENT ON COLUMN "public"."sys_role"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_role"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_role"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_role"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_role"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_role"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_role"."deleted_time" IS '删除时间';
COMMENT ON TABLE "public"."sys_role" IS '角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES ('管理员角色', 'ADMIN', 1, 4, 1, 'd1a7f5ad-205d-455e-ba56-c9d1c42ffa4a', '0', '初始化角色', '2026-04-26 13:46:59.136887', '2026-04-26 13:46:59.136887', 'f', NULL);

-- ----------------------------
-- Table structure for sys_role_depts
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_depts";
CREATE TABLE "public"."sys_role_depts" (
  "role_id" int4 NOT NULL,
  "dept_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_role_depts"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_depts"."dept_id" IS '部门ID';
COMMENT ON TABLE "public"."sys_role_depts" IS '角色部门关联表';

-- ----------------------------
-- Records of sys_role_depts
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menus
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menus";
CREATE TABLE "public"."sys_role_menus" (
  "role_id" int4 NOT NULL,
  "menu_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_role_menus"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_menus"."menu_id" IS '菜单ID';
COMMENT ON TABLE "public"."sys_role_menus" IS '角色菜单关联表';

-- ----------------------------
-- Records of sys_role_menus
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_tenant";
CREATE TABLE "public"."sys_tenant" (
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "start_time" timestamp(6),
  "end_time" timestamp(6),
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_tenant"."name" IS '租户名称';
COMMENT ON COLUMN "public"."sys_tenant"."code" IS '租户编码';
COMMENT ON COLUMN "public"."sys_tenant"."start_time" IS '开始时间';
COMMENT ON COLUMN "public"."sys_tenant"."end_time" IS '结束时间';
COMMENT ON COLUMN "public"."sys_tenant"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_tenant"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_tenant"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_tenant"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_tenant"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_tenant"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_tenant"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_tenant"."deleted_time" IS '删除时间';
COMMENT ON TABLE "public"."sys_tenant" IS '租户表';

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO "public"."sys_tenant" VALUES ('系统租户', 'system', NULL, NULL, 1, '7fdd811e-cdac-4014-9f09-624b35a0a011', '0', '平台默认租户，id 固定为 1', '2026-04-26 13:46:58.890351', '2026-04-26 13:46:58.890351', 'f', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "username" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "mobile" varchar(11) COLLATE "pg_catalog"."default",
  "email" varchar(64) COLLATE "pg_catalog"."default",
  "gender" varchar(1) COLLATE "pg_catalog"."default",
  "avatar" varchar(255) COLLATE "pg_catalog"."default",
  "is_superuser" bool NOT NULL,
  "last_login" timestamptz(6),
  "gitee_login" varchar(32) COLLATE "pg_catalog"."default",
  "github_login" varchar(32) COLLATE "pg_catalog"."default",
  "wx_login" varchar(32) COLLATE "pg_catalog"."default",
  "qq_login" varchar(32) COLLATE "pg_catalog"."default",
  "dept_id" int4,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "tenant_id" int4 NOT NULL,
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名/登录账号';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码哈希';
COMMENT ON COLUMN "public"."sys_user"."name" IS '昵称';
COMMENT ON COLUMN "public"."sys_user"."mobile" IS '手机号';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."gender" IS '性别(0:男 1:女 2:未知)';
COMMENT ON COLUMN "public"."sys_user"."avatar" IS '头像URL地址';
COMMENT ON COLUMN "public"."sys_user"."is_superuser" IS '是否超管';
COMMENT ON COLUMN "public"."sys_user"."last_login" IS '最后登录时间';
COMMENT ON COLUMN "public"."sys_user"."gitee_login" IS 'Gitee登录';
COMMENT ON COLUMN "public"."sys_user"."github_login" IS 'Github登录';
COMMENT ON COLUMN "public"."sys_user"."wx_login" IS '微信登录';
COMMENT ON COLUMN "public"."sys_user"."qq_login" IS 'QQ登录';
COMMENT ON COLUMN "public"."sys_user"."dept_id" IS '部门ID';
COMMENT ON COLUMN "public"."sys_user"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_user"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."sys_user"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."sys_user"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."sys_user"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."sys_user"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."sys_user"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."sys_user"."tenant_id" IS '租户ID';
COMMENT ON COLUMN "public"."sys_user"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."sys_user"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."sys_user"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."sys_user" IS '用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES ('admin', '$2b$12$e2IJgS/cvHgJ0H3G7Xa08OXoXnk6N/NX3IZRtubBDElA0VLZhkNOa', '超级管理员', NULL, NULL, '0', 'https://service.fastapiadmin.com/api/v1/static/image/avatar.png', 'f', '2026-04-26 13:47:20.610564+08', NULL, NULL, NULL, NULL, 1, 1, '722095ba-2dcd-4053-936b-511eab4fbd19', '0', '超级管理员', '2026-04-26 13:46:59.245303', '2026-04-26 13:47:20.629841', 'f', NULL, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_positions
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_positions";
CREATE TABLE "public"."sys_user_positions" (
  "user_id" int4 NOT NULL,
  "position_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_user_positions"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user_positions"."position_id" IS '岗位ID';
COMMENT ON TABLE "public"."sys_user_positions" IS '用户岗位关联表';

-- ----------------------------
-- Records of sys_user_positions
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_roles";
CREATE TABLE "public"."sys_user_roles" (
  "user_id" int4 NOT NULL,
  "role_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_user_roles"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user_roles"."role_id" IS '角色ID';
COMMENT ON TABLE "public"."sys_user_roles" IS '用户角色关联表';

-- ----------------------------
-- Records of sys_user_roles
-- ----------------------------
INSERT INTO "public"."sys_user_roles" VALUES (1, 1);

-- ----------------------------
-- Table structure for task_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_job";
CREATE TABLE "public"."task_job" (
  "job_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "job_name" varchar(128) COLLATE "pg_catalog"."default",
  "trigger_type" varchar(32) COLLATE "pg_catalog"."default",
  "status" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "next_run_time" varchar(64) COLLATE "pg_catalog"."default",
  "job_state" text COLLATE "pg_catalog"."default",
  "result" text COLLATE "pg_catalog"."default",
  "error" text COLLATE "pg_catalog"."default",
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."task_job"."job_id" IS '任务ID';
COMMENT ON COLUMN "public"."task_job"."job_name" IS '任务名称';
COMMENT ON COLUMN "public"."task_job"."trigger_type" IS '触发方式: cron/interval/date/manual';
COMMENT ON COLUMN "public"."task_job"."status" IS '执行状态';
COMMENT ON COLUMN "public"."task_job"."next_run_time" IS '下次执行时间';
COMMENT ON COLUMN "public"."task_job"."job_state" IS '任务状态信息';
COMMENT ON COLUMN "public"."task_job"."result" IS '执行结果';
COMMENT ON COLUMN "public"."task_job"."error" IS '错误信息';
COMMENT ON COLUMN "public"."task_job"."id" IS '主键ID';
COMMENT ON COLUMN "public"."task_job"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."task_job"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."task_job"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."task_job"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."task_job"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."task_job"."deleted_time" IS '删除时间';
COMMENT ON TABLE "public"."task_job" IS '任务执行日志表';

-- ----------------------------
-- Records of task_job
-- ----------------------------

-- ----------------------------
-- Table structure for task_node
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_node";
CREATE TABLE "public"."task_node" (
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "jobstore" varchar(64) COLLATE "pg_catalog"."default",
  "executor" varchar(64) COLLATE "pg_catalog"."default",
  "trigger" varchar(64) COLLATE "pg_catalog"."default",
  "trigger_args" text COLLATE "pg_catalog"."default",
  "func" text COLLATE "pg_catalog"."default",
  "args" text COLLATE "pg_catalog"."default",
  "kwargs" text COLLATE "pg_catalog"."default",
  "coalesce" bool,
  "max_instances" int4,
  "start_date" varchar(64) COLLATE "pg_catalog"."default",
  "end_date" varchar(64) COLLATE "pg_catalog"."default",
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."task_node"."name" IS '节点名称';
COMMENT ON COLUMN "public"."task_node"."code" IS '节点编码';
COMMENT ON COLUMN "public"."task_node"."jobstore" IS '存储器';
COMMENT ON COLUMN "public"."task_node"."executor" IS '执行器';
COMMENT ON COLUMN "public"."task_node"."trigger" IS '触发器';
COMMENT ON COLUMN "public"."task_node"."trigger_args" IS '触发器参数';
COMMENT ON COLUMN "public"."task_node"."func" IS '代码块';
COMMENT ON COLUMN "public"."task_node"."args" IS '位置参数';
COMMENT ON COLUMN "public"."task_node"."kwargs" IS '关键字参数';
COMMENT ON COLUMN "public"."task_node"."coalesce" IS '是否合并运行';
COMMENT ON COLUMN "public"."task_node"."max_instances" IS '最大实例数';
COMMENT ON COLUMN "public"."task_node"."start_date" IS '开始时间';
COMMENT ON COLUMN "public"."task_node"."end_date" IS '结束时间';
COMMENT ON COLUMN "public"."task_node"."id" IS '主键ID';
COMMENT ON COLUMN "public"."task_node"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."task_node"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."task_node"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."task_node"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."task_node"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."task_node"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."task_node"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."task_node"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."task_node"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."task_node"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."task_node" IS '节点类型表';

-- ----------------------------
-- Records of task_node
-- ----------------------------

-- ----------------------------
-- Table structure for task_workflow
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_workflow";
CREATE TABLE "public"."task_workflow" (
  "name" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "workflow_status" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "nodes" json,
  "edges" json,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."task_workflow"."name" IS '流程名称';
COMMENT ON COLUMN "public"."task_workflow"."code" IS '流程编码';
COMMENT ON COLUMN "public"."task_workflow"."workflow_status" IS '流程状态: draft/published/archived';
COMMENT ON COLUMN "public"."task_workflow"."nodes" IS 'Vue Flow nodes JSON';
COMMENT ON COLUMN "public"."task_workflow"."edges" IS 'Vue Flow edges JSON';
COMMENT ON COLUMN "public"."task_workflow"."id" IS '主键ID';
COMMENT ON COLUMN "public"."task_workflow"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."task_workflow"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."task_workflow"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."task_workflow"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."task_workflow"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."task_workflow"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."task_workflow"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."task_workflow"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."task_workflow"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."task_workflow"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."task_workflow" IS '工作流定义表';

-- ----------------------------
-- Records of task_workflow
-- ----------------------------

-- ----------------------------
-- Table structure for task_workflow_node_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_workflow_node_type";
CREATE TABLE "public"."task_workflow_node_type" (
  "name" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "category" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "func" text COLLATE "pg_catalog"."default" NOT NULL,
  "args" text COLLATE "pg_catalog"."default",
  "kwargs" text COLLATE "pg_catalog"."default",
  "sort_order" int4 NOT NULL,
  "is_active" bool NOT NULL,
  "id" int4 NOT NULL,
  "uuid" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_time" timestamp(6) NOT NULL,
  "updated_time" timestamp(6) NOT NULL,
  "is_deleted" bool NOT NULL,
  "deleted_time" timestamp(6),
  "created_id" int4,
  "updated_id" int4,
  "deleted_id" int4
)
;
COMMENT ON COLUMN "public"."task_workflow_node_type"."name" IS '显示名称';
COMMENT ON COLUMN "public"."task_workflow_node_type"."code" IS '节点编码，对应画布 node.type';
COMMENT ON COLUMN "public"."task_workflow_node_type"."category" IS '分类: trigger/action/condition/control';
COMMENT ON COLUMN "public"."task_workflow_node_type"."func" IS 'Python 代码块，须定义 handler(*args,**kwargs)';
COMMENT ON COLUMN "public"."task_workflow_node_type"."args" IS '默认位置参数，逗号分隔';
COMMENT ON COLUMN "public"."task_workflow_node_type"."kwargs" IS '默认关键字参数 JSON';
COMMENT ON COLUMN "public"."task_workflow_node_type"."sort_order" IS '排序';
COMMENT ON COLUMN "public"."task_workflow_node_type"."is_active" IS '是否启用';
COMMENT ON COLUMN "public"."task_workflow_node_type"."id" IS '主键ID';
COMMENT ON COLUMN "public"."task_workflow_node_type"."uuid" IS 'UUID全局唯一标识';
COMMENT ON COLUMN "public"."task_workflow_node_type"."status" IS '状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."task_workflow_node_type"."description" IS '备注/描述';
COMMENT ON COLUMN "public"."task_workflow_node_type"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."task_workflow_node_type"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."task_workflow_node_type"."is_deleted" IS '是否已删除(0:未删除 1:已删除)';
COMMENT ON COLUMN "public"."task_workflow_node_type"."deleted_time" IS '删除时间';
COMMENT ON COLUMN "public"."task_workflow_node_type"."created_id" IS '创建人ID';
COMMENT ON COLUMN "public"."task_workflow_node_type"."updated_id" IS '更新人ID';
COMMENT ON COLUMN "public"."task_workflow_node_type"."deleted_id" IS '删除人ID';
COMMENT ON TABLE "public"."task_workflow_node_type" IS '工作流编排节点类型（非定时任务节点）';

-- ----------------------------
-- Records of task_workflow_node_type
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."app_portal_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_ai_customer_profiles_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_ai_recommendations_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_ai_tags_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_alert_rules_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_approval_records_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_call_records_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_campaign_leads_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_campaigns_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_competitors_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_contact_change_logs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_contact_relations_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_contact_visits_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_contacts_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_contract_invoices_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_contract_items_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_contracts_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_activities_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_addresses_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_attachments_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_change_logs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_duplicate_logs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_health_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_health_scores_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_pool_logs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_profiles_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_satisfaction_surveys_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_tags_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customer_timeline_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_customers_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_data_dicts_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_deliveries_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_follow_records_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_followups_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_import_records_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_invoices_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_joint_followups_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_lead_scores_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_leads_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_marketing_campaigns_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_marketing_channels_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_notifications_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_operation_logs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_opportunities_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_opportunity_products_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_opportunity_stages_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_order_items_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_orders_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_payments_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_pool_transfers_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_price_tiers_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_product_categories_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_product_documents_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_product_price_history_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_product_price_policies_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_product_prices_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_product_skus_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_products_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_quotation_items_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_quotations_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_renewals_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_report_instances_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_report_templates_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_sales_activities_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_sales_targets_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_satisfaction_surveys_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_service_tickets_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_tag_definitions_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_tags_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_tasks_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_test_monitor_report_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_user_extensions_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_visit_records_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_workflow_approvals_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_workflow_logs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."crm_workflow_rules_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."gen_demo01_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."gen_demo_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."gen_table_column_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."gen_table_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dept_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dict_data_id_seq"', 390, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dict_type_id_seq"', 107, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_log_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_menu_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_notice_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_param_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_position_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_role_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_tenant_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_user_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."task_job_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."task_node_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."task_workflow_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."task_workflow_node_type_id_seq"', 1, false);

-- ----------------------------
-- Indexes structure for table app_portal
-- ----------------------------
CREATE INDEX "ix_app_portal_created_id" ON "public"."app_portal" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_app_portal_created_time" ON "public"."app_portal" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_app_portal_deleted_id" ON "public"."app_portal" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_app_portal_deleted_time" ON "public"."app_portal" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_app_portal_id" ON "public"."app_portal" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_app_portal_is_deleted" ON "public"."app_portal" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_app_portal_status" ON "public"."app_portal" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_app_portal_tenant_id" ON "public"."app_portal" USING btree (
  "tenant_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_app_portal_updated_id" ON "public"."app_portal" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_app_portal_updated_time" ON "public"."app_portal" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_app_portal_uuid" ON "public"."app_portal" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table app_portal
-- ----------------------------
ALTER TABLE "public"."app_portal" ADD CONSTRAINT "app_portal_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table apscheduler_jobs
-- ----------------------------
CREATE INDEX "ix_apscheduler_jobs_next_run_time" ON "public"."apscheduler_jobs" USING btree (
  "next_run_time" "pg_catalog"."float8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table apscheduler_jobs
-- ----------------------------
ALTER TABLE "public"."apscheduler_jobs" ADD CONSTRAINT "apscheduler_jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_ai_customer_profiles
-- ----------------------------
CREATE INDEX "idx_crm_ai_customer_profiles_customer_id" ON "public"."crm_ai_customer_profiles" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_deleted_id" ON "public"."crm_ai_customer_profiles" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_deleted_time" ON "public"."crm_ai_customer_profiles" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_dept_id" ON "public"."crm_ai_customer_profiles" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_is_deleted" ON "public"."crm_ai_customer_profiles" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_customer_profiles_owner_id" ON "public"."crm_ai_customer_profiles" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_profiles_customer" ON "public"."crm_ai_customer_profiles" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_profiles_score" ON "public"."crm_ai_customer_profiles" USING btree (
  "overall_score" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_ai_customer_profiles
-- ----------------------------
ALTER TABLE "public"."crm_ai_customer_profiles" ADD CONSTRAINT "crm_ai_customer_profiles_customer_id_key" UNIQUE ("customer_id");

-- ----------------------------
-- Primary Key structure for table crm_ai_customer_profiles
-- ----------------------------
ALTER TABLE "public"."crm_ai_customer_profiles" ADD CONSTRAINT "crm_ai_customer_profiles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_ai_recommendations
-- ----------------------------
CREATE INDEX "idx_crm_ai_recommendations_deleted_id" ON "public"."crm_ai_recommendations" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_deleted_time" ON "public"."crm_ai_recommendations" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_dept_id" ON "public"."crm_ai_recommendations" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_entity" ON "public"."crm_ai_recommendations" USING btree (
  "entity_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "entity_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_ai_recommendations_entity_id" ON "public"."crm_ai_recommendations" USING btree (
  "entity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_is_deleted" ON "public"."crm_ai_recommendations" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_owner_id" ON "public"."crm_ai_recommendations" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_recommendations_type" ON "public"."crm_ai_recommendations" USING btree (
  "recommendation_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_ai_recommendations
-- ----------------------------
ALTER TABLE "public"."crm_ai_recommendations" ADD CONSTRAINT "crm_ai_recommendations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_ai_tags
-- ----------------------------
CREATE INDEX "idx_crm_ai_tags_deleted_id" ON "public"."crm_ai_tags" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_tags_deleted_time" ON "public"."crm_ai_tags" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_tags_dept_id" ON "public"."crm_ai_tags" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_tags_is_deleted" ON "public"."crm_ai_tags" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_ai_tags_owner_id" ON "public"."crm_ai_tags" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_ai_tags
-- ----------------------------
ALTER TABLE "public"."crm_ai_tags" ADD CONSTRAINT "crm_ai_tags_tag_code_key" UNIQUE ("tag_code");

-- ----------------------------
-- Primary Key structure for table crm_ai_tags
-- ----------------------------
ALTER TABLE "public"."crm_ai_tags" ADD CONSTRAINT "crm_ai_tags_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_alert_rules
-- ----------------------------
CREATE INDEX "idx_crm_alert_rules_active" ON "public"."crm_alert_rules" USING btree (
  "is_active" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_code" ON "public"."crm_alert_rules" USING btree (
  "rule_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_dept_id" ON "public"."crm_alert_rules" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_owner_id" ON "public"."crm_alert_rules" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_severity" ON "public"."crm_alert_rules" USING btree (
  "severity" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_alert_rules_type" ON "public"."crm_alert_rules" USING btree (
  "alert_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_alert_rules
-- ----------------------------
ALTER TABLE "public"."crm_alert_rules" ADD CONSTRAINT "crm_alert_rules_rule_code_key" UNIQUE ("rule_code");

-- ----------------------------
-- Primary Key structure for table crm_alert_rules
-- ----------------------------
ALTER TABLE "public"."crm_alert_rules" ADD CONSTRAINT "crm_alert_rules_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_approval_records
-- ----------------------------
CREATE INDEX "idx_crm_approval_records_applicant" ON "public"."crm_approval_records" USING btree (
  "applicant_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_approver" ON "public"."crm_approval_records" USING btree (
  "current_approver_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_dept_id" ON "public"."crm_approval_records" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_no" ON "public"."crm_approval_records" USING btree (
  "approval_no" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_owner_id" ON "public"."crm_approval_records" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_status" ON "public"."crm_approval_records" USING btree (
  "approval_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approval_records_type" ON "public"."crm_approval_records" USING btree (
  "approval_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_approval_records
-- ----------------------------
ALTER TABLE "public"."crm_approval_records" ADD CONSTRAINT "crm_approval_records_approval_no_key" UNIQUE ("approval_no");

-- ----------------------------
-- Primary Key structure for table crm_approval_records
-- ----------------------------
ALTER TABLE "public"."crm_approval_records" ADD CONSTRAINT "crm_approval_records_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_call_records
-- ----------------------------
CREATE INDEX "idx_crm_call_records_call_time" ON "public"."crm_call_records" USING btree (
  "call_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_call_records_call_type" ON "public"."crm_call_records" USING btree (
  "call_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_call_records_customer" ON "public"."crm_call_records" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_call_records_dept_id" ON "public"."crm_call_records" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_call_records_owner_id" ON "public"."crm_call_records" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_call_records
-- ----------------------------
ALTER TABLE "public"."crm_call_records" ADD CONSTRAINT "crm_call_records_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_campaign_leads
-- ----------------------------
CREATE INDEX "idx_campaign_leads_campaign" ON "public"."crm_campaign_leads" USING btree (
  "campaign_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_campaign_leads_converted" ON "public"."crm_campaign_leads" USING btree (
  "is_converted" "pg_catalog"."bool_ops" ASC NULLS LAST
) WHERE is_converted = true;
CREATE INDEX "idx_campaign_leads_engagement" ON "public"."crm_campaign_leads" USING btree (
  "engagement_score" "pg_catalog"."numeric_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_campaign_leads_lead" ON "public"."crm_campaign_leads" USING btree (
  "lead_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_campaign" ON "public"."crm_campaign_leads" USING btree (
  "campaign_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_campaign_id" ON "public"."crm_campaign_leads" USING btree (
  "campaign_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_converted_customer_id" ON "public"."crm_campaign_leads" USING btree (
  "converted_customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_deleted_id" ON "public"."crm_campaign_leads" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_deleted_time" ON "public"."crm_campaign_leads" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_dept_id" ON "public"."crm_campaign_leads" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_is_deleted" ON "public"."crm_campaign_leads" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_lead" ON "public"."crm_campaign_leads" USING btree (
  "lead_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_lead_id" ON "public"."crm_campaign_leads" USING btree (
  "lead_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaign_leads_owner_id" ON "public"."crm_campaign_leads" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_campaign_leads
-- ----------------------------
ALTER TABLE "public"."crm_campaign_leads" ADD CONSTRAINT "crm_campaign_leads_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_campaigns
-- ----------------------------
CREATE INDEX "idx_crm_campaigns_code" ON "public"."crm_campaigns" USING btree (
  "campaign_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_dates" ON "public"."crm_campaigns" USING btree (
  "planned_start_date" "pg_catalog"."date_ops" ASC NULLS LAST,
  "planned_end_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_deleted_id" ON "public"."crm_campaigns" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_deleted_time" ON "public"."crm_campaigns" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_department_id" ON "public"."crm_campaigns" USING btree (
  "department_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_dept_id" ON "public"."crm_campaigns" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_is_deleted" ON "public"."crm_campaigns" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_owner" ON "public"."crm_campaigns" USING btree (
  "owner_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_owner_id" ON "public"."crm_campaigns" USING btree (
  "owner_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_related_campaign_id" ON "public"."crm_campaigns" USING btree (
  "related_campaign_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_status" ON "public"."crm_campaigns" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_campaigns_type" ON "public"."crm_campaigns" USING btree (
  "campaign_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_campaigns
-- ----------------------------
ALTER TABLE "public"."crm_campaigns" ADD CONSTRAINT "crm_campaigns_campaign_code_key" UNIQUE ("campaign_code");

-- ----------------------------
-- Primary Key structure for table crm_campaigns
-- ----------------------------
ALTER TABLE "public"."crm_campaigns" ADD CONSTRAINT "crm_campaigns_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_competitors
-- ----------------------------
CREATE INDEX "idx_crm_competitors_code" ON "public"."crm_competitors" USING btree (
  "competitor_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_competitors_dept_id" ON "public"."crm_competitors" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_competitors_owner_id" ON "public"."crm_competitors" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_competitors_threat_level" ON "public"."crm_competitors" USING btree (
  "threat_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_competitors
-- ----------------------------
ALTER TABLE "public"."crm_competitors" ADD CONSTRAINT "crm_competitors_competitor_code_key" UNIQUE ("competitor_code");

-- ----------------------------
-- Primary Key structure for table crm_competitors
-- ----------------------------
ALTER TABLE "public"."crm_competitors" ADD CONSTRAINT "crm_competitors_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_contact_change_logs
-- ----------------------------
CREATE INDEX "idx_crm_contact_change_logs_contact" ON "public"."crm_contact_change_logs" USING btree (
  "contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "changed_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_contact_change_logs_contact_id" ON "public"."crm_contact_change_logs" USING btree (
  "contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_created_by" ON "public"."crm_contact_change_logs" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_customer" ON "public"."crm_contact_change_logs" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_customer_id" ON "public"."crm_contact_change_logs" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_deleted_id" ON "public"."crm_contact_change_logs" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_deleted_time" ON "public"."crm_contact_change_logs" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_dept_id" ON "public"."crm_contact_change_logs" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_is_deleted" ON "public"."crm_contact_change_logs" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_operator_id" ON "public"."crm_contact_change_logs" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_change_logs_owner_id" ON "public"."crm_contact_change_logs" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_contact_change_logs
-- ----------------------------
ALTER TABLE "public"."crm_contact_change_logs" ADD CONSTRAINT "crm_contact_change_logs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_contact_relations
-- ----------------------------
CREATE INDEX "idx_crm_contact_relations_contact" ON "public"."crm_contact_relations" USING btree (
  "contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_contact_id" ON "public"."crm_contact_relations" USING btree (
  "contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_deleted_id" ON "public"."crm_contact_relations" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_deleted_time" ON "public"."crm_contact_relations" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_dept_id" ON "public"."crm_contact_relations" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_entity" ON "public"."crm_contact_relations" USING btree (
  "related_entity_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "related_entity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_owner_id" ON "public"."crm_contact_relations" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_related" ON "public"."crm_contact_relations" USING btree (
  "related_contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_related_contact_id" ON "public"."crm_contact_relations" USING btree (
  "related_contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_related_entity_id" ON "public"."crm_contact_relations" USING btree (
  "related_entity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_relations_type" ON "public"."crm_contact_relations" USING btree (
  "relation_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_contact_relations
-- ----------------------------
ALTER TABLE "public"."crm_contact_relations" ADD CONSTRAINT "crm_contact_relations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_contact_visits
-- ----------------------------
CREATE INDEX "idx_crm_contact_visits_contact" ON "public"."crm_contact_visits" USING btree (
  "contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "visit_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_contact_visits_contact_id" ON "public"."crm_contact_visits" USING btree (
  "contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_customer" ON "public"."crm_contact_visits" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "visit_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_contact_visits_customer_id" ON "public"."crm_contact_visits" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_deleted_id" ON "public"."crm_contact_visits" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_deleted_time" ON "public"."crm_contact_visits" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_dept_id" ON "public"."crm_contact_visits" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_owner_id" ON "public"."crm_contact_visits" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_visitor" ON "public"."crm_contact_visits" USING btree (
  "visitor_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contact_visits_visitor_id" ON "public"."crm_contact_visits" USING btree (
  "visitor_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_contact_visits
-- ----------------------------
ALTER TABLE "public"."crm_contact_visits" ADD CONSTRAINT "crm_contact_visits_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_contacts
-- ----------------------------
CREATE INDEX "idx_crm_contacts_customer" ON "public"."crm_contacts" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_customer_id" ON "public"."crm_contacts" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_deleted_id" ON "public"."crm_contacts" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_deleted_time" ON "public"."crm_contacts" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_dept_id" ON "public"."crm_contacts" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_name" ON "public"."crm_contacts" USING btree (
  "contact_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_owner_id" ON "public"."crm_contacts" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contacts_primary" ON "public"."crm_contacts" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "is_primary" "pg_catalog"."bool_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_contacts
-- ----------------------------
ALTER TABLE "public"."crm_contacts" ADD CONSTRAINT "crm_contacts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_contract_invoices
-- ----------------------------
CREATE INDEX "idx_crm_contract_invoices_contract" ON "public"."crm_contract_invoices" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_contract_id" ON "public"."crm_contract_invoices" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_date" ON "public"."crm_contract_invoices" USING btree (
  "invoice_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_deleted_id" ON "public"."crm_contract_invoices" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_deleted_time" ON "public"."crm_contract_invoices" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_dept_id" ON "public"."crm_contract_invoices" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_owner_id" ON "public"."crm_contract_invoices" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_payment_plan_id" ON "public"."crm_contract_invoices" USING btree (
  "payment_plan_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_invoices_status" ON "public"."crm_contract_invoices" USING btree (
  "invoice_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_contract_invoices
-- ----------------------------
ALTER TABLE "public"."crm_contract_invoices" ADD CONSTRAINT "crm_contract_invoices_invoice_code_key" UNIQUE ("invoice_code");

-- ----------------------------
-- Primary Key structure for table crm_contract_invoices
-- ----------------------------
ALTER TABLE "public"."crm_contract_invoices" ADD CONSTRAINT "crm_contract_invoices_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_contract_items
-- ----------------------------
CREATE INDEX "idx_crm_contract_items_contract" ON "public"."crm_contract_items" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_contract_id" ON "public"."crm_contract_items" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_created_by" ON "public"."crm_contract_items" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_deleted_id" ON "public"."crm_contract_items" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_deleted_time" ON "public"."crm_contract_items" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_dept_id" ON "public"."crm_contract_items" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_is_deleted" ON "public"."crm_contract_items" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_owner_id" ON "public"."crm_contract_items" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_product" ON "public"."crm_contract_items" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contract_items_product_id" ON "public"."crm_contract_items" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_contract_items
-- ----------------------------
ALTER TABLE "public"."crm_contract_items" ADD CONSTRAINT "crm_contract_items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_contracts
-- ----------------------------
CREATE INDEX "idx_contracts_customer" ON "public"."crm_contracts" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_contracts_opportunity" ON "public"."crm_contracts" USING btree (
  "opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_code" ON "public"."crm_contracts" USING btree (
  "contract_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_customer" ON "public"."crm_contracts" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_customer_id" ON "public"."crm_contracts" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_dates" ON "public"."crm_contracts" USING btree (
  "start_date" "pg_catalog"."date_ops" ASC NULLS LAST,
  "end_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_deleted_id" ON "public"."crm_contracts" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_deleted_time" ON "public"."crm_contracts" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_dept_id" ON "public"."crm_contracts" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_opportunity_id" ON "public"."crm_contracts" USING btree (
  "opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_owner" ON "public"."crm_contracts" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_owner_id" ON "public"."crm_contracts" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_contracts_quotation_id" ON "public"."crm_contracts" USING btree (
  "quotation_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_contracts
-- ----------------------------
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "crm_contracts_contract_code_key" UNIQUE ("contract_code");

-- ----------------------------
-- Primary Key structure for table crm_contracts
-- ----------------------------
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "crm_contracts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_activities
-- ----------------------------
CREATE INDEX "idx_crm_activities_customer" ON "public"."crm_customer_activities" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "activity_date" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_activities_operator" ON "public"."crm_customer_activities" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_activities_type" ON "public"."crm_customer_activities" USING btree (
  "activity_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_created_by" ON "public"."crm_customer_activities" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_customer_id" ON "public"."crm_customer_activities" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_deleted_id" ON "public"."crm_customer_activities" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_deleted_time" ON "public"."crm_customer_activities" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_dept_id" ON "public"."crm_customer_activities" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_is_deleted" ON "public"."crm_customer_activities" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_operator_id" ON "public"."crm_customer_activities" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_owner_id" ON "public"."crm_customer_activities" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_activities_related_id" ON "public"."crm_customer_activities" USING btree (
  "related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_customer_activities
-- ----------------------------
ALTER TABLE "public"."crm_customer_activities" ADD CONSTRAINT "crm_customer_activities_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_addresses
-- ----------------------------
CREATE INDEX "idx_crm_customer_addresses_customer" ON "public"."crm_customer_addresses" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "address_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_customer_id" ON "public"."crm_customer_addresses" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_default" ON "public"."crm_customer_addresses" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "is_default" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_deleted_id" ON "public"."crm_customer_addresses" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_deleted_time" ON "public"."crm_customer_addresses" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_dept_id" ON "public"."crm_customer_addresses" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_addresses_owner_id" ON "public"."crm_customer_addresses" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_customer_addresses
-- ----------------------------
ALTER TABLE "public"."crm_customer_addresses" ADD CONSTRAINT "crm_customer_addresses_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_attachments
-- ----------------------------
CREATE INDEX "idx_crm_customer_attachments_created_by" ON "public"."crm_customer_attachments" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_customer" ON "public"."crm_customer_attachments" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "attachment_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_customer_id" ON "public"."crm_customer_attachments" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_deleted_id" ON "public"."crm_customer_attachments" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_deleted_time" ON "public"."crm_customer_attachments" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_dept_id" ON "public"."crm_customer_attachments" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_owner_id" ON "public"."crm_customer_attachments" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_uploader" ON "public"."crm_customer_attachments" USING btree (
  "uploader_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_attachments_uploader_id" ON "public"."crm_customer_attachments" USING btree (
  "uploader_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_customer_attachments
-- ----------------------------
ALTER TABLE "public"."crm_customer_attachments" ADD CONSTRAINT "crm_customer_attachments_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_change_logs
-- ----------------------------
CREATE INDEX "idx_crm_customer_change_logs_created_by" ON "public"."crm_customer_change_logs" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_customer" ON "public"."crm_customer_change_logs" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "changed_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_customer_change_logs_customer_id" ON "public"."crm_customer_change_logs" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_deleted_id" ON "public"."crm_customer_change_logs" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_deleted_time" ON "public"."crm_customer_change_logs" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_dept_id" ON "public"."crm_customer_change_logs" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_field" ON "public"."crm_customer_change_logs" USING btree (
  "field_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_is_deleted" ON "public"."crm_customer_change_logs" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_operator" ON "public"."crm_customer_change_logs" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_operator_id" ON "public"."crm_customer_change_logs" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_change_logs_owner_id" ON "public"."crm_customer_change_logs" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_customer_change_logs
-- ----------------------------
ALTER TABLE "public"."crm_customer_change_logs" ADD CONSTRAINT "crm_customer_change_logs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_duplicate_logs
-- ----------------------------
CREATE INDEX "idx_crm_customer_duplicate_logs_a" ON "public"."crm_customer_duplicate_logs" USING btree (
  "customer_a_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_b" ON "public"."crm_customer_duplicate_logs" USING btree (
  "customer_b_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_created_by" ON "public"."crm_customer_duplicate_logs" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_customer_a_id" ON "public"."crm_customer_duplicate_logs" USING btree (
  "customer_a_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_customer_b_id" ON "public"."crm_customer_duplicate_logs" USING btree (
  "customer_b_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_deleted_id" ON "public"."crm_customer_duplicate_logs" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_deleted_time" ON "public"."crm_customer_duplicate_logs" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_dept_id" ON "public"."crm_customer_duplicate_logs" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_is_deleted" ON "public"."crm_customer_duplicate_logs" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_owner_id" ON "public"."crm_customer_duplicate_logs" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_duplicate_logs_type" ON "public"."crm_customer_duplicate_logs" USING btree (
  "collision_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_customer_duplicate_logs
-- ----------------------------
ALTER TABLE "public"."crm_customer_duplicate_logs" ADD CONSTRAINT "crm_customer_duplicate_logs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_health
-- ----------------------------
CREATE INDEX "idx_crm_customer_health_created_by" ON "public"."crm_customer_health" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_customer_id" ON "public"."crm_customer_health" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_deleted_id" ON "public"."crm_customer_health" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_deleted_time" ON "public"."crm_customer_health" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_dept_id" ON "public"."crm_customer_health" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_is_deleted" ON "public"."crm_customer_health" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_owner_id" ON "public"."crm_customer_health" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_health_customer" ON "public"."crm_customer_health" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_health_level" ON "public"."crm_customer_health" USING btree (
  "health_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_health_renewal" ON "public"."crm_customer_health" USING btree (
  "renewal_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "contract_end_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_health_score" ON "public"."crm_customer_health" USING btree (
  "health_score" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_customer_health
-- ----------------------------
ALTER TABLE "public"."crm_customer_health" ADD CONSTRAINT "crm_customer_health_customer_id_key" UNIQUE ("customer_id");

-- ----------------------------
-- Primary Key structure for table crm_customer_health
-- ----------------------------
ALTER TABLE "public"."crm_customer_health" ADD CONSTRAINT "crm_customer_health_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_health_scores
-- ----------------------------
CREATE INDEX "idx_crm_customer_health_scores_customer" ON "public"."crm_customer_health_scores" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_customer_id" ON "public"."crm_customer_health_scores" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_date" ON "public"."crm_customer_health_scores" USING btree (
  "score_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_deleted_id" ON "public"."crm_customer_health_scores" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_deleted_time" ON "public"."crm_customer_health_scores" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_dept_id" ON "public"."crm_customer_health_scores" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_is_deleted" ON "public"."crm_customer_health_scores" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_level" ON "public"."crm_customer_health_scores" USING btree (
  "health_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_health_scores_owner_id" ON "public"."crm_customer_health_scores" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_customer_health_scores
-- ----------------------------
ALTER TABLE "public"."crm_customer_health_scores" ADD CONSTRAINT "crm_customer_health_scores_customer_id_score_date_key" UNIQUE ("customer_id", "score_date");

-- ----------------------------
-- Checks structure for table crm_customer_health_scores
-- ----------------------------
ALTER TABLE "public"."crm_customer_health_scores" ADD CONSTRAINT "crm_customer_health_scores_overall_score_check" CHECK (overall_score >= 0 AND overall_score <= 100);

-- ----------------------------
-- Primary Key structure for table crm_customer_health_scores
-- ----------------------------
ALTER TABLE "public"."crm_customer_health_scores" ADD CONSTRAINT "crm_customer_health_scores_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_pool_logs
-- ----------------------------
CREATE INDEX "idx_crm_customer_pool_logs_action" ON "public"."crm_customer_pool_logs" USING btree (
  "action_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_created_by" ON "public"."crm_customer_pool_logs" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_customer" ON "public"."crm_customer_pool_logs" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_customer_id" ON "public"."crm_customer_pool_logs" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_date" ON "public"."crm_customer_pool_logs" USING btree (
  "action_date" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_deleted_id" ON "public"."crm_customer_pool_logs" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_deleted_time" ON "public"."crm_customer_pool_logs" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_from_dept_id" ON "public"."crm_customer_pool_logs" USING btree (
  "from_dept_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_from_user" ON "public"."crm_customer_pool_logs" USING btree (
  "from_user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_from_user_id" ON "public"."crm_customer_pool_logs" USING btree (
  "from_user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_is_deleted" ON "public"."crm_customer_pool_logs" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_operator_id" ON "public"."crm_customer_pool_logs" USING btree (
  "operator_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_to_dept_id" ON "public"."crm_customer_pool_logs" USING btree (
  "to_dept_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_to_user" ON "public"."crm_customer_pool_logs" USING btree (
  "to_user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_pool_logs_to_user_id" ON "public"."crm_customer_pool_logs" USING btree (
  "to_user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_customer_pool_logs
-- ----------------------------
ALTER TABLE "public"."crm_customer_pool_logs" ADD CONSTRAINT "crm_customer_pool_logs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_profiles
-- ----------------------------
CREATE INDEX "idx_crm_customer_profiles_churn" ON "public"."crm_customer_profiles" USING btree (
  "churn_probability" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_customer" ON "public"."crm_customer_profiles" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_customer_id" ON "public"."crm_customer_profiles" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_deleted_id" ON "public"."crm_customer_profiles" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_deleted_time" ON "public"."crm_customer_profiles" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_dept_id" ON "public"."crm_customer_profiles" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_is_deleted" ON "public"."crm_customer_profiles" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_ltv" ON "public"."crm_customer_profiles" USING btree (
  "lifetime_value" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_profiles_owner_id" ON "public"."crm_customer_profiles" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_customer_profiles
-- ----------------------------
ALTER TABLE "public"."crm_customer_profiles" ADD CONSTRAINT "crm_customer_profiles_customer_id_key" UNIQUE ("customer_id");

-- ----------------------------
-- Primary Key structure for table crm_customer_profiles
-- ----------------------------
ALTER TABLE "public"."crm_customer_profiles" ADD CONSTRAINT "crm_customer_profiles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_satisfaction_surveys
-- ----------------------------
CREATE INDEX "idx_crm_customer_satisfaction_surveys_contact_id" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "contact_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_customer" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_customer_id" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_dates" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "sent_date" "pg_catalog"."date_ops" ASC NULLS LAST,
  "completed_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_deleted_id" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_deleted_time" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_dept_id" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_is_deleted" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_nps" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "nps_score" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_order_id" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "order_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_owner_id" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_project_id" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "project_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_satisfaction_surveys_type" ON "public"."crm_customer_satisfaction_surveys" USING btree (
  "survey_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_customer_satisfaction_surveys
-- ----------------------------
ALTER TABLE "public"."crm_customer_satisfaction_surveys" ADD CONSTRAINT "crm_customer_satisfaction_surveys_survey_code_key" UNIQUE ("survey_code");

-- ----------------------------
-- Primary Key structure for table crm_customer_satisfaction_surveys
-- ----------------------------
ALTER TABLE "public"."crm_customer_satisfaction_surveys" ADD CONSTRAINT "crm_customer_satisfaction_surveys_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_tags
-- ----------------------------
CREATE INDEX "idx_crm_customer_tags_customer" ON "public"."crm_customer_tags" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_customer_id" ON "public"."crm_customer_tags" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_deleted_id" ON "public"."crm_customer_tags" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_deleted_time" ON "public"."crm_customer_tags" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_dept_id" ON "public"."crm_customer_tags" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_owner_id" ON "public"."crm_customer_tags" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_source" ON "public"."crm_customer_tags" USING btree (
  "tag_source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_tag" ON "public"."crm_customer_tags" USING btree (
  "tag_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_tags_tag_id" ON "public"."crm_customer_tags" USING btree (
  "tag_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_customer_tags
-- ----------------------------
ALTER TABLE "public"."crm_customer_tags" ADD CONSTRAINT "crm_customer_tags_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customer_timeline
-- ----------------------------
CREATE INDEX "idx_crm_customer_timeline_customer" ON "public"."crm_customer_timeline" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_customer_timeline_customer_id" ON "public"."crm_customer_timeline" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_deleted_id" ON "public"."crm_customer_timeline" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_deleted_time" ON "public"."crm_customer_timeline" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_dept_id" ON "public"."crm_customer_timeline" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_is_deleted" ON "public"."crm_customer_timeline" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_operator_id" ON "public"."crm_customer_timeline" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_owner_id" ON "public"."crm_customer_timeline" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_related" ON "public"."crm_customer_timeline" USING btree (
  "related_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_related_id" ON "public"."crm_customer_timeline" USING btree (
  "related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customer_timeline_type" ON "public"."crm_customer_timeline" USING btree (
  "event_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_customer_timeline
-- ----------------------------
ALTER TABLE "public"."crm_customer_timeline" ADD CONSTRAINT "crm_customer_timeline_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_customers
-- ----------------------------
CREATE INDEX "idx_crm_customers_churn" ON "public"."crm_customers" USING btree (
  "churn_risk" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_deleted_id" ON "public"."crm_customers" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_deleted_time" ON "public"."crm_customers" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_department_id" ON "public"."crm_customers" USING btree (
  "department_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_dept" ON "public"."crm_customers" USING btree (
  "department_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_dept_id" ON "public"."crm_customers" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_health" ON "public"."crm_customers" USING btree (
  "health_score" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_is_deleted" ON "public"."crm_customers" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_lead_id" ON "public"."crm_customers" USING btree (
  "lead_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_level" ON "public"."crm_customers" USING btree (
  "customer_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_owner" ON "public"."crm_customers" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_owner_id" ON "public"."crm_customers" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_parent" ON "public"."crm_customers" USING btree (
  "parent_customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_protection" ON "public"."crm_customers" USING btree (
  "protection_deadline" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_scale" ON "public"."crm_customers" USING btree (
  "scale" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_segment" ON "public"."crm_customers" USING btree (
  "customer_segment" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_customers_status" ON "public"."crm_customers" USING btree (
  "customer_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_customers_lead" ON "public"."crm_customers" USING btree (
  "lead_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_customers_owner" ON "public"."crm_customers" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_customers
-- ----------------------------
ALTER TABLE "public"."crm_customers" ADD CONSTRAINT "crm_customers_customer_code_key" UNIQUE ("customer_code");

-- ----------------------------
-- Checks structure for table crm_customers
-- ----------------------------
ALTER TABLE "public"."crm_customers" ADD CONSTRAINT "crm_customers_rating_check" CHECK (rating >= 1 AND rating <= 5);

-- ----------------------------
-- Primary Key structure for table crm_customers
-- ----------------------------
ALTER TABLE "public"."crm_customers" ADD CONSTRAINT "crm_customers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_data_dicts
-- ----------------------------
CREATE INDEX "idx_crm_data_dicts_code" ON "public"."crm_data_dicts" USING btree (
  "dict_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_data_dicts_deleted_id" ON "public"."crm_data_dicts" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_data_dicts_deleted_time" ON "public"."crm_data_dicts" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_data_dicts_dept_id" ON "public"."crm_data_dicts" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_data_dicts_owner_id" ON "public"."crm_data_dicts" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_data_dicts_parent" ON "public"."crm_data_dicts" USING btree (
  "parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_data_dicts_parent_id" ON "public"."crm_data_dicts" USING btree (
  "parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_data_dicts_type" ON "public"."crm_data_dicts" USING btree (
  "dict_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "dict_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_data_dicts
-- ----------------------------
ALTER TABLE "public"."crm_data_dicts" ADD CONSTRAINT "crm_data_dicts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_deliveries
-- ----------------------------
CREATE INDEX "idx_crm_deliveries_code" ON "public"."crm_deliveries" USING btree (
  "delivery_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_date" ON "public"."crm_deliveries" USING btree (
  "delivery_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_deleted_id" ON "public"."crm_deliveries" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_deleted_time" ON "public"."crm_deliveries" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_dept_id" ON "public"."crm_deliveries" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_is_deleted" ON "public"."crm_deliveries" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_order" ON "public"."crm_deliveries" USING btree (
  "order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_order_id" ON "public"."crm_deliveries" USING btree (
  "order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_owner_id" ON "public"."crm_deliveries" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_deliveries_status" ON "public"."crm_deliveries" USING btree (
  "delivery_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_deliveries
-- ----------------------------
ALTER TABLE "public"."crm_deliveries" ADD CONSTRAINT "crm_deliveries_delivery_code_key" UNIQUE ("delivery_code");

-- ----------------------------
-- Primary Key structure for table crm_deliveries
-- ----------------------------
ALTER TABLE "public"."crm_deliveries" ADD CONSTRAINT "crm_deliveries_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_follow_records
-- ----------------------------
CREATE INDEX "idx_crm_follow_records_contact_id" ON "public"."crm_follow_records" USING btree (
  "contact_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_customer" ON "public"."crm_follow_records" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_customer_id" ON "public"."crm_follow_records" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_date" ON "public"."crm_follow_records" USING btree (
  "created_time" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_deleted_id" ON "public"."crm_follow_records" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_deleted_time" ON "public"."crm_follow_records" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_dept_id" ON "public"."crm_follow_records" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_is_deleted" ON "public"."crm_follow_records" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_opportunity" ON "public"."crm_follow_records" USING btree (
  "opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_opportunity_id" ON "public"."crm_follow_records" USING btree (
  "opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_owner" ON "public"."crm_follow_records" USING btree (
  "created_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_owner_id" ON "public"."crm_follow_records" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_follow_records_type" ON "public"."crm_follow_records" USING btree (
  "follow_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_follow_records
-- ----------------------------
ALTER TABLE "public"."crm_follow_records" ADD CONSTRAINT "crm_follow_records_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_followups
-- ----------------------------
CREATE INDEX "idx_crm_followups_contact_id" ON "public"."crm_followups" USING btree (
  "contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_creator" ON "public"."crm_followups" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_customer" ON "public"."crm_followups" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "followup_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_followups_customer_id" ON "public"."crm_followups" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_date" ON "public"."crm_followups" USING btree (
  "followup_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_deleted_id" ON "public"."crm_followups" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_deleted_time" ON "public"."crm_followups" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_dept_id" ON "public"."crm_followups" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_owner_id" ON "public"."crm_followups" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_followups_type" ON "public"."crm_followups" USING btree (
  "followup_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_followups
-- ----------------------------
ALTER TABLE "public"."crm_followups" ADD CONSTRAINT "crm_followups_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_import_records
-- ----------------------------
CREATE INDEX "idx_crm_import_records_creator" ON "public"."crm_import_records" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_import_records_deleted_id" ON "public"."crm_import_records" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_deleted_time" ON "public"."crm_import_records" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_dept_id" ON "public"."crm_import_records" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_is_deleted" ON "public"."crm_import_records" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_owner_id" ON "public"."crm_import_records" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_status" ON "public"."crm_import_records" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_import_records_type" ON "public"."crm_import_records" USING btree (
  "import_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "created_time" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);

-- ----------------------------
-- Primary Key structure for table crm_import_records
-- ----------------------------
ALTER TABLE "public"."crm_import_records" ADD CONSTRAINT "crm_import_records_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_invoices
-- ----------------------------
CREATE INDEX "idx_crm_invoices_contract_id" ON "public"."crm_invoices" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_customer_id" ON "public"."crm_invoices" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_deleted_id" ON "public"."crm_invoices" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_deleted_time" ON "public"."crm_invoices" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_dept_id" ON "public"."crm_invoices" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_is_deleted" ON "public"."crm_invoices" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_order_id" ON "public"."crm_invoices" USING btree (
  "order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_invoices_owner_id" ON "public"."crm_invoices" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_invoices_contract" ON "public"."crm_invoices" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_invoices_customer" ON "public"."crm_invoices" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_invoices
-- ----------------------------
ALTER TABLE "public"."crm_invoices" ADD CONSTRAINT "crm_invoices_invoice_code_key" UNIQUE ("invoice_code");

-- ----------------------------
-- Primary Key structure for table crm_invoices
-- ----------------------------
ALTER TABLE "public"."crm_invoices" ADD CONSTRAINT "crm_invoices_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_joint_followups
-- ----------------------------
CREATE INDEX "idx_crm_joint_followups_deleted_id" ON "public"."crm_joint_followups" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_deleted_time" ON "public"."crm_joint_followups" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_dept_id" ON "public"."crm_joint_followups" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_is_deleted" ON "public"."crm_joint_followups" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_opportunity" ON "public"."crm_joint_followups" USING btree (
  "opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_opportunity_id" ON "public"."crm_joint_followups" USING btree (
  "opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_owner_id" ON "public"."crm_joint_followups" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_user" ON "public"."crm_joint_followups" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_joint_followups_user_id" ON "public"."crm_joint_followups" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_joint_followups_opportunity" ON "public"."crm_joint_followups" USING btree (
  "opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_joint_followups_role" ON "public"."crm_joint_followups" USING btree (
  "role_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_joint_followups_status" ON "public"."crm_joint_followups" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_joint_followups_user" ON "public"."crm_joint_followups" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_joint_followups
-- ----------------------------
ALTER TABLE "public"."crm_joint_followups" ADD CONSTRAINT "crm_joint_followups_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_lead_scores
-- ----------------------------
CREATE INDEX "idx_crm_lead_scores_created_by" ON "public"."crm_lead_scores" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_deleted_id" ON "public"."crm_lead_scores" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_deleted_time" ON "public"."crm_lead_scores" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_dept_id" ON "public"."crm_lead_scores" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_grade" ON "public"."crm_lead_scores" USING btree (
  "score_grade" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_is_deleted" ON "public"."crm_lead_scores" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_lead" ON "public"."crm_lead_scores" USING btree (
  "lead_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_lead_id" ON "public"."crm_lead_scores" USING btree (
  "lead_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_owner_id" ON "public"."crm_lead_scores" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_qualified" ON "public"."crm_lead_scores" USING btree (
  "is_qualified" "pg_catalog"."bool_ops" ASC NULLS LAST,
  "qualified_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_lead_scores_total" ON "public"."crm_lead_scores" USING btree (
  "total_score" "pg_catalog"."int4_ops" DESC NULLS FIRST
);

-- ----------------------------
-- Primary Key structure for table crm_lead_scores
-- ----------------------------
ALTER TABLE "public"."crm_lead_scores" ADD CONSTRAINT "crm_lead_scores_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_leads
-- ----------------------------
CREATE INDEX "idx_crm_leads_campaign_id" ON "public"."crm_leads" USING btree (
  "campaign_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_code" ON "public"."crm_leads" USING btree (
  "lead_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_converted_customer_id" ON "public"."crm_leads" USING btree (
  "converted_customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_deleted_id" ON "public"."crm_leads" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_deleted_time" ON "public"."crm_leads" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_dept_id" ON "public"."crm_leads" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_duplicate" ON "public"."crm_leads" USING btree (
  "duplicate_check_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_owner" ON "public"."crm_leads" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_owner_id" ON "public"."crm_leads" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_score" ON "public"."crm_leads" USING btree (
  "score" "pg_catalog"."int4_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_leads_source" ON "public"."crm_leads" USING btree (
  "source" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_leads_status" ON "public"."crm_leads" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_leads
-- ----------------------------
ALTER TABLE "public"."crm_leads" ADD CONSTRAINT "crm_leads_lead_code_key" UNIQUE ("lead_code");

-- ----------------------------
-- Primary Key structure for table crm_leads
-- ----------------------------
ALTER TABLE "public"."crm_leads" ADD CONSTRAINT "crm_leads_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_marketing_campaigns
-- ----------------------------
CREATE INDEX "idx_crm_marketing_campaigns_deleted_id" ON "public"."crm_marketing_campaigns" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_campaigns_deleted_time" ON "public"."crm_marketing_campaigns" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_campaigns_dept_id" ON "public"."crm_marketing_campaigns" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_campaigns_owner_id" ON "public"."crm_marketing_campaigns" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_marketing_campaigns
-- ----------------------------
ALTER TABLE "public"."crm_marketing_campaigns" ADD CONSTRAINT "crm_marketing_campaigns_campaign_code_key" UNIQUE ("campaign_code");

-- ----------------------------
-- Primary Key structure for table crm_marketing_campaigns
-- ----------------------------
ALTER TABLE "public"."crm_marketing_campaigns" ADD CONSTRAINT "crm_marketing_campaigns_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_marketing_channels
-- ----------------------------
CREATE INDEX "idx_crm_marketing_channels_deleted_id" ON "public"."crm_marketing_channels" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_deleted_time" ON "public"."crm_marketing_channels" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_dept_id" ON "public"."crm_marketing_channels" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_is_deleted" ON "public"."crm_marketing_channels" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_owner_id" ON "public"."crm_marketing_channels" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_parent" ON "public"."crm_marketing_channels" USING btree (
  "parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_parent_id" ON "public"."crm_marketing_channels" USING btree (
  "parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_marketing_channels_type" ON "public"."crm_marketing_channels" USING btree (
  "channel_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_marketing_channels
-- ----------------------------
ALTER TABLE "public"."crm_marketing_channels" ADD CONSTRAINT "crm_marketing_channels_channel_code_key" UNIQUE ("channel_code");

-- ----------------------------
-- Primary Key structure for table crm_marketing_channels
-- ----------------------------
ALTER TABLE "public"."crm_marketing_channels" ADD CONSTRAINT "crm_marketing_channels_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_notifications
-- ----------------------------
CREATE INDEX "idx_crm_notifications_created_by" ON "public"."crm_notifications" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_deleted_id" ON "public"."crm_notifications" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_deleted_time" ON "public"."crm_notifications" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_dept_id" ON "public"."crm_notifications" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_is_deleted" ON "public"."crm_notifications" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_owner_id" ON "public"."crm_notifications" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_related_id" ON "public"."crm_notifications" USING btree (
  "related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_type" ON "public"."crm_notifications" USING btree (
  "notification_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_notifications_user" ON "public"."crm_notifications" USING btree (
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "is_read" "pg_catalog"."bool_ops" ASC NULLS LAST,
  "sent_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_notifications_user_id" ON "public"."crm_notifications" USING btree (
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_notifications
-- ----------------------------
ALTER TABLE "public"."crm_notifications" ADD CONSTRAINT "crm_notifications_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_operation_logs
-- ----------------------------
CREATE INDEX "idx_crm_operation_logs_created_by" ON "public"."crm_operation_logs" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_deleted_id" ON "public"."crm_operation_logs" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_deleted_time" ON "public"."crm_operation_logs" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_dept_id" ON "public"."crm_operation_logs" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_is_deleted" ON "public"."crm_operation_logs" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_module" ON "public"."crm_operation_logs" USING btree (
  "module" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "action" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_owner_id" ON "public"."crm_operation_logs" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_status" ON "public"."crm_operation_logs" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_target" ON "public"."crm_operation_logs" USING btree (
  "target_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "target_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_target_id" ON "public"."crm_operation_logs" USING btree (
  "target_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_operation_logs_time" ON "public"."crm_operation_logs" USING btree (
  "operated_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_operation_logs_user" ON "public"."crm_operation_logs" USING btree (
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "operated_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_operation_logs_user_id" ON "public"."crm_operation_logs" USING btree (
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_operation_logs
-- ----------------------------
ALTER TABLE "public"."crm_operation_logs" ADD CONSTRAINT "crm_operation_logs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_opportunities
-- ----------------------------
CREATE INDEX "idx_crm_opportunities_close_date" ON "public"."crm_opportunities" USING btree (
  "expected_close_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_code" ON "public"."crm_opportunities" USING btree (
  "opportunity_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_customer" ON "public"."crm_opportunities" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_customer_id" ON "public"."crm_opportunities" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_deleted_id" ON "public"."crm_opportunities" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_deleted_time" ON "public"."crm_opportunities" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_dept_id" ON "public"."crm_opportunities" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_owner" ON "public"."crm_opportunities" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_owner_id" ON "public"."crm_opportunities" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunities_stage" ON "public"."crm_opportunities" USING btree (
  "stage" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opportunities_customer" ON "public"."crm_opportunities" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_opportunities
-- ----------------------------
ALTER TABLE "public"."crm_opportunities" ADD CONSTRAINT "crm_opportunities_opportunity_code_key" UNIQUE ("opportunity_code");

-- ----------------------------
-- Primary Key structure for table crm_opportunities
-- ----------------------------
ALTER TABLE "public"."crm_opportunities" ADD CONSTRAINT "crm_opportunities_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_opportunity_products
-- ----------------------------
CREATE INDEX "idx_crm_opportunity_products_deleted_id" ON "public"."crm_opportunity_products" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_deleted_time" ON "public"."crm_opportunity_products" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_dept_id" ON "public"."crm_opportunity_products" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_is_deleted" ON "public"."crm_opportunity_products" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_opportunity" ON "public"."crm_opportunity_products" USING btree (
  "opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_opportunity_id" ON "public"."crm_opportunity_products" USING btree (
  "opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_owner_id" ON "public"."crm_opportunity_products" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_product" ON "public"."crm_opportunity_products" USING btree (
  "product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_products_product_id" ON "public"."crm_opportunity_products" USING btree (
  "product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opp_products_amount" ON "public"."crm_opportunity_products" USING btree (
  "estimated_amount" "pg_catalog"."numeric_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opp_products_opportunity" ON "public"."crm_opportunity_products" USING btree (
  "opportunity_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_opp_products_product" ON "public"."crm_opportunity_products" USING btree (
  "product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_opportunity_products
-- ----------------------------
ALTER TABLE "public"."crm_opportunity_products" ADD CONSTRAINT "crm_opportunity_products_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_opportunity_stages
-- ----------------------------
CREATE INDEX "idx_crm_opportunity_stages_deleted_id" ON "public"."crm_opportunity_stages" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_deleted_time" ON "public"."crm_opportunity_stages" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_dept_id" ON "public"."crm_opportunity_stages" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_is_deleted" ON "public"."crm_opportunity_stages" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_owner_id" ON "public"."crm_opportunity_stages" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_sequence" ON "public"."crm_opportunity_stages" USING btree (
  "stage_sequence" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_opportunity_stages_status" ON "public"."crm_opportunity_stages" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_opportunity_stages
-- ----------------------------
ALTER TABLE "public"."crm_opportunity_stages" ADD CONSTRAINT "crm_opportunity_stages_stage_code_key" UNIQUE ("stage_code");

-- ----------------------------
-- Primary Key structure for table crm_opportunity_stages
-- ----------------------------
ALTER TABLE "public"."crm_opportunity_stages" ADD CONSTRAINT "crm_opportunity_stages_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_order_items
-- ----------------------------
CREATE INDEX "idx_crm_order_items_deleted_id" ON "public"."crm_order_items" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_deleted_time" ON "public"."crm_order_items" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_delivery" ON "public"."crm_order_items" USING btree (
  "delivery_date" "pg_catalog"."date_ops" ASC NULLS LAST,
  "production_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_dept_id" ON "public"."crm_order_items" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_order" ON "public"."crm_order_items" USING btree (
  "order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_order_id" ON "public"."crm_order_items" USING btree (
  "order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_owner_id" ON "public"."crm_order_items" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_product" ON "public"."crm_order_items" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_product_id" ON "public"."crm_order_items" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_sku" ON "public"."crm_order_items" USING btree (
  "sku_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_order_items_sku_id" ON "public"."crm_order_items" USING btree (
  "sku_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_order_items
-- ----------------------------
ALTER TABLE "public"."crm_order_items" ADD CONSTRAINT "crm_order_items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_orders
-- ----------------------------
CREATE INDEX "idx_crm_orders_code" ON "public"."crm_orders" USING btree (
  "order_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_contract" ON "public"."crm_orders" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_contract_id" ON "public"."crm_orders" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_customer" ON "public"."crm_orders" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "order_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_orders_customer_id" ON "public"."crm_orders" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_deleted_id" ON "public"."crm_orders" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_deleted_time" ON "public"."crm_orders" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_dept_id" ON "public"."crm_orders" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_owner_id" ON "public"."crm_orders" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_orders_status" ON "public"."crm_orders" USING btree (
  "order_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "payment_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_orders_contract" ON "public"."crm_orders" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_orders_customer" ON "public"."crm_orders" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_orders
-- ----------------------------
ALTER TABLE "public"."crm_orders" ADD CONSTRAINT "crm_orders_order_code_key" UNIQUE ("order_code");

-- ----------------------------
-- Primary Key structure for table crm_orders
-- ----------------------------
ALTER TABLE "public"."crm_orders" ADD CONSTRAINT "crm_orders_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_payments
-- ----------------------------
CREATE INDEX "idx_crm_payments_code" ON "public"."crm_payments" USING btree (
  "payment_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_contract" ON "public"."crm_payments" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "payment_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_payments_contract_id" ON "public"."crm_payments" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_customer" ON "public"."crm_payments" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "payment_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_payments_customer_id" ON "public"."crm_payments" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_date" ON "public"."crm_payments" USING btree (
  "payment_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_deleted_id" ON "public"."crm_payments" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_deleted_time" ON "public"."crm_payments" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_dept_id" ON "public"."crm_payments" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_invoice_id" ON "public"."crm_payments" USING btree (
  "invoice_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_method" ON "public"."crm_payments" USING btree (
  "payment_method" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_order" ON "public"."crm_payments" USING btree (
  "order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_order_id" ON "public"."crm_payments" USING btree (
  "order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_owner_id" ON "public"."crm_payments" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_payment_plan_id" ON "public"."crm_payments" USING btree (
  "payment_plan_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_plan" ON "public"."crm_payments" USING btree (
  "payment_plan_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_payments_status" ON "public"."crm_payments" USING btree (
  "payment_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_payments_order" ON "public"."crm_payments" USING btree (
  "order_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_payments
-- ----------------------------
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "crm_payments_payment_code_key" UNIQUE ("payment_code");

-- ----------------------------
-- Primary Key structure for table crm_payments
-- ----------------------------
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "crm_payments_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_pool_transfers
-- ----------------------------
CREATE INDEX "idx_crm_pool_transfers_created_by" ON "public"."crm_pool_transfers" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_customer" ON "public"."crm_pool_transfers" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_customer_id" ON "public"."crm_pool_transfers" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_deleted_id" ON "public"."crm_pool_transfers" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_deleted_time" ON "public"."crm_pool_transfers" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_from_owner_id" ON "public"."crm_pool_transfers" USING btree (
  "from_owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_is_deleted" ON "public"."crm_pool_transfers" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_operator" ON "public"."crm_pool_transfers" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_operator_id" ON "public"."crm_pool_transfers" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_pool_transfers_time" ON "public"."crm_pool_transfers" USING btree (
  "transferred_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_pool_transfers_to_owner_id" ON "public"."crm_pool_transfers" USING btree (
  "to_owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_pool_transfers
-- ----------------------------
ALTER TABLE "public"."crm_pool_transfers" ADD CONSTRAINT "crm_pool_transfers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_price_tiers
-- ----------------------------
CREATE INDEX "idx_crm_price_tiers_code" ON "public"."crm_price_tiers" USING btree (
  "tier_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_deleted_id" ON "public"."crm_price_tiers" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_deleted_time" ON "public"."crm_price_tiers" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_dept_id" ON "public"."crm_price_tiers" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_is_deleted" ON "public"."crm_price_tiers" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_level" ON "public"."crm_price_tiers" USING btree (
  "customer_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_price_tiers_owner_id" ON "public"."crm_price_tiers" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_price_tiers
-- ----------------------------
ALTER TABLE "public"."crm_price_tiers" ADD CONSTRAINT "crm_price_tiers_tier_code_key" UNIQUE ("tier_code");

-- ----------------------------
-- Primary Key structure for table crm_price_tiers
-- ----------------------------
ALTER TABLE "public"."crm_price_tiers" ADD CONSTRAINT "crm_price_tiers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_product_categories
-- ----------------------------
CREATE INDEX "idx_crm_product_categories_deleted_id" ON "public"."crm_product_categories" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_deleted_time" ON "public"."crm_product_categories" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_dept_id" ON "public"."crm_product_categories" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_is_deleted" ON "public"."crm_product_categories" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_level" ON "public"."crm_product_categories" USING btree (
  "level" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_owner_id" ON "public"."crm_product_categories" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_parent" ON "public"."crm_product_categories" USING btree (
  "parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_categories_parent_id" ON "public"."crm_product_categories" USING btree (
  "parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_product_categories
-- ----------------------------
ALTER TABLE "public"."crm_product_categories" ADD CONSTRAINT "crm_product_categories_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_product_documents
-- ----------------------------
CREATE INDEX "idx_crm_product_documents_deleted_id" ON "public"."crm_product_documents" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_deleted_time" ON "public"."crm_product_documents" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_dept_id" ON "public"."crm_product_documents" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_owner_id" ON "public"."crm_product_documents" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_product" ON "public"."crm_product_documents" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "is_latest" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_product_id" ON "public"."crm_product_documents" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_sku_id" ON "public"."crm_product_documents" USING btree (
  "sku_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_documents_type" ON "public"."crm_product_documents" USING btree (
  "doc_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_product_documents
-- ----------------------------
ALTER TABLE "public"."crm_product_documents" ADD CONSTRAINT "crm_product_documents_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_product_price_history
-- ----------------------------
CREATE INDEX "idx_crm_product_price_history_created_by" ON "public"."crm_product_price_history" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_deleted_id" ON "public"."crm_product_price_history" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_deleted_time" ON "public"."crm_product_price_history" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_dept_id" ON "public"."crm_product_price_history" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_is_deleted" ON "public"."crm_product_price_history" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_operator" ON "public"."crm_product_price_history" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_operator_id" ON "public"."crm_product_price_history" USING btree (
  "operator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_owner_id" ON "public"."crm_product_price_history" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_history_product" ON "public"."crm_product_price_history" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "effective_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_product_price_history_product_id" ON "public"."crm_product_price_history" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_product_price_history
-- ----------------------------
ALTER TABLE "public"."crm_product_price_history" ADD CONSTRAINT "crm_product_price_history_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_product_price_policies
-- ----------------------------
CREATE INDEX "idx_crm_product_price_policies_customer" ON "public"."crm_product_price_policies" USING btree (
  "customer_level" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_customer_id" ON "public"."crm_product_price_policies" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_deleted_id" ON "public"."crm_product_price_policies" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_deleted_time" ON "public"."crm_product_price_policies" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_dept_id" ON "public"."crm_product_price_policies" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_owner_id" ON "public"."crm_product_price_policies" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_product" ON "public"."crm_product_price_policies" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_product_id" ON "public"."crm_product_price_policies" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_sku_id" ON "public"."crm_product_price_policies" USING btree (
  "sku_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_price_policies_type" ON "public"."crm_product_price_policies" USING btree (
  "policy_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_product_price_policies
-- ----------------------------
ALTER TABLE "public"."crm_product_price_policies" ADD CONSTRAINT "crm_product_price_policies_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_product_prices
-- ----------------------------
CREATE INDEX "idx_crm_product_prices_customer" ON "public"."crm_product_prices" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_customer_id" ON "public"."crm_product_prices" USING btree (
  "customer_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_deleted_id" ON "public"."crm_product_prices" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_deleted_time" ON "public"."crm_product_prices" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_dept_id" ON "public"."crm_product_prices" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_effective" ON "public"."crm_product_prices" USING btree (
  "effective_from" "pg_catalog"."timestamptz_ops" ASC NULLS LAST,
  "effective_to" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_is_deleted" ON "public"."crm_product_prices" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_owner_id" ON "public"."crm_product_prices" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_product" ON "public"."crm_product_prices" USING btree (
  "product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_product_id" ON "public"."crm_product_prices" USING btree (
  "product_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_sku" ON "public"."crm_product_prices" USING btree (
  "sku_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_sku_id" ON "public"."crm_product_prices" USING btree (
  "sku_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_prices_type" ON "public"."crm_product_prices" USING btree (
  "price_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_product_prices
-- ----------------------------
ALTER TABLE "public"."crm_product_prices" ADD CONSTRAINT "crm_product_prices_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_product_skus
-- ----------------------------
CREATE INDEX "idx_crm_product_skus_code" ON "public"."crm_product_skus" USING btree (
  "sku_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_deleted_id" ON "public"."crm_product_skus" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_deleted_time" ON "public"."crm_product_skus" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_dept_id" ON "public"."crm_product_skus" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_owner_id" ON "public"."crm_product_skus" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_product" ON "public"."crm_product_skus" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_product_skus_product_id" ON "public"."crm_product_skus" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_product_skus
-- ----------------------------
ALTER TABLE "public"."crm_product_skus" ADD CONSTRAINT "crm_product_skus_sku_code_key" UNIQUE ("sku_code");

-- ----------------------------
-- Primary Key structure for table crm_product_skus
-- ----------------------------
ALTER TABLE "public"."crm_product_skus" ADD CONSTRAINT "crm_product_skus_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_products
-- ----------------------------
CREATE INDEX "idx_crm_products_category" ON "public"."crm_products" USING btree (
  "category_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_category_id" ON "public"."crm_products" USING btree (
  "category_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_code" ON "public"."crm_products" USING btree (
  "product_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_deleted_id" ON "public"."crm_products" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_deleted_time" ON "public"."crm_products" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_dept_id" ON "public"."crm_products" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_name" ON "public"."crm_products" USING btree (
  "product_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_owner_id" ON "public"."crm_products" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_products_type" ON "public"."crm_products" USING btree (
  "product_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_products
-- ----------------------------
ALTER TABLE "public"."crm_products" ADD CONSTRAINT "crm_products_product_code_key" UNIQUE ("product_code");

-- ----------------------------
-- Primary Key structure for table crm_products
-- ----------------------------
ALTER TABLE "public"."crm_products" ADD CONSTRAINT "crm_products_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_quotation_items
-- ----------------------------
CREATE INDEX "idx_crm_quotation_items_deleted_id" ON "public"."crm_quotation_items" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_deleted_time" ON "public"."crm_quotation_items" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_dept_id" ON "public"."crm_quotation_items" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_is_deleted" ON "public"."crm_quotation_items" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_owner_id" ON "public"."crm_quotation_items" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_product_id" ON "public"."crm_quotation_items" USING btree (
  "product_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_quotation" ON "public"."crm_quotation_items" USING btree (
  "quotation_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotation_items_quotation_id" ON "public"."crm_quotation_items" USING btree (
  "quotation_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_quotation_items
-- ----------------------------
ALTER TABLE "public"."crm_quotation_items" ADD CONSTRAINT "crm_quotation_items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_quotations
-- ----------------------------
CREATE INDEX "idx_crm_quotations_code" ON "public"."crm_quotations" USING btree (
  "quotation_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_converted_contract_id" ON "public"."crm_quotations" USING btree (
  "converted_contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_customer" ON "public"."crm_quotations" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_customer_id" ON "public"."crm_quotations" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_deleted_id" ON "public"."crm_quotations" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_deleted_time" ON "public"."crm_quotations" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_dept_id" ON "public"."crm_quotations" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_opportunity_id" ON "public"."crm_quotations" USING btree (
  "opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_owner_id" ON "public"."crm_quotations" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_quotations_status" ON "public"."crm_quotations" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_quotations
-- ----------------------------
ALTER TABLE "public"."crm_quotations" ADD CONSTRAINT "crm_quotations_quotation_code_key" UNIQUE ("quotation_code");

-- ----------------------------
-- Primary Key structure for table crm_quotations
-- ----------------------------
ALTER TABLE "public"."crm_quotations" ADD CONSTRAINT "crm_quotations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_renewals
-- ----------------------------
CREATE INDEX "idx_crm_renewals_current_contract_id" ON "public"."crm_renewals" USING btree (
  "current_contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_customer" ON "public"."crm_renewals" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_customer_id" ON "public"."crm_renewals" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_dates" ON "public"."crm_renewals" USING btree (
  "contract_end_date" "pg_catalog"."date_ops" ASC NULLS LAST,
  "renewal_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_deleted_id" ON "public"."crm_renewals" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_deleted_time" ON "public"."crm_renewals" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_new_contract_id" ON "public"."crm_renewals" USING btree (
  "new_contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_owner_id" ON "public"."crm_renewals" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_renewals_status" ON "public"."crm_renewals" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_renewals
-- ----------------------------
ALTER TABLE "public"."crm_renewals" ADD CONSTRAINT "crm_renewals_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_report_instances
-- ----------------------------
CREATE INDEX "idx_crm_report_instances_created_by" ON "public"."crm_report_instances" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_creator" ON "public"."crm_report_instances" USING btree (
  "generated_by" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "generated_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_report_instances_deleted_id" ON "public"."crm_report_instances" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_deleted_time" ON "public"."crm_report_instances" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_dept_id" ON "public"."crm_report_instances" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_is_deleted" ON "public"."crm_report_instances" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_owner_id" ON "public"."crm_report_instances" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_instances_template" ON "public"."crm_report_instances" USING btree (
  "template_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "generated_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_report_instances_template_id" ON "public"."crm_report_instances" USING btree (
  "template_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_report_instances
-- ----------------------------
ALTER TABLE "public"."crm_report_instances" ADD CONSTRAINT "crm_report_instances_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_report_templates
-- ----------------------------
CREATE INDEX "idx_crm_report_templates_created_by" ON "public"."crm_report_templates" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_templates_deleted_id" ON "public"."crm_report_templates" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_templates_deleted_time" ON "public"."crm_report_templates" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_templates_is_deleted" ON "public"."crm_report_templates" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_report_templates_owner_id" ON "public"."crm_report_templates" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_report_templates
-- ----------------------------
ALTER TABLE "public"."crm_report_templates" ADD CONSTRAINT "crm_report_templates_template_code_key" UNIQUE ("template_code");

-- ----------------------------
-- Primary Key structure for table crm_report_templates
-- ----------------------------
ALTER TABLE "public"."crm_report_templates" ADD CONSTRAINT "crm_report_templates_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_sales_activities
-- ----------------------------
CREATE INDEX "idx_crm_sales_activities_contact_id" ON "public"."crm_sales_activities" USING btree (
  "contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_creator" ON "public"."crm_sales_activities" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "activity_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_sales_activities_customer" ON "public"."crm_sales_activities" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "activity_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_sales_activities_customer_id" ON "public"."crm_sales_activities" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_deleted_id" ON "public"."crm_sales_activities" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_deleted_time" ON "public"."crm_sales_activities" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_dept_id" ON "public"."crm_sales_activities" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_opportunity_id" ON "public"."crm_sales_activities" USING btree (
  "opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_owner_id" ON "public"."crm_sales_activities" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_related_customer_id" ON "public"."crm_sales_activities" USING btree (
  "related_customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_activities_type" ON "public"."crm_sales_activities" USING btree (
  "activity_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_sales_activities
-- ----------------------------
ALTER TABLE "public"."crm_sales_activities" ADD CONSTRAINT "crm_sales_activities_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_sales_targets
-- ----------------------------
CREATE INDEX "idx_crm_sales_targets_deleted_id" ON "public"."crm_sales_targets" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_targets_deleted_time" ON "public"."crm_sales_targets" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_targets_is_deleted" ON "public"."crm_sales_targets" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_sales_targets_owner_id" ON "public"."crm_sales_targets" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_targets_owner" ON "public"."crm_sales_targets" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "target_year" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_targets_period" ON "public"."crm_sales_targets" USING btree (
  "target_year" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "target_quarter" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "target_month" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_sales_targets
-- ----------------------------
ALTER TABLE "public"."crm_sales_targets" ADD CONSTRAINT "crm_sales_targets_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_satisfaction_surveys
-- ----------------------------
CREATE INDEX "idx_crm_satisfaction_surveys_customer" ON "public"."crm_satisfaction_surveys" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "survey_date" "pg_catalog"."date_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_satisfaction_surveys_customer_id" ON "public"."crm_satisfaction_surveys" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_date" ON "public"."crm_satisfaction_surveys" USING btree (
  "survey_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_deleted_id" ON "public"."crm_satisfaction_surveys" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_deleted_time" ON "public"."crm_satisfaction_surveys" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_dept_id" ON "public"."crm_satisfaction_surveys" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_satisfaction_surveys_owner_id" ON "public"."crm_satisfaction_surveys" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_satisfaction_surveys
-- ----------------------------
ALTER TABLE "public"."crm_satisfaction_surveys" ADD CONSTRAINT "crm_satisfaction_surveys_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_service_tickets
-- ----------------------------
CREATE INDEX "idx_crm_service_tickets_assignee" ON "public"."crm_service_tickets" USING btree (
  "assignee_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_customer" ON "public"."crm_service_tickets" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_dept_id" ON "public"."crm_service_tickets" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_no" ON "public"."crm_service_tickets" USING btree (
  "ticket_no" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_owner_id" ON "public"."crm_service_tickets" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_priority" ON "public"."crm_service_tickets" USING btree (
  "priority" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_service_tickets_status" ON "public"."crm_service_tickets" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_service_tickets
-- ----------------------------
ALTER TABLE "public"."crm_service_tickets" ADD CONSTRAINT "crm_service_tickets_ticket_no_key" UNIQUE ("ticket_no");

-- ----------------------------
-- Primary Key structure for table crm_service_tickets
-- ----------------------------
ALTER TABLE "public"."crm_service_tickets" ADD CONSTRAINT "crm_service_tickets_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_tag_definitions
-- ----------------------------
CREATE INDEX "idx_crm_tag_definitions_category" ON "public"."crm_tag_definitions" USING btree (
  "category" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_code" ON "public"."crm_tag_definitions" USING btree (
  "tag_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_deleted_id" ON "public"."crm_tag_definitions" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_deleted_time" ON "public"."crm_tag_definitions" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_dept_id" ON "public"."crm_tag_definitions" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_is_deleted" ON "public"."crm_tag_definitions" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_owner_id" ON "public"."crm_tag_definitions" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tag_definitions_type" ON "public"."crm_tag_definitions" USING btree (
  "tag_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_tag_definitions
-- ----------------------------
ALTER TABLE "public"."crm_tag_definitions" ADD CONSTRAINT "crm_tag_definitions_tag_code_key" UNIQUE ("tag_code");

-- ----------------------------
-- Primary Key structure for table crm_tag_definitions
-- ----------------------------
ALTER TABLE "public"."crm_tag_definitions" ADD CONSTRAINT "crm_tag_definitions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_tags
-- ----------------------------
CREATE INDEX "idx_crm_tags_category" ON "public"."crm_tags" USING btree (
  "tag_category" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_deleted_id" ON "public"."crm_tags" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_deleted_time" ON "public"."crm_tags" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_dept_id" ON "public"."crm_tags" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_is_deleted" ON "public"."crm_tags" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_name" ON "public"."crm_tags" USING btree (
  "tag_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tags_owner_id" ON "public"."crm_tags" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_tags
-- ----------------------------
ALTER TABLE "public"."crm_tags" ADD CONSTRAINT "crm_tags_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_tasks
-- ----------------------------
CREATE INDEX "idx_crm_tasks_assignee" ON "public"."crm_tasks" USING btree (
  "assignee_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "due_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_assignee_id" ON "public"."crm_tasks" USING btree (
  "assignee_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_assigner_id" ON "public"."crm_tasks" USING btree (
  "assigner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_contact_id" ON "public"."crm_tasks" USING btree (
  "contact_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_contract_id" ON "public"."crm_tasks" USING btree (
  "contract_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_customer" ON "public"."crm_tasks" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_customer_id" ON "public"."crm_tasks" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_deleted_id" ON "public"."crm_tasks" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_deleted_time" ON "public"."crm_tasks" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_dept_id" ON "public"."crm_tasks" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_due" ON "public"."crm_tasks" USING btree (
  "due_date" "pg_catalog"."date_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_opportunity_id" ON "public"."crm_tasks" USING btree (
  "opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_tasks_owner_id" ON "public"."crm_tasks" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_tasks
-- ----------------------------
ALTER TABLE "public"."crm_tasks" ADD CONSTRAINT "crm_tasks_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_test_monitor_report
-- ----------------------------
CREATE INDEX "idx_crm_test_monitor_report_deleted_time" ON "public"."crm_test_monitor_report" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_test_monitor_report_is_deleted" ON "public"."crm_test_monitor_report" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_created_id" ON "public"."crm_test_monitor_report" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_created_time" ON "public"."crm_test_monitor_report" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_id" ON "public"."crm_test_monitor_report" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_status" ON "public"."crm_test_monitor_report" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_updated_id" ON "public"."crm_test_monitor_report" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_crm_test_monitor_report_updated_time" ON "public"."crm_test_monitor_report" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_test_monitor_report
-- ----------------------------
ALTER TABLE "public"."crm_test_monitor_report" ADD CONSTRAINT "crm_test_monitor_report_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_user_extensions
-- ----------------------------
CREATE INDEX "idx_crm_user_extensions_deleted_id" ON "public"."crm_user_extensions" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_deleted_time" ON "public"."crm_user_extensions" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_dept_id" ON "public"."crm_user_extensions" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_is_deleted" ON "public"."crm_user_extensions" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_manager_id" ON "public"."crm_user_extensions" USING btree (
  "manager_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_owner_id" ON "public"."crm_user_extensions" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_sales_area" ON "public"."crm_user_extensions" USING btree (
  "sales_area" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_team_id" ON "public"."crm_user_extensions" USING btree (
  "team_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_user_extensions_user_id" ON "public"."crm_user_extensions" USING btree (
  "user_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table crm_user_extensions
-- ----------------------------
ALTER TABLE "public"."crm_user_extensions" ADD CONSTRAINT "crm_user_extensions_user_id_key" UNIQUE ("user_id");

-- ----------------------------
-- Primary Key structure for table crm_user_extensions
-- ----------------------------
ALTER TABLE "public"."crm_user_extensions" ADD CONSTRAINT "crm_user_extensions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_visit_records
-- ----------------------------
CREATE INDEX "idx_crm_visit_records_customer" ON "public"."crm_visit_records" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_visit_records_date" ON "public"."crm_visit_records" USING btree (
  "visit_date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_visit_records_dept_id" ON "public"."crm_visit_records" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_visit_records_owner_id" ON "public"."crm_visit_records" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_visit_records_type" ON "public"."crm_visit_records" USING btree (
  "visit_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_visit_records
-- ----------------------------
ALTER TABLE "public"."crm_visit_records" ADD CONSTRAINT "crm_visit_records_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_workflow_approvals
-- ----------------------------
CREATE INDEX "idx_crm_approvals_initiator" ON "public"."crm_workflow_approvals" USING btree (
  "initiator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approvals_status" ON "public"."crm_workflow_approvals" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_approvals_type" ON "public"."crm_workflow_approvals" USING btree (
  "workflow_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_deleted_id" ON "public"."crm_workflow_approvals" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_deleted_time" ON "public"."crm_workflow_approvals" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_dept_id" ON "public"."crm_workflow_approvals" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_initiator_id" ON "public"."crm_workflow_approvals" USING btree (
  "initiator_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_is_deleted" ON "public"."crm_workflow_approvals" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_owner_id" ON "public"."crm_workflow_approvals" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_approvals_related_id" ON "public"."crm_workflow_approvals" USING btree (
  "related_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_workflow_approvals
-- ----------------------------
ALTER TABLE "public"."crm_workflow_approvals" ADD CONSTRAINT "crm_workflow_approvals_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_workflow_logs
-- ----------------------------
CREATE INDEX "idx_crm_workflow_logs_created_by" ON "public"."crm_workflow_logs" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_customer" ON "public"."crm_workflow_logs" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_customer_id" ON "public"."crm_workflow_logs" USING btree (
  "customer_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_deleted_id" ON "public"."crm_workflow_logs" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_deleted_time" ON "public"."crm_workflow_logs" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_dept_id" ON "public"."crm_workflow_logs" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_is_deleted" ON "public"."crm_workflow_logs" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_opportunity_id" ON "public"."crm_workflow_logs" USING btree (
  "opportunity_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_owner_id" ON "public"."crm_workflow_logs" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_result" ON "public"."crm_workflow_logs" USING btree (
  "execution_result" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_logs_rule" ON "public"."crm_workflow_logs" USING btree (
  "rule_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "executed_at" "pg_catalog"."timestamp_ops" DESC NULLS FIRST
);
CREATE INDEX "idx_crm_workflow_logs_rule_id" ON "public"."crm_workflow_logs" USING btree (
  "rule_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_workflow_logs
-- ----------------------------
ALTER TABLE "public"."crm_workflow_logs" ADD CONSTRAINT "crm_workflow_logs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table crm_workflow_rules
-- ----------------------------
CREATE INDEX "idx_crm_workflow_rules_deleted_id" ON "public"."crm_workflow_rules" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_deleted_time" ON "public"."crm_workflow_rules" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_dept_id" ON "public"."crm_workflow_rules" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_event" ON "public"."crm_workflow_rules" USING btree (
  "trigger_event" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_is_deleted" ON "public"."crm_workflow_rules" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_owner_id" ON "public"."crm_workflow_rules" USING btree (
  "owner_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_crm_workflow_rules_type" ON "public"."crm_workflow_rules" USING btree (
  "rule_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "enabled" "pg_catalog"."bool_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table crm_workflow_rules
-- ----------------------------
ALTER TABLE "public"."crm_workflow_rules" ADD CONSTRAINT "crm_workflow_rules_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table gen_demo
-- ----------------------------
CREATE INDEX "ix_gen_demo_created_id" ON "public"."gen_demo" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo_created_time" ON "public"."gen_demo" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo_deleted_id" ON "public"."gen_demo" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo_deleted_time" ON "public"."gen_demo" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo_id" ON "public"."gen_demo" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo_is_deleted" ON "public"."gen_demo" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo_status" ON "public"."gen_demo" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo_updated_id" ON "public"."gen_demo" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo_updated_time" ON "public"."gen_demo" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_gen_demo_uuid" ON "public"."gen_demo" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table gen_demo
-- ----------------------------
ALTER TABLE "public"."gen_demo" ADD CONSTRAINT "gen_demo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table gen_demo01
-- ----------------------------
CREATE INDEX "ix_gen_demo01_created_id" ON "public"."gen_demo01" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo01_created_time" ON "public"."gen_demo01" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo01_deleted_id" ON "public"."gen_demo01" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo01_deleted_time" ON "public"."gen_demo01" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo01_id" ON "public"."gen_demo01" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo01_is_deleted" ON "public"."gen_demo01" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo01_status" ON "public"."gen_demo01" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo01_updated_id" ON "public"."gen_demo01" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_demo01_updated_time" ON "public"."gen_demo01" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_gen_demo01_uuid" ON "public"."gen_demo01" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table gen_demo01
-- ----------------------------
ALTER TABLE "public"."gen_demo01" ADD CONSTRAINT "gen_demo01_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table gen_table
-- ----------------------------
CREATE INDEX "ix_gen_table_created_id" ON "public"."gen_table" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_created_time" ON "public"."gen_table" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_deleted_id" ON "public"."gen_table" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_deleted_time" ON "public"."gen_table" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_id" ON "public"."gen_table" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_is_deleted" ON "public"."gen_table" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_status" ON "public"."gen_table" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_updated_id" ON "public"."gen_table" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_updated_time" ON "public"."gen_table" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_gen_table_uuid" ON "public"."gen_table" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table gen_table
-- ----------------------------
ALTER TABLE "public"."gen_table" ADD CONSTRAINT "gen_table_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table gen_table_column
-- ----------------------------
CREATE INDEX "ix_gen_table_column_created_id" ON "public"."gen_table_column" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_column_created_time" ON "public"."gen_table_column" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_column_deleted_id" ON "public"."gen_table_column" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_column_deleted_time" ON "public"."gen_table_column" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_column_id" ON "public"."gen_table_column" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_column_is_deleted" ON "public"."gen_table_column" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_column_status" ON "public"."gen_table_column" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_column_table_id" ON "public"."gen_table_column" USING btree (
  "table_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_column_updated_id" ON "public"."gen_table_column" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_gen_table_column_updated_time" ON "public"."gen_table_column" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_gen_table_column_uuid" ON "public"."gen_table_column" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table gen_table_column
-- ----------------------------
ALTER TABLE "public"."gen_table_column" ADD CONSTRAINT "gen_table_column_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_dept
-- ----------------------------
CREATE INDEX "ix_sys_dept_created_time" ON "public"."sys_dept" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dept_deleted_time" ON "public"."sys_dept" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dept_id" ON "public"."sys_dept" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dept_is_deleted" ON "public"."sys_dept" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dept_parent_id" ON "public"."sys_dept" USING btree (
  "parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dept_status" ON "public"."sys_dept" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dept_updated_time" ON "public"."sys_dept" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_dept_uuid" ON "public"."sys_dept" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_code_key" UNIQUE ("code");

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_dict_data
-- ----------------------------
CREATE INDEX "ix_sys_dict_data_created_time" ON "public"."sys_dict_data" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_data_deleted_time" ON "public"."sys_dict_data" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_data_id" ON "public"."sys_dict_data" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_data_is_deleted" ON "public"."sys_dict_data" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_data_status" ON "public"."sys_dict_data" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_data_updated_time" ON "public"."sys_dict_data" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_dict_data_uuid" ON "public"."sys_dict_data" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_dict_data
-- ----------------------------
ALTER TABLE "public"."sys_dict_data" ADD CONSTRAINT "sys_dict_data_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_dict_type
-- ----------------------------
CREATE INDEX "ix_sys_dict_type_created_time" ON "public"."sys_dict_type" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_type_deleted_time" ON "public"."sys_dict_type" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_type_id" ON "public"."sys_dict_type" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_type_is_deleted" ON "public"."sys_dict_type" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_type_status" ON "public"."sys_dict_type" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_dict_type_updated_time" ON "public"."sys_dict_type" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_dict_type_uuid" ON "public"."sys_dict_type" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sys_dict_type
-- ----------------------------
ALTER TABLE "public"."sys_dict_type" ADD CONSTRAINT "sys_dict_type_dict_type_key" UNIQUE ("dict_type");

-- ----------------------------
-- Primary Key structure for table sys_dict_type
-- ----------------------------
ALTER TABLE "public"."sys_dict_type" ADD CONSTRAINT "sys_dict_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_log
-- ----------------------------
CREATE INDEX "ix_sys_log_created_id" ON "public"."sys_log" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_log_created_time" ON "public"."sys_log" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_log_deleted_id" ON "public"."sys_log" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_log_deleted_time" ON "public"."sys_log" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_log_id" ON "public"."sys_log" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_log_is_deleted" ON "public"."sys_log" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_log_status" ON "public"."sys_log" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_log_updated_id" ON "public"."sys_log" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_log_updated_time" ON "public"."sys_log" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_log_uuid" ON "public"."sys_log" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_log
-- ----------------------------
ALTER TABLE "public"."sys_log" ADD CONSTRAINT "sys_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_menu
-- ----------------------------
CREATE INDEX "ix_sys_menu_created_time" ON "public"."sys_menu" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_menu_deleted_time" ON "public"."sys_menu" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_menu_id" ON "public"."sys_menu" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_menu_is_deleted" ON "public"."sys_menu" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_menu_parent_id" ON "public"."sys_menu" USING btree (
  "parent_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_menu_status" ON "public"."sys_menu" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_menu_updated_time" ON "public"."sys_menu" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_menu_uuid" ON "public"."sys_menu" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_notice
-- ----------------------------
CREATE INDEX "ix_sys_notice_created_id" ON "public"."sys_notice" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_notice_created_time" ON "public"."sys_notice" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_notice_deleted_id" ON "public"."sys_notice" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_notice_deleted_time" ON "public"."sys_notice" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_notice_id" ON "public"."sys_notice" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_notice_is_deleted" ON "public"."sys_notice" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_notice_status" ON "public"."sys_notice" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_notice_updated_id" ON "public"."sys_notice" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_notice_updated_time" ON "public"."sys_notice" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_notice_uuid" ON "public"."sys_notice" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_notice
-- ----------------------------
ALTER TABLE "public"."sys_notice" ADD CONSTRAINT "sys_notice_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_param
-- ----------------------------
CREATE INDEX "ix_sys_param_created_time" ON "public"."sys_param" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_param_deleted_time" ON "public"."sys_param" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_param_id" ON "public"."sys_param" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_param_is_deleted" ON "public"."sys_param" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_param_status" ON "public"."sys_param" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_param_updated_time" ON "public"."sys_param" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_param_uuid" ON "public"."sys_param" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_param
-- ----------------------------
ALTER TABLE "public"."sys_param" ADD CONSTRAINT "sys_param_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_position
-- ----------------------------
CREATE INDEX "ix_sys_position_created_id" ON "public"."sys_position" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_position_created_time" ON "public"."sys_position" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_position_deleted_id" ON "public"."sys_position" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_position_deleted_time" ON "public"."sys_position" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_position_id" ON "public"."sys_position" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_position_is_deleted" ON "public"."sys_position" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_position_status" ON "public"."sys_position" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_position_updated_id" ON "public"."sys_position" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_position_updated_time" ON "public"."sys_position" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_position_uuid" ON "public"."sys_position" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_position
-- ----------------------------
ALTER TABLE "public"."sys_position" ADD CONSTRAINT "sys_position_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_role
-- ----------------------------
CREATE INDEX "ix_sys_role_created_time" ON "public"."sys_role" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_role_deleted_time" ON "public"."sys_role" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_role_id" ON "public"."sys_role" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_role_is_deleted" ON "public"."sys_role" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_role_status" ON "public"."sys_role" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_role_updated_time" ON "public"."sys_role" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_role_uuid" ON "public"."sys_role" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_code_key" UNIQUE ("code");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role_depts
-- ----------------------------
ALTER TABLE "public"."sys_role_depts" ADD CONSTRAINT "sys_role_depts_pkey" PRIMARY KEY ("role_id", "dept_id");

-- ----------------------------
-- Primary Key structure for table sys_role_menus
-- ----------------------------
ALTER TABLE "public"."sys_role_menus" ADD CONSTRAINT "sys_role_menus_pkey" PRIMARY KEY ("role_id", "menu_id");

-- ----------------------------
-- Indexes structure for table sys_tenant
-- ----------------------------
CREATE INDEX "ix_sys_tenant_created_time" ON "public"."sys_tenant" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_tenant_deleted_time" ON "public"."sys_tenant" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_tenant_id" ON "public"."sys_tenant" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_tenant_is_deleted" ON "public"."sys_tenant" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_tenant_status" ON "public"."sys_tenant" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_tenant_updated_time" ON "public"."sys_tenant" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_tenant_uuid" ON "public"."sys_tenant" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sys_tenant
-- ----------------------------
ALTER TABLE "public"."sys_tenant" ADD CONSTRAINT "sys_tenant_name_key" UNIQUE ("name");
ALTER TABLE "public"."sys_tenant" ADD CONSTRAINT "sys_tenant_code_key" UNIQUE ("code");

-- ----------------------------
-- Primary Key structure for table sys_tenant
-- ----------------------------
ALTER TABLE "public"."sys_tenant" ADD CONSTRAINT "sys_tenant_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------
CREATE INDEX "ix_sys_user_created_id" ON "public"."sys_user" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_created_time" ON "public"."sys_user" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_deleted_id" ON "public"."sys_user" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_deleted_time" ON "public"."sys_user" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_dept_id" ON "public"."sys_user" USING btree (
  "dept_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_id" ON "public"."sys_user" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_is_deleted" ON "public"."sys_user" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_status" ON "public"."sys_user" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_tenant_id" ON "public"."sys_user" USING btree (
  "tenant_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_updated_id" ON "public"."sys_user" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_sys_user_updated_time" ON "public"."sys_user" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_sys_user_uuid" ON "public"."sys_user" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_username_key" UNIQUE ("username");
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_mobile_key" UNIQUE ("mobile");
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_email_key" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_positions
-- ----------------------------
ALTER TABLE "public"."sys_user_positions" ADD CONSTRAINT "sys_user_positions_pkey" PRIMARY KEY ("user_id", "position_id");

-- ----------------------------
-- Primary Key structure for table sys_user_roles
-- ----------------------------
ALTER TABLE "public"."sys_user_roles" ADD CONSTRAINT "sys_user_roles_pkey" PRIMARY KEY ("user_id", "role_id");

-- ----------------------------
-- Indexes structure for table task_job
-- ----------------------------
CREATE INDEX "ix_task_job_created_time" ON "public"."task_job" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_job_deleted_time" ON "public"."task_job" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_job_id" ON "public"."task_job" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_job_is_deleted" ON "public"."task_job" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_job_job_id" ON "public"."task_job" USING btree (
  "job_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_job_updated_time" ON "public"."task_job" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_task_job_uuid" ON "public"."task_job" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table task_job
-- ----------------------------
ALTER TABLE "public"."task_job" ADD CONSTRAINT "task_job_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table task_node
-- ----------------------------
CREATE INDEX "ix_task_node_created_id" ON "public"."task_node" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_node_created_time" ON "public"."task_node" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_node_deleted_id" ON "public"."task_node" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_node_deleted_time" ON "public"."task_node" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_node_id" ON "public"."task_node" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_node_is_deleted" ON "public"."task_node" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_node_status" ON "public"."task_node" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_node_updated_id" ON "public"."task_node" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_node_updated_time" ON "public"."task_node" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_task_node_uuid" ON "public"."task_node" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table task_node
-- ----------------------------
ALTER TABLE "public"."task_node" ADD CONSTRAINT "task_node_code_key" UNIQUE ("code");

-- ----------------------------
-- Primary Key structure for table task_node
-- ----------------------------
ALTER TABLE "public"."task_node" ADD CONSTRAINT "task_node_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table task_workflow
-- ----------------------------
CREATE INDEX "ix_task_workflow_created_id" ON "public"."task_workflow" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_created_time" ON "public"."task_workflow" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_deleted_id" ON "public"."task_workflow" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_deleted_time" ON "public"."task_workflow" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_id" ON "public"."task_workflow" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_is_deleted" ON "public"."task_workflow" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_status" ON "public"."task_workflow" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_updated_id" ON "public"."task_workflow" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_updated_time" ON "public"."task_workflow" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_task_workflow_uuid" ON "public"."task_workflow" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table task_workflow
-- ----------------------------
ALTER TABLE "public"."task_workflow" ADD CONSTRAINT "uq_task_workflow_code" UNIQUE ("code");

-- ----------------------------
-- Primary Key structure for table task_workflow
-- ----------------------------
ALTER TABLE "public"."task_workflow" ADD CONSTRAINT "task_workflow_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table task_workflow_node_type
-- ----------------------------
CREATE INDEX "ix_task_workflow_node_type_created_id" ON "public"."task_workflow_node_type" USING btree (
  "created_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_node_type_created_time" ON "public"."task_workflow_node_type" USING btree (
  "created_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_node_type_deleted_id" ON "public"."task_workflow_node_type" USING btree (
  "deleted_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_node_type_deleted_time" ON "public"."task_workflow_node_type" USING btree (
  "deleted_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_node_type_id" ON "public"."task_workflow_node_type" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_node_type_is_deleted" ON "public"."task_workflow_node_type" USING btree (
  "is_deleted" "pg_catalog"."bool_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_node_type_status" ON "public"."task_workflow_node_type" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_node_type_updated_id" ON "public"."task_workflow_node_type" USING btree (
  "updated_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "ix_task_workflow_node_type_updated_time" ON "public"."task_workflow_node_type" USING btree (
  "updated_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ix_task_workflow_node_type_uuid" ON "public"."task_workflow_node_type" USING btree (
  "uuid" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table task_workflow_node_type
-- ----------------------------
ALTER TABLE "public"."task_workflow_node_type" ADD CONSTRAINT "task_workflow_node_type_code_key" UNIQUE ("code");

-- ----------------------------
-- Primary Key structure for table task_workflow_node_type
-- ----------------------------
ALTER TABLE "public"."task_workflow_node_type" ADD CONSTRAINT "task_workflow_node_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table app_portal
-- ----------------------------
ALTER TABLE "public"."app_portal" ADD CONSTRAINT "app_portal_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."app_portal" ADD CONSTRAINT "app_portal_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."app_portal" ADD CONSTRAINT "app_portal_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "public"."sys_tenant" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."app_portal" ADD CONSTRAINT "app_portal_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table crm_ai_customer_profiles
-- ----------------------------
ALTER TABLE "public"."crm_ai_customer_profiles" ADD CONSTRAINT "crm_ai_customer_profiles_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_ai_customer_profiles" ADD CONSTRAINT "fk_crm_ai_customer_profiles_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_ai_customer_profiles" ADD CONSTRAINT "fk_crm_ai_customer_profiles_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_ai_customer_profiles" ADD CONSTRAINT "fk_crm_ai_customer_profiles_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_ai_recommendations
-- ----------------------------
ALTER TABLE "public"."crm_ai_recommendations" ADD CONSTRAINT "crm_ai_recommendations_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_ai_recommendations" ADD CONSTRAINT "fk_crm_ai_recommendations_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_ai_recommendations" ADD CONSTRAINT "fk_crm_ai_recommendations_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_ai_tags
-- ----------------------------
ALTER TABLE "public"."crm_ai_tags" ADD CONSTRAINT "crm_ai_tags_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_ai_tags" ADD CONSTRAINT "fk_crm_ai_tags_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_ai_tags" ADD CONSTRAINT "fk_crm_ai_tags_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_campaign_leads
-- ----------------------------
ALTER TABLE "public"."crm_campaign_leads" ADD CONSTRAINT "crm_campaign_leads_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_campaign_leads" ADD CONSTRAINT "fk_crm_campaign_leads_campaign_id" FOREIGN KEY ("campaign_id") REFERENCES "public"."crm_campaigns" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_campaign_leads" ADD CONSTRAINT "fk_crm_campaign_leads_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_campaign_leads" ADD CONSTRAINT "fk_crm_campaign_leads_lead_id" FOREIGN KEY ("lead_id") REFERENCES "public"."crm_leads" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_campaign_leads" ADD CONSTRAINT "fk_crm_campaign_leads_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_campaigns
-- ----------------------------
ALTER TABLE "public"."crm_campaigns" ADD CONSTRAINT "crm_campaigns_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_campaigns" ADD CONSTRAINT "fk_crm_campaigns_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_campaigns" ADD CONSTRAINT "fk_crm_campaigns_dept" FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_campaigns" ADD CONSTRAINT "fk_crm_campaigns_owner" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_campaigns" ADD CONSTRAINT "fk_crm_campaigns_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_contact_change_logs
-- ----------------------------
ALTER TABLE "public"."crm_contact_change_logs" ADD CONSTRAINT "crm_contact_change_logs_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_change_logs" ADD CONSTRAINT "crm_contact_change_logs_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_change_logs" ADD CONSTRAINT "crm_contact_change_logs_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_change_logs" ADD CONSTRAINT "fk_crm_contact_change_logs_contact_id" FOREIGN KEY ("contact_id") REFERENCES "public"."crm_contacts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_change_logs" ADD CONSTRAINT "fk_crm_contact_change_logs_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_change_logs" ADD CONSTRAINT "fk_crm_contact_change_logs_operator_id" FOREIGN KEY ("operator_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_contact_relations
-- ----------------------------
ALTER TABLE "public"."crm_contact_relations" ADD CONSTRAINT "crm_contact_relations_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_relations" ADD CONSTRAINT "fk_crm_contact_relations_contact_id" FOREIGN KEY ("contact_id") REFERENCES "public"."crm_contacts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_relations" ADD CONSTRAINT "fk_crm_contact_relations_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_relations" ADD CONSTRAINT "fk_crm_contact_relations_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_contact_visits
-- ----------------------------
ALTER TABLE "public"."crm_contact_visits" ADD CONSTRAINT "crm_contact_visits_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_visits" ADD CONSTRAINT "fk_crm_contact_visits_contact_id" FOREIGN KEY ("contact_id") REFERENCES "public"."crm_contacts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_visits" ADD CONSTRAINT "fk_crm_contact_visits_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_visits" ADD CONSTRAINT "fk_crm_contact_visits_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_visits" ADD CONSTRAINT "fk_crm_contact_visits_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contact_visits" ADD CONSTRAINT "fk_crm_contact_visits_visitor_id" FOREIGN KEY ("visitor_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_contacts
-- ----------------------------
ALTER TABLE "public"."crm_contacts" ADD CONSTRAINT "crm_contacts_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contacts" ADD CONSTRAINT "fk_crm_contacts_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contacts" ADD CONSTRAINT "fk_crm_contacts_customer" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contacts" ADD CONSTRAINT "fk_crm_contacts_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_contract_invoices
-- ----------------------------
ALTER TABLE "public"."crm_contract_invoices" ADD CONSTRAINT "crm_contract_invoices_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contract_invoices" ADD CONSTRAINT "fk_crm_contract_invoices_contract_id" FOREIGN KEY ("contract_id") REFERENCES "public"."crm_contracts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contract_invoices" ADD CONSTRAINT "fk_crm_contract_invoices_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contract_invoices" ADD CONSTRAINT "fk_crm_contract_invoices_issued_by" FOREIGN KEY ("issued_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contract_invoices" ADD CONSTRAINT "fk_crm_contract_invoices_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_contract_items
-- ----------------------------
ALTER TABLE "public"."crm_contract_items" ADD CONSTRAINT "crm_contract_items_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contract_items" ADD CONSTRAINT "crm_contract_items_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contract_items" ADD CONSTRAINT "crm_contract_items_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contract_items" ADD CONSTRAINT "fk_crm_contract_items_contract_id" FOREIGN KEY ("contract_id") REFERENCES "public"."crm_contracts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contract_items" ADD CONSTRAINT "fk_crm_contract_items_product_id" FOREIGN KEY ("product_id") REFERENCES "public"."crm_products" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_contracts
-- ----------------------------
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "crm_contracts_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "fk_crm_contracts_approved_by" FOREIGN KEY ("approved_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "fk_crm_contracts_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "fk_crm_contracts_customer" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "fk_crm_contracts_opportunity" FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "fk_crm_contracts_owner" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "fk_crm_contracts_quotation_id" FOREIGN KEY ("quotation_id") REFERENCES "public"."crm_quotations" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_contracts" ADD CONSTRAINT "fk_crm_contracts_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_activities
-- ----------------------------
ALTER TABLE "public"."crm_customer_activities" ADD CONSTRAINT "crm_customer_activities_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_activities" ADD CONSTRAINT "crm_customer_activities_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_activities" ADD CONSTRAINT "crm_customer_activities_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_activities" ADD CONSTRAINT "fk_crm_customer_activities_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_activities" ADD CONSTRAINT "fk_crm_customer_activities_operator_id" FOREIGN KEY ("operator_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_addresses
-- ----------------------------
ALTER TABLE "public"."crm_customer_addresses" ADD CONSTRAINT "crm_customer_addresses_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_addresses" ADD CONSTRAINT "fk_crm_customer_addresses_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_addresses" ADD CONSTRAINT "fk_crm_customer_addresses_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_attachments
-- ----------------------------
ALTER TABLE "public"."crm_customer_attachments" ADD CONSTRAINT "crm_customer_attachments_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_attachments" ADD CONSTRAINT "crm_customer_attachments_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_attachments" ADD CONSTRAINT "crm_customer_attachments_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_attachments" ADD CONSTRAINT "fk_crm_customer_attachments_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_attachments" ADD CONSTRAINT "fk_crm_customer_attachments_uploader_id" FOREIGN KEY ("uploader_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_change_logs
-- ----------------------------
ALTER TABLE "public"."crm_customer_change_logs" ADD CONSTRAINT "crm_customer_change_logs_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_change_logs" ADD CONSTRAINT "crm_customer_change_logs_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_change_logs" ADD CONSTRAINT "crm_customer_change_logs_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_change_logs" ADD CONSTRAINT "fk_crm_customer_change_logs_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_change_logs" ADD CONSTRAINT "fk_crm_customer_change_logs_operator_id" FOREIGN KEY ("operator_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_duplicate_logs
-- ----------------------------
ALTER TABLE "public"."crm_customer_duplicate_logs" ADD CONSTRAINT "crm_customer_duplicate_logs_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_duplicate_logs" ADD CONSTRAINT "crm_customer_duplicate_logs_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_duplicate_logs" ADD CONSTRAINT "crm_customer_duplicate_logs_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_duplicate_logs" ADD CONSTRAINT "fk_crm_customer_duplicate_logs_handled_by" FOREIGN KEY ("handled_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_health
-- ----------------------------
ALTER TABLE "public"."crm_customer_health" ADD CONSTRAINT "crm_customer_health_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_health" ADD CONSTRAINT "crm_customer_health_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_health" ADD CONSTRAINT "crm_customer_health_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_health" ADD CONSTRAINT "fk_crm_customer_health_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_health_scores
-- ----------------------------
ALTER TABLE "public"."crm_customer_health_scores" ADD CONSTRAINT "crm_customer_health_scores_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_health_scores" ADD CONSTRAINT "fk_crm_customer_health_scores_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_health_scores" ADD CONSTRAINT "fk_crm_customer_health_scores_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_pool_logs
-- ----------------------------
ALTER TABLE "public"."crm_customer_pool_logs" ADD CONSTRAINT "crm_customer_pool_logs_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_pool_logs" ADD CONSTRAINT "crm_customer_pool_logs_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_pool_logs" ADD CONSTRAINT "crm_customer_pool_logs_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_pool_logs" ADD CONSTRAINT "fk_crm_customer_pool_logs_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_pool_logs" ADD CONSTRAINT "fk_crm_customer_pool_logs_operator_id" FOREIGN KEY ("operator_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_profiles
-- ----------------------------
ALTER TABLE "public"."crm_customer_profiles" ADD CONSTRAINT "crm_customer_profiles_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_profiles" ADD CONSTRAINT "fk_crm_customer_profiles_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_profiles" ADD CONSTRAINT "fk_crm_customer_profiles_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_profiles" ADD CONSTRAINT "fk_crm_customer_profiles_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_satisfaction_surveys
-- ----------------------------
ALTER TABLE "public"."crm_customer_satisfaction_surveys" ADD CONSTRAINT "crm_customer_satisfaction_surveys_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_satisfaction_surveys" ADD CONSTRAINT "fk_crm_customer_satisfaction_surveys_contact_id" FOREIGN KEY ("contact_id") REFERENCES "public"."crm_contacts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_satisfaction_surveys" ADD CONSTRAINT "fk_crm_customer_satisfaction_surveys_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_satisfaction_surveys" ADD CONSTRAINT "fk_crm_customer_satisfaction_surveys_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_satisfaction_surveys" ADD CONSTRAINT "fk_crm_customer_satisfaction_surveys_follow_up_by" FOREIGN KEY ("follow_up_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_satisfaction_surveys" ADD CONSTRAINT "fk_crm_customer_satisfaction_surveys_order_id" FOREIGN KEY ("order_id") REFERENCES "public"."crm_orders" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_satisfaction_surveys" ADD CONSTRAINT "fk_crm_customer_satisfaction_surveys_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_tags
-- ----------------------------
ALTER TABLE "public"."crm_customer_tags" ADD CONSTRAINT "crm_customer_tags_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_tags" ADD CONSTRAINT "fk_crm_customer_tags_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_tags" ADD CONSTRAINT "fk_crm_customer_tags_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_tags" ADD CONSTRAINT "fk_crm_customer_tags_tag_id" FOREIGN KEY ("tag_id") REFERENCES "public"."crm_tag_definitions" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_tags" ADD CONSTRAINT "fk_crm_customer_tags_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customer_timeline
-- ----------------------------
ALTER TABLE "public"."crm_customer_timeline" ADD CONSTRAINT "crm_customer_timeline_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_timeline" ADD CONSTRAINT "fk_crm_customer_timeline_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_timeline" ADD CONSTRAINT "fk_crm_customer_timeline_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_timeline" ADD CONSTRAINT "fk_crm_customer_timeline_operator_id" FOREIGN KEY ("operator_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customer_timeline" ADD CONSTRAINT "fk_crm_customer_timeline_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_customers
-- ----------------------------
ALTER TABLE "public"."crm_customers" ADD CONSTRAINT "crm_customers_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customers" ADD CONSTRAINT "fk_crm_customers_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customers" ADD CONSTRAINT "fk_crm_customers_dept" FOREIGN KEY ("department_id") REFERENCES "public"."sys_dept" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customers" ADD CONSTRAINT "fk_crm_customers_lead_id" FOREIGN KEY ("lead_id") REFERENCES "public"."crm_leads" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customers" ADD CONSTRAINT "fk_crm_customers_owner" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_customers" ADD CONSTRAINT "fk_crm_customers_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_data_dicts
-- ----------------------------
ALTER TABLE "public"."crm_data_dicts" ADD CONSTRAINT "crm_data_dicts_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_data_dicts" ADD CONSTRAINT "fk_crm_data_dicts_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_data_dicts" ADD CONSTRAINT "fk_crm_data_dicts_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_deliveries
-- ----------------------------
ALTER TABLE "public"."crm_deliveries" ADD CONSTRAINT "crm_deliveries_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_deliveries" ADD CONSTRAINT "fk_crm_deliveries_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_deliveries" ADD CONSTRAINT "fk_crm_deliveries_order_id" FOREIGN KEY ("order_id") REFERENCES "public"."crm_orders" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_deliveries" ADD CONSTRAINT "fk_crm_deliveries_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_follow_records
-- ----------------------------
ALTER TABLE "public"."crm_follow_records" ADD CONSTRAINT "crm_follow_records_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_follow_records" ADD CONSTRAINT "fk_crm_follow_records_contact_id" FOREIGN KEY ("contact_id") REFERENCES "public"."crm_contacts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_follow_records" ADD CONSTRAINT "fk_crm_follow_records_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_follow_records" ADD CONSTRAINT "fk_crm_follow_records_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_follow_records" ADD CONSTRAINT "fk_crm_follow_records_opportunity_id" FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_follow_records" ADD CONSTRAINT "fk_crm_follow_records_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_followups
-- ----------------------------
ALTER TABLE "public"."crm_followups" ADD CONSTRAINT "crm_followups_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_followups" ADD CONSTRAINT "fk_crm_followups_contact_id" FOREIGN KEY ("contact_id") REFERENCES "public"."crm_contacts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_followups" ADD CONSTRAINT "fk_crm_followups_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_followups" ADD CONSTRAINT "fk_crm_followups_customer" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_import_records
-- ----------------------------
ALTER TABLE "public"."crm_import_records" ADD CONSTRAINT "crm_import_records_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_import_records" ADD CONSTRAINT "fk_crm_import_records_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_invoices
-- ----------------------------
ALTER TABLE "public"."crm_invoices" ADD CONSTRAINT "crm_invoices_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_invoices" ADD CONSTRAINT "fk_crm_invoices_contract_id" FOREIGN KEY ("contract_id") REFERENCES "public"."crm_contracts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_invoices" ADD CONSTRAINT "fk_crm_invoices_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_invoices" ADD CONSTRAINT "fk_crm_invoices_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_invoices" ADD CONSTRAINT "fk_crm_invoices_order_id" FOREIGN KEY ("order_id") REFERENCES "public"."crm_orders" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_invoices" ADD CONSTRAINT "fk_crm_invoices_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_joint_followups
-- ----------------------------
ALTER TABLE "public"."crm_joint_followups" ADD CONSTRAINT "crm_joint_followups_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_joint_followups" ADD CONSTRAINT "fk_crm_joint_followups_assigned_by" FOREIGN KEY ("assigned_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_joint_followups" ADD CONSTRAINT "fk_crm_joint_followups_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_joint_followups" ADD CONSTRAINT "fk_crm_joint_followups_opportunity_id" FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_joint_followups" ADD CONSTRAINT "fk_crm_joint_followups_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_lead_scores
-- ----------------------------
ALTER TABLE "public"."crm_lead_scores" ADD CONSTRAINT "crm_lead_scores_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_lead_scores" ADD CONSTRAINT "crm_lead_scores_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_lead_scores" ADD CONSTRAINT "crm_lead_scores_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_lead_scores" ADD CONSTRAINT "fk_crm_lead_scores_lead_id" FOREIGN KEY ("lead_id") REFERENCES "public"."crm_leads" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_leads
-- ----------------------------
ALTER TABLE "public"."crm_leads" ADD CONSTRAINT "crm_leads_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_leads" ADD CONSTRAINT "fk_crm_leads_campaign_id" FOREIGN KEY ("campaign_id") REFERENCES "public"."crm_campaigns" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_leads" ADD CONSTRAINT "fk_crm_leads_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_leads" ADD CONSTRAINT "fk_crm_leads_owner" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_leads" ADD CONSTRAINT "fk_crm_leads_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_marketing_campaigns
-- ----------------------------
ALTER TABLE "public"."crm_marketing_campaigns" ADD CONSTRAINT "crm_marketing_campaigns_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_marketing_campaigns" ADD CONSTRAINT "fk_crm_marketing_campaigns_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_marketing_campaigns" ADD CONSTRAINT "fk_crm_marketing_campaigns_owner_id" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_marketing_campaigns" ADD CONSTRAINT "fk_crm_marketing_campaigns_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_marketing_channels
-- ----------------------------
ALTER TABLE "public"."crm_marketing_channels" ADD CONSTRAINT "crm_marketing_channels_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_marketing_channels" ADD CONSTRAINT "fk_crm_marketing_channels_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_marketing_channels" ADD CONSTRAINT "fk_crm_marketing_channels_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_notifications
-- ----------------------------
ALTER TABLE "public"."crm_notifications" ADD CONSTRAINT "crm_notifications_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_notifications" ADD CONSTRAINT "crm_notifications_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_notifications" ADD CONSTRAINT "crm_notifications_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_operation_logs
-- ----------------------------
ALTER TABLE "public"."crm_operation_logs" ADD CONSTRAINT "crm_operation_logs_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_operation_logs" ADD CONSTRAINT "crm_operation_logs_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_operation_logs" ADD CONSTRAINT "crm_operation_logs_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_opportunities
-- ----------------------------
ALTER TABLE "public"."crm_opportunities" ADD CONSTRAINT "crm_opportunities_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunities" ADD CONSTRAINT "fk_crm_opportunities_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunities" ADD CONSTRAINT "fk_crm_opportunities_customer" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunities" ADD CONSTRAINT "fk_crm_opportunities_owner" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunities" ADD CONSTRAINT "fk_crm_opportunities_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_opportunity_products
-- ----------------------------
ALTER TABLE "public"."crm_opportunity_products" ADD CONSTRAINT "crm_opportunity_products_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunity_products" ADD CONSTRAINT "fk_crm_opportunity_products_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunity_products" ADD CONSTRAINT "fk_crm_opportunity_products_opportunity_id" FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunity_products" ADD CONSTRAINT "fk_crm_opportunity_products_product_id" FOREIGN KEY ("product_id") REFERENCES "public"."crm_products" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunity_products" ADD CONSTRAINT "fk_crm_opportunity_products_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_opportunity_stages
-- ----------------------------
ALTER TABLE "public"."crm_opportunity_stages" ADD CONSTRAINT "crm_opportunity_stages_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunity_stages" ADD CONSTRAINT "fk_crm_opportunity_stages_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_opportunity_stages" ADD CONSTRAINT "fk_crm_opportunity_stages_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_order_items
-- ----------------------------
ALTER TABLE "public"."crm_order_items" ADD CONSTRAINT "crm_order_items_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_order_items" ADD CONSTRAINT "fk_crm_order_items_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_order_items" ADD CONSTRAINT "fk_crm_order_items_order_id" FOREIGN KEY ("order_id") REFERENCES "public"."crm_orders" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_order_items" ADD CONSTRAINT "fk_crm_order_items_product_id" FOREIGN KEY ("product_id") REFERENCES "public"."crm_products" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_orders
-- ----------------------------
ALTER TABLE "public"."crm_orders" ADD CONSTRAINT "crm_orders_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_orders" ADD CONSTRAINT "fk_crm_orders_contract_id" FOREIGN KEY ("contract_id") REFERENCES "public"."crm_contracts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_orders" ADD CONSTRAINT "fk_crm_orders_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_orders" ADD CONSTRAINT "fk_crm_orders_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_orders" ADD CONSTRAINT "fk_crm_orders_owner_id" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_payments
-- ----------------------------
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "crm_payments_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "fk_crm_payments_confirmed_by" FOREIGN KEY ("confirmed_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "fk_crm_payments_contract_id" FOREIGN KEY ("contract_id") REFERENCES "public"."crm_contracts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "fk_crm_payments_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "fk_crm_payments_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "fk_crm_payments_invoice_id" FOREIGN KEY ("invoice_id") REFERENCES "public"."crm_invoices" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "fk_crm_payments_order_id" FOREIGN KEY ("order_id") REFERENCES "public"."crm_orders" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_payments" ADD CONSTRAINT "fk_crm_payments_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_pool_transfers
-- ----------------------------
ALTER TABLE "public"."crm_pool_transfers" ADD CONSTRAINT "crm_pool_transfers_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_pool_transfers" ADD CONSTRAINT "crm_pool_transfers_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_pool_transfers" ADD CONSTRAINT "crm_pool_transfers_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_pool_transfers" ADD CONSTRAINT "fk_crm_pool_transfers_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_pool_transfers" ADD CONSTRAINT "fk_crm_pool_transfers_operator_id" FOREIGN KEY ("operator_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_price_tiers
-- ----------------------------
ALTER TABLE "public"."crm_price_tiers" ADD CONSTRAINT "crm_price_tiers_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_price_tiers" ADD CONSTRAINT "fk_crm_price_tiers_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_price_tiers" ADD CONSTRAINT "fk_crm_price_tiers_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_product_categories
-- ----------------------------
ALTER TABLE "public"."crm_product_categories" ADD CONSTRAINT "crm_product_categories_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_categories" ADD CONSTRAINT "fk_crm_product_categories_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_categories" ADD CONSTRAINT "fk_crm_product_categories_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_product_documents
-- ----------------------------
ALTER TABLE "public"."crm_product_documents" ADD CONSTRAINT "crm_product_documents_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_documents" ADD CONSTRAINT "fk_crm_product_documents_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_documents" ADD CONSTRAINT "fk_crm_product_documents_product_id" FOREIGN KEY ("product_id") REFERENCES "public"."crm_products" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_documents" ADD CONSTRAINT "fk_crm_product_documents_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_product_price_history
-- ----------------------------
ALTER TABLE "public"."crm_product_price_history" ADD CONSTRAINT "crm_product_price_history_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_price_history" ADD CONSTRAINT "crm_product_price_history_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_price_history" ADD CONSTRAINT "crm_product_price_history_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_price_history" ADD CONSTRAINT "fk_crm_product_price_history_approved_by" FOREIGN KEY ("approved_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_price_history" ADD CONSTRAINT "fk_crm_product_price_history_operator_id" FOREIGN KEY ("operator_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_price_history" ADD CONSTRAINT "fk_crm_product_price_history_product_id" FOREIGN KEY ("product_id") REFERENCES "public"."crm_products" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_product_price_policies
-- ----------------------------
ALTER TABLE "public"."crm_product_price_policies" ADD CONSTRAINT "crm_product_price_policies_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_price_policies" ADD CONSTRAINT "fk_crm_product_price_policies_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_price_policies" ADD CONSTRAINT "fk_crm_product_price_policies_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_price_policies" ADD CONSTRAINT "fk_crm_product_price_policies_product_id" FOREIGN KEY ("product_id") REFERENCES "public"."crm_products" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_product_prices
-- ----------------------------
ALTER TABLE "public"."crm_product_prices" ADD CONSTRAINT "crm_product_prices_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_prices" ADD CONSTRAINT "fk_crm_product_prices_approved_by" FOREIGN KEY ("approved_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_prices" ADD CONSTRAINT "fk_crm_product_prices_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_prices" ADD CONSTRAINT "fk_crm_product_prices_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_prices" ADD CONSTRAINT "fk_crm_product_prices_product_id" FOREIGN KEY ("product_id") REFERENCES "public"."crm_products" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_prices" ADD CONSTRAINT "fk_crm_product_prices_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_product_skus
-- ----------------------------
ALTER TABLE "public"."crm_product_skus" ADD CONSTRAINT "crm_product_skus_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_skus" ADD CONSTRAINT "fk_crm_product_skus_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_product_skus" ADD CONSTRAINT "fk_crm_product_skus_product_id" FOREIGN KEY ("product_id") REFERENCES "public"."crm_products" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_products
-- ----------------------------
ALTER TABLE "public"."crm_products" ADD CONSTRAINT "crm_products_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_products" ADD CONSTRAINT "fk_crm_products_category_id" FOREIGN KEY ("category_id") REFERENCES "public"."crm_product_categories" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_products" ADD CONSTRAINT "fk_crm_products_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_products" ADD CONSTRAINT "fk_crm_products_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_quotation_items
-- ----------------------------
ALTER TABLE "public"."crm_quotation_items" ADD CONSTRAINT "crm_quotation_items_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_quotation_items" ADD CONSTRAINT "fk_crm_quotation_items_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_quotation_items" ADD CONSTRAINT "fk_crm_quotation_items_product_id" FOREIGN KEY ("product_id") REFERENCES "public"."crm_products" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_quotation_items" ADD CONSTRAINT "fk_crm_quotation_items_quotation_id" FOREIGN KEY ("quotation_id") REFERENCES "public"."crm_quotations" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_quotation_items" ADD CONSTRAINT "fk_crm_quotation_items_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_quotations
-- ----------------------------
ALTER TABLE "public"."crm_quotations" ADD CONSTRAINT "crm_quotations_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_quotations" ADD CONSTRAINT "fk_crm_quotations_approved_by" FOREIGN KEY ("approved_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_quotations" ADD CONSTRAINT "fk_crm_quotations_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_quotations" ADD CONSTRAINT "fk_crm_quotations_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_quotations" ADD CONSTRAINT "fk_crm_quotations_opportunity_id" FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_quotations" ADD CONSTRAINT "fk_crm_quotations_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_renewals
-- ----------------------------
ALTER TABLE "public"."crm_renewals" ADD CONSTRAINT "crm_renewals_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_renewals" ADD CONSTRAINT "fk_crm_renewals_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_renewals" ADD CONSTRAINT "fk_crm_renewals_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_renewals" ADD CONSTRAINT "fk_crm_renewals_owner_id" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_renewals" ADD CONSTRAINT "fk_crm_renewals_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_report_instances
-- ----------------------------
ALTER TABLE "public"."crm_report_instances" ADD CONSTRAINT "crm_report_instances_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_report_instances" ADD CONSTRAINT "crm_report_instances_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_report_instances" ADD CONSTRAINT "crm_report_instances_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_report_instances" ADD CONSTRAINT "fk_crm_report_instances_generated_by" FOREIGN KEY ("generated_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_report_instances" ADD CONSTRAINT "fk_crm_report_instances_template_id" FOREIGN KEY ("template_id") REFERENCES "public"."crm_report_templates" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_report_templates
-- ----------------------------
ALTER TABLE "public"."crm_report_templates" ADD CONSTRAINT "crm_report_templates_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_report_templates" ADD CONSTRAINT "crm_report_templates_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_report_templates" ADD CONSTRAINT "crm_report_templates_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_report_templates" ADD CONSTRAINT "fk_crm_report_templates_owner_id" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_sales_activities
-- ----------------------------
ALTER TABLE "public"."crm_sales_activities" ADD CONSTRAINT "crm_sales_activities_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_sales_activities" ADD CONSTRAINT "fk_crm_sales_activities_contact_id" FOREIGN KEY ("contact_id") REFERENCES "public"."crm_contacts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_sales_activities" ADD CONSTRAINT "fk_crm_sales_activities_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_sales_activities" ADD CONSTRAINT "fk_crm_sales_activities_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_sales_activities" ADD CONSTRAINT "fk_crm_sales_activities_opportunity_id" FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_sales_targets
-- ----------------------------
ALTER TABLE "public"."crm_sales_targets" ADD CONSTRAINT "crm_sales_targets_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_sales_targets" ADD CONSTRAINT "fk_crm_sales_targets_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_sales_targets" ADD CONSTRAINT "fk_crm_sales_targets_owner_id" FOREIGN KEY ("owner_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_satisfaction_surveys
-- ----------------------------
ALTER TABLE "public"."crm_satisfaction_surveys" ADD CONSTRAINT "crm_satisfaction_surveys_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_satisfaction_surveys" ADD CONSTRAINT "fk_crm_satisfaction_surveys_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_satisfaction_surveys" ADD CONSTRAINT "fk_crm_satisfaction_surveys_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_tag_definitions
-- ----------------------------
ALTER TABLE "public"."crm_tag_definitions" ADD CONSTRAINT "crm_tag_definitions_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tag_definitions" ADD CONSTRAINT "fk_crm_tag_definitions_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tag_definitions" ADD CONSTRAINT "fk_crm_tag_definitions_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_tags
-- ----------------------------
ALTER TABLE "public"."crm_tags" ADD CONSTRAINT "crm_tags_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tags" ADD CONSTRAINT "fk_crm_tags_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tags" ADD CONSTRAINT "fk_crm_tags_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_tasks
-- ----------------------------
ALTER TABLE "public"."crm_tasks" ADD CONSTRAINT "crm_tasks_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tasks" ADD CONSTRAINT "fk_crm_tasks_contact_id" FOREIGN KEY ("contact_id") REFERENCES "public"."crm_contacts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tasks" ADD CONSTRAINT "fk_crm_tasks_contract_id" FOREIGN KEY ("contract_id") REFERENCES "public"."crm_contracts" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tasks" ADD CONSTRAINT "fk_crm_tasks_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tasks" ADD CONSTRAINT "fk_crm_tasks_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tasks" ADD CONSTRAINT "fk_crm_tasks_opportunity_id" FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_tasks" ADD CONSTRAINT "fk_crm_tasks_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_test_monitor_report
-- ----------------------------
ALTER TABLE "public"."crm_test_monitor_report" ADD CONSTRAINT "crm_test_monitor_report_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."crm_test_monitor_report" ADD CONSTRAINT "crm_test_monitor_report_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."crm_test_monitor_report" ADD CONSTRAINT "fk_crm_test_monitor_report_created_by" FOREIGN KEY ("created_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_test_monitor_report" ADD CONSTRAINT "fk_crm_test_monitor_report_updated_by" FOREIGN KEY ("updated_by") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_user_extensions
-- ----------------------------
ALTER TABLE "public"."crm_user_extensions" ADD CONSTRAINT "crm_user_extensions_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_user_extensions" ADD CONSTRAINT "fk_crm_user_extensions_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_user_extensions" ADD CONSTRAINT "fk_crm_user_extensions_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_workflow_approvals
-- ----------------------------
ALTER TABLE "public"."crm_workflow_approvals" ADD CONSTRAINT "crm_workflow_approvals_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_workflow_approvals" ADD CONSTRAINT "fk_crm_workflow_approvals_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_workflow_approvals" ADD CONSTRAINT "fk_crm_workflow_approvals_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_workflow_logs
-- ----------------------------
ALTER TABLE "public"."crm_workflow_logs" ADD CONSTRAINT "crm_workflow_logs_created_by_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_workflow_logs" ADD CONSTRAINT "crm_workflow_logs_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_workflow_logs" ADD CONSTRAINT "crm_workflow_logs_updated_by_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_workflow_logs" ADD CONSTRAINT "fk_crm_workflow_logs_customer_id" FOREIGN KEY ("customer_id") REFERENCES "public"."crm_customers" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_workflow_logs" ADD CONSTRAINT "fk_crm_workflow_logs_opportunity_id" FOREIGN KEY ("opportunity_id") REFERENCES "public"."crm_opportunities" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table crm_workflow_rules
-- ----------------------------
ALTER TABLE "public"."crm_workflow_rules" ADD CONSTRAINT "crm_workflow_rules_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_workflow_rules" ADD CONSTRAINT "fk_crm_workflow_rules_created_by" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "public"."crm_workflow_rules" ADD CONSTRAINT "fk_crm_workflow_rules_updated_by" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table gen_demo
-- ----------------------------
ALTER TABLE "public"."gen_demo" ADD CONSTRAINT "gen_demo_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."gen_demo" ADD CONSTRAINT "gen_demo_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."gen_demo" ADD CONSTRAINT "gen_demo_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table gen_demo01
-- ----------------------------
ALTER TABLE "public"."gen_demo01" ADD CONSTRAINT "gen_demo01_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."gen_demo01" ADD CONSTRAINT "gen_demo01_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."gen_demo01" ADD CONSTRAINT "gen_demo01_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table gen_table
-- ----------------------------
ALTER TABLE "public"."gen_table" ADD CONSTRAINT "gen_table_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."gen_table" ADD CONSTRAINT "gen_table_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."gen_table" ADD CONSTRAINT "gen_table_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table gen_table_column
-- ----------------------------
ALTER TABLE "public"."gen_table_column" ADD CONSTRAINT "gen_table_column_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."gen_table_column" ADD CONSTRAINT "gen_table_column_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."gen_table_column" ADD CONSTRAINT "gen_table_column_table_id_fkey" FOREIGN KEY ("table_id") REFERENCES "public"."gen_table" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."gen_table_column" ADD CONSTRAINT "gen_table_column_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "public"."sys_dept" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sys_dict_data
-- ----------------------------
ALTER TABLE "public"."sys_dict_data" ADD CONSTRAINT "sys_dict_data_dict_type_id_fkey" FOREIGN KEY ("dict_type_id") REFERENCES "public"."sys_dict_type" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sys_log
-- ----------------------------
ALTER TABLE "public"."sys_log" ADD CONSTRAINT "sys_log_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sys_log" ADD CONSTRAINT "sys_log_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sys_log" ADD CONSTRAINT "sys_log_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "public"."sys_menu" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sys_notice
-- ----------------------------
ALTER TABLE "public"."sys_notice" ADD CONSTRAINT "sys_notice_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sys_notice" ADD CONSTRAINT "sys_notice_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sys_notice" ADD CONSTRAINT "sys_notice_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sys_position
-- ----------------------------
ALTER TABLE "public"."sys_position" ADD CONSTRAINT "sys_position_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sys_position" ADD CONSTRAINT "sys_position_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sys_position" ADD CONSTRAINT "sys_position_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sys_role_depts
-- ----------------------------
ALTER TABLE "public"."sys_role_depts" ADD CONSTRAINT "sys_role_depts_dept_id_fkey" FOREIGN KEY ("dept_id") REFERENCES "public"."sys_dept" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."sys_role_depts" ADD CONSTRAINT "sys_role_depts_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sys_role_menus
-- ----------------------------
ALTER TABLE "public"."sys_role_menus" ADD CONSTRAINT "sys_role_menus_menu_id_fkey" FOREIGN KEY ("menu_id") REFERENCES "public"."sys_menu" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."sys_role_menus" ADD CONSTRAINT "sys_role_menus_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_dept_id_fkey" FOREIGN KEY ("dept_id") REFERENCES "public"."sys_dept" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "public"."sys_tenant" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sys_user_positions
-- ----------------------------
ALTER TABLE "public"."sys_user_positions" ADD CONSTRAINT "sys_user_positions_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "public"."sys_position" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."sys_user_positions" ADD CONSTRAINT "sys_user_positions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sys_user_roles
-- ----------------------------
ALTER TABLE "public"."sys_user_roles" ADD CONSTRAINT "sys_user_roles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."sys_role" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."sys_user_roles" ADD CONSTRAINT "sys_user_roles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."sys_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table task_node
-- ----------------------------
ALTER TABLE "public"."task_node" ADD CONSTRAINT "task_node_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."task_node" ADD CONSTRAINT "task_node_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."task_node" ADD CONSTRAINT "task_node_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table task_workflow
-- ----------------------------
ALTER TABLE "public"."task_workflow" ADD CONSTRAINT "task_workflow_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."task_workflow" ADD CONSTRAINT "task_workflow_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."task_workflow" ADD CONSTRAINT "task_workflow_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table task_workflow_node_type
-- ----------------------------
ALTER TABLE "public"."task_workflow_node_type" ADD CONSTRAINT "task_workflow_node_type_created_id_fkey" FOREIGN KEY ("created_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."task_workflow_node_type" ADD CONSTRAINT "task_workflow_node_type_deleted_id_fkey" FOREIGN KEY ("deleted_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."task_workflow_node_type" ADD CONSTRAINT "task_workflow_node_type_updated_id_fkey" FOREIGN KEY ("updated_id") REFERENCES "public"."sys_user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
