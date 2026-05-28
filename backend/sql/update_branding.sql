-- 更新站点品牌（名称与 Logo）
UPDATE sys_param SET config_value = '嘉期新媒体科技CRM' WHERE config_key = 'sys_web_title';
UPDATE sys_param SET config_value = '嘉期新媒体科技CRM管理系统' WHERE config_key = 'sys_web_description';
UPDATE sys_param SET config_value = '/api/v1/static/image/logo.png' WHERE config_key = 'sys_web_logo';
UPDATE sys_param SET config_value = '/api/v1/static/image/favicon.png' WHERE config_key = 'sys_web_favicon';
