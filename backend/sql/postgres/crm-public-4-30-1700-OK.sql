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

 Date: 30/04/2026 16:59:15
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
-- Sequence structure for app_portal_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."app_portal_id_seq1";
CREATE SEQUENCE "public"."app_portal_id_seq1" 
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
-- Sequence structure for gen_demo01_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_demo01_id_seq1";
CREATE SEQUENCE "public"."gen_demo01_id_seq1" 
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
-- Sequence structure for gen_demo_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_demo_id_seq1";
CREATE SEQUENCE "public"."gen_demo_id_seq1" 
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
-- Sequence structure for gen_table_column_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_table_column_id_seq1";
CREATE SEQUENCE "public"."gen_table_column_id_seq1" 
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
-- Sequence structure for gen_table_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."gen_table_id_seq1";
CREATE SEQUENCE "public"."gen_table_id_seq1" 
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
-- Sequence structure for sys_dept_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dept_id_seq1";
CREATE SEQUENCE "public"."sys_dept_id_seq1" 
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
-- Sequence structure for sys_dict_data_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dict_data_id_seq1";
CREATE SEQUENCE "public"."sys_dict_data_id_seq1" 
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
-- Sequence structure for sys_dict_type_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_dict_type_id_seq1";
CREATE SEQUENCE "public"."sys_dict_type_id_seq1" 
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
-- Sequence structure for sys_log_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_log_id_seq1";
CREATE SEQUENCE "public"."sys_log_id_seq1" 
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
-- Sequence structure for sys_menu_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_menu_id_seq1";
CREATE SEQUENCE "public"."sys_menu_id_seq1" 
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
-- Sequence structure for sys_notice_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_notice_id_seq1";
CREATE SEQUENCE "public"."sys_notice_id_seq1" 
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
-- Sequence structure for sys_param_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_param_id_seq1";
CREATE SEQUENCE "public"."sys_param_id_seq1" 
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
-- Sequence structure for sys_position_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_position_id_seq1";
CREATE SEQUENCE "public"."sys_position_id_seq1" 
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
-- Sequence structure for sys_role_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_role_id_seq1";
CREATE SEQUENCE "public"."sys_role_id_seq1" 
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
-- Sequence structure for sys_tenant_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_tenant_id_seq1";
CREATE SEQUENCE "public"."sys_tenant_id_seq1" 
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
-- Sequence structure for sys_user_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sys_user_id_seq1";
CREATE SEQUENCE "public"."sys_user_id_seq1" 
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
-- Sequence structure for task_job_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_job_id_seq1";
CREATE SEQUENCE "public"."task_job_id_seq1" 
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
-- Sequence structure for task_node_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_node_id_seq1";
CREATE SEQUENCE "public"."task_node_id_seq1" 
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
-- Sequence structure for task_workflow_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_workflow_id_seq1";
CREATE SEQUENCE "public"."task_workflow_id_seq1" 
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
-- Sequence structure for task_workflow_node_type_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_workflow_node_type_id_seq1";
CREATE SEQUENCE "public"."task_workflow_node_type_id_seq1" 
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
  "id" int4 NOT NULL DEFAULT nextval('app_portal_id_seq1'::regclass),
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
COMMENT ON COLUMN "public"."crm_ai_tags"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_campaign_leads"."is_converted" IS '是否已转化';
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
COMMENT ON COLUMN "public"."crm_campaigns"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_contact_relations"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_contact_relations"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_relations"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contact_relations"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contact_relations"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contact_relations"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_contact_visits"."visit_type" IS '拜访类型';
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
COMMENT ON COLUMN "public"."crm_contact_visits"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_contacts"."gender" IS '性别';
COMMENT ON COLUMN "public"."crm_contacts"."position" IS '职位';
COMMENT ON COLUMN "public"."crm_contacts"."department" IS '部门';
COMMENT ON COLUMN "public"."crm_contacts"."mobile" IS '手机';
COMMENT ON COLUMN "public"."crm_contacts"."phone" IS '电话';
COMMENT ON COLUMN "public"."crm_contacts"."email" IS '邮箱';
COMMENT ON COLUMN "public"."crm_contacts"."wechat" IS '微信';
COMMENT ON COLUMN "public"."crm_contacts"."qq" IS 'QQ号';
COMMENT ON COLUMN "public"."crm_contacts"."is_primary" IS '是否主要联系人';
COMMENT ON COLUMN "public"."crm_contacts"."relationship" IS '关系';
COMMENT ON COLUMN "public"."crm_contacts"."influence_level" IS '影响力等级';
COMMENT ON COLUMN "public"."crm_contacts"."birthday" IS '生日';
COMMENT ON COLUMN "public"."crm_contacts"."anniversary_date" IS '纪念日';
COMMENT ON COLUMN "public"."crm_contacts"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_contacts"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contacts"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contacts"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contacts"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contacts"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_type" IS '发票类型';
COMMENT ON COLUMN "public"."crm_contract_invoices"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_contract_invoices"."tax_rate" IS '税率';
COMMENT ON COLUMN "public"."crm_contract_invoices"."tax_amount" IS '税额';
COMMENT ON COLUMN "public"."crm_contract_invoices"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_date" IS '开票日期';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_status" IS '发票状态';
COMMENT ON COLUMN "public"."crm_contract_invoices"."issued_by" IS '开具人ID';
COMMENT ON COLUMN "public"."crm_contract_invoices"."issued_at" IS '开具时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."invoice_file_url" IS '发票文件URL';
COMMENT ON COLUMN "public"."crm_contract_invoices"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_contract_invoices"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_contract_invoices"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_contract_invoices"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_contracts"."contract_type" IS '合同类型';
COMMENT ON COLUMN "public"."crm_contracts"."start_date" IS '开始日期';
COMMENT ON COLUMN "public"."crm_contracts"."end_date" IS '结束日期';
COMMENT ON COLUMN "public"."crm_contracts"."currency" IS '币种';
COMMENT ON COLUMN "public"."crm_contracts"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_contracts"."paid_amount" IS '已付金额';
COMMENT ON COLUMN "public"."crm_contracts"."unpaid_amount" IS '未付金额';
COMMENT ON COLUMN "public"."crm_contracts"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_contracts"."approval_status" IS '审批状态';
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
COMMENT ON COLUMN "public"."crm_contracts"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_customer_activities"."activity_type" IS '活动类型';
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
COMMENT ON COLUMN "public"."crm_customer_addresses"."is_default" IS '是否默认';
COMMENT ON COLUMN "public"."crm_customer_addresses"."is_active" IS '是否启用';
COMMENT ON COLUMN "public"."crm_customer_addresses"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_customer_addresses"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_customer_addresses"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_customer_addresses"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_customer_attachments"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_customer_tags"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_customers"."customer_type" IS '客户类型';
COMMENT ON COLUMN "public"."crm_customers"."industry" IS '所属行业';
COMMENT ON COLUMN "public"."crm_customers"."source" IS '客户来源';
COMMENT ON COLUMN "public"."crm_customers"."customer_status" IS '客户状态';
COMMENT ON COLUMN "public"."crm_customers"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_customers"."department_id" IS '所属部门ID,关联sys_dept';
COMMENT ON COLUMN "public"."crm_customers"."lead_id" IS '来源线索ID,关联crm_leads';
COMMENT ON COLUMN "public"."crm_customers"."pool_status" IS '公海池状态';
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
COMMENT ON COLUMN "public"."crm_customers"."rating" IS '客户评分';
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
COMMENT ON COLUMN "public"."crm_customers"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_customers"."dept_id" IS '所属部门ID(关联sys_dept.id)';
COMMENT ON TABLE "public"."crm_customers" IS 'Customers';

