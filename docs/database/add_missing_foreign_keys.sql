DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_customer_profiles_created_by') THEN
        ALTER TABLE crm_ai_customer_profiles ADD CONSTRAINT fk_crm_ai_customer_profiles_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_customer_profiles_customer_id') THEN
        ALTER TABLE crm_ai_customer_profiles ADD CONSTRAINT fk_crm_ai_customer_profiles_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_customer_profiles_updated_by') THEN
        ALTER TABLE crm_ai_customer_profiles ADD CONSTRAINT fk_crm_ai_customer_profiles_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_recommendations_created_by') THEN
        ALTER TABLE crm_ai_recommendations ADD CONSTRAINT fk_crm_ai_recommendations_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_recommendations_updated_by') THEN
        ALTER TABLE crm_ai_recommendations ADD CONSTRAINT fk_crm_ai_recommendations_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_tags_created_by') THEN
        ALTER TABLE crm_ai_tags ADD CONSTRAINT fk_crm_ai_tags_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_ai_tags_updated_by') THEN
        ALTER TABLE crm_ai_tags ADD CONSTRAINT fk_crm_ai_tags_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaign_leads_campaign_id') THEN
        ALTER TABLE crm_campaign_leads ADD CONSTRAINT fk_crm_campaign_leads_campaign_id
        FOREIGN KEY (campaign_id) REFERENCES crm_campaigns(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaign_leads_created_by') THEN
        ALTER TABLE crm_campaign_leads ADD CONSTRAINT fk_crm_campaign_leads_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaign_leads_lead_id') THEN
        ALTER TABLE crm_campaign_leads ADD CONSTRAINT fk_crm_campaign_leads_lead_id
        FOREIGN KEY (lead_id) REFERENCES crm_leads(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaign_leads_updated_by') THEN
        ALTER TABLE crm_campaign_leads ADD CONSTRAINT fk_crm_campaign_leads_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_campaigns_updated_by') THEN
        ALTER TABLE crm_campaigns ADD CONSTRAINT fk_crm_campaigns_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_change_logs_contact_id') THEN
        ALTER TABLE crm_contact_change_logs ADD CONSTRAINT fk_crm_contact_change_logs_contact_id
        FOREIGN KEY (contact_id) REFERENCES crm_contacts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_change_logs_customer_id') THEN
        ALTER TABLE crm_contact_change_logs ADD CONSTRAINT fk_crm_contact_change_logs_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_change_logs_operator_id') THEN
        ALTER TABLE crm_contact_change_logs ADD CONSTRAINT fk_crm_contact_change_logs_operator_id
        FOREIGN KEY (operator_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_relations_contact_id') THEN
        ALTER TABLE crm_contact_relations ADD CONSTRAINT fk_crm_contact_relations_contact_id
        FOREIGN KEY (contact_id) REFERENCES crm_contacts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_relations_created_by') THEN
        ALTER TABLE crm_contact_relations ADD CONSTRAINT fk_crm_contact_relations_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_relations_updated_by') THEN
        ALTER TABLE crm_contact_relations ADD CONSTRAINT fk_crm_contact_relations_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_visits_contact_id') THEN
        ALTER TABLE crm_contact_visits ADD CONSTRAINT fk_crm_contact_visits_contact_id
        FOREIGN KEY (contact_id) REFERENCES crm_contacts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_visits_created_by') THEN
        ALTER TABLE crm_contact_visits ADD CONSTRAINT fk_crm_contact_visits_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_visits_customer_id') THEN
        ALTER TABLE crm_contact_visits ADD CONSTRAINT fk_crm_contact_visits_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_visits_updated_by') THEN
        ALTER TABLE crm_contact_visits ADD CONSTRAINT fk_crm_contact_visits_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contact_visits_visitor_id') THEN
        ALTER TABLE crm_contact_visits ADD CONSTRAINT fk_crm_contact_visits_visitor_id
        FOREIGN KEY (visitor_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contacts_updated_by') THEN
        ALTER TABLE crm_contacts ADD CONSTRAINT fk_crm_contacts_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contract_invoices_contract_id') THEN
        ALTER TABLE crm_contract_invoices ADD CONSTRAINT fk_crm_contract_invoices_contract_id
        FOREIGN KEY (contract_id) REFERENCES crm_contracts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contract_invoices_created_by') THEN
        ALTER TABLE crm_contract_invoices ADD CONSTRAINT fk_crm_contract_invoices_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contract_invoices_issued_by') THEN
        ALTER TABLE crm_contract_invoices ADD CONSTRAINT fk_crm_contract_invoices_issued_by
        FOREIGN KEY (issued_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contract_invoices_updated_by') THEN
        ALTER TABLE crm_contract_invoices ADD CONSTRAINT fk_crm_contract_invoices_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contract_items_contract_id') THEN
        ALTER TABLE crm_contract_items ADD CONSTRAINT fk_crm_contract_items_contract_id
        FOREIGN KEY (contract_id) REFERENCES crm_contracts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contract_items_product_id') THEN
        ALTER TABLE crm_contract_items ADD CONSTRAINT fk_crm_contract_items_product_id
        FOREIGN KEY (product_id) REFERENCES crm_products(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_approved_by') THEN
        ALTER TABLE crm_contracts ADD CONSTRAINT fk_crm_contracts_approved_by
        FOREIGN KEY (approved_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_quotation_id') THEN
        ALTER TABLE crm_contracts ADD CONSTRAINT fk_crm_contracts_quotation_id
        FOREIGN KEY (quotation_id) REFERENCES crm_quotations(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_contracts_updated_by') THEN
        ALTER TABLE crm_contracts ADD CONSTRAINT fk_crm_contracts_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_activities_customer_id') THEN
        ALTER TABLE crm_customer_activities ADD CONSTRAINT fk_crm_customer_activities_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_activities_operator_id') THEN
        ALTER TABLE crm_customer_activities ADD CONSTRAINT fk_crm_customer_activities_operator_id
        FOREIGN KEY (operator_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_addresses_created_by') THEN
        ALTER TABLE crm_customer_addresses ADD CONSTRAINT fk_crm_customer_addresses_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_addresses_customer_id') THEN
        ALTER TABLE crm_customer_addresses ADD CONSTRAINT fk_crm_customer_addresses_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_attachments_customer_id') THEN
        ALTER TABLE crm_customer_attachments ADD CONSTRAINT fk_crm_customer_attachments_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_attachments_uploader_id') THEN
        ALTER TABLE crm_customer_attachments ADD CONSTRAINT fk_crm_customer_attachments_uploader_id
        FOREIGN KEY (uploader_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_change_logs_customer_id') THEN
        ALTER TABLE crm_customer_change_logs ADD CONSTRAINT fk_crm_customer_change_logs_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_change_logs_operator_id') THEN
        ALTER TABLE crm_customer_change_logs ADD CONSTRAINT fk_crm_customer_change_logs_operator_id
        FOREIGN KEY (operator_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_duplicate_logs_handled_by') THEN
        ALTER TABLE crm_customer_duplicate_logs ADD CONSTRAINT fk_crm_customer_duplicate_logs_handled_by
        FOREIGN KEY (handled_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_health_customer_id') THEN
        ALTER TABLE crm_customer_health ADD CONSTRAINT fk_crm_customer_health_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_health_scores_created_by') THEN
        ALTER TABLE crm_customer_health_scores ADD CONSTRAINT fk_crm_customer_health_scores_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_health_scores_customer_id') THEN
        ALTER TABLE crm_customer_health_scores ADD CONSTRAINT fk_crm_customer_health_scores_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_pool_logs_customer_id') THEN
        ALTER TABLE crm_customer_pool_logs ADD CONSTRAINT fk_crm_customer_pool_logs_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_pool_logs_operator_id') THEN
        ALTER TABLE crm_customer_pool_logs ADD CONSTRAINT fk_crm_customer_pool_logs_operator_id
        FOREIGN KEY (operator_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_profiles_created_by') THEN
        ALTER TABLE crm_customer_profiles ADD CONSTRAINT fk_crm_customer_profiles_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_profiles_customer_id') THEN
        ALTER TABLE crm_customer_profiles ADD CONSTRAINT fk_crm_customer_profiles_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_profiles_updated_by') THEN
        ALTER TABLE crm_customer_profiles ADD CONSTRAINT fk_crm_customer_profiles_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_satisfaction_surveys_contact_id') THEN
        ALTER TABLE crm_customer_satisfaction_surveys ADD CONSTRAINT fk_crm_customer_satisfaction_surveys_contact_id
        FOREIGN KEY (contact_id) REFERENCES crm_contacts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_satisfaction_surveys_created_by') THEN
        ALTER TABLE crm_customer_satisfaction_surveys ADD CONSTRAINT fk_crm_customer_satisfaction_surveys_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_satisfaction_surveys_customer_id') THEN
        ALTER TABLE crm_customer_satisfaction_surveys ADD CONSTRAINT fk_crm_customer_satisfaction_surveys_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_satisfaction_surveys_follow_up_by') THEN
        ALTER TABLE crm_customer_satisfaction_surveys ADD CONSTRAINT fk_crm_customer_satisfaction_surveys_follow_up_by
        FOREIGN KEY (follow_up_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_satisfaction_surveys_order_id') THEN
        ALTER TABLE crm_customer_satisfaction_surveys ADD CONSTRAINT fk_crm_customer_satisfaction_surveys_order_id
        FOREIGN KEY (order_id) REFERENCES crm_orders(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_satisfaction_surveys_updated_by') THEN
        ALTER TABLE crm_customer_satisfaction_surveys ADD CONSTRAINT fk_crm_customer_satisfaction_surveys_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_tags_created_by') THEN
        ALTER TABLE crm_customer_tags ADD CONSTRAINT fk_crm_customer_tags_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_tags_customer_id') THEN
        ALTER TABLE crm_customer_tags ADD CONSTRAINT fk_crm_customer_tags_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_tags_tag_id') THEN
        ALTER TABLE crm_customer_tags ADD CONSTRAINT fk_crm_customer_tags_tag_id
        FOREIGN KEY (tag_id) REFERENCES crm_tag_definitions(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_tags_updated_by') THEN
        ALTER TABLE crm_customer_tags ADD CONSTRAINT fk_crm_customer_tags_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_timeline_created_by') THEN
        ALTER TABLE crm_customer_timeline ADD CONSTRAINT fk_crm_customer_timeline_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_timeline_customer_id') THEN
        ALTER TABLE crm_customer_timeline ADD CONSTRAINT fk_crm_customer_timeline_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_timeline_operator_id') THEN
        ALTER TABLE crm_customer_timeline ADD CONSTRAINT fk_crm_customer_timeline_operator_id
        FOREIGN KEY (operator_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customer_timeline_updated_by') THEN
        ALTER TABLE crm_customer_timeline ADD CONSTRAINT fk_crm_customer_timeline_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_customers_lead_id') THEN
        ALTER TABLE crm_customers ADD CONSTRAINT fk_crm_customers_lead_id
        FOREIGN KEY (lead_id) REFERENCES crm_leads(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_data_dicts_created_by') THEN
        ALTER TABLE crm_data_dicts ADD CONSTRAINT fk_crm_data_dicts_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_data_dicts_updated_by') THEN
        ALTER TABLE crm_data_dicts ADD CONSTRAINT fk_crm_data_dicts_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_deliveries_created_by') THEN
        ALTER TABLE crm_deliveries ADD CONSTRAINT fk_crm_deliveries_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_deliveries_order_id') THEN
        ALTER TABLE crm_deliveries ADD CONSTRAINT fk_crm_deliveries_order_id
        FOREIGN KEY (order_id) REFERENCES crm_orders(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_deliveries_updated_by') THEN
        ALTER TABLE crm_deliveries ADD CONSTRAINT fk_crm_deliveries_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_follow_records_contact_id') THEN
        ALTER TABLE crm_follow_records ADD CONSTRAINT fk_crm_follow_records_contact_id
        FOREIGN KEY (contact_id) REFERENCES crm_contacts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_follow_records_created_by') THEN
        ALTER TABLE crm_follow_records ADD CONSTRAINT fk_crm_follow_records_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_follow_records_customer_id') THEN
        ALTER TABLE crm_follow_records ADD CONSTRAINT fk_crm_follow_records_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_follow_records_opportunity_id') THEN
        ALTER TABLE crm_follow_records ADD CONSTRAINT fk_crm_follow_records_opportunity_id
        FOREIGN KEY (opportunity_id) REFERENCES crm_opportunities(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_follow_records_updated_by') THEN
        ALTER TABLE crm_follow_records ADD CONSTRAINT fk_crm_follow_records_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_contact_id') THEN
        ALTER TABLE crm_followups ADD CONSTRAINT fk_crm_followups_contact_id
        FOREIGN KEY (contact_id) REFERENCES crm_contacts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_followups_created_by') THEN
        ALTER TABLE crm_followups ADD CONSTRAINT fk_crm_followups_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_import_records_created_by') THEN
        ALTER TABLE crm_import_records ADD CONSTRAINT fk_crm_import_records_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_invoices_contract_id') THEN
        ALTER TABLE crm_invoices ADD CONSTRAINT fk_crm_invoices_contract_id
        FOREIGN KEY (contract_id) REFERENCES crm_contracts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_invoices_created_by') THEN
        ALTER TABLE crm_invoices ADD CONSTRAINT fk_crm_invoices_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_invoices_customer_id') THEN
        ALTER TABLE crm_invoices ADD CONSTRAINT fk_crm_invoices_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_invoices_order_id') THEN
        ALTER TABLE crm_invoices ADD CONSTRAINT fk_crm_invoices_order_id
        FOREIGN KEY (order_id) REFERENCES crm_orders(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_invoices_updated_by') THEN
        ALTER TABLE crm_invoices ADD CONSTRAINT fk_crm_invoices_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_joint_followups_assigned_by') THEN
        ALTER TABLE crm_joint_followups ADD CONSTRAINT fk_crm_joint_followups_assigned_by
        FOREIGN KEY (assigned_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_joint_followups_created_by') THEN
        ALTER TABLE crm_joint_followups ADD CONSTRAINT fk_crm_joint_followups_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_joint_followups_opportunity_id') THEN
        ALTER TABLE crm_joint_followups ADD CONSTRAINT fk_crm_joint_followups_opportunity_id
        FOREIGN KEY (opportunity_id) REFERENCES crm_opportunities(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_joint_followups_updated_by') THEN
        ALTER TABLE crm_joint_followups ADD CONSTRAINT fk_crm_joint_followups_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_lead_scores_lead_id') THEN
        ALTER TABLE crm_lead_scores ADD CONSTRAINT fk_crm_lead_scores_lead_id
        FOREIGN KEY (lead_id) REFERENCES crm_leads(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_leads_campaign_id') THEN
        ALTER TABLE crm_leads ADD CONSTRAINT fk_crm_leads_campaign_id
        FOREIGN KEY (campaign_id) REFERENCES crm_campaigns(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_leads_updated_by') THEN
        ALTER TABLE crm_leads ADD CONSTRAINT fk_crm_leads_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_marketing_campaigns_created_by') THEN
        ALTER TABLE crm_marketing_campaigns ADD CONSTRAINT fk_crm_marketing_campaigns_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_marketing_campaigns_owner_id') THEN
        ALTER TABLE crm_marketing_campaigns ADD CONSTRAINT fk_crm_marketing_campaigns_owner_id
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_marketing_campaigns_updated_by') THEN
        ALTER TABLE crm_marketing_campaigns ADD CONSTRAINT fk_crm_marketing_campaigns_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_marketing_channels_created_by') THEN
        ALTER TABLE crm_marketing_channels ADD CONSTRAINT fk_crm_marketing_channels_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_marketing_channels_updated_by') THEN
        ALTER TABLE crm_marketing_channels ADD CONSTRAINT fk_crm_marketing_channels_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunities_updated_by') THEN
        ALTER TABLE crm_opportunities ADD CONSTRAINT fk_crm_opportunities_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunity_products_created_by') THEN
        ALTER TABLE crm_opportunity_products ADD CONSTRAINT fk_crm_opportunity_products_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunity_products_opportunity_id') THEN
        ALTER TABLE crm_opportunity_products ADD CONSTRAINT fk_crm_opportunity_products_opportunity_id
        FOREIGN KEY (opportunity_id) REFERENCES crm_opportunities(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunity_products_product_id') THEN
        ALTER TABLE crm_opportunity_products ADD CONSTRAINT fk_crm_opportunity_products_product_id
        FOREIGN KEY (product_id) REFERENCES crm_products(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunity_products_updated_by') THEN
        ALTER TABLE crm_opportunity_products ADD CONSTRAINT fk_crm_opportunity_products_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunity_stages_created_by') THEN
        ALTER TABLE crm_opportunity_stages ADD CONSTRAINT fk_crm_opportunity_stages_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_opportunity_stages_updated_by') THEN
        ALTER TABLE crm_opportunity_stages ADD CONSTRAINT fk_crm_opportunity_stages_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_order_items_created_by') THEN
        ALTER TABLE crm_order_items ADD CONSTRAINT fk_crm_order_items_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_order_items_order_id') THEN
        ALTER TABLE crm_order_items ADD CONSTRAINT fk_crm_order_items_order_id
        FOREIGN KEY (order_id) REFERENCES crm_orders(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_order_items_product_id') THEN
        ALTER TABLE crm_order_items ADD CONSTRAINT fk_crm_order_items_product_id
        FOREIGN KEY (product_id) REFERENCES crm_products(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_orders_contract_id') THEN
        ALTER TABLE crm_orders ADD CONSTRAINT fk_crm_orders_contract_id
        FOREIGN KEY (contract_id) REFERENCES crm_contracts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_orders_created_by') THEN
        ALTER TABLE crm_orders ADD CONSTRAINT fk_crm_orders_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_orders_customer_id') THEN
        ALTER TABLE crm_orders ADD CONSTRAINT fk_crm_orders_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_orders_owner_id') THEN
        ALTER TABLE crm_orders ADD CONSTRAINT fk_crm_orders_owner_id
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_payments_confirmed_by') THEN
        ALTER TABLE crm_payments ADD CONSTRAINT fk_crm_payments_confirmed_by
        FOREIGN KEY (confirmed_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_payments_contract_id') THEN
        ALTER TABLE crm_payments ADD CONSTRAINT fk_crm_payments_contract_id
        FOREIGN KEY (contract_id) REFERENCES crm_contracts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_payments_created_by') THEN
        ALTER TABLE crm_payments ADD CONSTRAINT fk_crm_payments_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_payments_customer_id') THEN
        ALTER TABLE crm_payments ADD CONSTRAINT fk_crm_payments_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_payments_invoice_id') THEN
        ALTER TABLE crm_payments ADD CONSTRAINT fk_crm_payments_invoice_id
        FOREIGN KEY (invoice_id) REFERENCES crm_invoices(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_payments_order_id') THEN
        ALTER TABLE crm_payments ADD CONSTRAINT fk_crm_payments_order_id
        FOREIGN KEY (order_id) REFERENCES crm_orders(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_payments_updated_by') THEN
        ALTER TABLE crm_payments ADD CONSTRAINT fk_crm_payments_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_pool_transfers_customer_id') THEN
        ALTER TABLE crm_pool_transfers ADD CONSTRAINT fk_crm_pool_transfers_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_pool_transfers_operator_id') THEN
        ALTER TABLE crm_pool_transfers ADD CONSTRAINT fk_crm_pool_transfers_operator_id
        FOREIGN KEY (operator_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_price_tiers_created_by') THEN
        ALTER TABLE crm_price_tiers ADD CONSTRAINT fk_crm_price_tiers_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_price_tiers_updated_by') THEN
        ALTER TABLE crm_price_tiers ADD CONSTRAINT fk_crm_price_tiers_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_categories_created_by') THEN
        ALTER TABLE crm_product_categories ADD CONSTRAINT fk_crm_product_categories_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_categories_updated_by') THEN
        ALTER TABLE crm_product_categories ADD CONSTRAINT fk_crm_product_categories_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_documents_created_by') THEN
        ALTER TABLE crm_product_documents ADD CONSTRAINT fk_crm_product_documents_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_documents_product_id') THEN
        ALTER TABLE crm_product_documents ADD CONSTRAINT fk_crm_product_documents_product_id
        FOREIGN KEY (product_id) REFERENCES crm_products(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_documents_updated_by') THEN
        ALTER TABLE crm_product_documents ADD CONSTRAINT fk_crm_product_documents_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_price_history_approved_by') THEN
        ALTER TABLE crm_product_price_history ADD CONSTRAINT fk_crm_product_price_history_approved_by
        FOREIGN KEY (approved_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_price_history_operator_id') THEN
        ALTER TABLE crm_product_price_history ADD CONSTRAINT fk_crm_product_price_history_operator_id
        FOREIGN KEY (operator_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_price_history_product_id') THEN
        ALTER TABLE crm_product_price_history ADD CONSTRAINT fk_crm_product_price_history_product_id
        FOREIGN KEY (product_id) REFERENCES crm_products(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_price_policies_created_by') THEN
        ALTER TABLE crm_product_price_policies ADD CONSTRAINT fk_crm_product_price_policies_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_price_policies_customer_id') THEN
        ALTER TABLE crm_product_price_policies ADD CONSTRAINT fk_crm_product_price_policies_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_price_policies_product_id') THEN
        ALTER TABLE crm_product_price_policies ADD CONSTRAINT fk_crm_product_price_policies_product_id
        FOREIGN KEY (product_id) REFERENCES crm_products(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_prices_approved_by') THEN
        ALTER TABLE crm_product_prices ADD CONSTRAINT fk_crm_product_prices_approved_by
        FOREIGN KEY (approved_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_prices_created_by') THEN
        ALTER TABLE crm_product_prices ADD CONSTRAINT fk_crm_product_prices_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_prices_customer_id') THEN
        ALTER TABLE crm_product_prices ADD CONSTRAINT fk_crm_product_prices_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_prices_product_id') THEN
        ALTER TABLE crm_product_prices ADD CONSTRAINT fk_crm_product_prices_product_id
        FOREIGN KEY (product_id) REFERENCES crm_products(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_prices_updated_by') THEN
        ALTER TABLE crm_product_prices ADD CONSTRAINT fk_crm_product_prices_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_skus_created_by') THEN
        ALTER TABLE crm_product_skus ADD CONSTRAINT fk_crm_product_skus_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_product_skus_product_id') THEN
        ALTER TABLE crm_product_skus ADD CONSTRAINT fk_crm_product_skus_product_id
        FOREIGN KEY (product_id) REFERENCES crm_products(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_products_category_id') THEN
        ALTER TABLE crm_products ADD CONSTRAINT fk_crm_products_category_id
        FOREIGN KEY (category_id) REFERENCES crm_product_categories(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotation_items_created_by') THEN
        ALTER TABLE crm_quotation_items ADD CONSTRAINT fk_crm_quotation_items_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotation_items_product_id') THEN
        ALTER TABLE crm_quotation_items ADD CONSTRAINT fk_crm_quotation_items_product_id
        FOREIGN KEY (product_id) REFERENCES crm_products(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotation_items_quotation_id') THEN
        ALTER TABLE crm_quotation_items ADD CONSTRAINT fk_crm_quotation_items_quotation_id
        FOREIGN KEY (quotation_id) REFERENCES crm_quotations(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotation_items_updated_by') THEN
        ALTER TABLE crm_quotation_items ADD CONSTRAINT fk_crm_quotation_items_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotations_approved_by') THEN
        ALTER TABLE crm_quotations ADD CONSTRAINT fk_crm_quotations_approved_by
        FOREIGN KEY (approved_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotations_created_by') THEN
        ALTER TABLE crm_quotations ADD CONSTRAINT fk_crm_quotations_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotations_customer_id') THEN
        ALTER TABLE crm_quotations ADD CONSTRAINT fk_crm_quotations_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotations_opportunity_id') THEN
        ALTER TABLE crm_quotations ADD CONSTRAINT fk_crm_quotations_opportunity_id
        FOREIGN KEY (opportunity_id) REFERENCES crm_opportunities(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_quotations_updated_by') THEN
        ALTER TABLE crm_quotations ADD CONSTRAINT fk_crm_quotations_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_renewals_created_by') THEN
        ALTER TABLE crm_renewals ADD CONSTRAINT fk_crm_renewals_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_renewals_customer_id') THEN
        ALTER TABLE crm_renewals ADD CONSTRAINT fk_crm_renewals_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_renewals_owner_id') THEN
        ALTER TABLE crm_renewals ADD CONSTRAINT fk_crm_renewals_owner_id
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_renewals_updated_by') THEN
        ALTER TABLE crm_renewals ADD CONSTRAINT fk_crm_renewals_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_report_instances_generated_by') THEN
        ALTER TABLE crm_report_instances ADD CONSTRAINT fk_crm_report_instances_generated_by
        FOREIGN KEY (generated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_report_instances_template_id') THEN
        ALTER TABLE crm_report_instances ADD CONSTRAINT fk_crm_report_instances_template_id
        FOREIGN KEY (template_id) REFERENCES crm_report_templates(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_report_templates_owner_id') THEN
        ALTER TABLE crm_report_templates ADD CONSTRAINT fk_crm_report_templates_owner_id
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_sales_activities_contact_id') THEN
        ALTER TABLE crm_sales_activities ADD CONSTRAINT fk_crm_sales_activities_contact_id
        FOREIGN KEY (contact_id) REFERENCES crm_contacts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_sales_activities_created_by') THEN
        ALTER TABLE crm_sales_activities ADD CONSTRAINT fk_crm_sales_activities_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_sales_activities_customer_id') THEN
        ALTER TABLE crm_sales_activities ADD CONSTRAINT fk_crm_sales_activities_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_sales_activities_opportunity_id') THEN
        ALTER TABLE crm_sales_activities ADD CONSTRAINT fk_crm_sales_activities_opportunity_id
        FOREIGN KEY (opportunity_id) REFERENCES crm_opportunities(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_sales_targets_created_by') THEN
        ALTER TABLE crm_sales_targets ADD CONSTRAINT fk_crm_sales_targets_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_sales_targets_owner_id') THEN
        ALTER TABLE crm_sales_targets ADD CONSTRAINT fk_crm_sales_targets_owner_id
        FOREIGN KEY (owner_id) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_satisfaction_surveys_created_by') THEN
        ALTER TABLE crm_satisfaction_surveys ADD CONSTRAINT fk_crm_satisfaction_surveys_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_satisfaction_surveys_customer_id') THEN
        ALTER TABLE crm_satisfaction_surveys ADD CONSTRAINT fk_crm_satisfaction_surveys_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tag_definitions_created_by') THEN
        ALTER TABLE crm_tag_definitions ADD CONSTRAINT fk_crm_tag_definitions_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tag_definitions_updated_by') THEN
        ALTER TABLE crm_tag_definitions ADD CONSTRAINT fk_crm_tag_definitions_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tags_created_by') THEN
        ALTER TABLE crm_tags ADD CONSTRAINT fk_crm_tags_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tags_updated_by') THEN
        ALTER TABLE crm_tags ADD CONSTRAINT fk_crm_tags_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tasks_contact_id') THEN
        ALTER TABLE crm_tasks ADD CONSTRAINT fk_crm_tasks_contact_id
        FOREIGN KEY (contact_id) REFERENCES crm_contacts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tasks_contract_id') THEN
        ALTER TABLE crm_tasks ADD CONSTRAINT fk_crm_tasks_contract_id
        FOREIGN KEY (contract_id) REFERENCES crm_contracts(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tasks_created_by') THEN
        ALTER TABLE crm_tasks ADD CONSTRAINT fk_crm_tasks_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tasks_customer_id') THEN
        ALTER TABLE crm_tasks ADD CONSTRAINT fk_crm_tasks_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tasks_opportunity_id') THEN
        ALTER TABLE crm_tasks ADD CONSTRAINT fk_crm_tasks_opportunity_id
        FOREIGN KEY (opportunity_id) REFERENCES crm_opportunities(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_tasks_updated_by') THEN
        ALTER TABLE crm_tasks ADD CONSTRAINT fk_crm_tasks_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_test_monitor_report_created_by') THEN
        ALTER TABLE crm_test_monitor_report ADD CONSTRAINT fk_crm_test_monitor_report_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_test_monitor_report_updated_by') THEN
        ALTER TABLE crm_test_monitor_report ADD CONSTRAINT fk_crm_test_monitor_report_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_user_extensions_created_by') THEN
        ALTER TABLE crm_user_extensions ADD CONSTRAINT fk_crm_user_extensions_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_user_extensions_updated_by') THEN
        ALTER TABLE crm_user_extensions ADD CONSTRAINT fk_crm_user_extensions_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_workflow_approvals_created_by') THEN
        ALTER TABLE crm_workflow_approvals ADD CONSTRAINT fk_crm_workflow_approvals_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_workflow_approvals_updated_by') THEN
        ALTER TABLE crm_workflow_approvals ADD CONSTRAINT fk_crm_workflow_approvals_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_workflow_logs_customer_id') THEN
        ALTER TABLE crm_workflow_logs ADD CONSTRAINT fk_crm_workflow_logs_customer_id
        FOREIGN KEY (customer_id) REFERENCES crm_customers(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_workflow_logs_opportunity_id') THEN
        ALTER TABLE crm_workflow_logs ADD CONSTRAINT fk_crm_workflow_logs_opportunity_id
        FOREIGN KEY (opportunity_id) REFERENCES crm_opportunities(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_workflow_rules_created_by') THEN
        ALTER TABLE crm_workflow_rules ADD CONSTRAINT fk_crm_workflow_rules_created_by
        FOREIGN KEY (created_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$ BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_crm_workflow_rules_updated_by') THEN
        ALTER TABLE crm_workflow_rules ADD CONSTRAINT fk_crm_workflow_rules_updated_by
        FOREIGN KEY (updated_by) REFERENCES sys_user(id) ON DELETE SET NULL;
    END IF;
END $$;

