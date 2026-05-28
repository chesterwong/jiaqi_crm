-- =============================================
-- CRM Database - All Sequences
-- Total: 95 sequences
-- Extracted from: crm-public-4-26-1701.sql
-- =============================================

SET search_path TO public;

BEGIN;

-- =============================================
-- CRM Business Table Sequences (75 sequences)
-- =============================================
-- ----------------------------
-- Sequence structure for crm_ai_customer_profiles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_ai_customer_profiles_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_ai_customer_profiles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_ai_recommendations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_ai_recommendations_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_ai_recommendations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_ai_tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_ai_tags_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_ai_tags_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_alert_rules_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_alert_rules_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_alert_rules_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_approval_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_approval_records_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_approval_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_call_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_call_records_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_call_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_campaign_leads_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_campaign_leads_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_campaign_leads_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_campaigns_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_campaigns_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_campaigns_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_competitors_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_competitors_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_competitors_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contact_change_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contact_change_logs_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_contact_change_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contact_relations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contact_relations_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_contact_relations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contact_visits_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contact_visits_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_contact_visits_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contacts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contacts_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_contacts_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contract_invoices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contract_invoices_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_contract_invoices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contract_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contract_items_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_contract_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_contracts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_contracts_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_contracts_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_activities_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_activities_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_activities_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_addresses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_addresses_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_addresses_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_attachments_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_attachments_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_attachments_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_change_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_change_logs_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_change_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_duplicate_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_duplicate_logs_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_duplicate_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_health_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_health_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_health_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_health_scores_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_health_scores_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_health_scores_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_pool_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_pool_logs_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_pool_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_profiles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_profiles_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_profiles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_satisfaction_surveys_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_satisfaction_surveys_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_satisfaction_surveys_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_tags_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_tags_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customer_timeline_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customer_timeline_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customer_timeline_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_customers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_customers_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_customers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_deliveries_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_deliveries_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_deliveries_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_follow_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_follow_records_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_follow_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_followups_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_followups_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_followups_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_import_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_import_records_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_import_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_invoices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_invoices_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_invoices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_joint_followups_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_joint_followups_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_joint_followups_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_lead_scores_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_lead_scores_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_lead_scores_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_leads_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_leads_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_leads_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_marketing_campaigns_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_marketing_campaigns_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_marketing_campaigns_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_marketing_channels_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_marketing_channels_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_marketing_channels_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_notifications_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_notifications_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_notifications_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_operation_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_operation_logs_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_operation_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_opportunities_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_opportunities_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_opportunities_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_opportunity_products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_opportunity_products_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_opportunity_products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_opportunity_stages_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_opportunity_stages_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_opportunity_stages_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_order_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_order_items_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_order_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_orders_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_orders_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_payments_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_payments_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_payments_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_pool_transfers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_pool_transfers_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_pool_transfers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_price_tiers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_price_tiers_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_price_tiers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_categories_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_categories_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_product_categories_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_documents_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_documents_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_product_documents_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_price_history_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_price_history_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_product_price_history_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_price_policies_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_price_policies_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_product_price_policies_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_prices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_prices_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_product_prices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_product_skus_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_product_skus_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_product_skus_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_products_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_quotation_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_quotation_items_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_quotation_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_quotations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_quotations_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_quotations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_renewals_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_renewals_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_renewals_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_report_instances_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_report_instances_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_report_instances_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_report_templates_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_report_templates_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_report_templates_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_sales_activities_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_sales_activities_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_sales_activities_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_sales_targets_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_sales_targets_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_sales_targets_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_satisfaction_surveys_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_satisfaction_surveys_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_satisfaction_surveys_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_service_tickets_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_service_tickets_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_service_tickets_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_tag_definitions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_tag_definitions_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_tag_definitions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_tags_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_tags_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_tasks_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_tasks_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_tasks_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_test_monitor_report_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_test_monitor_report_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_test_monitor_report_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_user_extensions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_user_extensions_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_user_extensions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_visit_records_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_visit_records_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_visit_records_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_workflow_approvals_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_workflow_approvals_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_workflow_approvals_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_workflow_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_workflow_logs_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_workflow_logs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for crm_workflow_rules_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."crm_workflow_rules_id_seq" CASCADE;
CREATE SEQUENCE "public"."crm_workflow_rules_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;


COMMIT;