-- ----------------------------
-- Records of crm_customers
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
COMMENT ON COLUMN "public"."crm_follow_records"."follow_type" IS '跟进方式';
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
COMMENT ON COLUMN "public"."crm_followups"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_import_records"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_invoices"."invoice_type" IS '发票类型';
COMMENT ON COLUMN "public"."crm_invoices"."invoice_date" IS '开票日期';
COMMENT ON COLUMN "public"."crm_invoices"."due_date" IS '到期日期';
COMMENT ON COLUMN "public"."crm_invoices"."amount" IS '金额';
COMMENT ON COLUMN "public"."crm_invoices"."tax_amount" IS '税额';
COMMENT ON COLUMN "public"."crm_invoices"."total_amount" IS '总金额';
COMMENT ON COLUMN "public"."crm_invoices"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_joint_followups"."can_edit" IS '是否可编辑';
COMMENT ON COLUMN "public"."crm_joint_followups"."can_view_sensitive" IS '是否可查看敏感信息';
COMMENT ON COLUMN "public"."crm_joint_followups"."followup_count" IS '跟进次数';
COMMENT ON COLUMN "public"."crm_joint_followups"."last_followup_date" IS '最后跟进日期';
COMMENT ON COLUMN "public"."crm_joint_followups"."contribution_score" IS '贡献评分';
COMMENT ON COLUMN "public"."crm_joint_followups"."assigned_date" IS '分配日期';
COMMENT ON COLUMN "public"."crm_joint_followups"."assigned_by" IS '分配人ID';
COMMENT ON COLUMN "public"."crm_joint_followups"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_leads"."source" IS '来源';
COMMENT ON COLUMN "public"."crm_leads"."campaign_id" IS '活动ID';
COMMENT ON COLUMN "public"."crm_leads"."channel" IS '渠道';
COMMENT ON COLUMN "public"."crm_leads"."phone" IS '电话';
COMMENT ON COLUMN "public"."crm_leads"."email" IS '邮箱';
COMMENT ON COLUMN "public"."crm_leads"."company" IS '公司名称';
COMMENT ON COLUMN "public"."crm_leads"."position" IS '职位';
COMMENT ON COLUMN "public"."crm_leads"."score" IS '评分';
COMMENT ON COLUMN "public"."crm_leads"."grade" IS '等级';
COMMENT ON COLUMN "public"."crm_leads"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_leads"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_marketing_campaigns"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_marketing_channels"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_notifications"."notification_type" IS '通知类型';
COMMENT ON COLUMN "public"."crm_notifications"."title" IS '职位';
COMMENT ON COLUMN "public"."crm_notifications"."content" IS '内容';
COMMENT ON COLUMN "public"."crm_notifications"."related_type" IS '关联类型';
COMMENT ON COLUMN "public"."crm_notifications"."related_id" IS '关联ID,关联对应表';
COMMENT ON COLUMN "public"."crm_notifications"."is_read" IS '是否已读';
COMMENT ON COLUMN "public"."crm_notifications"."read_at" IS '阅读时间';
COMMENT ON COLUMN "public"."crm_notifications"."priority" IS '优先级';
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
COMMENT ON COLUMN "public"."crm_operation_logs"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_opportunities"."stage" IS '阶段';
COMMENT ON COLUMN "public"."crm_opportunities"."stage_updated_at" IS '阶段更新时间';
COMMENT ON COLUMN "public"."crm_opportunities"."product_ids" IS '产品IDs';
COMMENT ON COLUMN "public"."crm_opportunities"."source" IS '来源';
COMMENT ON COLUMN "public"."crm_opportunities"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_opportunities"."lost_reason" IS '输单原因';
COMMENT ON COLUMN "public"."crm_opportunities"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunities"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_opportunities"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_opportunities"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_opportunities"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_opportunity_products"."is_preferred" IS '是否首选';
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
COMMENT ON COLUMN "public"."crm_opportunity_stages"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_order_items"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_orders"."order_status" IS '订单状态';
COMMENT ON COLUMN "public"."crm_orders"."payment_status" IS '付款状态';
COMMENT ON COLUMN "public"."crm_orders"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_orders"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_orders"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_orders"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_orders"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_payments"."payment_status" IS '付款状态';
COMMENT ON COLUMN "public"."crm_payments"."confirmed_by" IS '确认人ID';
COMMENT ON COLUMN "public"."crm_payments"."confirmed_at" IS '确认时间';
COMMENT ON COLUMN "public"."crm_payments"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_payments"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_payments"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_payments"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_payments"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_payments"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_price_tiers"."priority" IS '优先级';
COMMENT ON COLUMN "public"."crm_price_tiers"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_product_categories"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_product_documents"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_product_documents"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_documents"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_documents"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_product_price_history"."approval_status" IS '审批状态';
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
COMMENT ON COLUMN "public"."crm_product_price_policies"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_product_price_policies"."priority" IS '优先级';
COMMENT ON COLUMN "public"."crm_product_price_policies"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_price_policies"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_price_policies"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_price_policies"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_product_prices"."is_active" IS '是否启用';
COMMENT ON COLUMN "public"."crm_product_prices"."customer_id" IS '客户ID,关联对应表';
COMMENT ON COLUMN "public"."crm_product_prices"."customer_level" IS '客户等级';
COMMENT ON COLUMN "public"."crm_product_prices"."quantity_prices" IS '阶梯价格';
COMMENT ON COLUMN "public"."crm_product_prices"."approval_status" IS '审批状态';
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
COMMENT ON COLUMN "public"."crm_product_skus"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_product_skus"."is_default" IS '是否默认';
COMMENT ON COLUMN "public"."crm_product_skus"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_product_skus"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_product_skus"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_product_skus"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_products"."product_type" IS '产品类型';
COMMENT ON COLUMN "public"."crm_products"."standard_price" IS '标准价';
COMMENT ON COLUMN "public"."crm_products"."cost_price" IS '成本价';
COMMENT ON COLUMN "public"."crm_products"."min_price" IS '最低价';
COMMENT ON COLUMN "public"."crm_products"."currency" IS '币种';
COMMENT ON COLUMN "public"."crm_products"."unit" IS '单位';
COMMENT ON COLUMN "public"."crm_products"."specifications" IS '规格参数';
COMMENT ON COLUMN "public"."crm_products"."stock_quantity" IS '库存数量';
COMMENT ON COLUMN "public"."crm_products"."min_stock" IS '最低库存';
COMMENT ON COLUMN "public"."crm_products"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_products"."is_featured" IS '是否推荐';
COMMENT ON COLUMN "public"."crm_products"."image_url" IS '图片URL';
COMMENT ON COLUMN "public"."crm_products"."document_urls" IS '文档链接';
COMMENT ON COLUMN "public"."crm_products"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_products"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_products"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_products"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_products"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_quotations"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_quotations"."approval_status" IS '审批状态';
COMMENT ON COLUMN "public"."crm_quotations"."approved_by" IS '审批人ID,关联sys_users';
COMMENT ON COLUMN "public"."crm_quotations"."approved_at" IS '审批时间';
COMMENT ON COLUMN "public"."crm_quotations"."converted_contract_id" IS '转化合同ID,关联对应表';
COMMENT ON COLUMN "public"."crm_quotations"."terms_conditions" IS '条款条件';
COMMENT ON COLUMN "public"."crm_quotations"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_quotations"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_quotations"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_quotations"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_quotations"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_quotations"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_renewals"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_renewals"."owner_id" IS '负责人ID(关联sys_user.id)';
COMMENT ON COLUMN "public"."crm_renewals"."remark" IS '备注';
COMMENT ON COLUMN "public"."crm_renewals"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_renewals"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_renewals"."updated_id" IS '更新人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_renewals"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_renewals"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_report_instances"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_report_templates"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_sales_activities"."activity_type" IS '活动类型';
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
COMMENT ON COLUMN "public"."crm_sales_activities"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."created_id" IS '创建人ID（外键→sys_user）';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_satisfaction_surveys"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_tag_definitions"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_tags"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_tasks"."priority" IS '优先级';
COMMENT ON COLUMN "public"."crm_tasks"."status" IS '系统状态(0:正常 1:禁用)';
COMMENT ON COLUMN "public"."crm_tasks"."completed_at" IS '完成时间';
COMMENT ON COLUMN "public"."crm_tasks"."remind_enabled" IS '是否启用提醒';
COMMENT ON COLUMN "public"."crm_tasks"."remind_before_minutes" IS '提前提醒分钟数';
COMMENT ON COLUMN "public"."crm_tasks"."created_time" IS '创建时间';
COMMENT ON COLUMN "public"."crm_tasks"."updated_time" IS '更新时间';
COMMENT ON COLUMN "public"."crm_tasks"."is_deleted" IS '是否已删除(false:否 true:是)';
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
COMMENT ON COLUMN "public"."crm_user_extensions"."auto_assign_enabled" IS '自动分配启用';
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
COMMENT ON COLUMN "public"."crm_workflow_approvals"."status" IS '系统状态(0:正常 1:禁用)';
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
COMMENT ON COLUMN "public"."crm_workflow_rules"."enabled" IS '是否启用';
COMMENT ON COLUMN "public"."crm_workflow_rules"."priority" IS '优先级';
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
  "id" int4 NOT NULL DEFAULT nextval('gen_demo_id_seq1'::regclass),
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
  "id" int4 NOT NULL DEFAULT nextval('gen_demo01_id_seq1'::regclass),
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
  "id" int4 NOT NULL DEFAULT nextval('gen_table_id_seq1'::regclass),
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
INSERT INTO "public"."gen_table" VALUES ('crm_customers', '客户中心', 'CrmCustomers', 'module_crm', 'customers', NULL, '客户中心', NULL, NULL, NULL, 1, '3ae9249a-c321-4640-896c-df86d4c94e32', '0', '客户管理/客户中心', '2026-04-29 19:56:07.845844', '2026-04-29 20:01:21.586057', 'f', NULL, 1, 1, NULL);

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
  "id" int4 NOT NULL DEFAULT nextval('gen_table_column_id_seq1'::regclass),
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
INSERT INTO "public"."gen_table_column" VALUES ('id', '主键ID（自增）', 'INTEGER', '', 'nextval(''crm_customers_id_seq''::regclass)', 'f', 'f', 'f', 'f', 'int', 'id', 'f', 'f', 'f', 'f', NULL, 'input', '', 1, 1, 1, '89552c2f-ba36-4401-908a-4567a8904ac7', '0', NULL, '2026-04-29 19:56:07.969522', '2026-04-29 19:56:07.969522', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('customer_code', '客户编号', 'VARCHAR(50)', '50', '', 'f', 'f', 'f', 'f', 'str', 'customerCode', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 2, 1, 2, '36fe6402-3ee1-46fb-be60-64050882241b', '0', NULL, '2026-04-29 19:56:08.008693', '2026-04-29 19:56:08.008693', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('customer_name', '客户名称', 'VARCHAR(200)', '200', '', 'f', 'f', 'f', 'f', 'str', 'customerName', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 3, 1, 3, 'f3ef0eb0-ac98-4e89-8aeb-c8e7c6051c6e', '0', NULL, '2026-04-29 19:56:08.0154', '2026-04-29 19:56:08.0154', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('customer_type', '客户类型', 'VARCHAR(20)', '20', '''enterprise''::character varying', 'f', 'f', 'f', 'f', 'str', 'customerType', 'f', 'f', 'f', 'f', 'LIKE', 'select', '', 4, 1, 4, 'abf96f60-c96c-4adb-be79-fad0778ed5fb', '0', NULL, '2026-04-29 19:56:08.020018', '2026-04-29 19:56:08.020018', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('industry', '所属行业', 'VARCHAR(100)', '100', '', 'f', 'f', 'f', 'f', 'str', 'industry', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 5, 1, 5, '53b36095-98f3-4ec8-a48b-2c82685fc5bf', '0', NULL, '2026-04-29 19:56:08.024626', '2026-04-29 19:56:08.024626', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('source', '客户来源', 'VARCHAR(50)', '50', '', 'f', 'f', 'f', 'f', 'str', 'source', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 6, 1, 6, '6bf0cbe4-0f93-4a19-ab87-da8f14079b3e', '0', NULL, '2026-04-29 19:56:08.029408', '2026-04-29 19:56:08.029408', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('customer_status', '客户状态', 'VARCHAR(20)', '20', '''active''::character varying', 'f', 'f', 'f', 'f', 'str', 'customerStatus', 'f', 'f', 'f', 'f', 'LIKE', 'radio', '', 7, 1, 7, 'b6373da2-1c00-447e-b0c4-46c215a5f3ec', '0', NULL, '2026-04-29 19:56:08.033322', '2026-04-29 19:56:08.033322', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('owner_id', '负责人ID(关联sys_user.id)', 'INTEGER', '', '', 'f', 'f', 'f', 'f', 'int', 'ownerId', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 8, 1, 8, 'f7c965db-05e1-43a4-a963-7a0b170d52a2', '0', NULL, '2026-04-29 19:56:08.036347', '2026-04-29 19:56:08.036347', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('department_id', '所属部门ID,关联sys_dept', 'INTEGER', '', '', 'f', 'f', 'f', 'f', 'int', 'departmentId', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 9, 1, 9, '73f9545d-d750-445c-9177-efb9da9dcb4c', '0', NULL, '2026-04-29 19:56:08.042407', '2026-04-29 19:56:08.042407', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('lead_id', '来源线索ID,关联crm_leads', 'INTEGER', '', '', 'f', 'f', 'f', 'f', 'int', 'leadId', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 10, 1, 10, '144a531d-43af-43ce-8ce4-d6f38cfd2176', '0', NULL, '2026-04-29 19:56:08.04847', '2026-04-29 19:56:08.04847', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('pool_status', '公海池状态', 'VARCHAR(20)', '20', '''private''::character varying', 'f', 'f', 'f', 'f', 'str', 'poolStatus', 'f', 'f', 'f', 'f', 'LIKE', 'radio', '', 11, 1, 11, '1e720395-a946-401a-b28c-3db757a7dfd4', '0', NULL, '2026-04-29 19:56:08.052863', '2026-04-29 19:56:08.052863', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('last_followup_at', '最后跟进时间', 'TIMESTAMP', '', '', 'f', 'f', 'f', 'f', 'datetime', 'lastFollowupAt', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 12, 1, 12, 'a9d85715-a329-4e5c-b63d-5e6b7c7eff68', '0', NULL, '2026-04-29 19:56:08.057779', '2026-04-29 19:56:08.057779', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('next_followup_at', '下次跟进时间', 'TIMESTAMP', '', '', 'f', 'f', 'f', 'f', 'datetime', 'nextFollowupAt', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 13, 1, 13, '64169cb1-8066-45b6-8800-75afe9441e81', '0', NULL, '2026-04-29 19:56:08.061539', '2026-04-29 19:56:08.061539', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('created_time', '创建时间', 'TIMESTAMP', '', 'CURRENT_TIMESTAMP', 'f', 'f', 'f', 'f', 'datetime', 'createdTime', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 14, 1, 14, 'be1cbe1e-1cea-4bee-9563-7cf075a6e4d5', '0', NULL, '2026-04-29 19:56:08.065538', '2026-04-29 19:56:08.065538', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('updated_time', '更新时间', 'TIMESTAMP', '', 'CURRENT_TIMESTAMP', 'f', 'f', 'f', 'f', 'datetime', 'updatedTime', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 15, 1, 15, '27fb728b-d292-4c7b-8e11-212e9d15133a', '0', NULL, '2026-04-29 19:56:08.069556', '2026-04-29 19:56:08.069556', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('created_id', '创建人ID(关联sys_user.id)', 'INTEGER', '', '', 'f', 'f', 'f', 'f', 'int', 'createdId', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 16, 1, 16, 'fe66a8e0-8c84-4448-9b1f-852da952d92f', '0', NULL, '2026-04-29 19:56:08.074064', '2026-04-29 19:56:08.074064', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('updated_id', '更新人ID(关联sys_user.id)', 'INTEGER', '', '', 'f', 'f', 'f', 'f', 'int', 'updatedId', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 17, 1, 17, '4f42e9f0-e50b-4b08-b7c9-555a0d911746', '0', NULL, '2026-04-29 19:56:08.078951', '2026-04-29 19:56:08.078951', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('customer_short_name', '客户简称', 'VARCHAR(100)', '100', '', 'f', 'f', 'f', 'f', 'str', 'customerShortName', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 18, 1, 18, 'a3aab327-46a2-4360-b6f3-3b02836853ff', '0', NULL, '2026-04-29 19:56:08.08388', '2026-04-29 19:56:08.08388', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('customer_level', '客户等级', 'VARCHAR(20)', '20', '''C''::character varying', 'f', 'f', 'f', 'f', 'str', 'customerLevel', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 19, 1, 19, '293b8ebb-a573-4a6e-9a3b-4bcfdd47ef6e', '0', NULL, '2026-04-29 19:56:08.087788', '2026-04-29 19:56:08.087788', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('scale', '企业规模', 'VARCHAR(20)', '20', '', 'f', 'f', 'f', 'f', 'str', 'scale', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 20, 1, 20, 'a1d83236-1397-4893-b5de-917289bf13c1', '0', NULL, '2026-04-29 19:56:08.091787', '2026-04-29 19:56:08.091787', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('registration_no', '工商注册号', 'VARCHAR(50)', '50', '', 'f', 'f', 'f', 'f', 'str', 'registrationNo', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 21, 1, 21, '772ee8de-a9d4-4e9b-a85b-fc047875cc63', '0', NULL, '2026-04-29 19:56:08.095833', '2026-04-29 19:56:08.095833', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('tax_no', '税号', 'VARCHAR(50)', '50', '', 'f', 'f', 'f', 'f', 'str', 'taxNo', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 22, 1, 22, 'e4bc19af-aefc-442d-b839-de6efb7806b7', '0', NULL, '2026-04-29 19:56:08.099572', '2026-04-29 19:56:08.099572', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('legal_person', '法人代表', 'VARCHAR(100)', '100', '', 'f', 'f', 'f', 'f', 'str', 'legalPerson', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 23, 1, 23, '0a95ff5f-239c-4eab-9b28-458d4d9cc831', '0', NULL, '2026-04-29 19:56:08.105083', '2026-04-29 19:56:08.105083', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('established_date', '成立日期', 'DATE', '', '', 'f', 'f', 'f', 'f', 'date', 'establishedDate', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 24, 1, 24, 'b1e18336-4be6-4701-bda1-ee9e5d64b62e', '0', NULL, '2026-04-29 19:56:08.107858', '2026-04-29 19:56:08.107858', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('registered_capital', '注册资本', 'NUMERIC(18, 2)', '', '', 'f', 'f', 'f', 'f', 'Decimal', 'registeredCapital', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 25, 1, 25, '7f8d215b-83a6-4113-83b6-28171b9752dd', '0', NULL, '2026-04-29 19:56:08.114117', '2026-04-29 19:56:08.114117', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('paid_capital', '实缴资本', 'NUMERIC(18, 2)', '', '', 'f', 'f', 'f', 'f', 'Decimal', 'paidCapital', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 26, 1, 26, '886d270c-1042-40f1-8737-33cfa1da6afa', '0', NULL, '2026-04-29 19:56:08.120272', '2026-04-29 19:56:08.120272', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('website', '公司网站', 'VARCHAR(255)', '255', '', 'f', 'f', 'f', 'f', 'str', 'website', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 27, 1, 27, 'bf3847d6-6fe8-49d1-8ca0-7ec15ec2aa49', '0', NULL, '2026-04-29 19:56:08.128359', '2026-04-29 19:56:08.128359', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('main_phone', '主联系电话', 'VARCHAR(50)', '50', '', 'f', 'f', 'f', 'f', 'str', 'mainPhone', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 28, 1, 28, 'c18d95cb-711a-4aea-8140-3579083dc6de', '0', NULL, '2026-04-29 19:56:08.134711', '2026-04-29 19:56:08.134711', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('main_email', '主联系邮箱', 'VARCHAR(255)', '255', '', 'f', 'f', 'f', 'f', 'str', 'mainEmail', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 29, 1, 29, '999c98ce-f4fc-44bf-8947-10fd0384b095', '0', NULL, '2026-04-29 19:56:08.141135', '2026-04-29 19:56:08.141135', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('country', '国家', 'VARCHAR(50)', '50', '''中国''::character varying', 'f', 'f', 'f', 'f', 'str', 'country', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 30, 1, 30, '165dac23-b269-4652-a495-6b4096170bdb', '0', NULL, '2026-04-29 19:56:08.147825', '2026-04-29 19:56:08.147825', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('province', '省份', 'VARCHAR(50)', '50', '', 'f', 'f', 'f', 'f', 'str', 'province', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 31, 1, 31, '0cbcb821-b80d-44e1-b6df-3c2c356a19b5', '0', NULL, '2026-04-29 19:56:08.154257', '2026-04-29 19:56:08.154257', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('city', '城市', 'VARCHAR(50)', '50', '', 'f', 'f', 'f', 'f', 'str', 'city', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 32, 1, 32, 'c0b9e617-a145-4157-adf5-0a998018851f', '0', NULL, '2026-04-29 19:56:08.159814', '2026-04-29 19:56:08.159814', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('district', '区县', 'VARCHAR(50)', '50', '', 'f', 'f', 'f', 'f', 'str', 'district', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 33, 1, 33, '20ecca60-e741-4307-a1a1-61d02262aa26', '0', NULL, '2026-04-29 19:56:08.167359', '2026-04-29 19:56:08.167359', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('address', '详细地址', 'VARCHAR(500)', '500', '', 'f', 'f', 'f', 'f', 'str', 'address', 'f', 'f', 'f', 'f', 'LIKE', 'textarea', '', 34, 1, 34, '8cc5f44a-ae62-4731-935b-d330bde65df4', '0', NULL, '2026-04-29 19:56:08.173694', '2026-04-29 19:56:08.173694', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('rating', '客户评分', 'INTEGER', '', '3', 'f', 'f', 'f', 'f', 'int', 'rating', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 35, 1, 35, 'bd8714bd-68f7-4594-8886-eb1eb155e1d1', '0', NULL, '2026-04-29 19:56:08.179502', '2026-04-29 19:56:08.179502', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('territory', '所属区域', 'VARCHAR(100)', '100', '', 'f', 'f', 'f', 'f', 'str', 'territory', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 36, 1, 36, '6a63b477-3ca4-40e2-b5a4-5abdee4ad5dd', '0', NULL, '2026-04-29 19:56:08.186531', '2026-04-29 19:56:08.186531', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('customer_since', '成为客户时间', 'DATE', '', '', 'f', 'f', 'f', 'f', 'date', 'customerSince', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 37, 1, 37, 'af1a58c3-cd7e-4c2f-8e51-772af9a14d76', '0', NULL, '2026-04-29 19:56:08.19326', '2026-04-29 19:56:08.19326', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('first_order_date', '首单日期', 'DATE', '', '', 'f', 'f', 'f', 'f', 'date', 'firstOrderDate', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 38, 1, 38, 'dbad33a4-b1c9-4afe-9c58-38c62dc9b392', '0', NULL, '2026-04-29 19:56:08.200588', '2026-04-29 19:56:08.200588', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('last_order_date', '最后订单日期', 'DATE', '', '', 'f', 'f', 'f', 'f', 'date', 'lastOrderDate', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 39, 1, 39, '620de21d-448c-4441-9d28-0f9005ee6649', '0', NULL, '2026-04-29 19:56:08.206738', '2026-04-29 19:56:08.206738', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('total_revenue', '总营收', 'NUMERIC(18, 2)', '', '0', 'f', 'f', 'f', 'f', 'Decimal', 'totalRevenue', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 40, 1, 40, '248a49e5-6fd6-432b-a1ca-4ba997dec70a', '0', NULL, '2026-04-29 19:56:08.211695', '2026-04-29 19:56:08.211695', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('total_orders', '总订单数', 'INTEGER', '', '0', 'f', 'f', 'f', 'f', 'int', 'totalOrders', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 41, 1, 41, 'c2c02283-c882-4062-95ab-d87464dcf11a', '0', NULL, '2026-04-29 19:56:08.227955', '2026-04-29 19:56:08.227955', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('credit_limit', '信用额度', 'NUMERIC(18, 2)', '', '0', 'f', 'f', 'f', 'f', 'Decimal', 'creditLimit', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 42, 1, 42, 'd8713a14-88f6-469e-9abd-edb4aeaa19d0', '0', NULL, '2026-04-29 19:56:08.23497', '2026-04-29 19:56:08.23497', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('outstanding_amount', '欠款金额', 'NUMERIC(18, 2)', '', '0', 'f', 'f', 'f', 'f', 'Decimal', 'outstandingAmount', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 43, 1, 43, '126c9220-8ec8-4727-83bb-de6daf56825f', '0', NULL, '2026-04-29 19:56:08.240133', '2026-04-29 19:56:08.240133', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('payment_days', '账期天数', 'INTEGER', '', '0', 'f', 'f', 'f', 'f', 'int', 'paymentDays', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 44, 1, 44, 'aeba2807-7f37-45ea-9222-80294162a1f0', '0', NULL, '2026-04-29 19:56:08.246218', '2026-04-29 19:56:08.246218', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('parent_customer_id', '父客户ID(集团客户)', 'INTEGER', '', '', 'f', 'f', 'f', 'f', 'int', 'parentCustomerId', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 45, 1, 45, 'db5b12c1-892d-43a9-917b-0940a1901ada', '0', NULL, '2026-04-29 19:56:08.253286', '2026-04-29 19:56:08.253286', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('is_parent', '是否父客户(集团总部)', 'BOOLEAN', '', 'false', 'f', 'f', 'f', 'f', 'bool', 'isParent', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 46, 1, 46, 'f8c95c40-1e2a-4214-8c36-175dc90391e6', '0', NULL, '2026-04-29 19:56:08.258659', '2026-04-29 19:56:08.258659', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('customer_segment', '客户分群', 'VARCHAR(50)', '50', '', 'f', 'f', 'f', 'f', 'str', 'customerSegment', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 47, 1, 47, '95173fb2-467c-4747-bdb9-0002b67f8238', '0', NULL, '2026-04-29 19:56:08.264165', '2026-04-29 19:56:08.264165', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('churn_risk', '流失风险(high/medium/low)', 'VARCHAR(20)', '20', '', 'f', 'f', 'f', 'f', 'str', 'churnRisk', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 48, 1, 48, '7d8c9278-7c12-49cb-bff8-c8c998d5af25', '0', NULL, '2026-04-29 19:56:08.270233', '2026-04-29 19:56:08.270233', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('description', '备注/描述', 'TEXT', '', '', 'f', 'f', 'f', 'f', 'str', 'description', 'f', 'f', 'f', 'f', NULL, 'textarea', '', 49, 1, 49, 'a9b5bdca-29b3-4d41-928a-78d422fd7820', '0', NULL, '2026-04-29 19:56:08.275058', '2026-04-29 19:56:08.275058', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('extra_data', '扩展数据(JSONB)', 'JSONB', '', '''{}''::jsonb', 'f', 'f', 'f', 'f', 'dict', 'extraData', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 50, 1, 50, '39a21d38-5256-4f2c-bf09-c23a5f429b5f', '0', NULL, '2026-04-29 19:56:08.278349', '2026-04-29 19:56:08.278349', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('version', '版本号(乐观锁)', 'INTEGER', '', '1', 'f', 'f', 'f', 'f', 'int', 'version', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 51, 1, 51, '8d2d0ccb-f000-4cdb-9d9d-13c485bf9c4f', '0', NULL, '2026-04-29 19:56:08.283208', '2026-04-29 19:56:08.283208', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('protection_deadline', '保护期截止时间(公海池)', 'TIMESTAMP', '', '', 'f', 'f', 'f', 'f', 'datetime', 'protectionDeadline', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 52, 1, 52, '8a4b8f18-80b4-4d9f-a881-19079f099dcd', '0', NULL, '2026-04-29 19:56:08.28722', '2026-04-29 19:56:08.28722', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('claim_time', '领取时间(公海池)', 'TIMESTAMP', '', '', 'f', 'f', 'f', 'f', 'datetime', 'claimTime', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 53, 1, 53, 'e51ea4e6-639a-49c6-9d7e-19dd00d4b6e8', '0', NULL, '2026-04-29 19:56:08.293381', '2026-04-29 19:56:08.293381', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('health_score', '健康度评分', 'NUMERIC(5, 2)', '', '', 'f', 'f', 'f', 'f', 'Decimal', 'healthScore', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 54, 1, 54, '6e0b3b7f-3f21-4433-b1b6-5cad8279378b', '0', NULL, '2026-04-29 19:56:08.298484', '2026-04-29 19:56:08.298484', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('duplicate_check_key', '查重键(防止重复客户)', 'VARCHAR(200)', '200', '', 'f', 'f', 'f', 'f', 'str', 'duplicateCheckKey', 'f', 'f', 'f', 'f', 'LIKE', 'input', '', 55, 1, 55, 'c42aaf1d-e711-4a40-a737-be89e6db5388', '0', NULL, '2026-04-29 19:56:08.30358', '2026-04-29 19:56:08.30358', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('is_deleted', '是否已删除(false:否 true:是)', 'BOOLEAN', '', 'false', 'f', 'f', 'f', 'f', 'bool', 'isDeleted', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 56, 1, 56, '8ec0efdc-4ae9-41fe-bc6a-8d43b1d3cd45', '0', NULL, '2026-04-29 19:56:08.307852', '2026-04-29 19:56:08.307852', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('deleted_time', '删除时间', 'TIMESTAMP', '', '', 'f', 'f', 'f', 'f', 'datetime', 'deletedTime', 'f', 'f', 'f', 'f', 'EQ', 'datetime', '', 57, 1, 57, '0cc78755-fd20-43cf-b913-c8579e4bdc60', '0', NULL, '2026-04-29 19:56:08.31238', '2026-04-29 19:56:08.31238', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('uuid', 'UUID全局唯一标识', 'VARCHAR(64)', '64', '(gen_random_uuid())::text', 'f', 'f', 'f', 'f', 'str', 'uuid', 'f', 'f', 'f', 'f', NULL, 'input', '', 58, 1, 58, 'd46f77bf-e956-4f93-9cca-705506ab03a9', '0', NULL, '2026-04-29 19:56:08.318743', '2026-04-29 19:56:08.318743', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('deleted_id', '删除人ID(关联sys_user.id)', 'INTEGER', '', '', 'f', 'f', 'f', 'f', 'int', 'deletedId', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 59, 1, 59, '268de196-5a24-431c-8d65-8b981d57bacf', '0', NULL, '2026-04-29 19:56:08.321941', '2026-04-29 19:56:08.321941', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('status', '系统状态(0:正常 1:禁用)', 'VARCHAR(10)', '10', '''0''::character varying', 'f', 'f', 'f', 'f', 'str', 'status', 'f', 'f', 'f', 'f', 'LIKE', 'radio', '', 60, 1, 60, 'f5bf359d-ac7f-41bf-ad45-a743c3024763', '0', NULL, '2026-04-29 19:56:08.32547', '2026-04-29 19:56:08.32547', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."gen_table_column" VALUES ('dept_id', '所属部门ID(关联sys_dept.id)', 'INTEGER', '', '', 'f', 'f', 'f', 'f', 'int', 'deptId', 'f', 'f', 'f', 'f', 'EQ', 'input', '', 61, 1, 61, '55c076c9-7caf-4231-9125-86b54efaebc4', '0', NULL, '2026-04-29 19:56:08.332204', '2026-04-29 19:56:08.332204', 'f', NULL, 1, 1, NULL);

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
  "id" int4 NOT NULL DEFAULT nextval('sys_dept_id_seq1'::regclass),
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
INSERT INTO "public"."sys_dept" VALUES ('集团总公司', 1, 'GROUP', '部门负责人', '1582112620', 'deptadmin@example.com', NULL, 1, '7f751e0f-b217-4d2c-bda3-04b7cb6a2f1a', '0', '集团总公司', '2026-04-29 19:40:54.543434', '2026-04-29 19:40:54.543434', 'f', NULL);

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
  "id" int4 NOT NULL DEFAULT nextval('sys_dict_data_id_seq1'::regclass),
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
INSERT INTO "public"."sys_dict_data" VALUES (1, '男', '0', 'blue', NULL, 'f', 'sys_user_sex', 1, 1, '42e1ddae-8c49-4aab-b226-8c44104bb93e', '0', '性别男', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '女', '1', 'pink', NULL, 'f', 'sys_user_sex', 1, 2, 'b763f337-2064-419d-8c9c-ea3eaabe20a5', '0', '性别女', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '未知', '2', 'red', NULL, 'f', 'sys_user_sex', 1, 3, '3087068e-f4a7-471d-9c04-229b8e1e58d8', '0', '性别未知', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '是', '1', '', 'primary', 'f', 'sys_yes_no', 2, 4, 'f40ee360-cf7d-4eb9-8092-6324fae87fb2', '0', '是', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '否', '0', '', 'danger', 'f', 'sys_yes_no', 2, 5, 'a061edd6-3105-4248-8437-51290c00e112', '0', '否', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '启用', '1', '', 'primary', 'f', 'sys_common_status', 3, 6, '5aef3554-9e1c-4897-9a2d-bdbc84087db6', '0', '启用状态', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '停用', '0', '', 'danger', 'f', 'sys_common_status', 3, 7, '111b810f-a182-48d1-8aef-b1d17b4c270b', '0', '停用状态', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '通知', '1', 'blue', 'warning', 'f', 'sys_notice_type', 4, 8, '08351f32-efcf-468c-872e-1d36119a54a5', '0', '通知', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '公告', '2', 'orange', 'success', 'f', 'sys_notice_type', 4, 9, '9b69abd7-4371-4f21-8db7-a4b0625fdf92', '0', '公告', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (99, '其他', '0', '', 'info', 'f', 'sys_oper_type', 5, 10, 'fc6e657d-90ee-4c3e-8604-8d3b85d808bf', '0', '其他操作', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '新增', '1', '', 'info', 'f', 'sys_oper_type', 5, 11, '5f77072b-c619-4c88-803e-ece3ba247ffb', '0', '新增操作', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '修改', '2', '', 'info', 'f', 'sys_oper_type', 5, 12, '0c976fa2-4735-4004-8a76-be80e71c4735', '0', '修改操作', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '删除', '3', '', 'danger', 'f', 'sys_oper_type', 5, 13, 'b1fa0c48-12d7-4cc8-8947-a05587f33836', '0', '删除操作', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '分配权限', '4', '', 'primary', 'f', 'sys_oper_type', 5, 14, '6e0fffd6-fc14-4057-89e9-3829dccdd59e', '0', '授权操作', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '导出', '5', '', 'warning', 'f', 'sys_oper_type', 5, 15, '08edacf0-65f1-4d0d-bda0-645564ae4d19', '0', '导出操作', '2026-04-29 19:40:54.615886', '2026-04-29 19:40:54.615886', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '导入', '6', '', 'warning', 'f', 'sys_oper_type', 5, 16, '5737f1bb-b4d3-46ee-9e79-b3645ab99e53', '0', '导入操作', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (7, '强退', '7', '', 'danger', 'f', 'sys_oper_type', 5, 17, 'e8591175-2841-460d-941c-0bd992c07de0', '0', '强退操作', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (8, '生成代码', '8', '', 'warning', 'f', 'sys_oper_type', 5, 18, 'b234d179-051d-4b9e-b1d7-3cc9edbac88f', '0', '生成操作', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (9, '清空数据', '9', '', 'danger', 'f', 'sys_oper_type', 5, 19, '49a7d004-69b9-4d94-bc52-c1a6002c2314', '0', '清空操作', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '默认(Memory)', 'default', '', NULL, 'f', 'sys_job_store', 6, 20, '9b228539-6e2a-4ebb-bbbd-35e9bccd5d59', '0', '默认分组', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '数据库(Sqlalchemy)', 'sqlalchemy', '', NULL, 'f', 'sys_job_store', 6, 21, 'f4e92a78-3037-43d2-b826-26888cb4d9c6', '0', '数据库分组', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '数据库(Redis)', 'redis', '', NULL, 'f', 'sys_job_store', 6, 22, '12693f02-1a52-454a-beb3-f9fdd108c4f4', '0', 'reids分组', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '线程池', 'default', '', NULL, 'f', 'sys_job_executor', 7, 23, '32db823d-b1b3-4089-b877-cc4419e2c28c', '0', '线程池', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '进程池', 'processpool', '', NULL, 'f', 'sys_job_executor', 7, 24, 'f0353191-2dfe-4870-a18c-eb343aeb64d2', '0', '进程池', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '演示函数', 'scheduler_test.job', '', NULL, 'f', 'sys_job_function', 8, 25, '058fd03d-1478-43e8-83c2-18b93ba329ed', '0', '演示函数', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '指定日期(date)', 'date', '', NULL, 'f', 'sys_job_trigger', 9, 26, '48620d2f-ba66-47ab-b63d-1f1d9db7c804', '0', '指定日期任务触发器', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '间隔触发器(interval)', 'interval', '', NULL, 'f', 'sys_job_trigger', 9, 27, 'c22a0c5a-fc43-4f82-b232-f8623f8824ba', '0', '间隔触发器任务触发器', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, 'cron表达式', 'cron', '', NULL, 'f', 'sys_job_trigger', 9, 28, '45a9cbc3-1763-47b2-b01c-39898c7e10a7', '0', '间隔触发器任务触发器', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (1, '默认(default)', 'default', '', NULL, 'f', 'sys_list_class', 10, 29, 'a2552126-60d7-4264-a0d0-8e899da239ec', '0', '默认表格回显样式', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (2, '主要(primary)', 'primary', '', NULL, 'f', 'sys_list_class', 10, 30, 'd8a1d5e8-dd40-41ba-9fe6-6262bb3fac8b', '0', '主要表格回显样式', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (3, '成功(success)', 'success', '', NULL, 'f', 'sys_list_class', 10, 31, '6d78cda9-c121-41c6-8bb6-10610fd69ea1', '0', '成功表格回显样式', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (4, '信息(info)', 'info', '', NULL, 'f', 'sys_list_class', 10, 32, '53e050c7-0760-4192-93be-c577d42d3685', '0', '信息表格回显样式', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (5, '警告(warning)', 'warning', '', NULL, 'f', 'sys_list_class', 10, 33, '0cf51e5f-eee3-45fb-889c-3dc09495bffa', '0', '警告表格回显样式', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);
INSERT INTO "public"."sys_dict_data" VALUES (6, '危险(danger)', 'danger', '', NULL, 'f', 'sys_list_class', 10, 34, '28ed7401-435d-4bd4-93b1-23619760399d', '0', '危险表格回显样式', '2026-04-29 19:40:54.616864', '2026-04-29 19:40:54.616864', 'f', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_type";
CREATE TABLE "public"."sys_dict_type" (
  "dict_name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" int4 NOT NULL DEFAULT nextval('sys_dict_type_id_seq1'::regclass),
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
INSERT INTO "public"."sys_dict_type" VALUES ('用户性别', 'sys_user_sex', 1, '9eb389d3-c043-49f4-8d49-3ebb2f86d07e', '0', '用户性别列表', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('系统是否', 'sys_yes_no', 2, '82d0761b-4054-4f4e-9414-4a317d6847ba', '0', '系统是否列表', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('系统状态', 'sys_common_status', 3, 'ff30fe27-ad42-4de1-8148-6163a16aecee', '0', '系统状态', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('通知类型', 'sys_notice_type', 4, 'e842b1a5-3c22-4a23-a643-b37c6907ee4a', '0', '通知类型列表', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('操作类型', 'sys_oper_type', 5, '37cb65ed-2972-4a79-a2bb-f0dccdca4a4d', '0', '操作类型列表', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('任务存储器', 'sys_job_store', 6, 'a304ee96-879e-43c4-871e-91ad24cf389d', '0', '任务分组列表', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('任务执行器', 'sys_job_executor', 7, '585f85d8-aceb-4eff-97bf-3d47a5d27fc2', '0', '任务执行器列表', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('任务函数', 'sys_job_function', 8, '58e4cfdb-aae4-4695-92e0-a8ce5122359b', '0', '任务函数列表', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('任务触发器', 'sys_job_trigger', 9, 'bc55fe20-08af-4018-8b7b-aeaaa2f57977', '0', '任务触发器列表', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);
INSERT INTO "public"."sys_dict_type" VALUES ('表格回显样式', 'sys_list_class', 10, '6eacee9b-d476-444b-9587-d8d5dae2c625', '0', '表格回显样式列表', '2026-04-29 19:40:54.595258', '2026-04-29 19:40:54.595258', 'f', NULL);

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
  "id" int4 NOT NULL DEFAULT nextval('sys_log_id_seq1'::regclass),
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
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/system/auth/logout', 'POST', '{"body": {"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCJcdThkODVcdTdlYTdcdTdiYTFcdTc0MDZcdTU0NThcIixcInNlc3Npb25faWRcIjpcImU2ZmQ3NzAzLTk0OGMtNDA3OS05MmM0LTI5ZGRlYTQyODgxYlwiLFwidXNlcl9pZFwiOjEsXCJ1c2VyX25hbWVcIjpcImFkbWluXCIsXCJpcGFkZHJcIjpcIjEyNy4wLjAuMVwiLFwibG9naW5fbG9jYXRpb25cIjpcIlx1NTE4NVx1N2Y1MUlQXCIsXCJvc1wiOlwiV2luZG93c1wiLFwiYnJvd3NlclwiOlwiQ2hyb21lXCIsXCJsb2dpbl90aW1lXCI6bnVsbCxcImxvZ2luX3R5cGVcIjpcIlBDXHU3YWVmXCJ9IiwiaXNfcmVmcmVzaCI6ZmFsc2UsImV4cCI6MTc3NzQ5MjI2NX0.EIwGVT3J3XcITGhkPCHbbvSzbuel8VjI3e9k-VXPGpo"}}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"退出成功","data":null,"status_code":200,"success":true}', '0.03s', 1, '73f8a66c-5796-40b6-af4d-ec61d1c6f204', '0', '退出登录', '2026-04-29 19:47:20.007498', '2026-04-29 19:47:20.007498', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (1, '/api/v1/system/auth/auto-login/token', 'POST', '{}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"获取成功","data":{"token":"5682e958-d1a1-43c1-97d5-08c826c43658","user":{"id":1,"username":"admin","name":"超级管理员","avatar":"https://service.fastapiadmin.com/api/v1/static/image/avatar.png"}},"status_code":200,"success":true}', '0.04s', 2, '84e9e5dc-ad89-472e-a7e1-c983273cbbc2', '0', '获取免登录Token', '2026-04-29 19:47:22.730301', '2026-04-29 19:47:22.730301', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."sys_log" VALUES (1, '/api/v1/system/auth/auto-login', 'POST', '{}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"登录成功","data":{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCJcdThkODVcdTdlYTdcdTdiYTFcdTc0MDZcdTU0NThcIixcInNlc3Npb25faWRcIjpcIjJkYTBhZGNhLWY5YzYtNGQxNS1iNWZmLWZkMGUyNjJhNWJiOVwiLFwidXNlcl9pZFwiOjEsXCJ1c2VyX25hbWVcIjpcImFkbWluXCIsXCJpcGFkZHJcIjpcIjEyNy4wLjAuMVwiLFwibG9naW5fbG9jYXRpb25cIjpcIlx1NTE4NVx1N2Y1MUlQXCIsXCJvc1wiOlwiV2luZG93c1wiLFwiYnJvd3NlclwiOlwiQ2hyb21lXCIsXCJsb2dpbl90aW1lXCI6bnVsbCxcImxvZ2luX3R5cGVcIjpcIlBDXHU3YWVmXCJ9IiwiaXNfcmVmcmVzaCI6ZmFsc2UsImV4cCI6MTc3NzQ5Mzg0Mn0.uG89NnGPTerRpW9FuO_ctZwTSe2q8XnthIlYGp685H4","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCJcdThkODVcdTdlYTdcdTdiYTFcdTc0MDZcdTU0NThcIixcInNlc3Npb25faWRcIjpcIjJkYTBhZGNhLWY5YzYtNGQxNS1iNWZmLWZkMGUyNjJhNWJiOVwiLFwidXNlcl9pZFwiOjEsXCJ1c2VyX25hbWVcIjpcImFkbWluXCIsXCJpcGFkZHJcIjpcIjEyNy4wLjAuMVwiLFwibG9naW5fbG9jYXRpb25cIjpcIlx1NTE4NVx1N2Y1MUlQXCIsXCJvc1wiOlwiV2luZG93c1wiLFwiYnJvd3NlclwiOlwiQ2hyb21lXCIsXCJsb2dpbl90aW1lXCI6bnVsbCxcImxvZ2luX3R5cGVcIjpcIlBDXHU3YWVmXCJ9IiwiaXNfcmVmcmVzaCI6dHJ1ZSwiZXhwIjoxNzc3NDkzODQyfQ.i-fsjApL5BYTR9VpVxQ5dP2vH6Mku6y1mVEsHMigSnw","token_type":"bearer","expires_in":1800},"status_code":200,"success":true}', '0.04s', 3, 'ed21a726-4855-4da4-9817-62fb9d049b6b', '0', '免登录', '2026-04-29 19:47:22.799039', '2026-04-29 19:47:22.799039', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/generator/gencode/import', 'POST', '{"body": ["crm_customers"]}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"导入表结构成功","data":true,"status_code":200,"success":true}', '0.91s', 4, 'd4f74ff8-76cb-4293-982d-66a712c34935', '0', '导入表结构', '2026-04-29 19:56:08.341254', '2026-04-29 19:56:08.341254', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/generator/gencode/update/1', 'PUT', '请求参数过长', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"编辑业务表信息成功","data":{"id":1,"uuid":"3ae9249a-c321-4640-896c-df86d4c94e32","status":"0","description":"客户管理/客户中心","created_time":"2026-04-29 19:56:07","updated_time":"2026-04-29 20:01:21","is_deleted":false,"deleted_time":null,"table_name":"crm_customers","table_comment":"客户中心","class_name":"CrmCustomers","package_name":"module_crm","module_name":"customers","business_name":null,"function_name":"客户中心","sub_table_name":null,"sub_table_fk_name":null,"parent_menu_id":null,"columns":[{"id":1,"uuid":"89552c2f-ba36-4401-908a-4567a8904ac7","status":"0","description":null,"created_time":"2026-04-29 19:56:07","updated_time":"2026-04-29 19:56:07","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"id","column_comment":"主键ID（自增）","column_type":"INTEGER","column_length":"","column_default":"nextval(''crm_customers_id_seq''::regclass)","is_pk":true,"is_increment":true,"is_nullable":false,"is_unique":false,"python_type":"int","python_field":"id","is_insert":false,"is_edit":false,"is_list":false,"is_query":false,"query_type":null,"html_type":"input","dict_type":"","sort":1,"super_column":"0"},{"id":2,"uuid":"36fe6402-3ee1-46fb-be60-64050882241b","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_code","column_comment":"客户编号","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":true,"python_type":"str","python_field":"customerCode","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":2,"super_column":"0"},{"id":3,"uuid":"f3ef0eb0-ac98-4e89-8aeb-c8e7c6051c6e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_name","column_comment":"客户名称","column_type":"VARCHAR(200)","column_length":"200","column_default":"","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"str","python_field":"customerName","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":3,"super_column":"0"},{"id":4,"uuid":"abf96f60-c96c-4adb-be79-fad0778ed5fb","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_type","column_comment":"客户类型","column_type":"VARCHAR(20)","column_length":"20","column_default":"''enterprise''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerType","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"select","dict_type":"","sort":4,"super_column":"0"},{"id":5,"uuid":"53b36095-98f3-4ec8-a48b-2c82685fc5bf","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"industry","column_comment":"所属行业","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"industry","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":5,"super_column":"0"},{"id":6,"uuid":"6bf0cbe4-0f93-4a19-ab87-da8f14079b3e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"source","column_comment":"客户来源","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"source","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":6,"super_column":"0"},{"id":7,"uuid":"b6373da2-1c00-447e-b0c4-46c215a5f3ec","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_status","column_comment":"客户状态","column_type":"VARCHAR(20)","column_length":"20","column_default":"''active''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerStatus","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"radio","dict_type":"","sort":7,"super_column":"0"},{"id":8,"uuid":"f7c965db-05e1-43a4-a963-7a0b170d52a2","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"owner_id","column_comment":"负责人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"ownerId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":8,"super_column":"0"},{"id":9,"uuid":"73f9545d-d750-445c-9177-efb9da9dcb4c","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"department_id","column_comment":"所属部门ID,关联sys_dept","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"departmentId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":9,"super_column":"0"},{"id":10,"uuid":"144a531d-43af-43ce-8ce4-d6f38cfd2176","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"lead_id","column_comment":"来源线索ID,关联crm_leads","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"leadId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":10,"super_column":"0"},{"id":11,"uuid":"1e720395-a946-401a-b28c-3db757a7dfd4","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"pool_status","column_comment":"公海池状态","column_type":"VARCHAR(20)","column_length":"20","column_default":"''private''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"poolStatus","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"radio","dict_type":"","sort":11,"super_column":"0"},{"id":12,"uuid":"a9d85715-a329-4e5c-b63d-5e6b7c7eff68","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"last_followup_at","column_comment":"最后跟进时间","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"lastFollowupAt","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":12,"super_column":"0"},{"id":13,"uuid":"64169cb1-8066-45b6-8800-75afe9441e81","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"next_followup_at","column_comment":"下次跟进时间","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"nextFollowupAt","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":13,"super_column":"0"},{"id":14,"uuid":"be1cbe1e-1cea-4bee-9563-7cf075a6e4d5","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"created_time","column_comment":"创建时间","column_type":"TIMESTAMP","column_length":"","column_default":"CURRENT_TIMESTAMP","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"createdTime","is_insert":false,"is_edit":false,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":14,"super_column":"0"},{"id":15,"uuid":"27fb728b-d292-4c7b-8e11-212e9d15133a","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"updated_time","column_comment":"更新时间","column_type":"TIMESTAMP","column_length":"","column_default":"CURRENT_TIMESTAMP","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"updatedTime","is_insert":false,"is_edit":false,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":15,"super_column":"0"},{"id":16,"uuid":"fe66a8e0-8c84-4448-9b1f-852da952d92f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"created_id","column_comment":"创建人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"createdId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":16,"super_column":"0"},{"id":17,"uuid":"4f42e9f0-e50b-4b08-b7c9-555a0d911746","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"updated_id","column_comment":"更新人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"updatedId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":17,"super_column":"0"},{"id":18,"uuid":"a3aab327-46a2-4360-b6f3-3b02836853ff","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_short_name","column_comment":"客户简称","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerShortName","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":18,"super_column":"0"},{"id":19,"uuid":"293b8ebb-a573-4a6e-9a3b-4bcfdd47ef6e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_level","column_comment":"客户等级","column_type":"VARCHAR(20)","column_length":"20","column_default":"''C''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerLevel","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":19,"super_column":"0"},{"id":20,"uuid":"a1d83236-1397-4893-b5de-917289bf13c1","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"scale","column_comment":"企业规模","column_type":"VARCHAR(20)","column_length":"20","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"scale","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":20,"super_column":"0"},{"id":21,"uuid":"772ee8de-a9d4-4e9b-a85b-fc047875cc63","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"registration_no","column_comment":"工商注册号","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"registrationNo","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":21,"super_column":"0"},{"id":22,"uuid":"e4bc19af-aefc-442d-b839-de6efb7806b7","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"tax_no","column_comment":"税号","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"taxNo","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":22,"super_column":"0"},{"id":23,"uuid":"0a95ff5f-239c-4eab-9b28-458d4d9cc831","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"legal_person","column_comment":"法人代表","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"legalPerson","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":23,"super_column":"0"},{"id":24,"uuid":"b1e18336-4be6-4701-bda1-ee9e5d64b62e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"established_date","column_comment":"成立日期","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"establishedDate","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":24,"super_column":"0"},{"id":25,"uuid":"7f8d215b-83a6-4113-83b6-28171b9752dd","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"registered_capital","column_comment":"注册资本","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"registeredCapital","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":25,"super_column":"0"},{"id":26,"uuid":"886d270c-1042-40f1-8737-33cfa1da6afa","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"paid_capital","column_comment":"实缴资本","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"paidCapital","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":26,"super_column":"0"},{"id":27,"uuid":"bf3847d6-6fe8-49d1-8ca0-7ec15ec2aa49","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"website","column_comment":"公司网站","column_type":"VARCHAR(255)","column_length":"255","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"website","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":27,"super_column":"0"},{"id":28,"uuid":"c18d95cb-711a-4aea-8140-3579083dc6de","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"main_phone","column_comment":"主联系电话","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"mainPhone","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":28,"super_column":"0"},{"id":29,"uuid":"999c98ce-f4fc-44bf-8947-10fd0384b095","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"main_email","column_comment":"主联系邮箱","column_type":"VARCHAR(255)","column_length":"255","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"mainEmail","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":29,"super_column":"0"},{"id":30,"uuid":"165dac23-b269-4652-a495-6b4096170bdb","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"country","column_comment":"国家","column_type":"VARCHAR(50)","column_length":"50","column_default":"''中国''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"country","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":30,"super_column":"0"},{"id":31,"uuid":"0cbcb821-b80d-44e1-b6df-3c2c356a19b5","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"province","column_comment":"省份","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"province","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":31,"super_column":"0"},{"id":32,"uuid":"c0b9e617-a145-4157-adf5-0a998018851f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"city","column_comment":"城市","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"city","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":32,"super_column":"0"},{"id":33,"uuid":"20ecca60-e741-4307-a1a1-61d02262aa26","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"district","column_comment":"区县","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"district","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":33,"super_column":"0"},{"id":34,"uuid":"8cc5f44a-ae62-4731-935b-d330bde65df4","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"address","column_comment":"详细地址","column_type":"VARCHAR(500)","column_length":"500","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"address","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"textarea","dict_type":"","sort":34,"super_column":"0"},{"id":35,"uuid":"bd8714bd-68f7-4594-8886-eb1eb155e1d1","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"rating","column_comment":"客户评分","column_type":"INTEGER","column_length":"","column_default":"3","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"rating","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":35,"super_column":"0"},{"id":36,"uuid":"6a63b477-3ca4-40e2-b5a4-5abdee4ad5dd","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"territory","column_comment":"所属区域","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"territory","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":36,"super_column":"0"},{"id":37,"uuid":"af1a58c3-cd7e-4c2f-8e51-772af9a14d76","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_since","column_comment":"成为客户时间","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"customerSince","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":37,"super_column":"0"},{"id":38,"uuid":"dbad33a4-b1c9-4afe-9c58-38c62dc9b392","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"first_order_date","column_comment":"首单日期","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"firstOrderDate","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":38,"super_column":"0"},{"id":39,"uuid":"620de21d-448c-4441-9d28-0f9005ee6649","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"last_order_date","column_comment":"最后订单日期","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"lastOrderDate","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":39,"super_column":"0"},{"id":40,"uuid":"248a49e5-6fd6-432b-a1ca-4ba997dec70a","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"total_revenue","column_comment":"总营收","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"totalRevenue","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":40,"super_column":"0"},{"id":41,"uuid":"c2c02283-c882-4062-95ab-d87464dcf11a","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"total_orders","column_comment":"总订单数","column_type":"INTEGER","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"totalOrders","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":41,"super_column":"0"},{"id":42,"uuid":"d8713a14-88f6-469e-9abd-edb4aeaa19d0","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"credit_limit","column_comment":"信用额度","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"creditLimit","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":42,"super_column":"0"},{"id":43,"uuid":"126c9220-8ec8-4727-83bb-de6daf56825f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"outstanding_amount","column_comment":"欠款金额","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"outstandingAmount","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":43,"super_column":"0"},{"id":44,"uuid":"aeba2807-7f37-45ea-9222-80294162a1f0","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"payment_days","column_comment":"账期天数","column_type":"INTEGER","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"paymentDays","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":44,"super_column":"0"},{"id":45,"uuid":"db5b12c1-892d-43a9-917b-0940a1901ada","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"parent_customer_id","column_comment":"父客户ID(集团客户)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"parentCustomerId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":45,"super_column":"0"},{"id":46,"uuid":"f8c95c40-1e2a-4214-8c36-175dc90391e6","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"is_parent","column_comment":"是否父客户(集团总部)","column_type":"BOOLEAN","column_length":"","column_default":"false","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"bool","python_field":"isParent","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":46,"super_column":"0"},{"id":47,"uuid":"95173fb2-467c-4747-bdb9-0002b67f8238","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_segment","column_comment":"客户分群","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerSegment","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":47,"super_column":"0"},{"id":48,"uuid":"7d8c9278-7c12-49cb-bff8-c8c998d5af25","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"churn_risk","column_comment":"流失风险(high/medium/low)","column_type":"VARCHAR(20)","column_length":"20","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"churnRisk","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":48,"super_column":"0"},{"id":49,"uuid":"a9b5bdca-29b3-4d41-928a-78d422fd7820","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"description","column_comment":"备注/描述","column_type":"TEXT","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"description","is_insert":true,"is_edit":true,"is_list":true,"is_query":false,"query_type":null,"html_type":"textarea","dict_type":"","sort":49,"super_column":"0"},{"id":50,"uuid":"39a21d38-5256-4f2c-bf09-c23a5f429b5f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"extra_data","column_comment":"扩展数据(JSONB)","column_type":"JSONB","column_length":"","column_default":"''{}''::jsonb","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"dict","python_field":"extraData","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":50,"super_column":"0"},{"id":51,"uuid":"8d2d0ccb-f000-4cdb-9d9d-13c485bf9c4f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"version","column_comment":"版本号(乐观锁)","column_type":"INTEGER","column_length":"","column_default":"1","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"version","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":51,"super_column":"0"},{"id":52,"uuid":"8a4b8f18-80b4-4d9f-a881-19079f099dcd","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"protection_deadline","column_comment":"保护期截止时间(公海池)","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"protectionDeadline","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":52,"super_column":"0"},{"id":53,"uuid":"e51ea4e6-639a-49c6-9d7e-19dd00d4b6e8","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"claim_time","column_comment":"领取时间(公海池)","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"claimTime","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":53,"super_column":"0"},{"id":54,"uuid":"6e0b3b7f-3f21-4433-b1b6-5cad8279378b","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"health_score","column_comment":"健康度评分","column_type":"NUMERIC(5, 2)","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"healthScore","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":54,"super_column":"0"},{"id":55,"uuid":"c42aaf1d-e711-4a40-a737-be89e6db5388","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"duplicate_check_key","column_comment":"查重键(防止重复客户)","column_type":"VARCHAR(200)","column_length":"200","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"duplicateCheckKey","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":55,"super_column":"0"},{"id":56,"uuid":"8ec0efdc-4ae9-41fe-bc6a-8d43b1d3cd45","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"is_deleted","column_comment":"是否已删除(false:否 true:是)","column_type":"BOOLEAN","column_length":"","column_default":"false","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"bool","python_field":"isDeleted","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":56,"super_column":"0"},{"id":57,"uuid":"0cc78755-fd20-43cf-b913-c8579e4bdc60","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"deleted_time","column_comment":"删除时间","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"deletedTime","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":57,"super_column":"0"},{"id":58,"uuid":"d46f77bf-e956-4f93-9cca-705506ab03a9","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"uuid","column_comment":"UUID全局唯一标识","column_type":"VARCHAR(64)","column_length":"64","column_default":"(gen_random_uuid())::text","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"str","python_field":"uuid","is_insert":true,"is_edit":false,"is_list":false,"is_query":false,"query_type":null,"html_type":"input","dict_type":"","sort":58,"super_column":"0"},{"id":59,"uuid":"268de196-5a24-431c-8d65-8b981d57bacf","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"deleted_id","column_comment":"删除人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"deletedId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":59,"super_column":"0"},{"id":60,"uuid":"f5bf359d-ac7f-41bf-ad45-a743c3024763","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"status","column_comment":"系统状态(0:正常 1:禁用)","column_type":"VARCHAR(10)","column_length":"10","column_default":"''0''::character varying","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"str","python_field":"status","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"radio","dict_type":"","sort":60,"super_column":"0"},{"id":61,"uuid":"55c076c9-7caf-4231-9125-86b54efaebc4","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"dept_id","column_comment":"所属部门ID(关联sys_dept.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"deptId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":61,"super_column":"0"}],"pk_column":{"id":1,"uuid":"89552c2f-ba36-4401-908a-4567a8904ac7","status":"0","description":null,"created_time":"2026-04-29 19:56:07","updated_time":"2026-04-29 19:56:07","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"id","column_comment":"主键ID（自增）","column_type":"INTEGER","column_length":"","column_default":"nextval(''crm_customers_id_seq''::regclass)","is_pk":true,"is_increment":true,"is_nullable":false,"is_unique":false,"python_type":"int","python_field":"id","is_insert":false,"is_edit":false,"is_list":false,"is_query":false,"query_type":null,"html_type":"input","dict_type":"","sort":1,"super_column":"0"},"sub_table":null,"sub":false,"master_sub_hint":null},"status_code":200,"success":true}', '4.46s', 5, 'eb88bae2-56ff-4d21-84a2-b56f116e817d', '0', '编辑业务表信息', '2026-04-29 20:01:25.826598', '2026-04-29 20:01:25.826598', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/generator/gencode/update/1', 'PUT', '请求参数过长', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"编辑业务表信息成功","data":{"id":1,"uuid":"3ae9249a-c321-4640-896c-df86d4c94e32","status":"0","description":"客户管理/客户中心","created_time":"2026-04-29 19:56:07","updated_time":"2026-04-29 20:01:21","is_deleted":false,"deleted_time":null,"table_name":"crm_customers","table_comment":"客户中心","class_name":"CrmCustomers","package_name":"module_crm","module_name":"customers","business_name":null,"function_name":"客户中心","sub_table_name":null,"sub_table_fk_name":null,"parent_menu_id":null,"columns":[{"id":1,"uuid":"89552c2f-ba36-4401-908a-4567a8904ac7","status":"0","description":null,"created_time":"2026-04-29 19:56:07","updated_time":"2026-04-29 19:56:07","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"id","column_comment":"主键ID（自增）","column_type":"INTEGER","column_length":"","column_default":"nextval(''crm_customers_id_seq''::regclass)","is_pk":true,"is_increment":true,"is_nullable":false,"is_unique":false,"python_type":"int","python_field":"id","is_insert":false,"is_edit":false,"is_list":false,"is_query":false,"query_type":null,"html_type":"input","dict_type":"","sort":1,"super_column":"0"},{"id":2,"uuid":"36fe6402-3ee1-46fb-be60-64050882241b","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_code","column_comment":"客户编号","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":true,"python_type":"str","python_field":"customerCode","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":2,"super_column":"0"},{"id":3,"uuid":"f3ef0eb0-ac98-4e89-8aeb-c8e7c6051c6e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_name","column_comment":"客户名称","column_type":"VARCHAR(200)","column_length":"200","column_default":"","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"str","python_field":"customerName","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":3,"super_column":"0"},{"id":4,"uuid":"abf96f60-c96c-4adb-be79-fad0778ed5fb","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_type","column_comment":"客户类型","column_type":"VARCHAR(20)","column_length":"20","column_default":"''enterprise''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerType","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"select","dict_type":"","sort":4,"super_column":"0"},{"id":5,"uuid":"53b36095-98f3-4ec8-a48b-2c82685fc5bf","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"industry","column_comment":"所属行业","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"industry","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":5,"super_column":"0"},{"id":6,"uuid":"6bf0cbe4-0f93-4a19-ab87-da8f14079b3e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"source","column_comment":"客户来源","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"source","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":6,"super_column":"0"},{"id":7,"uuid":"b6373da2-1c00-447e-b0c4-46c215a5f3ec","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_status","column_comment":"客户状态","column_type":"VARCHAR(20)","column_length":"20","column_default":"''active''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerStatus","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"radio","dict_type":"","sort":7,"super_column":"0"},{"id":8,"uuid":"f7c965db-05e1-43a4-a963-7a0b170d52a2","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"owner_id","column_comment":"负责人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"ownerId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":8,"super_column":"0"},{"id":9,"uuid":"73f9545d-d750-445c-9177-efb9da9dcb4c","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"department_id","column_comment":"所属部门ID,关联sys_dept","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"departmentId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":9,"super_column":"0"},{"id":10,"uuid":"144a531d-43af-43ce-8ce4-d6f38cfd2176","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"lead_id","column_comment":"来源线索ID,关联crm_leads","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"leadId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":10,"super_column":"0"},{"id":11,"uuid":"1e720395-a946-401a-b28c-3db757a7dfd4","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"pool_status","column_comment":"公海池状态","column_type":"VARCHAR(20)","column_length":"20","column_default":"''private''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"poolStatus","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"radio","dict_type":"","sort":11,"super_column":"0"},{"id":12,"uuid":"a9d85715-a329-4e5c-b63d-5e6b7c7eff68","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"last_followup_at","column_comment":"最后跟进时间","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"lastFollowupAt","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":12,"super_column":"0"},{"id":13,"uuid":"64169cb1-8066-45b6-8800-75afe9441e81","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"next_followup_at","column_comment":"下次跟进时间","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"nextFollowupAt","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":13,"super_column":"0"},{"id":14,"uuid":"be1cbe1e-1cea-4bee-9563-7cf075a6e4d5","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"created_time","column_comment":"创建时间","column_type":"TIMESTAMP","column_length":"","column_default":"CURRENT_TIMESTAMP","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"createdTime","is_insert":false,"is_edit":false,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":14,"super_column":"0"},{"id":15,"uuid":"27fb728b-d292-4c7b-8e11-212e9d15133a","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"updated_time","column_comment":"更新时间","column_type":"TIMESTAMP","column_length":"","column_default":"CURRENT_TIMESTAMP","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"updatedTime","is_insert":false,"is_edit":false,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":15,"super_column":"0"},{"id":16,"uuid":"fe66a8e0-8c84-4448-9b1f-852da952d92f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"created_id","column_comment":"创建人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"createdId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":16,"super_column":"0"},{"id":17,"uuid":"4f42e9f0-e50b-4b08-b7c9-555a0d911746","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"updated_id","column_comment":"更新人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"updatedId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":17,"super_column":"0"},{"id":18,"uuid":"a3aab327-46a2-4360-b6f3-3b02836853ff","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_short_name","column_comment":"客户简称","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerShortName","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":18,"super_column":"0"},{"id":19,"uuid":"293b8ebb-a573-4a6e-9a3b-4bcfdd47ef6e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_level","column_comment":"客户等级","column_type":"VARCHAR(20)","column_length":"20","column_default":"''C''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerLevel","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":19,"super_column":"0"},{"id":20,"uuid":"a1d83236-1397-4893-b5de-917289bf13c1","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"scale","column_comment":"企业规模","column_type":"VARCHAR(20)","column_length":"20","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"scale","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":20,"super_column":"0"},{"id":21,"uuid":"772ee8de-a9d4-4e9b-a85b-fc047875cc63","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"registration_no","column_comment":"工商注册号","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"registrationNo","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":21,"super_column":"0"},{"id":22,"uuid":"e4bc19af-aefc-442d-b839-de6efb7806b7","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"tax_no","column_comment":"税号","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"taxNo","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":22,"super_column":"0"},{"id":23,"uuid":"0a95ff5f-239c-4eab-9b28-458d4d9cc831","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"legal_person","column_comment":"法人代表","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"legalPerson","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":23,"super_column":"0"},{"id":24,"uuid":"b1e18336-4be6-4701-bda1-ee9e5d64b62e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"established_date","column_comment":"成立日期","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"establishedDate","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":24,"super_column":"0"},{"id":25,"uuid":"7f8d215b-83a6-4113-83b6-28171b9752dd","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"registered_capital","column_comment":"注册资本","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"registeredCapital","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":25,"super_column":"0"},{"id":26,"uuid":"886d270c-1042-40f1-8737-33cfa1da6afa","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"paid_capital","column_comment":"实缴资本","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"paidCapital","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":26,"super_column":"0"},{"id":27,"uuid":"bf3847d6-6fe8-49d1-8ca0-7ec15ec2aa49","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"website","column_comment":"公司网站","column_type":"VARCHAR(255)","column_length":"255","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"website","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":27,"super_column":"0"},{"id":28,"uuid":"c18d95cb-711a-4aea-8140-3579083dc6de","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"main_phone","column_comment":"主联系电话","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"mainPhone","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":28,"super_column":"0"},{"id":29,"uuid":"999c98ce-f4fc-44bf-8947-10fd0384b095","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"main_email","column_comment":"主联系邮箱","column_type":"VARCHAR(255)","column_length":"255","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"mainEmail","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":29,"super_column":"0"},{"id":30,"uuid":"165dac23-b269-4652-a495-6b4096170bdb","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"country","column_comment":"国家","column_type":"VARCHAR(50)","column_length":"50","column_default":"''中国''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"country","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":30,"super_column":"0"},{"id":31,"uuid":"0cbcb821-b80d-44e1-b6df-3c2c356a19b5","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"province","column_comment":"省份","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"province","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":31,"super_column":"0"},{"id":32,"uuid":"c0b9e617-a145-4157-adf5-0a998018851f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"city","column_comment":"城市","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"city","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":32,"super_column":"0"},{"id":33,"uuid":"20ecca60-e741-4307-a1a1-61d02262aa26","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"district","column_comment":"区县","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"district","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":33,"super_column":"0"},{"id":34,"uuid":"8cc5f44a-ae62-4731-935b-d330bde65df4","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"address","column_comment":"详细地址","column_type":"VARCHAR(500)","column_length":"500","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"address","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"textarea","dict_type":"","sort":34,"super_column":"0"},{"id":35,"uuid":"bd8714bd-68f7-4594-8886-eb1eb155e1d1","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"rating","column_comment":"客户评分","column_type":"INTEGER","column_length":"","column_default":"3","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"rating","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":35,"super_column":"0"},{"id":36,"uuid":"6a63b477-3ca4-40e2-b5a4-5abdee4ad5dd","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"territory","column_comment":"所属区域","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"territory","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":36,"super_column":"0"},{"id":37,"uuid":"af1a58c3-cd7e-4c2f-8e51-772af9a14d76","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_since","column_comment":"成为客户时间","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"customerSince","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":37,"super_column":"0"},{"id":38,"uuid":"dbad33a4-b1c9-4afe-9c58-38c62dc9b392","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"first_order_date","column_comment":"首单日期","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"firstOrderDate","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":38,"super_column":"0"},{"id":39,"uuid":"620de21d-448c-4441-9d28-0f9005ee6649","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"last_order_date","column_comment":"最后订单日期","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"lastOrderDate","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":39,"super_column":"0"},{"id":40,"uuid":"248a49e5-6fd6-432b-a1ca-4ba997dec70a","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"total_revenue","column_comment":"总营收","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"totalRevenue","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":40,"super_column":"0"},{"id":41,"uuid":"c2c02283-c882-4062-95ab-d87464dcf11a","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"total_orders","column_comment":"总订单数","column_type":"INTEGER","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"totalOrders","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":41,"super_column":"0"},{"id":42,"uuid":"d8713a14-88f6-469e-9abd-edb4aeaa19d0","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"credit_limit","column_comment":"信用额度","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"creditLimit","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":42,"super_column":"0"},{"id":43,"uuid":"126c9220-8ec8-4727-83bb-de6daf56825f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"outstanding_amount","column_comment":"欠款金额","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"outstandingAmount","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":43,"super_column":"0"},{"id":44,"uuid":"aeba2807-7f37-45ea-9222-80294162a1f0","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"payment_days","column_comment":"账期天数","column_type":"INTEGER","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"paymentDays","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":44,"super_column":"0"},{"id":45,"uuid":"db5b12c1-892d-43a9-917b-0940a1901ada","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"parent_customer_id","column_comment":"父客户ID(集团客户)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"parentCustomerId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":45,"super_column":"0"},{"id":46,"uuid":"f8c95c40-1e2a-4214-8c36-175dc90391e6","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"is_parent","column_comment":"是否父客户(集团总部)","column_type":"BOOLEAN","column_length":"","column_default":"false","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"bool","python_field":"isParent","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":46,"super_column":"0"},{"id":47,"uuid":"95173fb2-467c-4747-bdb9-0002b67f8238","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_segment","column_comment":"客户分群","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerSegment","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":47,"super_column":"0"},{"id":48,"uuid":"7d8c9278-7c12-49cb-bff8-c8c998d5af25","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"churn_risk","column_comment":"流失风险(high/medium/low)","column_type":"VARCHAR(20)","column_length":"20","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"churnRisk","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":48,"super_column":"0"},{"id":49,"uuid":"a9b5bdca-29b3-4d41-928a-78d422fd7820","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"description","column_comment":"备注/描述","column_type":"TEXT","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"description","is_insert":true,"is_edit":true,"is_list":true,"is_query":false,"query_type":null,"html_type":"textarea","dict_type":"","sort":49,"super_column":"0"},{"id":50,"uuid":"39a21d38-5256-4f2c-bf09-c23a5f429b5f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"extra_data","column_comment":"扩展数据(JSONB)","column_type":"JSONB","column_length":"","column_default":"''{}''::jsonb","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"dict","python_field":"extraData","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":50,"super_column":"0"},{"id":51,"uuid":"8d2d0ccb-f000-4cdb-9d9d-13c485bf9c4f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"version","column_comment":"版本号(乐观锁)","column_type":"INTEGER","column_length":"","column_default":"1","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"version","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":51,"super_column":"0"},{"id":52,"uuid":"8a4b8f18-80b4-4d9f-a881-19079f099dcd","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"protection_deadline","column_comment":"保护期截止时间(公海池)","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"protectionDeadline","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":52,"super_column":"0"},{"id":53,"uuid":"e51ea4e6-639a-49c6-9d7e-19dd00d4b6e8","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"claim_time","column_comment":"领取时间(公海池)","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"claimTime","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":53,"super_column":"0"},{"id":54,"uuid":"6e0b3b7f-3f21-4433-b1b6-5cad8279378b","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"health_score","column_comment":"健康度评分","column_type":"NUMERIC(5, 2)","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"healthScore","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":54,"super_column":"0"},{"id":55,"uuid":"c42aaf1d-e711-4a40-a737-be89e6db5388","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"duplicate_check_key","column_comment":"查重键(防止重复客户)","column_type":"VARCHAR(200)","column_length":"200","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"duplicateCheckKey","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":55,"super_column":"0"},{"id":56,"uuid":"8ec0efdc-4ae9-41fe-bc6a-8d43b1d3cd45","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"is_deleted","column_comment":"是否已删除(false:否 true:是)","column_type":"BOOLEAN","column_length":"","column_default":"false","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"bool","python_field":"isDeleted","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":56,"super_column":"0"},{"id":57,"uuid":"0cc78755-fd20-43cf-b913-c8579e4bdc60","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"deleted_time","column_comment":"删除时间","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"deletedTime","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":57,"super_column":"0"},{"id":58,"uuid":"d46f77bf-e956-4f93-9cca-705506ab03a9","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"uuid","column_comment":"UUID全局唯一标识","column_type":"VARCHAR(64)","column_length":"64","column_default":"(gen_random_uuid())::text","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"str","python_field":"uuid","is_insert":true,"is_edit":false,"is_list":false,"is_query":false,"query_type":null,"html_type":"input","dict_type":"","sort":58,"super_column":"0"},{"id":59,"uuid":"268de196-5a24-431c-8d65-8b981d57bacf","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"deleted_id","column_comment":"删除人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"deletedId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":59,"super_column":"0"},{"id":60,"uuid":"f5bf359d-ac7f-41bf-ad45-a743c3024763","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"status","column_comment":"系统状态(0:正常 1:禁用)","column_type":"VARCHAR(10)","column_length":"10","column_default":"''0''::character varying","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"str","python_field":"status","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"radio","dict_type":"","sort":60,"super_column":"0"},{"id":61,"uuid":"55c076c9-7caf-4231-9125-86b54efaebc4","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"dept_id","column_comment":"所属部门ID(关联sys_dept.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"deptId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":61,"super_column":"0"}],"pk_column":{"id":1,"uuid":"89552c2f-ba36-4401-908a-4567a8904ac7","status":"0","description":null,"created_time":"2026-04-29 19:56:07","updated_time":"2026-04-29 19:56:07","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"id","column_comment":"主键ID（自增）","column_type":"INTEGER","column_length":"","column_default":"nextval(''crm_customers_id_seq''::regclass)","is_pk":true,"is_increment":true,"is_nullable":false,"is_unique":false,"python_type":"int","python_field":"id","is_insert":false,"is_edit":false,"is_list":false,"is_query":false,"query_type":null,"html_type":"input","dict_type":"","sort":1,"super_column":"0"},"sub_table":null,"sub":false,"master_sub_hint":null},"status_code":200,"success":true}', '4.93s', 6, 'f368570c-0848-474d-9d46-56573f16e11b', '0', '编辑业务表信息', '2026-04-29 20:01:34.190381', '2026-04-29 20:01:34.190381', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/generator/gencode/update/1', 'PUT', '请求参数过长', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"编辑业务表信息成功","data":{"id":1,"uuid":"3ae9249a-c321-4640-896c-df86d4c94e32","status":"0","description":"客户管理/客户中心","created_time":"2026-04-29 19:56:07","updated_time":"2026-04-29 20:01:21","is_deleted":false,"deleted_time":null,"table_name":"crm_customers","table_comment":"客户中心","class_name":"CrmCustomers","package_name":"module_crm","module_name":"customers","business_name":null,"function_name":"客户中心","sub_table_name":null,"sub_table_fk_name":null,"parent_menu_id":null,"columns":[{"id":1,"uuid":"89552c2f-ba36-4401-908a-4567a8904ac7","status":"0","description":null,"created_time":"2026-04-29 19:56:07","updated_time":"2026-04-29 19:56:07","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"id","column_comment":"主键ID（自增）","column_type":"INTEGER","column_length":"","column_default":"nextval(''crm_customers_id_seq''::regclass)","is_pk":true,"is_increment":true,"is_nullable":false,"is_unique":false,"python_type":"int","python_field":"id","is_insert":false,"is_edit":false,"is_list":false,"is_query":false,"query_type":null,"html_type":"input","dict_type":"","sort":1,"super_column":"0"},{"id":2,"uuid":"36fe6402-3ee1-46fb-be60-64050882241b","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_code","column_comment":"客户编号","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":true,"python_type":"str","python_field":"customerCode","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":2,"super_column":"0"},{"id":3,"uuid":"f3ef0eb0-ac98-4e89-8aeb-c8e7c6051c6e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_name","column_comment":"客户名称","column_type":"VARCHAR(200)","column_length":"200","column_default":"","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"str","python_field":"customerName","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":3,"super_column":"0"},{"id":4,"uuid":"abf96f60-c96c-4adb-be79-fad0778ed5fb","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_type","column_comment":"客户类型","column_type":"VARCHAR(20)","column_length":"20","column_default":"''enterprise''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerType","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"select","dict_type":"","sort":4,"super_column":"0"},{"id":5,"uuid":"53b36095-98f3-4ec8-a48b-2c82685fc5bf","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"industry","column_comment":"所属行业","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"industry","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":5,"super_column":"0"},{"id":6,"uuid":"6bf0cbe4-0f93-4a19-ab87-da8f14079b3e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"source","column_comment":"客户来源","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"source","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":6,"super_column":"0"},{"id":7,"uuid":"b6373da2-1c00-447e-b0c4-46c215a5f3ec","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_status","column_comment":"客户状态","column_type":"VARCHAR(20)","column_length":"20","column_default":"''active''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerStatus","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"radio","dict_type":"","sort":7,"super_column":"0"},{"id":8,"uuid":"f7c965db-05e1-43a4-a963-7a0b170d52a2","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"owner_id","column_comment":"负责人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"ownerId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":8,"super_column":"0"},{"id":9,"uuid":"73f9545d-d750-445c-9177-efb9da9dcb4c","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"department_id","column_comment":"所属部门ID,关联sys_dept","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"departmentId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":9,"super_column":"0"},{"id":10,"uuid":"144a531d-43af-43ce-8ce4-d6f38cfd2176","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"lead_id","column_comment":"来源线索ID,关联crm_leads","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"leadId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":10,"super_column":"0"},{"id":11,"uuid":"1e720395-a946-401a-b28c-3db757a7dfd4","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"pool_status","column_comment":"公海池状态","column_type":"VARCHAR(20)","column_length":"20","column_default":"''private''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"poolStatus","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"radio","dict_type":"","sort":11,"super_column":"0"},{"id":12,"uuid":"a9d85715-a329-4e5c-b63d-5e6b7c7eff68","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"last_followup_at","column_comment":"最后跟进时间","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"lastFollowupAt","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":12,"super_column":"0"},{"id":13,"uuid":"64169cb1-8066-45b6-8800-75afe9441e81","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"next_followup_at","column_comment":"下次跟进时间","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"nextFollowupAt","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":13,"super_column":"0"},{"id":14,"uuid":"be1cbe1e-1cea-4bee-9563-7cf075a6e4d5","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"created_time","column_comment":"创建时间","column_type":"TIMESTAMP","column_length":"","column_default":"CURRENT_TIMESTAMP","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"createdTime","is_insert":false,"is_edit":false,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":14,"super_column":"0"},{"id":15,"uuid":"27fb728b-d292-4c7b-8e11-212e9d15133a","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"updated_time","column_comment":"更新时间","column_type":"TIMESTAMP","column_length":"","column_default":"CURRENT_TIMESTAMP","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"updatedTime","is_insert":false,"is_edit":false,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":15,"super_column":"0"},{"id":16,"uuid":"fe66a8e0-8c84-4448-9b1f-852da952d92f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"created_id","column_comment":"创建人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"createdId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":16,"super_column":"0"},{"id":17,"uuid":"4f42e9f0-e50b-4b08-b7c9-555a0d911746","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"updated_id","column_comment":"更新人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"updatedId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":17,"super_column":"0"},{"id":18,"uuid":"a3aab327-46a2-4360-b6f3-3b02836853ff","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_short_name","column_comment":"客户简称","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerShortName","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":18,"super_column":"0"},{"id":19,"uuid":"293b8ebb-a573-4a6e-9a3b-4bcfdd47ef6e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_level","column_comment":"客户等级","column_type":"VARCHAR(20)","column_length":"20","column_default":"''C''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerLevel","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":19,"super_column":"0"},{"id":20,"uuid":"a1d83236-1397-4893-b5de-917289bf13c1","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"scale","column_comment":"企业规模","column_type":"VARCHAR(20)","column_length":"20","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"scale","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":20,"super_column":"0"},{"id":21,"uuid":"772ee8de-a9d4-4e9b-a85b-fc047875cc63","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"registration_no","column_comment":"工商注册号","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"registrationNo","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":21,"super_column":"0"},{"id":22,"uuid":"e4bc19af-aefc-442d-b839-de6efb7806b7","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"tax_no","column_comment":"税号","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"taxNo","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":22,"super_column":"0"},{"id":23,"uuid":"0a95ff5f-239c-4eab-9b28-458d4d9cc831","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"legal_person","column_comment":"法人代表","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"legalPerson","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":23,"super_column":"0"},{"id":24,"uuid":"b1e18336-4be6-4701-bda1-ee9e5d64b62e","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"established_date","column_comment":"成立日期","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"establishedDate","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":24,"super_column":"0"},{"id":25,"uuid":"7f8d215b-83a6-4113-83b6-28171b9752dd","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"registered_capital","column_comment":"注册资本","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"registeredCapital","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":25,"super_column":"0"},{"id":26,"uuid":"886d270c-1042-40f1-8737-33cfa1da6afa","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"paid_capital","column_comment":"实缴资本","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"paidCapital","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":26,"super_column":"0"},{"id":27,"uuid":"bf3847d6-6fe8-49d1-8ca0-7ec15ec2aa49","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"website","column_comment":"公司网站","column_type":"VARCHAR(255)","column_length":"255","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"website","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":27,"super_column":"0"},{"id":28,"uuid":"c18d95cb-711a-4aea-8140-3579083dc6de","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"main_phone","column_comment":"主联系电话","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"mainPhone","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":28,"super_column":"0"},{"id":29,"uuid":"999c98ce-f4fc-44bf-8947-10fd0384b095","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"main_email","column_comment":"主联系邮箱","column_type":"VARCHAR(255)","column_length":"255","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"mainEmail","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":29,"super_column":"0"},{"id":30,"uuid":"165dac23-b269-4652-a495-6b4096170bdb","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"country","column_comment":"国家","column_type":"VARCHAR(50)","column_length":"50","column_default":"''中国''::character varying","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"country","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":30,"super_column":"0"},{"id":31,"uuid":"0cbcb821-b80d-44e1-b6df-3c2c356a19b5","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"province","column_comment":"省份","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"province","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":31,"super_column":"0"},{"id":32,"uuid":"c0b9e617-a145-4157-adf5-0a998018851f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"city","column_comment":"城市","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"city","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":32,"super_column":"0"},{"id":33,"uuid":"20ecca60-e741-4307-a1a1-61d02262aa26","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"district","column_comment":"区县","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"district","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":33,"super_column":"0"},{"id":34,"uuid":"8cc5f44a-ae62-4731-935b-d330bde65df4","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"address","column_comment":"详细地址","column_type":"VARCHAR(500)","column_length":"500","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"address","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"textarea","dict_type":"","sort":34,"super_column":"0"},{"id":35,"uuid":"bd8714bd-68f7-4594-8886-eb1eb155e1d1","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"rating","column_comment":"客户评分","column_type":"INTEGER","column_length":"","column_default":"3","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"rating","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":35,"super_column":"0"},{"id":36,"uuid":"6a63b477-3ca4-40e2-b5a4-5abdee4ad5dd","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"territory","column_comment":"所属区域","column_type":"VARCHAR(100)","column_length":"100","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"territory","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":36,"super_column":"0"},{"id":37,"uuid":"af1a58c3-cd7e-4c2f-8e51-772af9a14d76","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_since","column_comment":"成为客户时间","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"customerSince","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":37,"super_column":"0"},{"id":38,"uuid":"dbad33a4-b1c9-4afe-9c58-38c62dc9b392","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"first_order_date","column_comment":"首单日期","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"firstOrderDate","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":38,"super_column":"0"},{"id":39,"uuid":"620de21d-448c-4441-9d28-0f9005ee6649","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"last_order_date","column_comment":"最后订单日期","column_type":"DATE","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"date","python_field":"lastOrderDate","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":39,"super_column":"0"},{"id":40,"uuid":"248a49e5-6fd6-432b-a1ca-4ba997dec70a","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"total_revenue","column_comment":"总营收","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"totalRevenue","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":40,"super_column":"0"},{"id":41,"uuid":"c2c02283-c882-4062-95ab-d87464dcf11a","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"total_orders","column_comment":"总订单数","column_type":"INTEGER","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"totalOrders","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":41,"super_column":"0"},{"id":42,"uuid":"d8713a14-88f6-469e-9abd-edb4aeaa19d0","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"credit_limit","column_comment":"信用额度","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"creditLimit","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":42,"super_column":"0"},{"id":43,"uuid":"126c9220-8ec8-4727-83bb-de6daf56825f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"outstanding_amount","column_comment":"欠款金额","column_type":"NUMERIC(18, 2)","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"outstandingAmount","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":43,"super_column":"0"},{"id":44,"uuid":"aeba2807-7f37-45ea-9222-80294162a1f0","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"payment_days","column_comment":"账期天数","column_type":"INTEGER","column_length":"","column_default":"0","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"paymentDays","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":44,"super_column":"0"},{"id":45,"uuid":"db5b12c1-892d-43a9-917b-0940a1901ada","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"parent_customer_id","column_comment":"父客户ID(集团客户)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"parentCustomerId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":45,"super_column":"0"},{"id":46,"uuid":"f8c95c40-1e2a-4214-8c36-175dc90391e6","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"is_parent","column_comment":"是否父客户(集团总部)","column_type":"BOOLEAN","column_length":"","column_default":"false","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"bool","python_field":"isParent","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":46,"super_column":"0"},{"id":47,"uuid":"95173fb2-467c-4747-bdb9-0002b67f8238","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"customer_segment","column_comment":"客户分群","column_type":"VARCHAR(50)","column_length":"50","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"customerSegment","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":47,"super_column":"0"},{"id":48,"uuid":"7d8c9278-7c12-49cb-bff8-c8c998d5af25","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"churn_risk","column_comment":"流失风险(high/medium/low)","column_type":"VARCHAR(20)","column_length":"20","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"churnRisk","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":48,"super_column":"0"},{"id":49,"uuid":"a9b5bdca-29b3-4d41-928a-78d422fd7820","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"description","column_comment":"备注/描述","column_type":"TEXT","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"description","is_insert":true,"is_edit":true,"is_list":true,"is_query":false,"query_type":null,"html_type":"textarea","dict_type":"","sort":49,"super_column":"0"},{"id":50,"uuid":"39a21d38-5256-4f2c-bf09-c23a5f429b5f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"extra_data","column_comment":"扩展数据(JSONB)","column_type":"JSONB","column_length":"","column_default":"''{}''::jsonb","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"dict","python_field":"extraData","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":50,"super_column":"0"},{"id":51,"uuid":"8d2d0ccb-f000-4cdb-9d9d-13c485bf9c4f","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"version","column_comment":"版本号(乐观锁)","column_type":"INTEGER","column_length":"","column_default":"1","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"version","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":51,"super_column":"0"},{"id":52,"uuid":"8a4b8f18-80b4-4d9f-a881-19079f099dcd","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"protection_deadline","column_comment":"保护期截止时间(公海池)","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"protectionDeadline","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":52,"super_column":"0"},{"id":53,"uuid":"e51ea4e6-639a-49c6-9d7e-19dd00d4b6e8","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"claim_time","column_comment":"领取时间(公海池)","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"claimTime","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":53,"super_column":"0"},{"id":54,"uuid":"6e0b3b7f-3f21-4433-b1b6-5cad8279378b","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"health_score","column_comment":"健康度评分","column_type":"NUMERIC(5, 2)","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"Decimal","python_field":"healthScore","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":54,"super_column":"0"},{"id":55,"uuid":"c42aaf1d-e711-4a40-a737-be89e6db5388","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"duplicate_check_key","column_comment":"查重键(防止重复客户)","column_type":"VARCHAR(200)","column_length":"200","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"str","python_field":"duplicateCheckKey","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"input","dict_type":"","sort":55,"super_column":"0"},{"id":56,"uuid":"8ec0efdc-4ae9-41fe-bc6a-8d43b1d3cd45","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"is_deleted","column_comment":"是否已删除(false:否 true:是)","column_type":"BOOLEAN","column_length":"","column_default":"false","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"bool","python_field":"isDeleted","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":56,"super_column":"0"},{"id":57,"uuid":"0cc78755-fd20-43cf-b913-c8579e4bdc60","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"deleted_time","column_comment":"删除时间","column_type":"TIMESTAMP","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"datetime","python_field":"deletedTime","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"datetime","dict_type":"","sort":57,"super_column":"0"},{"id":58,"uuid":"d46f77bf-e956-4f93-9cca-705506ab03a9","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"uuid","column_comment":"UUID全局唯一标识","column_type":"VARCHAR(64)","column_length":"64","column_default":"(gen_random_uuid())::text","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"str","python_field":"uuid","is_insert":true,"is_edit":false,"is_list":false,"is_query":false,"query_type":null,"html_type":"input","dict_type":"","sort":58,"super_column":"0"},{"id":59,"uuid":"268de196-5a24-431c-8d65-8b981d57bacf","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"deleted_id","column_comment":"删除人ID(关联sys_user.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"deletedId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":59,"super_column":"0"},{"id":60,"uuid":"f5bf359d-ac7f-41bf-ad45-a743c3024763","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"status","column_comment":"系统状态(0:正常 1:禁用)","column_type":"VARCHAR(10)","column_length":"10","column_default":"''0''::character varying","is_pk":false,"is_increment":false,"is_nullable":false,"is_unique":false,"python_type":"str","python_field":"status","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"LIKE","html_type":"radio","dict_type":"","sort":60,"super_column":"0"},{"id":61,"uuid":"55c076c9-7caf-4231-9125-86b54efaebc4","status":"0","description":null,"created_time":"2026-04-29 19:56:08","updated_time":"2026-04-29 19:56:08","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"dept_id","column_comment":"所属部门ID(关联sys_dept.id)","column_type":"INTEGER","column_length":"","column_default":"","is_pk":false,"is_increment":false,"is_nullable":true,"is_unique":false,"python_type":"int","python_field":"deptId","is_insert":true,"is_edit":true,"is_list":true,"is_query":true,"query_type":"EQ","html_type":"input","dict_type":"","sort":61,"super_column":"0"}],"pk_column":{"id":1,"uuid":"89552c2f-ba36-4401-908a-4567a8904ac7","status":"0","description":null,"created_time":"2026-04-29 19:56:07","updated_time":"2026-04-29 19:56:07","is_deleted":false,"deleted_time":null,"table_id":1,"column_name":"id","column_comment":"主键ID（自增）","column_type":"INTEGER","column_length":"","column_default":"nextval(''crm_customers_id_seq''::regclass)","is_pk":true,"is_increment":true,"is_nullable":false,"is_unique":false,"python_type":"int","python_field":"id","is_insert":false,"is_edit":false,"is_list":false,"is_query":false,"query_type":null,"html_type":"input","dict_type":"","sort":1,"super_column":"0"},"sub_table":null,"sub":false,"master_sub_hint":null},"status_code":200,"success":true}', '4.74s', 7, 'af501dee-ccbf-4006-9263-4f75edacfd13', '0', '编辑业务表信息', '2026-04-29 20:01:54.020646', '2026-04-29 20:01:54.020646', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/generator/gencode/output/crm_customers', 'POST', '{"path_params": {"table_name": "crm_customers"}}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"生成代码到指定路径成功","data":true,"status_code":200,"success":true}', '0.26s', 8, '4de97959-94fd-45cb-87ac-8ce025f769ea', '0', '生成代码到指定路径', '2026-04-29 20:01:58.297314', '2026-04-29 20:01:58.297314', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (2, '/api/v1/system/menu/update/189', 'PUT', '{"body": {"id": 189, "name": "客户管理", "type": 1, "icon": "menu", "order": 9999, "permission": null, "route_name": "ModuleCrmCustomers", "route_path": "/module_crm/customers", "component_path": null, "redirect": "/module_crm/customers", "parent_id": null, "keep_alive": true, "hidden": false, "always_show": false, "title": "客户管理", "params": null, "affix": false, "status": "0", "description": "模块目录（代码生成）", "uuid": "ade58d3d-98a7-48a7-96c7-36ebe5d59daf", "created_time": "2026-04-29 20:01:58", "updated_time": "2026-04-29 20:01:58", "is_deleted": false, "deleted_time": null, "parent_name": null}, "path_params": {"id": "189"}}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"修改菜单成功","data":{"id":189,"uuid":"ade58d3d-98a7-48a7-96c7-36ebe5d59daf","status":"0","description":"模块目录（代码生成）","created_time":"2026-04-29 20:01:58","updated_time":"2026-04-29 20:02:18","is_deleted":false,"deleted_time":null,"name":"客户管理","type":1,"order":9999,"permission":null,"icon":"menu","route_name":"ModuleCrmCustomers","route_path":"/module_crm/customers","component_path":null,"redirect":"/module_crm/customers","hidden":false,"keep_alive":true,"always_show":false,"title":"客户管理","params":null,"affix":false,"parent_id":null,"parent_name":null},"status_code":200,"success":true}', '0.10s', 9, 'e8e779f3-679f-4931-b599-500cdb4dbecb', '0', '修改菜单', '2026-04-29 20:02:18.539646', '2026-04-29 20:02:18.539646', 'f', NULL, 1, 1, NULL);
INSERT INTO "public"."sys_log" VALUES (1, '/api/v1/system/auth/auto-login/token', 'POST', '{}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"获取成功","data":{"token":"9172e8f5-5430-4c48-953e-ca351f6c03be","user":{"id":1,"username":"admin","name":"超级管理员","avatar":"https://service.fastapiadmin.com/api/v1/static/image/avatar.png"}},"status_code":200,"success":true}', '0.03s', 10, '8fef1536-7c10-425e-93b8-b1a85812f085', '0', '获取免登录Token', '2026-04-29 20:10:47.137705', '2026-04-29 20:10:47.137705', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."sys_log" VALUES (1, '/api/v1/system/auth/auto-login', 'POST', '{}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"登录成功","data":{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCJcdThkODVcdTdlYTdcdTdiYTFcdTc0MDZcdTU0NThcIixcInNlc3Npb25faWRcIjpcIjJiN2IwMTcyLTYyNmYtNGRiMy1hZGJmLTkxYWIzOGE2MjgyMVwiLFwidXNlcl9pZFwiOjEsXCJ1c2VyX25hbWVcIjpcImFkbWluXCIsXCJpcGFkZHJcIjpcIjEyNy4wLjAuMVwiLFwibG9naW5fbG9jYXRpb25cIjpcIlx1NTE4NVx1N2Y1MUlQXCIsXCJvc1wiOlwiV2luZG93c1wiLFwiYnJvd3NlclwiOlwiQ2hyb21lXCIsXCJsb2dpbl90aW1lXCI6bnVsbCxcImxvZ2luX3R5cGVcIjpcIlBDXHU3YWVmXCJ9IiwiaXNfcmVmcmVzaCI6ZmFsc2UsImV4cCI6MTc3NzQ5NTI0N30.fMGrtn8qAeXO_5mrF6tC_-FxF0JXZctGHOMJOSKFg0g","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCJcdThkODVcdTdlYTdcdTdiYTFcdTc0MDZcdTU0NThcIixcInNlc3Npb25faWRcIjpcIjJiN2IwMTcyLTYyNmYtNGRiMy1hZGJmLTkxYWIzOGE2MjgyMVwiLFwidXNlcl9pZFwiOjEsXCJ1c2VyX25hbWVcIjpcImFkbWluXCIsXCJpcGFkZHJcIjpcIjEyNy4wLjAuMVwiLFwibG9naW5fbG9jYXRpb25cIjpcIlx1NTE4NVx1N2Y1MUlQXCIsXCJvc1wiOlwiV2luZG93c1wiLFwiYnJvd3NlclwiOlwiQ2hyb21lXCIsXCJsb2dpbl90aW1lXCI6bnVsbCxcImxvZ2luX3R5cGVcIjpcIlBDXHU3YWVmXCJ9IiwiaXNfcmVmcmVzaCI6dHJ1ZSwiZXhwIjoxNzc3NDk1MjQ3fQ.1_0l48i84lxXOCrhkDuUBoizcQ2DFN69lX5qjQ_S7CE","token_type":"bearer","expires_in":1800},"status_code":200,"success":true}', '0.03s', 11, '1a032595-e659-40af-8b51-0becbe63f5f2', '0', '免登录', '2026-04-29 20:10:47.187052', '2026-04-29 20:10:47.187052', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."sys_log" VALUES (1, '/api/v1/system/auth/auto-login/token', 'POST', '{}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"获取成功","data":{"token":"f35ed97d-14be-4551-9752-f4e1e14aa402","user":{"id":1,"username":"admin","name":"超级管理员","avatar":"https://service.fastapiadmin.com/api/v1/static/image/avatar.png"}},"status_code":200,"success":true}', '0.02s', 12, '8fa7f312-1c34-4925-92ba-1e22e18005fd', '0', '获取免登录Token', '2026-04-30 16:52:30.32557', '2026-04-30 16:52:30.32557', 'f', NULL, NULL, NULL, NULL);
INSERT INTO "public"."sys_log" VALUES (1, '/api/v1/system/auth/auto-login', 'POST', '{}', '127.0.0.1', '内网IP', 'Windows', 'Chrome', 200, '{"code":0,"msg":"登录成功","data":{"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCJcdThkODVcdTdlYTdcdTdiYTFcdTc0MDZcdTU0NThcIixcInNlc3Npb25faWRcIjpcImIxNDYwMWFjLTQwZmYtNDY4Yy1hY2YyLWU3NTBiNzk0ZmJhOVwiLFwidXNlcl9pZFwiOjEsXCJ1c2VyX25hbWVcIjpcImFkbWluXCIsXCJpcGFkZHJcIjpcIjEyNy4wLjAuMVwiLFwibG9naW5fbG9jYXRpb25cIjpcIlx1NTE4NVx1N2Y1MUlQXCIsXCJvc1wiOlwiV2luZG93c1wiLFwiYnJvd3NlclwiOlwiQ2hyb21lXCIsXCJsb2dpbl90aW1lXCI6bnVsbCxcImxvZ2luX3R5cGVcIjpcIlBDXHU3YWVmXCJ9IiwiaXNfcmVmcmVzaCI6ZmFsc2UsImV4cCI6MTc3NzU2OTc1MH0.dAWIlx9htQck3DWC7d2mx3a1VyRCeozLfJFBwqMxRaU","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ7XCJuYW1lXCI6XCJcdThkODVcdTdlYTdcdTdiYTFcdTc0MDZcdTU0NThcIixcInNlc3Npb25faWRcIjpcImIxNDYwMWFjLTQwZmYtNDY4Yy1hY2YyLWU3NTBiNzk0ZmJhOVwiLFwidXNlcl9pZFwiOjEsXCJ1c2VyX25hbWVcIjpcImFkbWluXCIsXCJpcGFkZHJcIjpcIjEyNy4wLjAuMVwiLFwibG9naW5fbG9jYXRpb25cIjpcIlx1NTE4NVx1N2Y1MUlQXCIsXCJvc1wiOlwiV2luZG93c1wiLFwiYnJvd3NlclwiOlwiQ2hyb21lXCIsXCJsb2dpbl90aW1lXCI6bnVsbCxcImxvZ2luX3R5cGVcIjpcIlBDXHU3YWVmXCJ9IiwiaXNfcmVmcmVzaCI6dHJ1ZSwiZXhwIjoxNzc3NTY5NzUwfQ.-079lpz2NFTh1JeMLybu59TGZyIPmGtwAYGfavK_4Lw","token_type":"bearer","expires_in":1800},"status_code":200,"success":true}', '0.02s', 13, 'f76bdde7-1825-47eb-853a-ba9bfb64860f', '0', '免登录', '2026-04-30 16:52:30.401359', '2026-04-30 16:52:30.401359', 'f', NULL, NULL, NULL, NULL);

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
  "id" int4 NOT NULL DEFAULT nextval('sys_menu_id_seq1'::regclass),
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
INSERT INTO "public"."sys_menu" VALUES ('仪表盘', 1, 1, '', 'client', 'Dashboard', '/dashboard', NULL, '/dashboard/workplace', 'f', 'f', 'f', '仪表盘', 'null', 'f', NULL, 1, '991f5940-5344-4ec7-9017-ff59f784fd5a', '0', '初始化数据', '2026-04-29 19:40:54.365558', '2026-04-29 19:40:54.365558', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('系统管理', 1, 2, NULL, 'system', 'System', '/system', NULL, '/system/menu', 'f', 'f', 'f', '系统管理', 'null', 'f', NULL, 2, '1a70f479-0410-45c8-b01b-fcbe57fd2c8c', '0', '初始化数据', '2026-04-29 19:40:54.365558', '2026-04-29 19:40:54.365558', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('监控管理', 1, 3, NULL, 'monitor', 'Monitor', '/monitor', NULL, '/monitor/online', 'f', 'f', 'f', '监控管理', 'null', 'f', NULL, 3, '038b4fd5-29af-4445-994e-899f9c3aaf4a', '0', '初始化数据', '2026-04-29 19:40:54.365558', '2026-04-29 19:40:54.365558', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('接口管理', 1, 4, NULL, 'document', 'Common', '/common', NULL, '/common/docs', 'f', 'f', 'f', '接口管理', 'null', 'f', NULL, 4, '5e796252-90f3-4da9-bb1a-bdfcd4e44301', '0', '初始化数据', '2026-04-29 19:40:54.365558', '2026-04-29 19:40:54.365558', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('代码管理', 1, 5, NULL, 'code', 'Generator', '/generator', NULL, '/generator/gencode', 'f', 'f', 'f', '代码管理', 'null', 'f', NULL, 5, '45649f0e-a128-4fb7-b80f-98cb8fcffd97', '0', '代码管理', '2026-04-29 19:40:54.365558', '2026-04-29 19:40:54.365558', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('应用管理', 1, 6, NULL, 'el-icon-ShoppingBag', 'Application', '/application', NULL, '/application/portal', 'f', 'f', 'f', '应用管理', 'null', 'f', NULL, 6, '7f8628d1-934d-47a2-883f-646ada7cfb8f', '0', '初始化数据', '2026-04-29 19:40:54.365558', '2026-04-29 19:40:54.365558', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('AI管理', 1, 7, NULL, 'el-icon-ChatLineSquare', 'AI', '/ai', NULL, '/ai/chat', 'f', 'f', 'f', 'AI管理', 'null', 'f', NULL, 7, '9ffbe8d3-f27b-4d90-84e2-c45456967d81', '0', 'AI管理', '2026-04-29 19:40:54.365558', '2026-04-29 19:40:54.365558', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('任务管理', 1, 8, NULL, 'el-icon-SetUp', 'Task', '/task', NULL, '/task/cronjob/job', 'f', 'f', 'f', '任务管理', 'null', 'f', NULL, 8, 'a8f6661c-8f6e-4302-921f-efdf45b5f885', '0', '任务管理', '2026-04-29 19:40:54.365558', '2026-04-29 19:40:54.365558', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('案例管理', 1, 9, NULL, 'menu', 'Example', '/example', NULL, '/example/demo', 'f', 'f', 'f', '案例管理', 'null', 'f', NULL, 9, '9093dd4a-7f90-4f9a-bf28-f80322593814', '0', '案例管理', '2026-04-29 19:40:54.365558', '2026-04-29 19:40:54.365558', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('工作台', 2, 1, 'dashboard:workplace:query', 'el-icon-PieChart', 'Workplace', '/dashboard/workplace', 'dashboard/workplace', NULL, 'f', 'f', 'f', '工作台', 'null', 'f', 1, 10, '372630c3-033b-48d8-9775-8cb37020f364', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('菜单管理', 2, 1, 'module_system:menu:query', 'menu', 'Menu', '/system/menu', 'module_system/menu/index', NULL, 'f', 'f', 'f', '菜单管理', 'null', 'f', 2, 11, 'a85a492f-60df-40bd-939d-558956a9d62e', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('部门管理', 2, 2, 'module_system:dept:query', 'tree', 'Dept', '/system/dept', 'module_system/dept/index', NULL, 'f', 'f', 'f', '部门管理', 'null', 'f', 2, 12, '8ec2daeb-1dd8-4459-a4da-dcdd95420836', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('岗位管理', 2, 3, 'module_system:position:query', 'el-icon-Coordinate', 'Position', '/system/position', 'module_system/position/index', NULL, 'f', 'f', 'f', '岗位管理', 'null', 'f', 2, 13, '56ac3e4c-643b-42bb-bd3f-1d67087d2fc3', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('角色管理', 2, 4, 'module_system:role:query', 'role', 'Role', '/system/role', 'module_system/role/index', NULL, 'f', 'f', 'f', '角色管理', 'null', 'f', 2, 14, '75011245-8213-4d62-92e8-6cf1374ebbb9', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('用户管理', 2, 5, 'module_system:user:query', 'el-icon-User', 'User', '/system/user', 'module_system/user/index', NULL, 'f', 'f', 'f', '用户管理', 'null', 'f', 2, 15, '533aef16-d79c-4f2a-892b-d726486ab031', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('日志管理', 2, 6, 'module_system:log:query', 'el-icon-Aim', 'Log', '/system/log', 'module_system/log/index', NULL, 'f', 'f', 'f', '日志管理', 'null', 'f', 2, 16, '0ccdcf2c-2a31-458d-b1a1-af134c251acb', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告管理', 2, 7, 'module_system:notice:query', 'bell', 'Notice', '/system/notice', 'module_system/notice/index', NULL, 'f', 'f', 'f', '公告管理', 'null', 'f', 2, 17, '08f274ad-aa98-4ef6-a0a7-afa9235b59f6', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('参数管理', 2, 8, 'module_system:param:query', 'setting', 'Params', '/system/param', 'module_system/param/index', NULL, 'f', 'f', 'f', '参数管理', 'null', 'f', 2, 18, '2d1a6fdf-3d81-4022-8e9f-575b72a05a3a', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('字典管理', 2, 9, 'module_system:dict_type:query', 'dict', 'Dict', '/system/dict', 'module_system/dict/index', NULL, 'f', 'f', 'f', '字典管理', 'null', 'f', 2, 19, 'a01d6612-293c-475f-8700-fce3be76889f', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('租户管理', 2, 10, 'module_system:tenant:query', 'el-icon-DataBoard', 'Tenant', '/system/tenant', 'module_system/tenant/index', NULL, 'f', 'f', 'f', '租户管理', 'null', 'f', 2, 20, 'f0cf9e1b-d406-4acc-a267-b32dd0ab9d6a', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('在线用户', 2, 1, 'module_monitor:online:query', 'el-icon-Headset', 'MonitorOnline', '/monitor/online', 'module_monitor/online/index', NULL, 'f', 'f', 'f', '在线用户', 'null', 'f', 3, 21, '186e2998-cacd-4244-8846-43578bff01eb', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('服务器监控', 2, 2, 'module_monitor:server:query', 'el-icon-Odometer', 'MonitorServer', '/monitor/server', 'module_monitor/server/index', NULL, 'f', 'f', 'f', '服务器监控', 'null', 'f', 3, 22, 'cc1ce37a-405a-4a6d-83b2-3cdcd08e1150', '0', '初始化数据', '2026-04-29 19:40:54.375704', '2026-04-29 19:40:54.375704', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('缓存监控', 2, 3, 'module_monitor:cache:query', 'el-icon-Stopwatch', 'MonitorCache', '/monitor/cache', 'module_monitor/cache/index', NULL, 'f', 'f', 'f', '缓存监控', 'null', 'f', 3, 23, '8efe00ca-76b7-46ab-9c6c-9eaf84159239', '0', '初始化数据', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件管理', 2, 4, 'module_monitor:resource:query', 'el-icon-Files', 'Resource', '/monitor/resource', 'module_monitor/resource/index', NULL, 'f', 'f', 'f', '文件管理', 'null', 'f', 3, 24, 'e5a0947f-a53d-437a-8195-d6de3a676dfe', '0', '初始化数据', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('Swagger文档', 4, 1, 'module_common:docs:query', 'api', 'Docs', '/common/docs', 'module_common/docs/index', NULL, 'f', 'f', 'f', 'Swagger文档', 'null', 'f', 4, 25, '1547f78f-1e2b-4411-a129-3aaeecddb182', '0', '初始化数据', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('Redoc文档', 4, 2, 'module_common:redoc:query', 'el-icon-Document', 'Redoc', '/common/redoc', 'module_common/redoc/index', NULL, 'f', 'f', 'f', 'Redoc文档', 'null', 'f', 4, 26, 'e23eeadf-21ae-4d0b-9fcf-02cb52d905e5', '0', '初始化数据', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('LangJin文档', 4, 3, 'module_common:ljdoc:query', 'el-icon-Document', 'Ljdoc', '/common/ljdoc', 'module_common/ljdoc/index', NULL, 'f', 'f', 'f', 'LangJin文档', 'null', 'f', 4, 27, '51cba7d1-baad-4075-a8a4-672fc54ebf8d', '0', '初始化数据', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('代码生成', 2, 1, 'module_generator:gencode:query', 'code', 'GenCode', '/generator/gencode', 'module_generator/gencode/index', NULL, 'f', 'f', 'f', '代码生成', 'null', 'f', 5, 28, 'afe91b4b-3739-4a23-a67f-e41a0aa7e968', '0', '代码生成', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('插件市场', 2, 1, 'module_application:portal:query', 'el-icon-ShoppingCartFull', 'PortalApp', '/application/portal', 'module_application/portal/index', NULL, 'f', 'f', 'f', '插件市场', 'null', 'f', 6, 29, '0ae62da9-7aa7-471e-bb30-7a6bcea657b2', '0', '初始化数据', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('AI智能助手', 2, 1, 'module_ai:chat:query', 'el-icon-ChatDotRound', 'Chat', '/ai/chat', 'module_ai/chat/index', NULL, 'f', 'f', 'f', 'AI智能助手', 'null', 'f', 7, 30, '3b2fbec3-024c-49be-93c2-2ab48c6b37a6', '0', 'AI智能助手', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('会话记忆', 2, 2, 'module_ai:chat:query', 'el-icon-ChatLineSquare', 'Memory', '/ai/memory', 'module_ai/memory/index', NULL, 'f', 'f', 'f', '会话记忆', 'null', 'f', 7, 31, '16899c96-66ae-4ef3-ad34-b5a44313f40e', '0', '会话记忆管理', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('定时任务', 1, 1, NULL, 'el-icon-Timer', 'Cronjob', '/task/cronjob', NULL, '/task/cronjob/job', 'f', 'f', 'f', '定时任务', 'null', 'f', 8, 32, '3792b223-cd4f-4d67-baa6-a599c55bd749', '0', 'APScheduler 调度器与任务节点', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('工作流', 1, 2, NULL, 'el-icon-SetUp', 'WorkflowMgr', '/task/workflow-mgr', NULL, '/task/workflow/definition', 'f', 'f', 'f', '工作流', 'null', 'f', 8, 33, '5982b893-061c-4b0b-85b9-bc982f627507', '0', '流程编排与编排节点类型', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('示例管理', 2, 1, 'module_example:demo:query', 'menu', 'Demo', '/example/demo', 'module_example/demo/index', NULL, 'f', 'f', 'f', '示例管理', 'null', 'f', 9, 34, '2d87a94c-fe91-49e5-a0de-bdb79f4c5fcc', '0', '示例管理', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('二级目录', 1, 2, NULL, 'menu', 'DemoDir', '/example/demo-group', NULL, '/example/demo-group/demo01', 'f', 'f', 'f', '二级目录', 'null', 'f', 9, 35, '89f51ce2-96a3-4c6f-a9cc-89af9f4dec47', '0', '二级目录（含三级菜单）', '2026-04-29 19:40:54.37623', '2026-04-29 19:40:54.37623', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建菜单', 3, 1, 'module_system:menu:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建菜单', 'null', 'f', 11, 36, '581d570b-1071-474f-9f41-e10c8c36679a', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改菜单', 3, 2, 'module_system:menu:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改菜单', 'null', 'f', 11, 37, 'bf40d7b6-f1fd-4904-9075-1b637aaab4f4', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除菜单', 3, 3, 'module_system:menu:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除菜单', 'null', 'f', 11, 38, 'b1492b31-31ab-48f9-b00c-f0d59f50439b', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改菜单状态', 3, 4, 'module_system:menu:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改菜单状态', 'null', 'f', 11, 39, 'a3c469d0-cb66-490f-be99-8307f9de9422', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情菜单', 3, 5, 'module_system:menu:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情菜单', 'null', 'f', 11, 40, 'b8ce6fc5-fecb-448e-8faa-a564bdb6c94a', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询菜单', 3, 6, 'module_system:menu:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询菜单', 'null', 'f', 11, 41, '90c98d5b-0c36-489f-a714-b5d7abc31b2b', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建部门', 3, 1, 'module_system:dept:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建部门', 'null', 'f', 12, 42, 'f505a1e1-e1ba-40bc-84cd-915a7b334b53', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改部门', 3, 2, 'module_system:dept:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改部门', 'null', 'f', 12, 43, 'a4462829-0cc3-44c3-b8dc-13acf6024ff6', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除部门', 3, 3, 'module_system:dept:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除部门', 'null', 'f', 12, 44, '718ee40c-e267-48eb-b7a4-5105f53f7856', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改部门状态', 3, 4, 'module_system:dept:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改部门状态', 'null', 'f', 12, 45, '8815caad-4b40-4f7c-95f2-e9cfb8267de6', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情部门', 3, 5, 'module_system:dept:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情部门', 'null', 'f', 12, 46, '25bbd2d5-0f9b-4d52-9e56-9729bc28b6fa', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询部门', 3, 6, 'module_system:dept:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询部门', 'null', 'f', 12, 47, '11c717c4-17a2-4877-85bc-a126e1c2b29c', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建岗位', 3, 1, 'module_system:position:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建岗位', 'null', 'f', 13, 48, '6a89f9a0-e47a-474a-8995-906b02dae211', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改岗位', 3, 2, 'module_system:position:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改岗位', 'null', 'f', 13, 49, '03a4cdc3-0b47-4507-a9fc-32ad42fdb515', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除岗位', 3, 3, 'module_system:position:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改岗位', 'null', 'f', 13, 50, 'e2fa078b-d862-4764-9d69-f56e78281012', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改岗位状态', 3, 4, 'module_system:position:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改岗位状态', 'null', 'f', 13, 51, '14c8a593-032d-42a3-8793-dfe726a4e977', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('岗位导出', 3, 5, 'module_system:position:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '岗位导出', 'null', 'f', 13, 52, '01c6f4e2-1d3b-4b63-86ab-29243d83e606', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情岗位', 3, 6, 'module_system:position:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情岗位', 'null', 'f', 13, 53, '4dc06693-9317-4945-904f-43369ffeed01', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询岗位', 3, 7, 'module_system:position:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询岗位', 'null', 'f', 13, 54, 'fc955ab0-4903-4f97-a4bd-f29e872b14ef', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建角色', 3, 1, 'module_system:role:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建角色', 'null', 'f', 14, 55, 'e6c979b5-6333-43d6-a941-ebf9de9941c7', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改角色', 3, 2, 'module_system:role:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改角色', 'null', 'f', 14, 56, '73469484-0514-436d-ad58-ea901e939d3a', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除角色', 3, 3, 'module_system:role:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除角色', 'null', 'f', 14, 57, '8850a081-91ec-4e19-bcbc-b2eaccff4e86', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改角色状态', 3, 4, 'module_system:role:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改角色状态', 'null', 'f', 14, 58, '1ba1610f-6a0f-48e6-b863-90a0261f9c0f', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('角色导出', 3, 5, 'module_system:role:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '角色导出', 'null', 'f', 14, 59, 'ca40dca4-1945-42d4-8443-ced1ee426a21', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情角色', 3, 6, 'module_system:role:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情角色', 'null', 'f', 14, 60, 'ded4eac3-3d23-4b12-9ec4-1b55cc87586a', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询角色', 3, 7, 'module_system:role:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询角色', 'null', 'f', 14, 61, '0d489524-6bfb-4a7e-84e3-b0df7afe735e', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('分配权限', 3, 8, 'module_system:role:permission', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '分配权限', 'null', 'f', 14, 62, 'e5dbfc01-e2d4-4fd7-a792-88dc11d3f227', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建用户', 3, 1, 'module_system:user:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建用户', 'null', 'f', 15, 63, 'bf7834b7-acb8-4824-9f98-d2179504ae57', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改用户', 3, 2, 'module_system:user:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改用户', 'null', 'f', 15, 64, '40ec354a-3a1a-44ea-a861-6baef03b6e9e', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除用户', 3, 3, 'module_system:user:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除用户', 'null', 'f', 15, 65, 'ee66e5f8-e490-4c5e-aabf-4bef2f06af8d', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改用户状态', 3, 4, 'module_system:user:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改用户状态', 'null', 'f', 15, 66, '288ded93-1ae0-44f3-9420-d6b1d7ebf450', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出用户', 3, 5, 'module_system:user:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出用户', 'null', 'f', 15, 67, '383d33ef-fc1d-442d-9908-fe2f8070ef0d', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导入用户', 3, 6, 'module_system:user:import', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导入用户', 'null', 'f', 15, 68, '70c777e0-2517-436b-a41c-a40cc89122a4', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('下载用户导入模板', 3, 7, 'module_system:user:download', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '下载用户导入模板', 'null', 'f', 15, 69, 'fc066eb7-a5fc-479b-bc61-8bb634711f66', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情用户', 3, 8, 'module_system:user:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情用户', 'null', 'f', 15, 70, 'adce852c-7f60-4c6e-8960-cb9f837039d0', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询用户', 3, 9, 'module_system:user:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询用户', 'null', 'f', 15, 71, '1033af26-67c1-4030-b395-bc9c1dbb40a3', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('日志删除', 3, 1, 'module_system:log:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '日志删除', 'null', 'f', 16, 72, '477362dc-956d-4ed5-b1d3-ac736867da80', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('日志导出', 3, 2, 'module_system:log:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '日志导出', 'null', 'f', 16, 73, '90a584ec-d399-4d4f-8d0b-ba42c40b707d', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('日志详情', 3, 3, 'module_system:log:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '日志详情', 'null', 'f', 16, 74, '5fbf21f7-1481-4eb6-8005-9443ee872e2a', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询日志', 3, 4, 'module_system:log:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询日志', 'null', 'f', 16, 75, '270f171f-7242-4798-8dcf-863d2b6174a7', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告创建', 3, 1, 'module_system:notice:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告创建', 'null', 'f', 17, 76, 'a2ef1fda-360c-4437-951b-65c9c2fade79', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告修改', 3, 2, 'module_system:notice:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改用户', 'null', 'f', 17, 77, '132c0342-7f9d-4c5a-b122-608e06dc69f9', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告删除', 3, 3, 'module_system:notice:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告删除', 'null', 'f', 17, 78, '2fdea961-85ce-475f-9147-6ab6367e001f', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告导出', 3, 4, 'module_system:notice:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告导出', 'null', 'f', 17, 79, 'f6159c97-fdb3-4782-884d-4f5d271a4e7d', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告批量修改状态', 3, 5, 'module_system:notice:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告批量修改状态', 'null', 'f', 17, 80, 'bbafeb71-4289-4375-9f72-e197b07c6b2c', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('公告详情', 3, 6, 'module_system:notice:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '公告详情', 'null', 'f', 17, 81, 'b3e28b07-1f69-4f7c-a4a1-f083b4d0ed3c', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询公告', 3, 5, 'module_system:notice:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询公告', 'null', 'f', 17, 82, 'ae6826d1-9728-4a97-9c13-ba0c575cebf3', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建参数', 3, 1, 'module_system:param:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建参数', 'null', 'f', 18, 83, '3dfff84d-47b5-493e-8ea0-d4457c6e066e', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改参数', 3, 2, 'module_system:param:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改参数', 'null', 'f', 18, 84, 'a0a57518-de95-4fbc-8d71-88bd0315248c', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除参数', 3, 3, 'module_system:param:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除参数', 'null', 'f', 18, 85, '00cb7fe6-eec9-47f8-9546-1069e7ad7103', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出参数', 3, 4, 'module_system:param:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出参数', 'null', 'f', 18, 86, 'ea90365e-888f-4f7e-b619-3dc4af21951c', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('参数上传', 3, 5, 'module_system:param:upload', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '参数上传', 'null', 'f', 18, 87, 'ceb1458f-d203-4e74-b6b4-ce94196a413c', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('参数详情', 3, 6, 'module_system:param:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '参数详情', 'null', 'f', 18, 88, '067cc758-4e91-4ac4-8a89-f275d0455938', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询参数', 3, 7, 'module_system:param:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询参数', 'null', 'f', 18, 89, '1d7cdc8c-0337-42fd-a4e5-0513561945c1', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建字典类型', 3, 1, 'module_system:dict_type:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建字典类型', 'null', 'f', 19, 90, '0d9725aa-930f-42f4-8ace-b34573e34a63', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改字典类型', 3, 2, 'module_system:dict_type:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改字典类型', 'null', 'f', 19, 91, '68ad12e4-98da-44ab-bd9a-773894e0ffea', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除字典类型', 3, 3, 'module_system:dict_type:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除字典类型', 'null', 'f', 19, 92, 'c98dd492-7a75-4714-9f0e-2f27cb2c1544', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出字典类型', 3, 4, 'module_system:dict_type:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出字典类型', 'null', 'f', 19, 93, 'cc5ddd49-30ed-42c2-91d3-feaa4814c66a', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改字典状态', 3, 5, 'module_system:dict_type:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出字典类型', 'null', 'f', 19, 94, '20d635a7-d511-4816-8766-3c7b88b07928', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('字典数据查询', 3, 6, 'module_system:dict_data:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '字典数据查询', 'null', 'f', 19, 95, 'f68921b8-1854-45d5-8f49-336673a1e686', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建字典数据', 3, 7, 'module_system:dict_data:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建字典数据', 'null', 'f', 19, 96, '2e8d3024-a9f3-4d98-8dd5-495246700504', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改字典数据', 3, 8, 'module_system:dict_data:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改字典数据', 'null', 'f', 19, 97, '6fb11c6c-56f2-4c16-be7f-bae213d01806', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除字典数据', 3, 9, 'module_system:dict_data:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除字典数据', 'null', 'f', 19, 98, '9c50b27e-ebae-433d-b1da-9a62ed58c0d6', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出字典数据', 3, 10, 'module_system:dict_data:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出字典数据', 'null', 'f', 19, 99, 'ab146787-158e-490e-9b17-757786d1d01c', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改字典数据状态', 3, 11, 'module_system:dict_data:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改字典数据状态', 'null', 'f', 19, 100, 'b1081877-3e7c-4210-891e-ed8529712a39', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情字典类型', 3, 12, 'module_system:dict_type:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情字典类型', 'null', 'f', 19, 101, '58bf9515-9e58-4300-a7b9-766d9d34278d', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询字典类型', 3, 13, 'module_system:dict_type:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询字典类型', 'null', 'f', 19, 102, 'f3b1bdc6-bcbc-4679-83af-438e28b8fa95', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情字典数据', 3, 14, 'module_system:dict_data:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情字典数据', 'null', 'f', 19, 103, '6d6a748d-088b-4e0b-976c-5228cb4bed19', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建租户', 3, 1, 'module_system:tenant:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建租户', 'null', 'f', 20, 104, '23370764-2d52-4d72-bf0b-46b191b1b060', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改租户', 3, 2, 'module_system:tenant:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改租户', 'null', 'f', 20, 105, '148e33f4-fd32-4f24-9449-03ec56f897eb', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除租户', 3, 3, 'module_system:tenant:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除租户', 'null', 'f', 20, 106, 'eaf4e1cf-7828-4a91-8ade-fbca6facf5c8', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改租户状态', 3, 4, 'module_system:tenant:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改租户状态', 'null', 'f', 20, 107, '346c757a-0aa1-452f-8be3-47c322737ca0', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('租户详情', 3, 5, 'module_system:tenant:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '租户详情', 'null', 'f', 20, 108, '1dec3860-85dd-4f23-b9d1-f0daf02927ee', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询租户', 3, 6, 'module_system:tenant:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询租户', 'null', 'f', 20, 109, '5c3cc604-bef1-48b1-bff1-87768668b857', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('在线用户强制下线', 3, 1, 'module_monitor:online:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '在线用户强制下线', 'null', 'f', 21, 110, 'b3e906e9-e51b-4132-99b1-1cc17fdbf4f4', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('清除缓存', 3, 1, 'module_monitor:cache:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '清除缓存', 'null', 'f', 23, 111, '4e3264a2-b9ff-454a-b96f-ead04fe5be15', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件上传', 3, 1, 'module_monitor:resource:upload', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件上传', 'null', 'f', 24, 112, '1bfefb65-2964-4a4a-994e-8f1e2cae4dd0', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件下载', 3, 2, 'module_monitor:resource:download', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件下载', 'null', 'f', 24, 113, '8f85a8da-a5c8-4793-8658-274f6f1db6f8', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件删除', 3, 3, 'module_monitor:resource:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件删除', 'null', 'f', 24, 114, 'f4a83ecc-ba79-4672-8f6d-ec89e889762a', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件移动', 3, 4, 'module_monitor:resource:move', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件移动', 'null', 'f', 24, 115, '2b95e73e-994e-4cb4-ac7c-444c0f07c19f', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件复制', 3, 5, 'module_monitor:resource:copy', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件复制', 'null', 'f', 24, 116, '57982265-1851-4ba7-8c88-d6f04f963e84', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('文件重命名', 3, 6, 'module_monitor:resource:rename', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '文件重命名', 'null', 'f', 24, 117, 'b06575ae-7067-4eb1-9c87-9c6bcfc632e3', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建目录', 3, 7, 'module_monitor:resource:create_dir', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建目录', 'null', 'f', 24, 118, '535bb0e1-8be9-4bc2-9991-8d2441e2747e', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出文件列表', 3, 9, 'module_monitor:resource:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出文件列表', 'null', 'f', 24, 119, '6c711974-2829-40a0-9224-f660157dbc5a', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询代码生成业务表列表', 3, 1, 'module_generator:gencode:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询代码生成业务表列表', 'null', 'f', 28, 120, 'e9a689ba-1245-400a-98a9-df64536cdf07', '0', '查询代码生成业务表列表', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建表结构', 3, 2, 'module_generator:gencode:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建表结构', 'null', 'f', 28, 121, '6a13c218-bf0e-40cf-8d5b-5327fd954c9c', '0', '创建表结构', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('编辑业务表信息', 3, 3, 'module_generator:gencode:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '编辑业务表信息', 'null', 'f', 28, 122, 'b5c6e31b-d90b-484e-aa8b-71fa9513efee', '0', '编辑业务表信息', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除业务表信息', 3, 4, 'module_generator:gencode:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除业务表信息', 'null', 'f', 28, 123, '711a25fa-7195-4de3-b69d-38e032cdc664', '0', '删除业务表信息', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导入表结构', 3, 5, 'module_generator:gencode:import', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导入表结构', 'null', 'f', 28, 124, '178cecc5-277b-49da-9c2d-b0709b2bd126', '0', '导入表结构', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量生成代码', 3, 6, 'module_generator:gencode:operate', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量生成代码', 'null', 'f', 28, 125, '43dd4bcc-6c75-483a-a653-65885d0557c4', '0', '批量生成代码', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('生成代码到指定路径', 3, 7, 'module_generator:gencode:code', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '生成代码到指定路径', 'null', 'f', 28, 126, '036dd5c8-0b1e-4f97-979a-d268be88d538', '0', '生成代码到指定路径', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询数据库表列表', 3, 8, 'module_generator:dblist:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询数据库表列表', 'null', 'f', 28, 127, '92879699-d51e-42f6-ba40-b17d77d5b8d5', '0', '查询数据库表列表', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('同步数据库', 3, 9, 'module_generator:db:sync', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '同步数据库', 'null', 'f', 28, 128, '6c4e1641-c3f3-486e-af2b-1e5282018ec5', '0', '同步数据库', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建插件', 3, 1, 'module_application:portal:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建插件', 'null', 'f', 29, 129, '9bfec0bf-ee64-4066-bd98-eab6ffc2567e', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改插件', 3, 2, 'module_application:portal:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改插件', 'null', 'f', 29, 130, '55847c24-c029-45d5-823a-66b87e30d82f', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除插件', 3, 3, 'module_application:portal:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除插件', 'null', 'f', 29, 131, '69c54af3-3128-4679-8635-2670463d5b77', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改插件状态', 3, 4, 'module_application:portal:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改应用状态', 'null', 'f', 29, 132, 'd5284ad5-fad7-4355-9b49-5af626147fdc', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情插件', 3, 5, 'module_application:portal:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情插件', 'null', 'f', 29, 133, 'ac06c879-97af-4df2-b0a9-47b2df29c96c', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询插件', 3, 6, 'module_application:portal:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询插件', 'null', 'f', 29, 134, '29355548-2ce3-45b5-8c81-3df19c786ad1', '0', '查询插件', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('AI对话', 3, 1, 'module_ai:chat:ws', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', 'AI对话', 'null', 'f', 30, 135, 'd583325f-9410-412a-9ada-fd0a32cfb33c', '0', 'AI对话', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询会话', 3, 2, 'module_ai:chat:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询会话', 'null', 'f', 30, 136, '73fa0c9b-9143-48c4-b669-eee10c147d39', '0', '查询会话', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('会话详情', 3, 3, 'module_ai:chat:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '会话详情', 'null', 'f', 30, 137, '8eeb7150-5da1-4de0-be71-a6efed3e5378', '0', '会话详情', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建会话', 3, 4, 'module_ai:chat:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建会话', 'null', 'f', 30, 138, '81419510-2ce2-4c3a-9db2-ba08a11265c5', '0', '创建会话', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('更新会话', 3, 5, 'module_ai:chat:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '更新会话', 'null', 'f', 30, 139, '73b14ba3-3fb9-45d5-b0f6-a318c7005f75', '0', '更新会话', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除会话', 3, 6, 'module_ai:chat:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除会话', 'null', 'f', 30, 140, 'dd6c4902-1a50-49f9-970d-f472361afa68', '0', '删除会话', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询会话记忆', 3, 1, 'module_ai:chat:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询会话记忆', 'null', 'f', 31, 141, 'b8e04175-ad90-431f-91ea-49e6742ef610', '0', '查询会话记忆', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('会话记忆详情', 3, 2, 'module_ai:chat:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '会话记忆详情', 'null', 'f', 31, 142, 'bd940c23-1f4c-4ed5-80a2-2a8062431ae4', '0', '会话记忆详情', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除会话记忆', 3, 3, 'module_ai:chat:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除会话记忆', 'null', 'f', 31, 143, '90e37306-d18a-4125-99e4-030cd6fd7cdd', '0', '删除会话记忆', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('调度器监控', 2, 1, 'module_task:cronjob:job:query', 'el-icon-DataLine', 'Job', '/task/cronjob/job', 'module_task/cronjob/job/index', NULL, 'f', 'f', 'f', '调度器监控', 'null', 'f', 32, 144, 'ddab84ae-8cb2-403c-842a-94f1c9457fe5', '0', '调度器监控', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('节点管理', 2, 2, 'module_task:cronjob:node:query', 'el-icon-Postcard', 'Node', '/task/cronjob/node', 'module_task/cronjob/node/index', NULL, 'f', 'f', 'f', '节点管理', 'null', 'f', 32, 145, '46d5e51d-369d-44f7-a0a6-383866b7203e', '0', '节点管理', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('流程编排', 2, 1, 'module_task:workflow:definition:query', 'el-icon-SetUp', 'Workflow', '/task/workflow/definition', 'module_task/workflow/definition/index', NULL, 'f', 'f', 'f', '流程编排', 'null', 'f', 33, 146, '7f9b20e2-1669-4ee8-9114-4d4b532d969f', '0', 'Vue Flow 画布与发布执行', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('编排节点类型', 2, 2, 'module_task:workflow:node-type:query', 'el-icon-Grid', 'WorkflowNodeType', '/task/workflow/node-type', 'module_task/workflow/node-type/index', NULL, 'f', 'f', 'f', '编排节点类型', 'null', 'f', 33, 147, '1c86dab7-0c5e-4cb1-9ea7-7bca59625315', '0', '画布节点类型与 Prefect 执行逻辑', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建示例', 3, 1, 'module_example:demo:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建示例', 'null', 'f', 34, 148, 'faee5759-c743-4b8e-8500-392d7339af74', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('更新示例', 3, 2, 'module_example:demo:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '更新示例', 'null', 'f', 34, 149, 'dd0ae294-c410-4f2e-bd5d-14486f5da70a', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除示例', 3, 3, 'module_example:demo:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除示例', 'null', 'f', 34, 150, '9d482c22-76b6-4d48-8f0d-72b407429771', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改示例状态', 3, 4, 'module_example:demo:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改示例状态', 'null', 'f', 34, 151, 'c915801c-a0af-402e-8e44-30a2a6c774dc', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出示例', 3, 5, 'module_example:demo:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出示例', 'null', 'f', 34, 152, '01da393a-3479-4474-b694-2f06d8ea06ff', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导入示例', 3, 6, 'module_example:demo:import', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导入示例', 'null', 'f', 34, 153, 'b5dc5994-f668-4ed2-b1d1-ed462e1ae07f', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('下载导入示例模版', 3, 7, 'module_example:demo:download', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '下载导入示例模版', 'null', 'f', 34, 154, '20b0f401-10cd-407c-a7e6-03a45f036662', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情示例', 3, 8, 'module_example:demo:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情示例', 'null', 'f', 34, 155, '7657977e-f1e5-4820-96bf-34f357d1b5f5', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询示例', 3, 9, 'module_example:demo:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询示例', 'null', 'f', 34, 156, 'aa99ff4a-3415-46a7-8606-84f6c4300d9e', '0', '初始化数据', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('三级菜单', 2, 1, 'module_example:demo01:query', 'menu', 'Demo01', '/example/demo-group/demo01', 'module_example/demo01/index', NULL, 'f', 'f', 'f', '三级菜单', 'null', 'f', 35, 157, '3c167dfe-b2ba-4585-9c93-1b9854d5a482', '0', '示例01管理', '2026-04-29 19:40:54.387696', '2026-04-29 19:40:54.387696', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询调度器', 3, 1, 'module_task:cronjob:job:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询调度器', 'null', 'f', 144, 158, '2daab10c-e288-431d-8cdf-2080e63f89ef', '0', '查询调度器', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('控制调度器', 3, 2, 'module_task:cronjob:job:scheduler', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '控制调度器', 'null', 'f', 144, 159, 'ad84595e-e5d7-4da9-acee-0042dd67b170', '0', '控制调度器', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('操作任务', 3, 3, 'module_task:cronjob:job:task', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '操作任务', 'null', 'f', 144, 160, '4920afa8-15c2-4b0f-af48-351263bf1aae', '0', '操作任务', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除执行日志', 3, 4, 'module_task:cronjob:job:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除执行日志', 'null', 'f', 144, 161, '3ef3b51f-fe46-425b-a62b-3494ea9930a7', '0', '删除执行日志', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情执行日志', 3, 5, 'module_task:cronjob:job:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情执行日志', 'null', 'f', 144, 162, '6890fec8-638f-412d-845c-6134f8c79287', '0', '详情执行日志', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建节点', 3, 1, 'module_task:cronjob:node:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建节点', 'null', 'f', 145, 163, '1209e856-e4a7-4a89-9e77-8298f7c9c7c7', '0', '创建节点', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('调试节点', 3, 2, 'module_task:cronjob:node:execute', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '调试节点', 'null', 'f', 145, 164, 'c91ce946-9555-49a7-9af4-1428ea33eccc', '0', '调试节点', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改节点', 3, 3, 'module_task:cronjob:node:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改节点', 'null', 'f', 145, 165, '31370889-3e75-44cc-b9ae-e7444cd05b35', '0', '修改节点', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除节点', 3, 4, 'module_task:cronjob:node:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除节点', 'null', 'f', 145, 166, '9b56b698-f9c0-4793-85a9-51c06ff80da9', '0', '删除节点', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情节点', 3, 5, 'module_task:cronjob:node:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情节点', 'null', 'f', 145, 167, '7138a852-f774-485a-ab81-0645367c6e51', '0', '详情节点', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询节点', 3, 6, 'module_task:cronjob:node:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询节点', 'null', 'f', 145, 168, 'c234f18b-0f06-4a44-ac67-acaa6aac2ff3', '0', '查询节点', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建流程', 3, 1, 'module_task:workflow:definition:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建流程', 'null', 'f', 146, 169, '62fca64a-75ad-4c0d-b5d9-32aad8b8d74d', '0', '创建流程', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('执行流程', 3, 2, 'module_task:workflow:definition:execute', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '执行流程', 'null', 'f', 146, 170, 'b92f430d-51f2-417c-a948-9b688bc88388', '0', '执行流程', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改流程', 3, 3, 'module_task:workflow:definition:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改流程', 'null', 'f', 146, 171, '80a2f01c-2373-444a-bbbd-235335b36867', '0', '修改流程', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除流程', 3, 4, 'module_task:workflow:definition:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除流程', 'null', 'f', 146, 172, '8dd91294-a507-4132-83ba-c319ba608436', '0', '删除流程', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情流程', 3, 5, 'module_task:workflow:definition:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情流程', 'null', 'f', 146, 173, '77d96109-9e3e-4ce5-8384-fd691870f1c1', '0', '详情流程', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询流程', 3, 6, 'module_task:workflow:definition:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询流程', 'null', 'f', 146, 174, '3f64a895-459c-4bd2-a91d-d0acb8c8d6a2', '0', '查询流程', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建编排节点类型', 3, 1, 'module_task:workflow:node-type:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建编排节点类型', 'null', 'f', 147, 175, '45f39641-a648-4135-8f84-7e08473a0680', '0', '创建编排节点类型', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('修改编排节点类型', 3, 2, 'module_task:workflow:node-type:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '修改编排节点类型', 'null', 'f', 147, 176, 'bd2c50cf-5890-44c1-8ac5-5a4c1014e26c', '0', '修改编排节点类型', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除编排节点类型', 3, 3, 'module_task:workflow:node-type:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除编排节点类型', 'null', 'f', 147, 177, '0a60f397-ec3b-401a-8faa-31027ecd8c72', '0', '删除编排节点类型', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情编排节点类型', 3, 4, 'module_task:workflow:node-type:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情编排节点类型', 'null', 'f', 147, 178, '3cb16253-fcbc-4883-aabe-7818c18aedde', '0', '详情编排节点类型', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询编排节点类型', 3, 5, 'module_task:workflow:node-type:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询编排节点类型', 'null', 'f', 147, 179, '3278242f-43ac-4725-a16f-f2f9841522ea', '0', '查询编排节点类型', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('创建示例01', 3, 1, 'module_example:demo01:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '创建示例01', 'null', 'f', 157, 180, 'ef2213a8-6cef-44d2-8f59-696a3e8f30dc', '0', '初始化数据', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('更新示例01', 3, 2, 'module_example:demo01:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '更新示例01', 'null', 'f', 157, 181, '9b92638c-2d6e-4232-a225-ca2e1925488d', '0', '初始化数据', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('删除示例01', 3, 3, 'module_example:demo01:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '删除示例01', 'null', 'f', 157, 182, 'd5e66eab-0157-4921-b633-5528e7bc7bff', '0', '初始化数据', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('批量修改示例01状态', 3, 4, 'module_example:demo01:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '批量修改示例01状态', 'null', 'f', 157, 183, 'c443622e-1380-4210-9c9f-8dd9827c22f9', '0', '初始化数据', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导出示例01', 3, 5, 'module_example:demo01:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导出示例01', 'null', 'f', 157, 184, '8d0070c0-13e3-413b-ae5a-d224dd6432b8', '0', '初始化数据', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('导入示例01', 3, 6, 'module_example:demo01:import', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '导入示例01', 'null', 'f', 157, 185, '4e7e3503-b3c6-4aab-a84a-37ed39e43ba0', '0', '初始化数据', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('下载导入示例01模版', 3, 7, 'module_example:demo01:download', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '下载导入示例01模版', 'null', 'f', 157, 186, 'c1860594-f0c4-4e0d-9a31-a177f55324a9', '0', '初始化数据', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('详情示例01', 3, 8, 'module_example:demo01:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '详情示例01', 'null', 'f', 157, 187, '1663f670-f244-466b-b710-dcfeef29fd99', '0', '初始化数据', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('查询示例01', 3, 9, 'module_example:demo01:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '查询示例01', 'null', 'f', 157, 188, '8639b315-e8f1-48bb-b800-ea6b67e6ca38', '0', '初始化数据', '2026-04-29 19:40:54.487996', '2026-04-29 19:40:54.487996', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心', 2, 9999, 'module_crm:customers:query', 'menu', 'Customers', '/module_crm/customers', 'module_crm/customers/index', NULL, 'f', 'f', 'f', '客户中心', 'null', 'f', 189, 190, 'c886c222-1c99-4020-a8d4-48273e183e43', '0', '客户中心功能菜单', '2026-04-29 20:01:58.173864', '2026-04-29 20:01:58.173864', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心查询', 3, 1, 'module_crm:customers:query', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '客户中心查询', 'null', 'f', 190, 191, 'bf34790e-93a4-4e1e-ab5d-3cf20ad59d99', '0', '客户中心功能按钮', '2026-04-29 20:01:58.179406', '2026-04-29 20:01:58.179406', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心详情', 3, 2, 'module_crm:customers:detail', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '客户中心详情', 'null', 'f', 190, 192, '73322196-dc45-4544-9ce7-b383d6e7f1ba', '0', '客户中心功能按钮', '2026-04-29 20:01:58.187354', '2026-04-29 20:01:58.187354', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心新增', 3, 3, 'module_crm:customers:create', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '客户中心新增', 'null', 'f', 190, 193, '7a156648-97f2-409f-b21e-e1d851c0bae8', '0', '客户中心功能按钮', '2026-04-29 20:01:58.191707', '2026-04-29 20:01:58.191707', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心修改', 3, 4, 'module_crm:customers:update', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '客户中心修改', 'null', 'f', 190, 194, 'b1d2dc67-4c22-496f-8af0-637284f7b3db', '0', '客户中心功能按钮', '2026-04-29 20:01:58.202822', '2026-04-29 20:01:58.202822', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心删除', 3, 5, 'module_crm:customers:delete', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '客户中心删除', 'null', 'f', 190, 195, '378d6e55-621c-477b-8e89-0cce13b9fad8', '0', '客户中心功能按钮', '2026-04-29 20:01:58.211725', '2026-04-29 20:01:58.211725', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心批量状态修改', 3, 6, 'module_crm:customers:patch', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '客户中心批量状态修改', 'null', 'f', 190, 196, '2c019929-7d9a-436f-9f41-fab66b7f08e0', '0', '客户中心功能按钮', '2026-04-29 20:01:58.218261', '2026-04-29 20:01:58.218261', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心导出', 3, 7, 'module_crm:customers:export', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '客户中心导出', 'null', 'f', 190, 197, '11bd1856-8712-45cf-ab5d-2afd715bab79', '0', '客户中心功能按钮', '2026-04-29 20:01:58.224492', '2026-04-29 20:01:58.224492', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心导入', 3, 8, 'module_crm:customers:import', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '客户中心导入', 'null', 'f', 190, 198, '6a7a8ea0-9b8a-4526-82e5-b89530667a2f', '0', '客户中心功能按钮', '2026-04-29 20:01:58.234409', '2026-04-29 20:01:58.234409', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户中心下载导入模板', 3, 9, 'module_crm:customers:download', NULL, NULL, NULL, NULL, NULL, 'f', 'f', 'f', '客户中心下载导入模板', 'null', 'f', 190, 199, 'c34bdb7f-f310-43b0-931d-07705c657039', '0', '客户中心功能按钮', '2026-04-29 20:01:58.240567', '2026-04-29 20:01:58.240567', 'f', NULL);
INSERT INTO "public"."sys_menu" VALUES ('客户管理', 1, 9999, NULL, 'menu', 'ModuleCrmCustomers', '/module_crm/customers', NULL, '/module_crm/customers', 'f', 'f', 'f', '客户管理', 'null', 'f', NULL, 189, 'ade58d3d-98a7-48a7-96c7-36ebe5d59daf', '0', '模块目录（代码生成）', '2026-04-29 20:01:58.148299', '2026-04-29 20:02:18.525334', 'f', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_notice";
CREATE TABLE "public"."sys_notice" (
  "notice_title" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "notice_type" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "notice_content" text COLLATE "pg_catalog"."default",
  "id" int4 NOT NULL DEFAULT nextval('sys_notice_id_seq1'::regclass),
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
  "id" int4 NOT NULL DEFAULT nextval('sys_param_id_seq1'::regclass),
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
INSERT INTO "public"."sys_param" VALUES ('网站名称', 'sys_web_title', 'FastApiAdmin', 'f', 1, '1522ed3f-424f-48ee-8a90-ac09b3dd364f', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('网站描述', 'sys_web_description', 'FastApiAdmin 是完全开源的权限管理系统', 'f', 2, 'ce5b5469-04fa-4b01-ab0c-9ad78a3aab65', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('网页图标', 'sys_web_favicon', 'https://service.fastapiadmin.com/api/v1/static/image/favicon.png', 'f', 3, 'b955ac64-0e7a-4cc8-9e64-e5ed9c6460e5', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('网站Logo', 'sys_web_logo', 'https://service.fastapiadmin.com/api/v1/static/image/logo.png', 'f', 4, '85a9c426-93d7-4f5d-a974-f8eb45247579', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('登录背景', 'sys_login_background', 'https://service.fastapiadmin.com/api/v1/static/image/background.svg', 'f', 5, '85e86aaf-b4a3-4fde-807a-1ee0ddd2f20f', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('版权信息', 'sys_web_copyright', 'Copyright © 2025-2026 service.fastapiadmin.com 版权所有', 'f', 6, 'aa1271f1-795d-4bec-836d-89bf217ad3c8', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('备案信息', 'sys_keep_record', '陕ICP备2025069493号-1', 'f', 7, '9ad03bdd-13ac-4ee1-86a8-cd514783bba2', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('帮助文档', 'sys_help_doc', 'https://service.fastapiadmin.com', 'f', 8, 'e99a4f90-c8dc-4962-af31-18d4045df7c0', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('隐私政策', 'sys_web_privacy', 'https://github.com/fastapiadmin/FastapiAdmin/blob/master/LICENSE', 'f', 9, '927af380-b586-4f52-a41f-d06ba27eb631', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('用户协议', 'sys_web_clause', 'https://github.com/fastapiadmin/FastapiAdmin/blob/master/LICENSE', 'f', 10, 'd4eab48d-b40b-41c8-a48e-e47367ff3487', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('源码代码', 'sys_git_code', 'https://github.com/fastapiadmin/FastapiAdmin.git', 'f', 11, '2d73e913-8f9c-4b58-8c27-6b6435fe5718', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('项目版本', 'sys_web_version', '2.0.0', 'f', 12, '3dee68b5-2aa5-47f0-a4a6-489fb273f13d', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('演示模式启用', 'demo_enable', 'false', 'f', 13, 'cdbfadec-a427-48c5-8628-cc79cfa710d9', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('演示访问IP白名单', 'ip_white_list', '["127.0.0.1"]', 'f', 14, '18a0160a-2b92-46e1-874c-f27c46b472a8', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('接口白名单', 'white_api_list_path', '["/api/v1/system/auth/login", "/api/v1/system/auth/token/refresh", "/api/v1/system/auth/captcha/get", "/api/v1/system/auth/logout", "/api/v1/system/config/info", "/api/v1/system/user/current/info", "/api/v1/system/notice/available", "/api/v1/system/auth/auto-login/users", "/api/v1/system/auth/auto-login/token", "/api/v1/system/auth/auto-login"]', 'f', 15, '3fe80a1c-8c4f-4785-9668-786d7a8226fa', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('访问IP黑名单', 'ip_black_list', '[]', 'f', 16, 'dd90e93b-fd9c-48da-bdca-fa1c493357dc', '0', '初始化数据', '2026-04-29 19:40:54.517756', '2026-04-29 19:40:54.517756', 'f', NULL);
INSERT INTO "public"."sys_param" VALUES ('调度器状态', 'scheduler_status', 'stopped', 'f', 17, 'fa05b9ae-af2f-4e31-828c-2aa32d1890dc', '0', NULL, '2026-04-29 20:07:20.011632', '2026-04-29 20:07:20.011632', 'f', NULL);

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_position";
CREATE TABLE "public"."sys_position" (
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "order" int4 NOT NULL,
  "id" int4 NOT NULL DEFAULT nextval('sys_position_id_seq1'::regclass),
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
  "id" int4 NOT NULL DEFAULT nextval('sys_role_id_seq1'::regclass),
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
INSERT INTO "public"."sys_role" VALUES ('管理员角色', 'ADMIN', 1, 4, 1, 'dc408b07-37cc-4203-9055-d5685c19ef66', '0', '初始化角色', '2026-04-29 19:40:54.567723', '2026-04-29 19:40:54.567723', 'f', NULL);

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
  "id" int4 NOT NULL DEFAULT nextval('sys_tenant_id_seq1'::regclass),
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
INSERT INTO "public"."sys_tenant" VALUES ('系统租户', 'system', NULL, NULL, 1, '4d5b808c-ffbf-4c46-a067-b6c35b7a951c', '0', '平台默认租户，id 固定为 1', '2026-04-29 19:40:54.323729', '2026-04-29 19:40:54.323729', 'f', NULL);

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
  "id" int4 NOT NULL DEFAULT nextval('sys_user_id_seq1'::regclass),
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
INSERT INTO "public"."sys_user" VALUES ('admin', '$2b$12$e2IJgS/cvHgJ0H3G7Xa08OXoXnk6N/NX3IZRtubBDElA0VLZhkNOa', '超级管理员', NULL, NULL, '0', 'https://service.fastapiadmin.com/api/v1/static/image/avatar.png', 'f', NULL, NULL, NULL, NULL, NULL, 1, 1, 'c1c9c0fd-539d-427c-b22b-d044b2c4023e', '0', '超级管理员', '2026-04-29 19:40:54.705192', '2026-04-29 19:40:54.705192', 'f', NULL, 1, NULL, NULL, NULL);

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
  "id" int4 NOT NULL DEFAULT nextval('task_job_id_seq1'::regclass),
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
  "id" int4 NOT NULL DEFAULT nextval('task_node_id_seq1'::regclass),
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
  "id" int4 NOT NULL DEFAULT nextval('task_workflow_id_seq1'::regclass),
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
  "id" int4 NOT NULL DEFAULT nextval('task_workflow_node_type_id_seq1'::regclass),
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
ALTER SEQUENCE "public"."app_portal_id_seq1"
OWNED BY "public"."app_portal"."id";
SELECT setval('"public"."app_portal_id_seq1"', 1, false);

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
ALTER SEQUENCE "public"."gen_demo01_id_seq1"
OWNED BY "public"."gen_demo01"."id";
SELECT setval('"public"."gen_demo01_id_seq1"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."gen_demo_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."gen_demo_id_seq1"
OWNED BY "public"."gen_demo"."id";
SELECT setval('"public"."gen_demo_id_seq1"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."gen_table_column_id_seq"', 89, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."gen_table_column_id_seq1"
OWNED BY "public"."gen_table_column"."id";
SELECT setval('"public"."gen_table_column_id_seq1"', 61, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."gen_table_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."gen_table_id_seq1"
OWNED BY "public"."gen_table"."id";
SELECT setval('"public"."gen_table_id_seq1"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dept_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_dept_id_seq1"
OWNED BY "public"."sys_dept"."id";
SELECT setval('"public"."sys_dept_id_seq1"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dict_data_id_seq"', 391, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_dict_data_id_seq1"
OWNED BY "public"."sys_dict_data"."id";
SELECT setval('"public"."sys_dict_data_id_seq1"', 34, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_dict_type_id_seq"', 108, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_dict_type_id_seq1"
OWNED BY "public"."sys_dict_type"."id";
SELECT setval('"public"."sys_dict_type_id_seq1"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_log_id_seq"', 26, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_log_id_seq1"
OWNED BY "public"."sys_log"."id";
SELECT setval('"public"."sys_log_id_seq1"', 13, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_menu_id_seq"', 199, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_menu_id_seq1"
OWNED BY "public"."sys_menu"."id";
SELECT setval('"public"."sys_menu_id_seq1"', 199, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_notice_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_notice_id_seq1"
OWNED BY "public"."sys_notice"."id";
SELECT setval('"public"."sys_notice_id_seq1"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_param_id_seq"', 17, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_param_id_seq1"
OWNED BY "public"."sys_param"."id";
SELECT setval('"public"."sys_param_id_seq1"', 17, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_position_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_position_id_seq1"
OWNED BY "public"."sys_position"."id";
SELECT setval('"public"."sys_position_id_seq1"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_role_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_role_id_seq1"
OWNED BY "public"."sys_role"."id";
SELECT setval('"public"."sys_role_id_seq1"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_tenant_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_tenant_id_seq1"
OWNED BY "public"."sys_tenant"."id";
SELECT setval('"public"."sys_tenant_id_seq1"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."sys_user_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."sys_user_id_seq1"
OWNED BY "public"."sys_user"."id";
SELECT setval('"public"."sys_user_id_seq1"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."task_job_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."task_job_id_seq1"
OWNED BY "public"."task_job"."id";
SELECT setval('"public"."task_job_id_seq1"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."task_node_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."task_node_id_seq1"
OWNED BY "public"."task_node"."id";
SELECT setval('"public"."task_node_id_seq1"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."task_workflow_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."task_workflow_id_seq1"
OWNED BY "public"."task_workflow"."id";
SELECT setval('"public"."task_workflow_id_seq1"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."task_workflow_node_type_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."task_workflow_node_type_id_seq1"
OWNED BY "public"."task_workflow_node_type"."id";
SELECT setval('"public"."task_workflow_node_type_id_seq1"', 1, false);

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
