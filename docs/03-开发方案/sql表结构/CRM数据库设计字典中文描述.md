CRM系统数据库字典（中文完整版）
基于《CRM数据库设计文档-最终版》整理
数据库类型：PostgreSQL 14+
表总数：50张核心业务表

一、数据库表概览
模块	表名	中文表名	说明
系统基础	crm_users	用户表	系统用户账号信息
crm_roles	角色表	系统角色定义
crm_permissions	权限菜单表	系统权限与菜单配置
crm_departments	部门表	组织架构树形结构
crm_user_roles	用户角色关联表	用户与角色多对多关系
crm_role_permissions	角色权限关联表	角色与权限多对多关系
crm_data_dicts	数据字典表	系统枚举值配置
客户管理	crm_customers	客户主表	客户档案核心信息
crm_contacts	联系人表	客户联系人信息
crm_customer_addresses	客户地址表	客户多地址管理
crm_customer_pool_logs	客户池日志表	资源池流转记录
crm_tag_definitions	标签定义表	标签字典
crm_customer_tags	客户标签关联表	客户与标签多对多
crm_customer_timeline	客户动态时间线表	客户事件聚合记录
crm_contact_relations	联系人关系图谱表	联系人之间的关系
crm_contact_visits	联系人拜访记录表	拜访活动记录
crm_import_records	导入记录表	批量导入历史
销售管理	crm_opportunities	商机表	销售漏斗核心数据
crm_opportunity_stages	商机阶段表	销售阶段定义
crm_follow_records	跟进记录表	销售跟进活动
crm_sales_targets	销售目标表	销售业绩目标
crm_tasks	任务表	待办任务管理
产品管理	crm_product_categories	产品分类表	产品树形分类
crm_products	产品表	产品主数据
crm_product_skus	产品SKU表	产品规格明细
crm_product_prices	产品价格表	多价格体系
crm_price_tiers	价格等级表	客户价格等级折扣
crm_product_documents	产品技术文档表	产品附件文档
营销服务	crm_campaigns	营销活动表	市场活动管理
crm_leads	线索表	销售线索管理
crm_lead_scores	线索评分表	线索评分规则
crm_marketing_channels	营销渠道表	渠道定义与ROI
客户成功	crm_customer_health_scores	客户健康度评分表	健康度每日快照
crm_renewals	续费管理表	续约与增购机会
crm_customer_satisfaction_surveys	客户满意度调查表	NPS/CSAT调查
商务合同	crm_quotations	报价单表	报价单主信息
crm_quotation_items	报价单明细表	报价产品明细
crm_contracts	合同表	合同主信息
crm_contract_items	合同明细表	合同产品明细
crm_orders	订单表	销售订单
crm_order_items	订单明细表	订单产品明细
crm_payment_plans	回款计划表	分期付款计划
crm_payments	回款记录表	实际收款记录
crm_invoices	发票表	发票管理
AI智能	crm_customer_profiles	客户画像表	AI生成的360°画像
crm_ai_tags	AI标签表	AI动态标签定义
crm_ai_recommendations	AI推荐表	智能推荐记录
数据报表	crm_report_templates	报表模板表	报表配置模板
crm_report_instances	报表实例表	报表生成记录
系统管理	crm_operation_logs	操作日志表	全系统审计日志
补充表	crm_sequence_rules	序列号规则表	业务单号生成规则
crm_customer_duplicate_logs	客户查重冲突日志表	查重与防撞单记录
crm_workflow_rules	工作流规则表	自动化规则配置
crm_joint_followups	联合跟进关系表	多人协作跟进关系
二、逐表字段中文说明
2.1 系统基础模块
crm_users（用户表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	自增主键
username	用户名	VARCHAR(50)	NOT NULL, UNIQUE	登录账号
email	邮箱	VARCHAR(255)	NOT NULL, UNIQUE	绑定邮箱
phone	手机号	VARCHAR(20)		联系电话
password_hash	密码哈希	VARCHAR(255)	NOT NULL	加密存储的密码
real_name	真实姓名	VARCHAR(100)	NOT NULL	用户真实姓名
avatar_url	头像URL	VARCHAR(500)		头像图片地址
employee_no	工号	VARCHAR(50)	UNIQUE	员工编号
department_id	所属部门ID	BIGINT	REFERENCES crm_departments	关联部门表
position	职位	VARCHAR(100)		岗位名称
manager_id	直属上级ID	BIGINT	REFERENCES crm_users	汇报上级
status	状态	VARCHAR(20)	CHECK	active/inactive/locked
last_login_at	最后登录时间	TIMESTAMP		最近一次登录
last_login_ip	最后登录IP	VARCHAR(45)		最近登录IP地址
password_changed_at	密码修改时间	TIMESTAMP		上次修改密码时间
password_expire_at	密码过期时间	DATE		密码失效日期
failed_login_count	登录失败次数	INTEGER	DEFAULT 0	连续失败计数
mfa_enabled	是否启用MFA	BOOLEAN	DEFAULT FALSE	多因素认证开关
mfa_secret	MFA密钥	VARCHAR(255)		多因素认证密钥
language	语言偏好	VARCHAR(10)	DEFAULT 'zh-CN'	界面语言
timezone	时区	VARCHAR(50)	DEFAULT 'Asia/Shanghai'	用户时区
notification_prefs	通知偏好	JSONB	DEFAULT '{}'	通知渠道配置(JSON)
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		软删除标记
version	乐观锁版本	INTEGER	DEFAULT 1	并发控制
crm_roles（角色表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
role_code	角色编码	VARCHAR(50)	NOT NULL, UNIQUE	系统唯一标识
role_name	角色名称	VARCHAR(100)	NOT NULL	显示名称
role_type	角色类型	VARCHAR(20)	CHECK	system/custom
description	描述	TEXT		角色说明
data_scope	数据权限范围	VARCHAR(20)	CHECK	all/dept/self
parent_id	父角色ID	BIGINT	REFERENCES crm_roles	实现权限继承
level	层级	INTEGER	DEFAULT 1	角色层级深度
is_system	是否系统内置	BOOLEAN	DEFAULT FALSE	内置角色不可删除
status	状态	VARCHAR(20)	DEFAULT 'active'	
sort_order	排序	INTEGER	DEFAULT 0	显示顺序
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_permissions（权限菜单表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
permission_code	权限编码	VARCHAR(100)	NOT NULL, UNIQUE	如 'CUSTOMER_LIST'
permission_name	权限名称	VARCHAR(100)	NOT NULL	如 '客户列表'
permission_type	权限类型	VARCHAR(20)	CHECK	menu/button/api/data
parent_id	父权限ID	BIGINT	REFERENCES crm_permissions	树形结构
level	层级	INTEGER	DEFAULT 1	
path	树形路径	VARCHAR(500)		如 '/system/user'
icon	图标	VARCHAR(100)		菜单图标
resource_path	API路径	VARCHAR(255)		接口URL
http_method	HTTP方法	VARCHAR(10)		GET/POST/PUT/DELETE
sort_order	排序	INTEGER	DEFAULT 0	
status	状态	VARCHAR(20)	DEFAULT 'active'	
is_public	是否公共权限	BOOLEAN	DEFAULT FALSE	无需分配即可访问
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_departments（部门表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
dept_code	部门编码	VARCHAR(50)	NOT NULL, UNIQUE	如 'SALES_01'
dept_name	部门名称	VARCHAR(100)	NOT NULL	如 '销售一部'
parent_id	父部门ID	BIGINT	REFERENCES crm_departments	树形结构
path	树形路径	VARCHAR(500)		如 '/1/3/5/'
level	层级	INTEGER	DEFAULT 1	部门层级深度
leaf	是否叶子节点	BOOLEAN	DEFAULT TRUE	是否末级部门
dept_type	部门类型	VARCHAR(20)		总部/分公司/部门/小组
manager_id	部门负责人ID	BIGINT	REFERENCES crm_users	
cost_center	成本中心	VARCHAR(50)		财务核算用
contact_phone	联系电话	VARCHAR(20)		部门电话
contact_email	联系邮箱	VARCHAR(255)		部门邮箱
address	地址	TEXT		办公地址
status	状态	VARCHAR(20)	DEFAULT 'active'	
sort_order	排序	INTEGER	DEFAULT 0	
extra_data	扩展数据	JSONB	DEFAULT '{}'	灵活扩展字段
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_user_roles（用户角色关联表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
user_id	用户ID	BIGINT	NOT NULL, REFERENCES crm_users	
role_id	角色ID	BIGINT	NOT NULL, REFERENCES crm_roles	
effective_from	生效开始时间	TIMESTAMP		角色有效期起始
effective_to	生效结束时间	TIMESTAMP		角色有效期结束
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
created_by	创建人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_role_permissions（角色权限关联表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
role_id	角色ID	BIGINT	NOT NULL, REFERENCES crm_roles	
permission_id	权限ID	BIGINT	NOT NULL, REFERENCES crm_permissions	
constraints	权限约束	JSONB	DEFAULT '{}'	行级权限规则
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
created_by	创建人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_data_dicts（数据字典表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
dict_type	字典类型	VARCHAR(50)	NOT NULL	如 'customer_level'
dict_code	字典项编码	VARCHAR(100)	NOT NULL	如 'A'
dict_label	字典项标签	VARCHAR(100)	NOT NULL	显示文本，如 'A级客户'
dict_value	字典项值	VARCHAR(255)		存储值
dict_sort	排序	INTEGER	DEFAULT 0	
dict_status	状态	VARCHAR(20)	DEFAULT 'active'	
css_class	CSS类名	VARCHAR(100)		前端样式
list_class	列表样式	VARCHAR(100)		
color_class	颜色类	VARCHAR(50)		标签颜色
parent_id	父字典ID	BIGINT	REFERENCES crm_data_dicts	树形字典
is_default	是否默认	BOOLEAN	DEFAULT FALSE	
is_leaf	是否叶子节点	BOOLEAN	DEFAULT TRUE	
remark	备注	VARCHAR(500)		
extra_data	扩展数据	JSONB	DEFAULT '{}'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
2.2 客户管理模块
crm_customers（客户主表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_code	客户编号	VARCHAR(50)	NOT NULL, UNIQUE	自动生成
customer_name	客户名称	VARCHAR(200)	NOT NULL	公司全称
customer_short_name	客户简称	VARCHAR(100)		便于显示
customer_type	客户类型	VARCHAR(20)	NOT NULL	企业/个人/集团
industry	所属行业	VARCHAR(50)		
scale	企业规模	VARCHAR(20)		小微/中小/大型/集团
source	客户来源	VARCHAR(30)		展会/转介绍/官网等
registration_no	工商注册号	VARCHAR(50)		营业执照号
tax_no	税号	VARCHAR(50)		纳税人识别号
legal_person	法人代表	VARCHAR(100)		
established_date	成立日期	DATE		
registered_capital	注册资本	DECIMAL(18,2)		
paid_capital	实缴资本	DECIMAL(18,2)		
website	公司网站	VARCHAR(255)		
main_phone	主要电话	VARCHAR(50)		公司总机
main_email	主要邮箱	VARCHAR(255)		公司邮箱
country	国家	VARCHAR(50)	DEFAULT '中国'	
province	省份	VARCHAR(50)		
city	城市	VARCHAR(50)		
district	区县	VARCHAR(50)		
address	详细地址	VARCHAR(500)		
level	客户等级	VARCHAR(20)	DEFAULT 'C'	A/B/C/D
rating	星级评分	INTEGER	CHECK (1-5)	1-5星
owner_id	负责人ID	BIGINT	REFERENCES crm_users	销售/业务员
department_id	负责部门ID	BIGINT	REFERENCES crm_departments	
territory	所属区域	VARCHAR(100)		销售区域划分
pool_type	资源池类型	VARCHAR(20)	DEFAULT 'personal'	personal/team/public
protection_deadline	保护期截止时间	TIMESTAMP		公海保护期
claim_time	领取/分配时间	TIMESTAMP		进入个人池时间
status	客户状态	VARCHAR(20)	DEFAULT 'potential'	potential/active/inactive/churned/blacklist
customer_since	成为客户日期	DATE		首次成交日期
first_order_date	首次下单日期	DATE		
last_order_date	最近下单日期	DATE		
total_revenue	累计营收	DECIMAL(18,2)	DEFAULT 0	历史总成交额
total_orders	累计订单数	INTEGER	DEFAULT 0	
credit_limit	信用额度	DECIMAL(18,2)	DEFAULT 0	
outstanding_amount	应付余额	DECIMAL(18,2)	DEFAULT 0	
payment_days	账期天数	INTEGER	DEFAULT 0	
parent_customer_id	父客户ID	BIGINT	REFERENCES crm_customers	集团客户关联
is_parent	是否为父客户	BOOLEAN	DEFAULT FALSE	
health_score	健康度评分	DECIMAL(5,2)		冗余快照，提升性能
duplicate_check_key	查重键	VARCHAR(200)		MD5(名称+代码+手机)
customer_segment	客户分群	VARCHAR(50)		AI分析标签
churn_risk	流失风险	VARCHAR(20)		high/medium/low
description	描述	TEXT		
extra_data	扩展数据	JSONB	DEFAULT '{}'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_contacts（联系人表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_id	所属客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
contact_name	联系人姓名	VARCHAR(100)	NOT NULL	
contact_code	联系人编号	VARCHAR(50)	UNIQUE	自动生成
gender	性别	VARCHAR(10)		male/female
mobile	手机号	VARCHAR(30)		
phone	座机	VARCHAR(30)		
email	邮箱	VARCHAR(255)		
wechat	微信号	VARCHAR(100)		
qq	QQ号	VARCHAR(50)		
department	部门	VARCHAR(100)		客户方部门
position	职位	VARCHAR(100)		客户方职位
job_level	职级	VARCHAR(30)		高层/中层/基层
country	国家	VARCHAR(50)		
province	省份	VARCHAR(50)		
city	城市	VARCHAR(50)		
district	区县	VARCHAR(50)		
address	详细地址	VARCHAR(500)		
role_type	联系人角色	VARCHAR(20)	CHECK	decision_maker/influencer/user/other
influence_level	影响力等级	VARCHAR(20)	CHECK	high/medium/low
is_primary	是否主要联系人	BOOLEAN	DEFAULT FALSE	
is_decision_maker	是否决策人	BOOLEAN	DEFAULT FALSE	
importance	重要性	VARCHAR(20)	DEFAULT 'normal'	key/important/normal
preferred_contact	偏好联系方式	VARCHAR(20)	DEFAULT 'any'	电话/邮件/微信
best_contact_time	最佳联系时间	VARCHAR(100)		如 '工作日10:00-12:00'
birthday	生日	DATE		用于生日提醒
birthday_lunar	是否农历生日	BOOLEAN	DEFAULT FALSE	
linkedin	LinkedIn	VARCHAR(255)		领英主页
hobbies	兴趣爱好	TEXT[]		数组类型
last_contact_date	最后联系时间	TIMESTAMP		
next_contact_date	下次联系日期	DATE		
contact_frequency	累计联系次数	INTEGER	DEFAULT 0	
description	描述	TEXT		
extra_data	扩展数据	JSONB	DEFAULT '{}'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_customer_addresses（客户地址表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
address_type	地址类型	VARCHAR(20)	CHECK	billing/shipping/factory/warehouse/other
address_name	地址名称	VARCHAR(100)		如 "上海总部"
country	国家	VARCHAR(50)	DEFAULT '中国'	
province	省份	VARCHAR(50)	NOT NULL	
city	城市	VARCHAR(50)	NOT NULL	
district	区县	VARCHAR(50)		
street_address	街道地址	VARCHAR(300)		详细门牌号
postal_code	邮政编码	VARCHAR(20)		
longitude	经度	DECIMAL(10,7)		GPS坐标
latitude	纬度	DECIMAL(10,7)		GPS坐标
contact_name	联系人	VARCHAR(100)		收货联系人
contact_phone	联系电话	VARCHAR(30)		
is_default	是否默认地址	BOOLEAN	DEFAULT FALSE	
receiving_hours	可收货时间段	VARCHAR(100)		如 "工作日9:00-18:00"
max_freight_volume	最大货运量(吨)	DECIMAL(18,2)		⚠️制造业字段
status	状态	VARCHAR(20)	DEFAULT 'active'	
description	描述	TEXT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_customer_pool_logs（客户池日志表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
action_type	操作类型	VARCHAR(30)	NOT NULL	assign/transfer/claim/release
action_date	操作时间	TIMESTAMP	DEFAULT NOW()	
from_user_id	原负责人ID	BIGINT	REFERENCES crm_users	
from_dept_id	原部门ID	BIGINT	REFERENCES crm_departments	
to_user_id	新负责人ID	BIGINT	REFERENCES crm_users	
to_dept_id	新部门ID	BIGINT	REFERENCES crm_departments	
reason	流转原因	TEXT		
transfer_type	流转类型	VARCHAR(20)		manual/auto/reclaim/force
operator_id	操作人ID	BIGINT	REFERENCES crm_users	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_tag_definitions（标签定义表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
tag_code	标签编码	VARCHAR(50)	NOT NULL, UNIQUE	
tag_name	标签名称	VARCHAR(100)	NOT NULL	
tag_type	标签类型	VARCHAR(20)	NOT NULL	system/user
category	标签分类	VARCHAR(50)		客户/商机/产品等
color	标签颜色	VARCHAR(20)		前端显示颜色
icon	标签图标	VARCHAR(50)		
applicable_types	适用范围	VARCHAR(20)[]	DEFAULT '{}'	数组，如 {customer,lead}
is_multi_select	是否支持多选	BOOLEAN	DEFAULT TRUE	
is_required	是否必填	BOOLEAN	DEFAULT FALSE	
validation_rule	校验规则	VARCHAR(200)		
status	状态	VARCHAR(20)	DEFAULT 'active'	
sort_order	排序	INTEGER	DEFAULT 0	
usage_count	使用次数	INTEGER	DEFAULT 0	统计用
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_customer_tags（客户标签关联表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
tag_id	标签ID	BIGINT	NOT NULL, REFERENCES crm_tag_definitions	
tag_value	标签值	VARCHAR(200)		动态标签值
tagged_by	打标人ID	BIGINT	REFERENCES crm_users	
tagged_at	打标时间	TIMESTAMP	DEFAULT NOW()	
source	来源	VARCHAR(30)		manual/auto/import
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_customer_timeline（客户动态时间线表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
event_type	事件类型	VARCHAR(50)	NOT NULL	create/update/follow/opportunity/contract等
event_category	事件分类	VARCHAR(30)		
title	事件标题	VARCHAR(200)	NOT NULL	
description	事件描述	TEXT		
related_type	关联对象类型	VARCHAR(50)		customer/opportunity/quotation等
related_id	关联对象ID	BIGINT		
related_name	关联对象名称	VARCHAR(200)		冗余显示
operator_id	操作人ID	BIGINT	REFERENCES crm_users	
operator_name	操作人姓名	VARCHAR(100)		冗余显示
attachments	附件	JSONB	DEFAULT '[]'	
extra_data	扩展数据	JSONB	DEFAULT '{}'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_contact_relations（联系人关系图谱表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
contact_id	联系人ID	BIGINT	NOT NULL, REFERENCES crm_contacts	
related_contact_id	关联联系人ID	BIGINT	REFERENCES crm_contacts	
related_entity_type	关联实体类型	VARCHAR(50)		contact/customer/user
related_entity_id	关联实体ID	BIGINT		
relation_type	关系类型	VARCHAR(50)	NOT NULL	colleague/boss/subordinate/partner/family
relation_desc	关系描述	VARCHAR(200)		
importance	重要性	VARCHAR(20)	DEFAULT 'normal'	
status	状态	VARCHAR(20)	DEFAULT 'active'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_contact_visits（联系人拜访记录表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
contact_id	联系人ID	BIGINT	NOT NULL, REFERENCES crm_contacts	
customer_id	客户ID	BIGINT	REFERENCES crm_customers	冗余便于查询
visit_type	拜访类型	VARCHAR(30)	NOT NULL	in_person/call/video/email
visit_date	拜访日期	DATE	NOT NULL	
visit_duration	拜访时长(分钟)	INTEGER		
purpose	拜访目的	VARCHAR(200)		
content	拜访内容	TEXT		
outcome	拜访结果	VARCHAR(50)		
participants	参与人员	BIGINT[]		用户ID数组
location	地点	VARCHAR(300)		
next_visit_date	下次拜访日期	DATE		
next_action	下次行动	VARCHAR(200)		
satisfaction	满意度评分	INTEGER	CHECK (1-5)	1-5分
attachments	附件	JSONB	DEFAULT '[]'	
task_id	关联任务ID	BIGINT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_import_records（导入记录表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
import_type	导入类型	VARCHAR(30)	NOT NULL	customer/contact/product
file_name	文件名	VARCHAR(255)	NOT NULL	
file_url	文件地址	VARCHAR(500)		
file_size	文件大小	BIGINT		字节数
total_rows	总行数	INTEGER	DEFAULT 0	
success_rows	成功行数	INTEGER	DEFAULT 0	
failed_rows	失败行数	INTEGER	DEFAULT 0	
duplicate_rows	重复行数	INTEGER	DEFAULT 0	
error_log	错误日志	TEXT		
failed_data	失败数据	JSONB	DEFAULT '[]'	失败行详情
status	状态	VARCHAR(20)	DEFAULT 'pending'	pending/processing/completed/failed
completed_at	完成时间	TIMESTAMP		
created_by	操作人ID	BIGINT	REFERENCES crm_users	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
2.3 销售管理模块
crm_opportunities（商机表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
opportunity_code	商机编号	VARCHAR(50)	NOT NULL, UNIQUE	自动生成
opportunity_name	商机名称	VARCHAR(200)	NOT NULL	
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
contact_id	联系人ID	BIGINT	REFERENCES crm_contacts	
opportunity_type	商机类型	VARCHAR(30)		new_sale/expansion/renewal
channel	渠道	VARCHAR(50)		直销/渠道/线上/线下
estimated_amount	预计金额	DECIMAL(18,2)	NOT NULL, DEFAULT 0	
weighted_amount	加权金额	DECIMAL(18,2)		金额×概率
probability	赢单概率(%)	INTEGER	CHECK (0-100)	
expected_close_date	预计成交日期	DATE		
actual_close_date	实际成交日期	DATE		
sales_cycle_days	销售周期(天)	INTEGER		
stay_duration	当前阶段停留天数	INTEGER	DEFAULT 0	
stage_id	阶段ID	BIGINT	REFERENCES crm_opportunity_stages	
stage_name	阶段名称	VARCHAR(100)		冗余字段
stage_probability	阶段默认概率	INTEGER		冗余字段
stage_sequence	阶段序号	INTEGER		冗余字段
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
department_id	所属部门ID	BIGINT	REFERENCES crm_departments	
team_members	团队成员	BIGINT[]		用户ID数组
competitors	竞争对手	TEXT[]		竞争公司名称
our_advantages	我方优势	TEXT[]		
competitive_price	竞争对手报价	DECIMAL(18,2)		
result	最终结果	VARCHAR(20)		won/lost/pending/cancelled
result_reason	结果原因	TEXT		赢单/输单分析
lost_to_competitor	输给竞争对手	VARCHAR(100)		
product_lines	产品线	BIGINT[]		产品分类ID
product_count	产品数量	INTEGER	DEFAULT 0	
source	商机来源	VARCHAR(50)		线索转化/主动开拓
campaign_id	来源活动ID	BIGINT		
extra_data	扩展数据	JSONB	DEFAULT '{}'	
description	描述	TEXT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_opportunity_stages（商机阶段表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
stage_code	阶段编码	VARCHAR(50)	NOT NULL, UNIQUE	如 'LEAD'
stage_name	阶段名称	VARCHAR(100)	NOT NULL	如 '线索'
stage_sequence	阶段顺序	INTEGER	NOT NULL	漏斗展示顺序
probability	默认赢单概率	INTEGER	DEFAULT 0	
stage_type	阶段类型	VARCHAR(20)	DEFAULT 'normal'	start/middle/end
is_milestone	是否里程碑	BOOLEAN	DEFAULT FALSE	
milestone_name	里程碑名称	VARCHAR(100)		
status	状态	VARCHAR(20)	DEFAULT 'active'	
is_default	是否默认	BOOLEAN	DEFAULT FALSE	
sort_order	排序	INTEGER	DEFAULT 0	
avg_days_in_stage	平均停留天数	INTEGER	DEFAULT 0	统计分析用
description	描述	TEXT		
extra_data	扩展数据	JSONB	DEFAULT '{}'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_follow_records（跟进记录表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
opportunity_id	商机ID	BIGINT	REFERENCES crm_opportunities	
customer_id	客户ID	BIGINT	REFERENCES crm_customers	
contact_id	联系人ID	BIGINT	REFERENCES crm_contacts	
follow_type	跟进方式	VARCHAR(30)	NOT NULL	call/visit/email/meeting/proposal
subject	主题	VARCHAR(200)		
content	跟进内容	TEXT	NOT NULL	
contact_mode	沟通方式	VARCHAR(20)		
duration_minutes	沟通时长(分钟)	INTEGER		
participants	参与人员	BIGINT[]		
location	地点	VARCHAR(200)		
outcome	跟进结果	VARCHAR(20)		successful/pending/failed
next_action	下一步行动	VARCHAR(200)		
next_follow_date	下次跟进日期	DATE		
attachments	附件	JSONB	DEFAULT '[]'	
sentiment	情感分析	VARCHAR(20)		positive/neutral/negative (AI)
key_points	关键要点	TEXT[]		AI提取
action_items	行动项	JSONB	DEFAULT '[]'	AI生成待办
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_sales_targets（销售目标表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
target_year	目标年份	INTEGER	NOT NULL	
target_month	目标月份	INTEGER		
target_quarter	目标季度	INTEGER		
period_type	周期类型	VARCHAR(20)	NOT NULL	yearly/quarterly/monthly
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
department_id	部门ID	BIGINT	REFERENCES crm_departments	
team_id	团队ID	BIGINT		
metric_type	指标类型	VARCHAR(30)	NOT NULL	revenue/order_count/new_customers
target_value	目标值	DECIMAL(18,2)	NOT NULL	
achieved_value	实际完成值	DECIMAL(18,2)	DEFAULT 0	
completion_rate	完成率(%)	DECIMAL(5,2)	DEFAULT 0	
product_category_id	产品分类ID	BIGINT		按产品线细分
status	状态	VARCHAR(20)	DEFAULT 'active'	
is_decomposed	是否已分解	BOOLEAN	DEFAULT FALSE	
parent_target_id	父目标ID	BIGINT	REFERENCES crm_sales_targets	目标层级分解
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_tasks（任务表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
task_code	任务编号	VARCHAR(50)	UNIQUE	
task_title	任务标题	VARCHAR(200)	NOT NULL	
task_type	任务类型	VARCHAR(30)	NOT NULL	follow_up/demo/presentation/contract等
priority	优先级	VARCHAR(20)	DEFAULT 'medium'	urgent/high/medium/low
status	状态	VARCHAR(20)	DEFAULT 'pending'	pending/in_progress/completed/cancelled
related_type	关联对象类型	VARCHAR(50)		customer/opportunity/quotation/contract
related_id	关联对象ID	BIGINT		
customer_id	客户ID	BIGINT	REFERENCES crm_customers	
opportunity_id	商机ID	BIGINT	REFERENCES crm_opportunities	
assignee_id	负责人ID	BIGINT	REFERENCES crm_users	执行人
owner_id	创建人ID	BIGINT	REFERENCES crm_users	任务创建者
collaborators	协作人	BIGINT[]		
followers	关注人	BIGINT[]		
due_date	截止日期	TIMESTAMP		
start_date	开始日期	TIMESTAMP		
completed_at	完成时间	TIMESTAMP		
estimated_hours	预估工时	DECIMAL(5,2)		
actual_hours	实际工时	DECIMAL(5,2)		
description	任务描述	TEXT		
location	地点	VARCHAR(300)		
is_recurring	是否重复任务	BOOLEAN	DEFAULT FALSE	
recurrence_rule	重复规则	VARCHAR(100)		RRULE格式
reminders	提醒设置	JSONB	DEFAULT '[]'	
parent_task_id	父任务ID	BIGINT	REFERENCES crm_tasks	子任务支持
subtask_count	子任务数量	INTEGER	DEFAULT 0	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
2.4 产品管理模块
crm_product_categories（产品分类表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
category_code	分类编码	VARCHAR(50)	NOT NULL, UNIQUE	
category_name	分类名称	VARCHAR(100)	NOT NULL	
category_short_name	分类简称	VARCHAR(50)		
parent_id	父分类ID	BIGINT	REFERENCES crm_product_categories	树形结构
path	树形路径	VARCHAR(500)		
level	层级	INTEGER	DEFAULT 1	
leaf	是否叶子节点	BOOLEAN	DEFAULT TRUE	
category_type	分类类型	VARCHAR(30)		product/material/service/bundle
is_standard	是否标准品	BOOLEAN	DEFAULT TRUE	
level_attrs	层级属性	JSONB	DEFAULT '{}'	
status	状态	VARCHAR(20)	DEFAULT 'active'	
sort_order	排序	INTEGER	DEFAULT 0	
seo_title	SEO标题	VARCHAR(200)		
seo_keywords	SEO关键词	VARCHAR(500)		
seo_description	SEO描述	TEXT		
icon_url	图标URL	VARCHAR(500)		
banner_url	Banner图URL	VARCHAR(500)		
product_count	产品数量	INTEGER	DEFAULT 0	统计子产品数
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_products（产品表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
product_code	产品编码	VARCHAR(50)	NOT NULL, UNIQUE	SKU主编码
product_name	产品名称	VARCHAR(200)	NOT NULL	
product_short_name	产品简称	VARCHAR(100)		
category_id	所属分类ID	BIGINT	NOT NULL, REFERENCES crm_product_categories	
category_path	分类路径	VARCHAR(500)		冗余字段
product_type	产品类型	VARCHAR(30)	NOT NULL	standard/custom/bundle/service
brand	品牌	VARCHAR(100)		
model	型号	VARCHAR(100)		
specification	规格参数	VARCHAR(200)		⚠️制造业字段
unit	单位	VARCHAR(20)	DEFAULT 'PCS'	个/套/箱等
min_order_qty	最小起订量	INTEGER	DEFAULT 1	
weight	重量(kg)	DECIMAL(10,3)		⚠️制造业字段
dimensions	尺寸(LWH)	VARCHAR(100)		
color	颜色	VARCHAR(50)		
material	材质	VARCHAR(100)		⚠️制造业字段
technical_params	技术参数	JSONB	DEFAULT '{}'	⚠️制造业字段
cost_price	成本价	DECIMAL(18,4)	DEFAULT 0	
standard_price	标准售价	DECIMAL(18,4)	DEFAULT 0	
wholesale_price	批发价	DECIMAL(18,4)	DEFAULT 0	
msrp	建议零售价	DECIMAL(18,4)	DEFAULT 0	
stock_quantity	库存数量	INTEGER	DEFAULT 0	
safety_stock	安全库存	INTEGER	DEFAULT 0	
reserved_quantity	预留数量	INTEGER	DEFAULT 0	
available_quantity	可用数量	INTEGER	GENERATED ALWAYS AS (stock_quantity - reserved_quantity) STORED	生成列
warehouse_id	仓库ID	BIGINT		⚠️制造业字段
warehouse_location	库位	VARCHAR(100)		
lifecycle_status	生命周期状态	VARCHAR(20)	DEFAULT 'active'	new/active/discontinued/obsolete
status	销售状态	VARCHAR(20)	DEFAULT 'active'	active/inactive/draft/discontinued
listing_date	上架日期	DATE		
delist_date	下架日期	DATE		
is_sellable	是否可售	BOOLEAN	DEFAULT TRUE	
is_procurable	是否可采购	BOOLEAN	DEFAULT TRUE	
lead_time_days	交期(天)	INTEGER	DEFAULT 0	⚠️制造业字段
description	描述	TEXT		
short_description	简短描述	VARCHAR(500)		
images	产品图片	JSONB	DEFAULT '[]'	
attachments	附件	JSONB	DEFAULT '[]'	
seo_title	SEO标题	VARCHAR(200)		
seo_keywords	SEO关键词	VARCHAR(500)		
extra_data	扩展数据	JSONB	DEFAULT '{}'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_product_skus（产品SKU表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
product_id	所属产品ID	BIGINT	NOT NULL, REFERENCES crm_products	
sku_code	SKU编码	VARCHAR(50)	NOT NULL, UNIQUE	
barcode	条形码	VARCHAR(50)	UNIQUE	
sku_attributes	SKU属性组合	JSONB	NOT NULL, DEFAULT '{}'	如 {"颜色":"红色","尺码":"XL"}
sku_cost	SKU成本价	DECIMAL(18,4)	DEFAULT 0	
sku_price	SKU售价	DECIMAL(18,4)	DEFAULT 0	
stock_quantity	SKU库存	INTEGER	DEFAULT 0	
reserved_quantity	SKU预留库存	INTEGER	DEFAULT 0	
weight	重量(kg)	DECIMAL(10,3)		⚠️制造业字段
dimensions	尺寸	VARCHAR(100)		
images	SKU图片	JSONB	DEFAULT '[]'	
status	状态	VARCHAR(20)	DEFAULT 'active'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_product_prices（产品价格表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
product_id	产品ID	BIGINT	REFERENCES crm_products	
sku_id	SKU ID	BIGINT	REFERENCES crm_product_skus	
price_type	价格类型	VARCHAR(20)	NOT NULL	standard/wholesale/special/campaign
price_name	价格名称	VARCHAR(100)		如 "双十一促销价"
unit_price	单价	DECIMAL(18,4)	NOT NULL	
min_quantity	最小数量	INTEGER	DEFAULT 1	
max_quantity	最大数量	INTEGER		
effective_from	生效时间	TIMESTAMP	DEFAULT NOW()	
effective_to	失效时间	TIMESTAMP		
is_active	是否启用	BOOLEAN	DEFAULT TRUE	
customer_id	专属客户ID	BIGINT	REFERENCES crm_customers	客户专属价
customer_level	适用客户等级	VARCHAR(20)		VIP/GOLD/SILVER
quantity_prices	阶梯价格	JSONB	DEFAULT '[]'	[{qty_from, qty_to, price}]
approval_status	审批状态	VARCHAR(20)	DEFAULT 'pending'	
approved_by	审批人ID	BIGINT		
approved_at	审批时间	TIMESTAMP		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_price_tiers（价格等级表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
tier_code	等级编码	VARCHAR(50)	NOT NULL, UNIQUE	
tier_name	等级名称	VARCHAR(100)	NOT NULL	如 "金牌会员"
tier_level	等级级别	INTEGER	NOT NULL	数字越大等级越高
applicable_to	适用对象	VARCHAR(20)	NOT NULL	customer/role/channel
applicable_values	适用值列表	VARCHAR(50)[]		如具体客户ID或角色编码
discount_type	折扣类型	VARCHAR(20)	DEFAULT 'percentage'	percentage/fixed
discount_value	折扣值	DECIMAL(10,4)	NOT NULL	0.9表示9折
min_order_amount	最低订单金额	DECIMAL(18,2)	DEFAULT 0	
effective_from	生效日期	DATE		
effective_to	失效日期	DATE		
status	状态	VARCHAR(20)	DEFAULT 'active'	
is_default	是否默认	BOOLEAN	DEFAULT FALSE	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_product_documents（产品技术文档表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
product_id	产品ID	BIGINT	NOT NULL, REFERENCES crm_products	
doc_code	文档编码	VARCHAR(50)	UNIQUE	
doc_name	文档名称	VARCHAR(200)	NOT NULL	
doc_type	文档类型	VARCHAR(50)	NOT NULL	specification/datasheet/manual/certificate
doc_version	文档版本	VARCHAR(20)		
file_url	文件URL	VARCHAR(500)		
file_size	文件大小	BIGINT		
file_type	文件类型	VARCHAR(50)		PDF/DOC/XLS等
status	状态	VARCHAR(20)	DEFAULT 'active'	
is_public	是否公开	BOOLEAN	DEFAULT FALSE	
description	描述	TEXT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
2.5 营销服务模块
crm_campaigns（营销活动表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
campaign_code	活动编号	VARCHAR(50)	NOT NULL, UNIQUE	
campaign_name	活动名称	VARCHAR(200)	NOT NULL	
campaign_type	活动类型	VARCHAR(30)	NOT NULL	exhibition/seminar/digital/email/sms
campaign_subtype	活动子类型	VARCHAR(50)		
planned_start_date	计划开始日期	DATE		
planned_end_date	计划结束日期	DATE		
actual_start_date	实际开始日期	DATE		
actual_end_date	实际结束日期	DATE		
budget	预算	DECIMAL(18,2)	DEFAULT 0	
actual_cost	实际成本	DECIMAL(18,2)	DEFAULT 0	
cost_currency	币种	VARCHAR(10)	DEFAULT 'CNY'	
objectives	活动目标	TEXT		
target_participants	目标参与人数	INTEGER		
actual_participants	实际参与人数	INTEGER	DEFAULT 0	
target_leads	目标线索数	INTEGER		
actual_leads	实际线索数	INTEGER	DEFAULT 0	
target_conversions	目标转化数	INTEGER		
actual_conversions	实际转化数	INTEGER	DEFAULT 0	
expected_roi	预期ROI	DECIMAL(10,2)		
actual_roi	实际ROI	DECIMAL(10,2)		
channels	渠道列表	VARCHAR(50)[]		
channel_ids	渠道ID列表	BIGINT[]		
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
department_id	负责部门ID	BIGINT	REFERENCES crm_departments	
team_members	团队成员	BIGINT[]		
related_campaign_id	关联活动ID	BIGINT	REFERENCES crm_campaigns	
description	描述	TEXT		
content_plan	内容计划	JSONB	DEFAULT '[]'	
landing_page_url	落地页URL	VARCHAR(500)		
status	状态	VARCHAR(20)	DEFAULT 'draft'	draft/active/completed/cancelled
phase	阶段	VARCHAR(20)		planning/execution/analysis/closed
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_leads（线索表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
lead_code	线索编号	VARCHAR(50)	NOT NULL, UNIQUE	
lead_name	线索名称	VARCHAR(200)	NOT NULL	
lead_type	线索类型	VARCHAR(20)	DEFAULT 'individual'	individual/company
company_name	公司名称	VARCHAR(200)		
contact_name	联系人姓名	VARCHAR(100)		
gender	性别	VARCHAR(10)		
mobile	手机号	VARCHAR(30)		
phone	电话	VARCHAR(30)		
email	邮箱	VARCHAR(255)		
wechat	微信号	VARCHAR(100)		
industry	行业	VARCHAR(50)		
position	职位	VARCHAR(100)		
company_size	公司规模	VARCHAR(30)		
source	来源	VARCHAR(50)	NOT NULL	website/phone/exhibition/referral/import
source_detail	来源详情	VARCHAR(100)		
channel_id	渠道ID	BIGINT		
campaign_id	活动ID	BIGINT		
utm_source	UTM来源	VARCHAR(100)		
utm_medium	UTM媒介	VARCHAR(100)		
utm_campaign	UTM活动	VARCHAR(100)		
score	评分	INTEGER	DEFAULT 0	0-100
grade	等级	VARCHAR(10)	DEFAULT 'C'	A/B/C/D
score_details	评分详情	JSONB	DEFAULT '{}'	各维度得分
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
department_id	所属部门ID	BIGINT	REFERENCES crm_departments	
assign_date	分配日期	DATE		
last_contact_date	最后联系时间	TIMESTAMP		
next_contact_date	下次联系日期	DATE		
follow_status	跟进状态	VARCHAR(20)	DEFAULT 'new'	new/contacted/qualified/unqualified
nurturing_stage	培育阶段	VARCHAR(30)		导入期/活跃期/休眠期
nurturing_score	培育评分	INTEGER	DEFAULT 0	
engagement_level	参与度	VARCHAR(20)	DEFAULT 'cold'	hot/warm/cold
converted	是否已转化	BOOLEAN	DEFAULT FALSE	
converted_at	转化时间	TIMESTAMP		
converted_to_type	转化类型	VARCHAR(20)		customer/opportunity
converted_to_id	转化目标ID	BIGINT		
status	状态	VARCHAR(20)	DEFAULT 'active'	
invalid_reason	无效原因	VARCHAR(100)		
ip_address	来源IP	VARCHAR(45)		
extra_data	扩展数据	JSONB	DEFAULT '{}'	
description	描述	TEXT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_lead_scores（线索评分表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
rule_name	规则名称	VARCHAR(100)	NOT NULL	
rule_code	规则编码	VARCHAR(50)	UNIQUE	
dimension	评分维度	VARCHAR(30)	NOT NULL	behavior/profile/engagement
sub_dimension	子维度	VARCHAR(50)		
condition_type	条件类型	VARCHAR(30)	NOT NULL	threshold/range/enum
conditions	条件配置	JSONB	NOT NULL, DEFAULT '[]'	
score_type	分值类型	VARCHAR(20)	DEFAULT 'fixed'	fixed/range
score_value	分值	INTEGER	NOT NULL	
score_range_start	分值范围起始	INTEGER		
score_range_end	分值范围结束	INTEGER		
weight	权重	DECIMAL(5,2)	DEFAULT 1.0	
status	状态	VARCHAR(20)	DEFAULT 'active'	
is_system	是否系统内置	BOOLEAN	DEFAULT FALSE	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_marketing_channels（营销渠道表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
channel_code	渠道编码	VARCHAR(50)	NOT NULL, UNIQUE	
channel_name	渠道名称	VARCHAR(100)	NOT NULL	百度/微信/展会等
channel_type	渠道类型	VARCHAR(30)	NOT NULL	online/offline/social
platform	平台	VARCHAR(50)		具体平台名称
account_id	账号ID	VARCHAR(100)		广告账户ID
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
department_id	负责部门ID	BIGINT	REFERENCES crm_departments	
cost_model	计费模式	VARCHAR(20)		CPC/CPM/CPA/CPS
unit_cost	单位成本	DECIMAL(10,2)	DEFAULT 0	
monthly_budget	月度预算	DECIMAL(18,2)	DEFAULT 0	
total_visitors	总访客数	INTEGER	DEFAULT 0	
total_leads	总线索数	INTEGER	DEFAULT 0	
total_conversions	总转化数	INTEGER	DEFAULT 0	
conversion_rate	转化率(%)	DECIMAL(8,4)	DEFAULT 0	
total_revenue	总营收	DECIMAL(18,2)	DEFAULT 0	
roi	ROI(%)	DECIMAL(10,2)	DEFAULT 0	
utm_params	UTM参数	JSONB	DEFAULT '{}'	
status	状态	VARCHAR(20)	DEFAULT 'active'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
2.6 客户成功模块
crm_customer_health_scores（客户健康度评分表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
score_date	评分日期	DATE	NOT NULL	每日快照
overall_score	综合评分	INTEGER	NOT NULL, CHECK (0-100)	0-100分
health_level	健康等级	VARCHAR(20)	NOT NULL	healthy/at_risk/critical
dimension_scores	分维度评分	JSONB	NOT NULL, DEFAULT '{}'	5维度详细得分
product_usage	产品使用数据	JSONB	DEFAULT '{}'	
adoption_rate	产品采用率(%)	DECIMAL(5,2)	DEFAULT 0	
engagement_score	互动评分	INTEGER	DEFAULT 0	
avg_contact_frequency	平均联系频率(次/月)	DECIMAL(5,2)	DEFAULT 0	
last_interaction_date	最后互动日期	DATE		
payment_score	付款评分	INTEGER	DEFAULT 0	
revenue_trend	收入趋势	VARCHAR(20)		growing/stable/declining
arpu	客单价	DECIMAL(18,2)	DEFAULT 0	
satisfaction_score	满意度评分	INTEGER	DEFAULT 0	
nps_score	NPS评分	INTEGER		-100~100
last_survey_date	最后调查日期	DATE		
risk_indicators	风险指标	TEXT[]		风险项列表
churn_signals	流失信号	TEXT[]		
churn_probability	流失概率(%)	DECIMAL(5,2)	DEFAULT 0	
expansion_probability	增购概率(%)	DECIMAL(5,2)	DEFAULT 0	
ai_insights	AI洞察	JSONB	DEFAULT '{}'	AI分析结论
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
created_by	创建人ID	BIGINT		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_renewals（续费管理表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
renewal_code	续费编号	VARCHAR(50)	NOT NULL, UNIQUE	
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
contract_id	原合同ID	BIGINT		
renewal_type	续费类型	VARCHAR(20)	NOT NULL	renewal/upgrade/downgrade
product_id	产品ID	BIGINT		
current_expire_date	当前到期日期	DATE	NOT NULL	
renewal_date	续费日期	DATE	NOT NULL	
new_expire_date	新到期日期	DATE		
current_amount	当前合同金额	DECIMAL(18,2)	NOT NULL	
renewal_amount	续费金额	DECIMAL(18,2)		
currency	币种	VARCHAR(10)	DEFAULT 'CNY'	
renewal_probability	续费概率(%)	INTEGER	DEFAULT 0	
churn_risk	流失风险	VARCHAR(20)		high/medium/low
status	状态	VARCHAR(20)	DEFAULT 'pending'	pending/negotiating/confirmed/lost
renewal_result	续费结果	VARCHAR(20)		renewed/lost/churned
owner_id	负责人ID	BIGINT	REFERENCES crm_users	销售负责人
cs_owner_id	客户成功负责人ID	BIGINT	REFERENCES crm_users	
last_contact_date	最后联系日期	DATE		
last_contact_note	最后联系备注	TEXT		
competitor_info	竞争对手信息	VARCHAR(200)		
upgrade_details	升级/降级详情	JSONB	DEFAULT '{}'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_customer_satisfaction_surveys（客户满意度调查表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
survey_code	调查编号	VARCHAR(50)	NOT NULL, UNIQUE	
survey_name	调查名称	VARCHAR(200)	NOT NULL	
survey_type	调查类型	VARCHAR(30)	NOT NULL	nps/csat/ces/custom
customer_id	客户ID	BIGINT	REFERENCES crm_customers	
contact_id	联系人ID	BIGINT	REFERENCES crm_contacts	
order_id	订单ID	BIGINT		
project_id	项目ID	BIGINT		
sent_date	发送日期	DATE		
completed_date	完成日期	DATE		
overall_score	总体评分	INTEGER		
nps_score	NPS评分	INTEGER		
csat_score	CSAT评分	INTEGER		1-5
ces_score	CES评分	INTEGER		1-7
dimension_scores	分项评分	JSONB	DEFAULT '{}'	
feedback	反馈内容	TEXT		
positive_feedback	正面反馈	TEXT		
negative_feedback	负面反馈	TEXT		
follow_up_required	是否需要跟进	BOOLEAN	DEFAULT FALSE	
follow_up_status	跟进状态	VARCHAR(20)		
follow_up_by	跟进人ID	BIGINT	REFERENCES crm_users	
follow_up_date	跟进日期	DATE		
follow_up_notes	跟进备注	TEXT		
channel	调查渠道	VARCHAR(30)		email/sms/in_app/phone
respondent_email	回复人邮箱	VARCHAR(255)		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
2.7 商务合同模块
crm_quotations（报价单表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
quotation_no	报价单号	VARCHAR(50)	NOT NULL, UNIQUE	
quotation_name	报价单名称	VARCHAR(200)		
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
contact_id	联系人ID	BIGINT	REFERENCES crm_contacts	
opportunity_id	商机ID	BIGINT	REFERENCES crm_opportunities	
project_name	项目名称	VARCHAR(200)		
customer_name	客户名称(冗余)	VARCHAR(200)		快照
customer_address	客户地址(冗余)	VARCHAR(500)		快照
quotation_type	报价类型	VARCHAR(20)	DEFAULT 'standard'	standard/custom/oem
price_term	价格条款	VARCHAR(30)		EXW/FOB/CIF/DDP
payment_term	付款条款	VARCHAR(50)		
delivery_term	交货条款	VARCHAR(50)		⚠️制造业字段
delivery_days	交货天数	INTEGER	DEFAULT 0	⚠️制造业字段
valid_days	有效期天数	INTEGER	DEFAULT 30	
subtotal	小计	DECIMAL(18,2)	DEFAULT 0	
discount_rate	折扣率(%)	DECIMAL(8,4)	DEFAULT 0	
discount_amount	折扣金额	DECIMAL(18,2)	DEFAULT 0	
tax_rate	税率(%)	DECIMAL(8,4)	DEFAULT 0	
tax_amount	税额	DECIMAL(18,2)	DEFAULT 0	
total_amount	总金额	DECIMAL(18,2)	DEFAULT 0	
currency	币种	VARCHAR(10)	DEFAULT 'CNY'	
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
department_id	负责部门ID	BIGINT	REFERENCES crm_departments	
approval_status	审批状态	VARCHAR(20)	DEFAULT 'draft'	draft/pending/approved/rejected
approved_by	审批人ID	BIGINT		
approved_at	审批时间	TIMESTAMP		
approval_comments	审批意见	TEXT		
status	状态	VARCHAR(20)	DEFAULT 'draft'	draft/sent/negotiating/accepted/rejected/expired
sent_date	发送日期	DATE		
expire_date	过期日期	DATE		
accepted_date	接受日期	DATE		
notes	备注	TEXT		
terms_conditions	条款与条件	TEXT		
attachments	附件	JSONB	DEFAULT '[]'	
contract_id	转化合同ID	BIGINT		
converted_to_order	是否已转订单	BOOLEAN	DEFAULT FALSE	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_quotation_items（报价单明细表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
quotation_id	报价单ID	BIGINT	NOT NULL	
product_id	产品ID	BIGINT		
sku_id	SKU ID	BIGINT		
product_code	产品编码	VARCHAR(50)		
product_name	产品名称	VARCHAR(200)		
sku_code	SKU编码	VARCHAR(50)		
sku_attributes	SKU属性	JSONB	DEFAULT '{}'	
quantity	数量	DECIMAL(18,4)	NOT NULL	
unit	单位	VARCHAR(20)		
unit_price	单价	DECIMAL(18,4)	NOT NULL	
price_type	价格类型	VARCHAR(20)		
subtotal	小计	DECIMAL(18,2)	NOT NULL	
discount_rate	折扣率(%)	DECIMAL(8,4)	DEFAULT 0	
discount_amount	折扣金额	DECIMAL(18,2)	DEFAULT 0	
tax_rate	税率(%)	DECIMAL(8,4)	DEFAULT 0	
tax_amount	税额	DECIMAL(18,2)	DEFAULT 0	
line_total	行总计	DECIMAL(18,2)	NOT NULL	
delivery_days	交期天数	INTEGER		⚠️制造业字段
expected_date	预计交付日期	DATE		
description	描述	TEXT		
notes	备注	VARCHAR(500)		
line_no	行号	INTEGER		排序用
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_contracts（合同表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
contract_no	合同编号	VARCHAR(50)	NOT NULL, UNIQUE	
contract_name	合同名称	VARCHAR(200)	NOT NULL	
contract_type	合同类型	VARCHAR(30)	NOT NULL	sales/service/rental/cooperation
category	合同类别	VARCHAR(50)		
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
contact_id	联系人ID	BIGINT	REFERENCES crm_contacts	
quotation_id	来源报价单ID	BIGINT		
opportunity_id	来源商机ID	BIGINT	REFERENCES crm_opportunities	
customer_name	客户名称(冗余)	VARCHAR(200)		
customer_address	客户地址(冗余)	VARCHAR(500)		
legal_person	法定代表人	VARCHAR(100)		
signing_date	签署日期	DATE		
effective_date	生效日期	DATE		
expire_date	到期日期	DATE		
contract_amount	合同总金额	DECIMAL(18,2)	NOT NULL	
received_amount	已回款金额	DECIMAL(18,2)	DEFAULT 0	
pending_amount	待回款金额	DECIMAL(18,2)		计算字段
currency	币种	VARCHAR(10)	DEFAULT 'CNY'	
payment_method	付款方式	VARCHAR(50)		
payment_terms	付款条款	VARCHAR(100)		
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
department_id	负责部门ID	BIGINT	REFERENCES crm_departments	
signatory	签约人	VARCHAR(100)		我方签约代表
approval_status	审批状态	VARCHAR(20)	DEFAULT 'draft'	
approved_by	审批人ID	BIGINT		
approved_at	审批时间	TIMESTAMP		
approval_comments	审批意见	TEXT		
status	状态	VARCHAR(20)	DEFAULT 'draft'	draft/active/executing/completed/terminated
execution_status	执行状态	VARCHAR(20)		
contract_file_url	合同文件URL	VARCHAR(500)		
attachments	附件	JSONB	DEFAULT '[]'	
terms	合同条款	TEXT		
special_terms	特殊条款	TEXT		
delivery_status	交付状态	VARCHAR(20)		⚠️制造业字段
invoice_status	开票状态	VARCHAR(20)		
payment_status	回款状态	VARCHAR(20)		
performance_score	履约评分	INTEGER		
performance_notes	履约备注	TEXT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_contract_items（合同明细表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
contract_id	合同ID	BIGINT	NOT NULL	
product_id	产品ID	BIGINT		
sku_id	SKU ID	BIGINT		
product_code	产品编码	VARCHAR(50)		
product_name	产品名称	VARCHAR(200)		
sku_attributes	SKU属性	JSONB	DEFAULT '{}'	
quantity	数量	DECIMAL(18,4)	NOT NULL	
delivered_quantity	已交付数量	DECIMAL(18,4)	DEFAULT 0	
invoiced_quantity	已开票数量	DECIMAL(18,4)	DEFAULT 0	
unit	单位	VARCHAR(20)		
unit_price	单价	DECIMAL(18,4)	NOT NULL	
subtotal	小计	DECIMAL(18,2)	NOT NULL	
discount_rate	折扣率(%)	DECIMAL(8,4)	DEFAULT 0	
discount_amount	折扣金额	DECIMAL(18,2)	DEFAULT 0	
line_total	行总计	DECIMAL(18,2)	NOT NULL	
delivery_date	交付日期	DATE		⚠️制造业字段
delivery_status	交付状态	VARCHAR(20)	DEFAULT 'pending'	
line_no	行号	INTEGER		
description	描述	TEXT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_orders（订单表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
order_no	订单编号	VARCHAR(50)	NOT NULL, UNIQUE	
order_name	订单名称	VARCHAR(200)		
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
contact_id	联系人ID	BIGINT	REFERENCES crm_contacts	
quotation_id	报价单ID	BIGINT		
contract_id	合同ID	BIGINT		
opportunity_id	商机ID	BIGINT	REFERENCES crm_opportunities	
customer_name	客户名称(冗余)	VARCHAR(200)		
billing_address_id	开票地址ID	BIGINT		
shipping_address_id	收货地址ID	BIGINT		
billing_address	开票地址(冗余)	VARCHAR(500)		
shipping_address	收货地址(冗余)	VARCHAR(500)		
order_type	订单类型	VARCHAR(20)	NOT NULL	standard/rush/maintenance
source_type	来源类型	VARCHAR(20)		manual/ecommerce/import
subtotal	小计	DECIMAL(18,2)	DEFAULT 0	
discount_amount	折扣金额	DECIMAL(18,2)	DEFAULT 0	
shipping_fee	运费	DECIMAL(18,2)	DEFAULT 0	
tax_amount	税额	DECIMAL(18,2)	DEFAULT 0	
total_amount	总金额	DECIMAL(18,2)	DEFAULT 0	
paid_amount	已付金额	DECIMAL(18,2)	DEFAULT 0	
currency	币种	VARCHAR(10)	DEFAULT 'CNY'	
payment_status	付款状态	VARCHAR(20)	DEFAULT 'unpaid'	unpaid/partial/paid
payment_method	付款方式	VARCHAR(30)		
payment_terms	付款条款	VARCHAR(50)		
order_date	下单日期	DATE	NOT NULL	
delivery_date	交付日期	DATE		⚠️制造业字段
shipping_date	发货日期	DATE		⚠️制造业字段
received_date	收货日期	DATE		
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
department_id	负责部门ID	BIGINT	REFERENCES crm_departments	
sales_rep_id	销售代表ID	BIGINT	REFERENCES crm_users	
approval_status	审批状态	VARCHAR(20)	DEFAULT 'pending'	
approved_by	审批人ID	BIGINT		
approved_at	审批时间	TIMESTAMP		
status	订单状态	VARCHAR(20)	DEFAULT 'pending'	pending/confirmed/processing/shipped/delivered/completed/cancelled
fulfillment_status	履约状态	VARCHAR(20)	DEFAULT 'pending'	
shipping_method	配送方式	VARCHAR(50)		
tracking_no	物流单号	VARCHAR(100)		
shipping_company	物流公司	VARCHAR(100)		
customer_notes	客户备注	TEXT		
internal_notes	内部备注	TEXT		
attachments	附件	JSONB	DEFAULT '[]'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_order_items（订单明细表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
order_id	订单ID	BIGINT	NOT NULL	
product_id	产品ID	BIGINT		
sku_id	SKU ID	BIGINT		
product_code	产品编码	VARCHAR(50)		
product_name	产品名称	VARCHAR(200)		
sku_code	SKU编码	VARCHAR(50)		
sku_attributes	SKU属性	JSONB	DEFAULT '{}'	
quantity	数量	DECIMAL(18,4)	NOT NULL	
shipped_quantity	已发货数量	DECIMAL(18,4)	DEFAULT 0	⚠️制造业字段
invoiced_quantity	已开票数量	DECIMAL(18,4)	DEFAULT 0	
returned_quantity	已退货数量	DECIMAL(18,4)	DEFAULT 0	
unit	单位	VARCHAR(20)		
unit_price	单价	DECIMAL(18,4)	NOT NULL	
subtotal	小计	DECIMAL(18,2)	NOT NULL	
discount_rate	折扣率(%)	DECIMAL(8,4)	DEFAULT 0	
discount_amount	折扣金额	DECIMAL(18,2)	DEFAULT 0	
tax_rate	税率(%)	DECIMAL(8,4)	DEFAULT 0	
tax_amount	税额	DECIMAL(18,2)	DEFAULT 0	
line_total	行总计	DECIMAL(18,2)	NOT NULL	
delivery_date	交付日期	DATE		⚠️制造业字段
warehouse_id	仓库ID	BIGINT		⚠️制造业字段
line_no	行号	INTEGER		
description	描述	TEXT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_payment_plans（回款计划表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_id	客户ID	BIGINT	REFERENCES crm_customers	
contract_id	合同ID	BIGINT		
order_id	订单ID	BIGINT		
quotation_id	报价单ID	BIGINT		
plan_no	计划编号	VARCHAR(50)	NOT NULL, UNIQUE	
plan_name	计划名称	VARCHAR(200)		如 "首付款"
plan_type	计划类型	VARCHAR(20)	NOT NULL	installment/deposit/progress
installment_no	分期期次	INTEGER		第几期
total_installments	总期数	INTEGER		
plan_amount	计划金额	DECIMAL(18,2)	NOT NULL	
currency	币种	VARCHAR(10)	DEFAULT 'CNY'	
due_date	应付日期	DATE	NOT NULL	
paid_date	实付日期	DATE		
is_overdue	是否逾期	BOOLEAN	DEFAULT FALSE	
overdue_days	逾期天数	INTEGER	DEFAULT 0	
status	状态	VARCHAR(20)	DEFAULT 'pending'	pending/partial/paid/overdue/cancelled
payment_status	付款状态	VARCHAR(20)		
payment_method	付款方式	VARCHAR(30)		
payment_reference	付款参考号	VARCHAR(100)		
reminder_count	提醒次数	INTEGER	DEFAULT 0	
last_reminder_date	最后提醒日期	DATE		
next_reminder_date	下次提醒日期	DATE		
notes	备注	TEXT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_payments（回款记录表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
payment_no	回款编号	VARCHAR(50)	NOT NULL, UNIQUE	
payment_date	回款日期	DATE	NOT NULL	
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
contract_id	合同ID	BIGINT		
order_id	订单ID	BIGINT		
invoice_id	发票ID	BIGINT		
customer_name	客户名称(冗余)	VARCHAR(200)		
payment_amount	回款金额	DECIMAL(18,2)	NOT NULL	
currency	币种	VARCHAR(10)	DEFAULT 'CNY'	
payment_method	付款方式	VARCHAR(30)	NOT NULL	bank_transfer/cash/check/credit_card/online
bank_name	银行名称	VARCHAR(100)		
account_no	银行账号	VARCHAR(50)		
transaction_no	交易流水号	VARCHAR(100)		
payment_plan_id	关联付款计划ID	BIGINT		
allocated_amount	已核销金额	DECIMAL(18,2)	DEFAULT 0	
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
department_id	负责部门ID	BIGINT	REFERENCES crm_departments	
status	状态	VARCHAR(20)	DEFAULT 'pending'	pending/confirmed/rejected
confirmation_status	确认状态	VARCHAR(20)		
confirmed_by	确认人ID	BIGINT		
confirmed_at	确认时间	TIMESTAMP		
receipt_no	收据号	VARCHAR(50)		
receipt_url	收据URL	VARCHAR(500)		
notes	备注	TEXT		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_invoices（发票表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
invoice_no	发票编号	VARCHAR(50)	NOT NULL, UNIQUE	
invoice_type	发票类型	VARCHAR(20)	NOT NULL	VAT/simplified/commercial
invoice_kind	发票种类	VARCHAR(20)	NOT NULL	蓝字/红字
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
order_id	订单ID	BIGINT		
contract_id	合同ID	BIGINT		
payment_id	回款ID	BIGINT		
red_flush_id	红冲关联ID	BIGINT	REFERENCES crm_invoices	指向原发票
customer_name	客户名称(冗余)	VARCHAR(200)		
customer_tax_no	客户税号	VARCHAR(50)		
customer_address	客户地址	VARCHAR(500)		
customer_bank	客户开户行	VARCHAR(100)		
customer_account	客户银行账号	VARCHAR(50)		
subtotal	小计	DECIMAL(18,2)	DEFAULT 0	
tax_rate	税率(%)	DECIMAL(8,4)	DEFAULT 0	
tax_amount	税额	DECIMAL(18,2)	DEFAULT 0	
total_amount	价税合计	DECIMAL(18,2)	NOT NULL	
total_amount_capital	大写金额	VARCHAR(200)		
currency	币种	VARCHAR(10)	DEFAULT 'CNY'	
write_off_amount	已核销金额	DECIMAL(18,2)	DEFAULT 0	
write_off_status	核销状态	VARCHAR(20)	DEFAULT 'unwriteoff'	unwriteoff/partial/writeoff
invoice_date	开票日期	DATE	NOT NULL	
billing_date	记账日期	DATE		
expected_date	预计开票日期	DATE		
owner_id	负责人ID	BIGINT	REFERENCES crm_users	
status	状态	VARCHAR(20)	DEFAULT 'draft'	draft/pending/issued/voided
issue_status	开具状态	VARCHAR(20)		
express_company	快递公司	VARCHAR(50)		
tracking_no	快递单号	VARCHAR(100)		
sent_date	寄出日期	DATE		
received_date	签收日期	DATE		
red_invoice_reason	红冲原因	VARCHAR(200)		
red_invoice_no	红字发票号	VARCHAR(50)		
invoice_file_url	发票文件URL	VARCHAR(500)		
attachments	附件	JSONB	DEFAULT '[]'	
notes	备注	TEXT		
remark	简短备注	VARCHAR(500)		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
2.8 AI智能模块
crm_customer_profiles（客户画像表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_id	客户ID	BIGINT	NOT NULL, UNIQUE, REFERENCES crm_customers	
basic_profile	基础画像	JSONB	DEFAULT '{}'	工商信息等
behavior_profile	行为画像	JSONB	DEFAULT '{}'	互动行为特征
preference_profile	偏好画像	JSONB	DEFAULT '{}'	沟通偏好等
value_profile	价值画像	JSONB	DEFAULT '{}'	客户价值评分
purchase_patterns	购买模式	JSONB	DEFAULT '{}'	
preferred_products	偏好产品	JSONB	DEFAULT '{}'	
price_sensitivity	价格敏感度	VARCHAR(20)		high/medium/low
buying_stages	购买阶段	VARCHAR(20)		
communication_prefs	沟通偏好	JSONB	DEFAULT '{}'	
best_contact_times	最佳联系时间	VARCHAR(20)[]		如 ['周二10:00','周四15:00']
preferred_channels	偏好渠道	VARCHAR(20)[]		电话/邮件/微信等
lifetime_value	客户终身价值	DECIMAL(18,2)		
churn_probability	流失概率(%)	DECIMAL(5,2)		
upsell_probability	增购概率(%)	DECIMAL(5,2)		
referral_probability	推荐概率(%)	DECIMAL(5,2)		
personas	用户画像标签	VARCHAR(50)[]		
tags	AI标签	VARCHAR(50)[]		
analysis_count	分析次数	INTEGER	DEFAULT 0	
last_analysis_at	最后分析时间	TIMESTAMP		
model_version	模型版本	VARCHAR(50)		
confidence_score	置信度	DECIMAL(5,2)		
data_completeness	数据完整度	DECIMAL(5,2)		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_ai_tags（AI标签表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
tag_code	标签编码	VARCHAR(50)	NOT NULL, UNIQUE	
tag_name	标签名称	VARCHAR(100)	NOT NULL	
tag_category	标签分类	VARCHAR(50)	NOT NULL	behavior/preference/intent/risk
tag_type	标签类型	VARCHAR(20)	NOT NULL	system/user
is_auto_tagged	是否自动打标	BOOLEAN	DEFAULT TRUE	
applicable_types	适用范围	VARCHAR(20)[]	DEFAULT '{customer}'	
generation_method	生成方法	VARCHAR(30)		rule/ml/hybrid
model_name	模型名称	VARCHAR(100)		
confidence_threshold	置信度阈值	DECIMAL(5,2)	DEFAULT 0.7	
usage_count	使用次数	INTEGER	DEFAULT 0	
accuracy	准确率(%)	DECIMAL(5,2)		
status	状态	VARCHAR(20)	DEFAULT 'active'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_ai_recommendations（AI推荐表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
recommend_type	推荐类型	VARCHAR(30)	NOT NULL	product/cross_sell/upsell/content/action
customer_id	客户ID	BIGINT	REFERENCES crm_customers	
opportunity_id	商机ID	BIGINT	REFERENCES crm_opportunities	
recommended_items	推荐项	JSONB	NOT NULL, DEFAULT '[]'	推荐产品/内容列表
reason	推荐理由	TEXT		可解释性说明
scenario	场景	VARCHAR(50)		quotation/follow_up/onboarding
context	上下文	JSONB	DEFAULT '{}'	
score	推荐得分	DECIMAL(5,4)		
rank_position	排名	INTEGER		
status	状态	VARCHAR(20)	DEFAULT 'pending'	pending/shown/accepted/rejected/expired
action_result	执行结果	VARCHAR(50)		
feedback	用户反馈	TEXT		
rating	用户评分	INTEGER		1-5
valid_from	生效时间	TIMESTAMP		
valid_to	失效时间	TIMESTAMP		
model_name	模型名称	VARCHAR(100)		
model_version	模型版本	VARCHAR(50)		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
2.9 数据报表模块
crm_report_templates（报表模板表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
template_code	模板编码	VARCHAR(50)	NOT NULL, UNIQUE	
template_name	模板名称	VARCHAR(200)	NOT NULL	
template_type	模板类型	VARCHAR(30)	NOT NULL	sales/customer/finance/inventory/custom
category	分类	VARCHAR(50)		
tags	标签	VARCHAR(50)[]		
config	报表配置	JSONB	NOT NULL, DEFAULT '{}'	图表/表格配置
data_sources	数据源配置	JSONB	DEFAULT '[]'	
filters	默认筛选器	JSONB	DEFAULT '[]'	
chart_config	图表配置	JSONB	DEFAULT '{}'	
table_config	表格配置	JSONB	DEFAULT '{}'	
access_level	访问级别	VARCHAR(20)	DEFAULT 'private'	private/shared/organization/public
allowed_roles	允许角色	BIGINT[]		
allowed_users	允许用户	BIGINT[]		
is_scheduled	是否定时发送	BOOLEAN	DEFAULT FALSE	
schedule_config	调度配置	JSONB	DEFAULT '{}'	
recipients	接收人列表	JSONB	DEFAULT '[]'	
status	状态	VARCHAR(20)	DEFAULT 'draft'	draft/published/archived
is_featured	是否精选	BOOLEAN	DEFAULT FALSE	
usage_count	使用次数	INTEGER	DEFAULT 0	
owner_id	创建人ID	BIGINT	REFERENCES crm_users	
department_id	所属部门ID	BIGINT	REFERENCES crm_departments	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_report_instances（报表实例表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
instance_code	实例编码	VARCHAR(50)	NOT NULL, UNIQUE	
template_id	模板ID	BIGINT		
template_name	模板名称(冗余)	VARCHAR(200)		
report_name	报表名称	VARCHAR(200)		
parameters	运行参数	JSONB	DEFAULT '{}'	
date_range_type	时间范围类型	VARCHAR(20)		predefined/custom
start_date	开始日期	DATE		
end_date	结束日期	DATE		
executed_by	执行人ID	BIGINT	REFERENCES crm_users	
executed_at	执行时间	TIMESTAMP		
execution_time_ms	执行耗时(毫秒)	INTEGER		
result_data	结果数据	JSONB		
result_url	导出文件URL	VARCHAR(500)		
result_format	导出格式	VARCHAR(20)		xlsx/pdf/csv
file_size	文件大小	BIGINT		
status	状态	VARCHAR(20)	DEFAULT 'pending'	pending/running/completed/failed
error_message	错误信息	TEXT		
is_subscription	是否订阅生成	BOOLEAN	DEFAULT FALSE	
subscription_id	订阅ID	VARCHAR(50)		
shared_with	共享用户	BIGINT[]		
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
2.10 系统管理模块
crm_operation_logs（操作日志表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
user_id	操作用户ID	BIGINT	REFERENCES crm_users	
username	用户名(冗余)	VARCHAR(50)		
real_name	真实姓名(冗余)	VARCHAR(100)		
ip_address	IP地址	VARCHAR(45)		
user_agent	用户代理	VARCHAR(500)		浏览器/设备信息
module	模块	VARCHAR(50)	NOT NULL	customer/sales/product等
action	操作	VARCHAR(50)	NOT NULL	create/update/delete/export
operation_type	操作类型	VARCHAR(30)		CREATE/UPDATE/DELETE/EXPORT/LOGIN
description	描述	TEXT		操作说明
object_type	对象类型	VARCHAR(100)		表名
object_id	对象ID	BIGINT		记录ID
object_name	对象名称	VARCHAR(200)		记录名称
request_method	请求方法	VARCHAR(10)		GET/POST/PUT/DELETE
request_url	请求URL	VARCHAR(500)		
request_params	请求参数	JSONB		Query String
request_body	请求体	JSONB		POST/PUT数据
response_code	响应状态码	INTEGER		HTTP状态码
response_time_ms	响应时间(毫秒)	INTEGER		
error_message	错误信息	TEXT		
old_data	变更前数据	JSONB		
new_data	变更后数据	JSONB		
diff_data	差异数据	JSONB		变更对比
created_at	操作时间	TIMESTAMP	DEFAULT NOW()	
2.11 补充表
crm_sequence_rules（序列号规则表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
rule_code	规则编码	VARCHAR(50)	NOT NULL, UNIQUE	
rule_name	规则名称	VARCHAR(100)	NOT NULL	
entity_type	实体类型	VARCHAR(50)	NOT NULL	customer/opportunity/quotation/contract/order
prefix	前缀	VARCHAR(20)	DEFAULT ''	如 'C'
date_format	日期格式	VARCHAR(20)		如 'YYYYMMDD'
separator	分隔符	VARCHAR(10)	DEFAULT '-'	
sequence_length	序号长度	INTEGER	DEFAULT 4	
reset_type	重置规则	VARCHAR(20)	DEFAULT 'never'	never/daily/monthly/yearly
reset_date	重置日期	DATE		
current_value	当前值	INTEGER	DEFAULT 0	
current_date	当前日期	DATE		
padding_char	填充字符	VARCHAR(1)	DEFAULT '0'	
suffix	后缀	VARCHAR(20)	DEFAULT ''	
status	状态	VARCHAR(20)	DEFAULT 'active'	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_customer_duplicate_logs（客户查重冲突日志表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_a_id	客户A ID	BIGINT		
customer_b_id	客户B ID	BIGINT		
similarity	相似度(%)	DECIMAL(5,2)		
collision_type	冲突类型	VARCHAR(30)		duplicate/protected/claim_competition/joint
duplicate_dimensions	重复维度	JSONB		如["credit_code","company_name"]
handled_by	处理人ID	BIGINT		
handled_at	处理时间	TIMESTAMP		
result	处理结果	VARCHAR(30)		view/joint/force/quit/merge
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
crm_workflow_rules（工作流规则表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
rule_name	规则名称	VARCHAR(100)	NOT NULL	
trigger_type	触发类型	VARCHAR(20)	NOT NULL	time/status_change/behavior/data_threshold
trigger_config	触发配置	JSONB	NOT NULL	
actions	执行动作	JSONB	NOT NULL	
is_active	是否启用	BOOLEAN	DEFAULT TRUE	
created_at	创建时间	TIMESTAMP	DEFAULT NOW()	
updated_at	更新时间	TIMESTAMP		
created_by	创建人ID	BIGINT		
updated_by	更新人ID	BIGINT		
deleted_at	删除时间	TIMESTAMP		
version	乐观锁版本	INTEGER	DEFAULT 1	
crm_joint_followups（联合跟进关系表）
字段名	中文名	类型	约束	说明
id	主键ID	BIGSERIAL	PRIMARY KEY	
customer_id	客户ID	BIGINT	NOT NULL, REFERENCES crm_customers	
main_owner_id	主负责人ID	BIGINT	NOT NULL, REFERENCES crm_users	
joint_owner_id	协作人ID	BIGINT	NOT NULL, REFERENCES crm_users	
share_ratio	业绩分成比例	DECIMAL(5,2)	NOT NULL	如0.3表示30%
start_time	开始时间	TIMESTAMP	NOT NULL	
end_time	结束时间	TIMESTAMP		
status	状态	VARCHAR(20)	DEFAULT 'active'	active/ended
created_at	创建时间	TIMESTAMP	DEFAULT NOW()