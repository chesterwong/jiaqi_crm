# 制造业CRM系统技术架构与接口设计方案

**版本**: v1.0
**文档日期**: 2026-03-29
**项目名称**: 制造业CRM客户管理系统

---

## 目录
1. [技术框架选型](#一技术框架选型)
2. [系统架构设计](#二系统架构设计)
3. [端口统一规划](#三端口统一规划)
4. [数据库表结构设计](#四数据库表结构设计)
5. [RESTful API接口规范](#五restful-api接口规范)
6. [接口文档方案](#六接口文档方案)
7. [测试策略](#七测试策略)
8. [部署架构](#八部署架构)

---

## 一、技术框架选型

### 1.1 整体技术栈

```
┌─────────────────────────────────────────────────────────┐
│                      前端层 (Frontend)                    │
├─────────────────────────────────────────────────────────┤
│  Vue 3.x + TypeScript + Vite + Element Plus + Pinia   │
│  + ECharts (图表) + Axios (HTTP) + Vue Router (路由)   │
└─────────────────────────────────────────────────────────┘
                            │ HTTP/HTTPS
┌─────────────────────────────────────────────────────────┐
│                     网关层 (Gateway)                      │
├─────────────────────────────────────────────────────────┤
│                Nginx (反向代理/负载均衡)                 │
└─────────────────────────────────────────────────────────┘
                            │
┌─────────────────────────────────────────────────────────┐
│                    后端层 (Backend)                       │
├─────────────────────────────────────────────────────────┤
│  Spring Boot 3.x + Spring Cloud Alibaba               │
│  + Spring Security + MyBatis Plus + Redis + RabbitMQ  │
└─────────────────────────────────────────────────────────┘
                            │
┌─────────────────────────────────────────────────────────┐
│                   数据层 (Data Layer)                    │
├─────────────────────────────────────────────────────────┤
│  MySQL 8.0 (主库) + Redis 7.x (缓存)                  │
│  + Elasticsearch (搜索) + MinIO (文件存储)              │
└─────────────────────────────────────────────────────────┘
```

### 1.2 前端技术栈详解

| 技术组件 | 版本 | 用途说明 |
|---------|------|---------|
| **Vue 3** | 3.4+ | 渐进式JavaScript框架，采用Composition API |
| **TypeScript** | 5.3+ | 类型安全的JavaScript超集 |
| **Vite** | 5.0+ | 新一代前端构建工具，快速开发 |
| **Element Plus** | 2.5+ | Vue 3的UI组件库 |
| **Pinia** | 2.1+ | Vue 3的状态管理库 |
| **Vue Router** | 4.2+ | 官方路由管理器 |
| **Axios** | 1.6+ | HTTP客户端 |
| **ECharts** | 5.5+ | 数据可视化图表库 |
| **Tailwind CSS** | 3.4+ | 原子化CSS框架 |

### 1.3 后端技术栈详解

| 技术组件 | 版本 | 用途说明 |
|---------|------|---------|
| **Spring Boot** | 3.2+ | 基础应用框架 |
| **Spring Cloud Alibaba** | 2023.x | 微服务套件 |
| **Nacos** | 2.3+ | 服务注册与配置中心 |
| **Spring Security** | 6.2+ | 安全认证框架 |
| **JWT** | 0.12+ | Token认证 |
| **MyBatis Plus** | 3.5+ | ORM框架 |
| **Druid** | 1.2+ | 数据库连接池 |
| **Redis** | 7.2+ | 缓存与会话存储 |
| **RabbitMQ** | 3.12+ | 消息队列 |
| **Elasticsearch** | 8.11+ | 全文搜索引擎 |
| **MinIO** | 2024.x | 对象存储服务 |

### 1.4 开发工具链

| 工具类型 | 工具名称 | 版本 |
|---------|---------|------|
| **IDE** | IntelliJ IDEA | 2024.x |
| **IDE** | VS Code | 1.86+ |
| **版本控制** | Git | 2.43+ |
| **构建工具** | Maven | 3.9+ |
| **API测试** | Postman | 10.x |
| **接口文档** | Swagger/OpenAPI | 3.x |
| **数据库管理** | Navicat Premium | 16.x |
| **容器化** | Docker | 24.x |
| **容器编排** | Docker Compose | 2.x |

---

## 二、系统架构设计

### 2.1 整体架构图

```
┌─────────────────────────────────────────────────────────────┐
│                         客户端层                              │
├─────────────────────────────────────────────────────────────┤
│  Web浏览器  │  移动端(H5)  │  桌面客户端(Electron)            │
└──────────────────────────────┬──────────────────────────────┘
                               │ HTTPS
┌──────────────────────────────┴──────────────────────────────┐
│                      网关层 (Nginx:80/443)                    │
│              反向代理 / 负载均衡 / SSL终止 / 静态资源         │
└──────────────────────────────┬──────────────────────────────┘
                               │
        ┌──────────────────────┼──────────────────────┐
        │                      │                      │
┌───────┴────────┐    ┌───────┴────────┐    ┌───────┴────────┐
│  前端静态资源   │    │   后端API服务   │    │   文件服务      │
│  (Vue Build)   │    │  (Spring Boot) │    │   (MinIO)      │
└────────────────┘    └────────────────┘    └────────────────┘
                               │
        ┌──────────────────────┼──────────────────────┐
        │                      │                      │
┌───────┴────────┐    ┌───────┴────────┐    ┌───────┴────────┐
│  业务服务层    │    │   中间件层      │    │   数据存储层    │
│                │    │                │    │                │
│ • 客户服务     │    │ • Redis缓存     │    │ • MySQL主从     │
│ • 销售服务     │    │ • RabbitMQ队列  │    │ • Elasticsearch│
│ • 订单服务     │    │ • Nacos注册     │    │ • MinIO存储    │
│ • 营销服务     │    │                │    │                │
│ • 客服服务     │    │                │    │                │
│ • 分析服务     │    │                │    │                │
│ • 系统服务     │    │                │    │                │
└────────────────┘    └────────────────┘    └────────────────┘
```

### 2.2 微服务模块划分

基于功能需求文档，系统划分为以下8个微服务：

| 服务名称 | 服务端口 | 职责描述 | 核心功能 |
|---------|---------|---------|---------|
| **crm-customer-service** | 8001 | 客户管理服务 | 客户档案、资源池、分层管理 |
| **crm-sales-service** | 8002 | 销售管理服务 | 销售漏斗、跟进记录、商机管理 |
| **crm-order-service** | 8003 | 订单合同服务 | 报价单、合同、付款计划 |
| **crm-product-service** | 8004 | 产品管理服务 | 产品目录、价格管理、库存 |
| **crm-marketing-service** | 8005 | 营销服务 | 活动管理、线索培育、渠道归因 |
| **crm-service-service** | 8006 | 客户服务 | 工单管理、SLA、知识库 |
| **crm-analysis-service** | 8007 | 数据分析服务 | 报表统计、预测分析、客户画像 |
| **crm-system-service** | 8008 | 系统管理服务 | 用户权限、配置管理、审批流程 |

### 2.3 技术架构分层

```
┌────────────────────────────────────────────────────────┐
│                   表现层 (Presentation)                  │
│         Vue 3 + TypeScript + Element Plus              │
└────────────────────────────────────────────────────────┘
                        │
┌────────────────────────────────────────────────────────┐
│                   网关层 (Gateway)                       │
│              Nginx + 负载均衡 + SSL                      │
└────────────────────────────────────────────────────────┘
                        │
┌────────────────────────────────────────────────────────┐
│                  应用层 (Application)                    │
│            Controller + DTO + Validation                │
└────────────────────────────────────────────────────────┘
                        │
┌────────────────────────────────────────────────────────┐
│                  业务层 (Business)                       │
│              Service + Domain + Event                   │
└────────────────────────────────────────────────────────┘
                        │
┌────────────────────────────────────────────────────────┐
│                  持久层 (Persistence)                    │
│           Mapper + Entity + Repository                 │
└────────────────────────────────────────────────────────┘
                        │
┌────────────────────────────────────────────────────────┐
│                  数据层 (Data)                           │
│   MySQL + Redis + Elasticsearch + MinIO                │
└────────────────────────────────────────────────────────┘
```

---

## 三、端口统一规划

### 3.1 端口分配总览

**设计原则**：前端、后端、数据库各使用统一端口，避免配置混乱

| 层级 | 服务/组件 | 端口 | 协议 | 说明 |
|-----|-----------|------|------|------|
| **前端层** | 前端开发服务器 | 3000 | HTTP | Vite开发服务器 |
| | 前端生产构建 | - | - | 静态文件通过Nginx托管 |
| **网关层** | Nginx HTTP | 80 | HTTP | 生产环境HTTP入口 |
| | Nginx HTTPS | 443 | HTTPS | 生产环境HTTPS入口 |
| **后端层** | 后端API网关 | 9000 | HTTP | 统一API入口 |
| | crm-customer-service | 8001 | HTTP | 客户管理服务 |
| | crm-sales-service | 8002 | HTTP | 销售管理服务 |
| | crm-order-service | 8003 | HTTP | 订单合同服务 |
| | crm-product-service | 8004 | HTTP | 产品管理服务 |
| | crm-marketing-service | 8005 | HTTP | 营销服务 |
| | crm-service-service | 8006 | HTTP | 客户服务 |
| | crm-analysis-service | 8007 | HTTP | 数据分析服务 |
| | crm-system-service | 8008 | HTTP | 系统管理服务 |
| **中间件层** | Nacos Server | 8848 | HTTP | 服务注册与配置中心 |
| | Redis | 6379 | TCP | 缓存服务 |
| | RabbitMQ | 5672 | TCP | 消息队列 |
| | RabbitMQ Management | 15672 | HTTP | 管理界面 |
| **数据层** | MySQL | 3306 | TCP | 主数据库 |
| | Elasticsearch | 9200 | HTTP | 搜索引擎 |
| | MinIO Console | 9001 | HTTP | 文件存储管理 |
| | MinIO API | 9000 | HTTP | 文件存储API(与网关冲突，需调整) |

### 3.2 端口冲突处理

**冲突说明**：MinIO默认API端口9000与后端网关冲突

**解决方案**：调整MinIO配置
- MinIO API端口：`9000` → `9002`
- MinIO Console端口：`9001`（保持不变）

**修正后的端口分配**：

| 层级 | 服务/组件 | 端口 | 协议 |
|-----|-----------|------|------|
| **后端层** | 后端API网关 | 9000 | HTTP |
| **数据层** | MinIO API | 9002 | HTTP |
| | MinIO Console | 9001 | HTTP |

### 3.3 环境变量配置

创建统一的端口配置文件：

```yaml
# application-common.yml (所有服务共用)
server:
  port: ${SERVICE_PORT:8000}

# 端口配置映射
service:
  ports:
    gateway: 9000
    customer: 8001
    sales: 8002
    order: 8003
    product: 8004
    marketing: 8005
    service: 8006
    analysis: 8007
    system: 8008

# 中间件配置
middleware:
  nacos:
    server-addr: 127.0.0.1:8848
  redis:
    host: 127.0.0.1
    port: 6379
  rabbitmq:
    host: 127.0.0.1
    port: 5672
    management-port: 15672

# 数据库配置
database:
  mysql:
    host: 127.0.0.1
    port: 3306
  elasticsearch:
    host: 127.0.0.1
    port: 9200
  minio:
    endpoint: http://127.0.0.1:9002
    console: http://127.0.0.1:9001
```

### 3.4 Nginx配置示例

```nginx
# /etc/nginx/conf.d/crm.conf

# 前端静态资源
server {
    listen 80;
    server_name crm.example.com;
    
    # 前端构建文件
    location / {
        root /usr/share/nginx/html/crm-frontend;
        try_files $uri $uri/ /index.html;
        
        # 缓存配置
        expires 7d;
        add_header Cache-Control "public, immutable";
    }
    
    # 后端API代理
    location /api/ {
        proxy_pass http://127.0.0.1:9000/api/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # 超时配置
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }
    
    # WebSocket支持
    location /ws/ {
        proxy_pass http://127.0.0.1:9000/ws/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
    }
    
    # 文件上传大小限制
    client_max_body_size 100M;
}

# HTTPS配置 (生产环境)
server {
    listen 443 ssl http2;
    server_name crm.example.com;
    
    ssl_certificate /etc/nginx/ssl/crm.example.com.crt;
    ssl_certificate_key /etc/nginx/ssl/crm.example.com.key;
    
    # SSL配置
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    
    # 其他配置同HTTP
    location / {
        root /usr/share/nginx/html/crm-frontend;
        try_files $uri $uri/ /index.html;
    }
    
    location /api/ {
        proxy_pass http://127.0.0.1:9000/api/;
        # ... 其他配置同上
    }
}
```

---

## 四、数据库表结构设计

### 4.1 数据库命名规范

**数据库设计原则**：
- 数据库字符集：`utf8mb4`
- 排序规则：`utf8mb4_unicode_ci`
- 时间字段：统一使用`DATETIME`或`TIMESTAMP`
- 主键：统一使用`BIGINT`类型的`id`字段
- 软删除：添加`deleted`字段（TINYINT，0-未删除，1-已删除）
- 审计字段：`created_by`、`created_time`、`updated_by`、`updated_time`

**表命名规范**：
- 格式：`{模块}_{功能表}`（下划线分隔）
- 示例：`crm_customer`、`crm_sales_opportunity`、`crm_order`

### 4.2 核心表结构

#### 4.2.1 客户管理模块

**1. 客户主表 (crm_customer)**

```sql
CREATE TABLE `crm_customer` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `customer_code` VARCHAR(50) NOT NULL COMMENT '客户编号',
  `company_name` VARCHAR(200) NOT NULL COMMENT '企业名称',
  `credit_code` VARCHAR(18) COMMENT '统一社会信用代码',
  `registered_capital` DECIMAL(18,2) COMMENT '注册资本',
  `established_date` DATE COMMENT '成立日期',
  `company_type` VARCHAR(50) COMMENT '企业类型',
  `business_scope` TEXT COMMENT '经营范围',
  `registered_address` VARCHAR(500) COMMENT '注册地址',
  `business_address` VARCHAR(500) COMMENT '经营地址',
  `industry_l1` VARCHAR(50) COMMENT '一级行业',
  `industry_l2` VARCHAR(50) COMMENT '二级行业',
  `industry_l3` VARCHAR(50) COMMENT '三级行业',
  `company_scale` VARCHAR(20) COMMENT '企业规模',
  `supply_chain_position` VARCHAR(50) COMMENT '供应链位置',
  `business_type` VARCHAR(50) COMMENT '业务类型',
  `customer_level` VARCHAR(20) DEFAULT 'C' COMMENT '客户等级',
  `customer_status` VARCHAR(20) DEFAULT 'ACTIVE' COMMENT '客户状态',
  `pool_type` VARCHAR(20) DEFAULT 'PUBLIC' COMMENT '资源池类型',
  `owner_id` BIGINT COMMENT '负责人ID',
  `team_id` BIGINT COMMENT '所属团队ID',
  `health_score` INT DEFAULT 0 COMMENT '健康度评分',
  `churn_risk` DECIMAL(5,2) COMMENT '流失风险',
  `total_purchase` DECIMAL(18,2) DEFAULT 0 COMMENT '累计采购额',
  `last_purchase_date` DATETIME COMMENT '最后采购日期',
  `protection_expire_date` DATETIME COMMENT '保护期到期日期',
  `tags` JSON COMMENT '客户标签',
  `remark` TEXT COMMENT '备注',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` BIGINT COMMENT '更新人ID',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` TINYINT DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_customer_code` (`customer_code`),
  UNIQUE KEY `uk_credit_code` (`credit_code`),
  KEY `idx_company_name` (`company_name`),
  KEY `idx_owner_id` (`owner_id`),
  KEY `idx_pool_type` (`pool_type`),
  KEY `idx_customer_level` (`customer_level`),
  KEY `idx_industry_l2` (`industry_l2`),
  KEY `idx_created_time` (`created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户主表';
```

**2. 联系人表 (crm_customer_contact)**

```sql
CREATE TABLE `crm_customer_contact` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '联系人ID',
  `customer_id` BIGINT NOT NULL COMMENT '客户ID',
  `contact_name` VARCHAR(100) NOT NULL COMMENT '联系人姓名',
  `position` VARCHAR(100) COMMENT '职位',
  `department` VARCHAR(100) COMMENT '部门',
  `mobile` VARCHAR(20) COMMENT '手机号',
  `email` VARCHAR(100) COMMENT '邮箱',
  `wechat` VARCHAR(50) COMMENT '微信号',
  `qq` VARCHAR(20) COMMENT 'QQ号',
  `address` VARCHAR(500) COMMENT '地址',
  `latitude` DECIMAL(10,6) COMMENT '纬度',
  `longitude` DECIMAL(10,6) COMMENT '经度',
  `contact_role` VARCHAR(50) COMMENT '联系人角色',
  `is_primary` TINYINT DEFAULT 0 COMMENT '是否主要联系人',
  `remark` TEXT COMMENT '备注',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` BIGINT COMMENT '更新人ID',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` TINYINT DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_mobile` (`mobile`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户联系人表';
```

**3. 跟进记录表 (crm_follow_up)**

```sql
CREATE TABLE `crm_follow_up` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '跟进记录ID',
  `customer_id` BIGINT NOT NULL COMMENT '客户ID',
  `contact_id` BIGINT COMMENT '联系人ID',
  `follow_type` VARCHAR(20) NOT NULL COMMENT '跟进类型',
  `follow_method` VARCHAR(20) COMMENT '跟进方式',
  `content` TEXT COMMENT '跟进内容',
  `images` JSON COMMENT '图片列表',
  `audio_url` VARCHAR(500) COMMENT '语音文件URL',
  `audio_text` TEXT COMMENT '语音转文字内容',
  `location` VARCHAR(200) COMMENT '位置信息',
  `latitude` DECIMAL(10,6) COMMENT '纬度',
  `longitude` DECIMAL(10,6) COMMENT '经度',
  `next_follow_date` DATETIME COMMENT '下次跟进时间',
  `follow_result` VARCHAR(50) COMMENT '跟进结果',
  `sales_id` BIGINT NOT NULL COMMENT '销售人员ID',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` BIGINT COMMENT '更新人ID',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` TINYINT DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_sales_id` (`sales_id`),
  KEY `idx_created_time` (`created_time`),
  KEY `idx_next_follow_date` (`next_follow_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='跟进记录表';
```

#### 4.2.2 销售管理模块

**4. 销售机会表 (crm_sales_opportunity)**

```sql
CREATE TABLE `crm_sales_opportunity` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '商机ID',
  `opportunity_code` VARCHAR(50) NOT NULL COMMENT '商机编号',
  `customer_id` BIGINT NOT NULL COMMENT '客户ID',
  `opportunity_name` VARCHAR(200) NOT NULL COMMENT '商机名称',
  `opportunity_stage` VARCHAR(20) NOT NULL COMMENT '商机阶段',
  `probability` DECIMAL(5,2) COMMENT '成交概率',
  `expected_amount` DECIMAL(18,2) COMMENT '预期金额',
  `actual_amount` DECIMAL(18,2) COMMENT '实际金额',
  `expected_close_date` DATE COMMENT '预期成交日期',
  `actual_close_date` DATE COMMENT '实际成交日期',
  `lost_reason` VARCHAR(200) COMMENT '失败原因',
  `competitor` VARCHAR(200) COMMENT '竞争对手',
  `sales_id` BIGINT NOT NULL COMMENT '销售人员ID',
  `team_id` BIGINT COMMENT '所属团队ID',
  `source` VARCHAR(50) COMMENT '来源渠道',
  `description` TEXT COMMENT '商机描述',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` BIGINT COMMENT '更新人ID',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` TINYINT DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_opportunity_code` (`opportunity_code`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_sales_id` (`sales_id`),
  KEY `idx_opportunity_stage` (`opportunity_stage`),
  KEY `idx_expected_close_date` (`expected_close_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='销售机会表';
```

#### 4.2.3 订单合同模块

**5. 报价单表 (crm_quote)**

```sql
CREATE TABLE `crm_quote` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '报价单ID',
  `quote_code` VARCHAR(50) NOT NULL COMMENT '报价单编号',
  `customer_id` BIGINT NOT NULL COMMENT '客户ID',
  `quote_name` VARCHAR(200) NOT NULL COMMENT '报价单名称',
  `currency` VARCHAR(10) DEFAULT 'CNY' COMMENT '币种',
  `subtotal` DECIMAL(18,2) COMMENT '小计',
  `discount` DECIMAL(18,2) COMMENT '折扣',
  `tax` DECIMAL(18,2) COMMENT '税额',
  `total_amount` DECIMAL(18,2) COMMENT '总金额',
  `valid_from` DATE COMMENT '有效期开始',
  `valid_to` DATE COMMENT '有效期结束',
  `quote_status` VARCHAR(20) DEFAULT 'DRAFT' COMMENT '报价状态',
  `template_id` BIGINT COMMENT '模板ID',
  `sales_id` BIGINT NOT NULL COMMENT '销售人员ID',
  `terms` TEXT COMMENT '条款内容',
  `remark` TEXT COMMENT '备注',
  `approved_by` BIGINT COMMENT '审批人ID',
  `approved_time` DATETIME COMMENT '审批时间',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` BIGINT COMMENT '更新人ID',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` TINYINT DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_quote_code` (`quote_code`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_sales_id` (`sales_id`),
  KEY `idx_quote_status` (`quote_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='报价单表';
```

**6. 报价单明细表 (crm_quote_item)**

```sql
CREATE TABLE `crm_quote_item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '明细ID',
  `quote_id` BIGINT NOT NULL COMMENT '报价单ID',
  `product_id` BIGINT COMMENT '产品ID',
  `product_name` VARCHAR(200) COMMENT '产品名称',
  `product_code` VARCHAR(50) COMMENT '产品编码',
  `specification` VARCHAR(500) COMMENT '规格参数',
  `quantity` DECIMAL(18,2) COMMENT '数量',
  `unit` VARCHAR(20) COMMENT '单位',
  `unit_price` DECIMAL(18,2) COMMENT '单价',
  `discount_rate` DECIMAL(5,2) COMMENT '折扣率',
  `subtotal` DECIMAL(18,2) COMMENT '小计',
  `remark` TEXT COMMENT '备注',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_quote_id` (`quote_id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='报价单明细表';
```

**7. 合同表 (crm_contract)**

```sql
CREATE TABLE `crm_contract` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '合同ID',
  `contract_code` VARCHAR(50) NOT NULL COMMENT '合同编号',
  `customer_id` BIGINT NOT NULL COMMENT '客户ID',
  `contract_name` VARCHAR(200) NOT NULL COMMENT '合同名称',
  `contract_type` VARCHAR(20) COMMENT '合同类型',
  `contract_amount` DECIMAL(18,2) COMMENT '合同金额',
  `currency` VARCHAR(10) DEFAULT 'CNY' COMMENT '币种',
  `sign_date` DATE COMMENT '签署日期',
  `start_date` DATE COMMENT '开始日期',
  `end_date` DATE COMMENT '结束日期',
  `contract_status` VARCHAR(20) DEFAULT 'DRAFT' COMMENT '合同状态',
  `template_id` BIGINT COMMENT '模板ID',
  `sales_id` BIGINT NOT NULL COMMENT '销售人员ID',
  `file_url` VARCHAR(500) COMMENT '合同文件URL',
  `electronic_sign` TINYINT DEFAULT 0 COMMENT '是否电子签',
  `signatories` JSON COMMENT '签署人信息',
  `terms` TEXT COMMENT '条款内容',
  `remark` TEXT COMMENT '备注',
  `approved_by` BIGINT COMMENT '审批人ID',
  `approved_time` DATETIME COMMENT '审批时间',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` BIGINT COMMENT '更新人ID',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` TINYINT DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_contract_code` (`contract_code`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_sales_id` (`sales_id`),
  KEY `idx_contract_status` (`contract_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合同表';
```

**8. 付款计划表 (crm_payment_plan)**

```sql
CREATE TABLE `crm_payment_plan` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '付款计划ID',
  `contract_id` BIGINT NOT NULL COMMENT '合同ID',
  `plan_code` VARCHAR(50) NOT NULL COMMENT '计划编号',
  `plan_name` VARCHAR(200) COMMENT '计划名称',
  `plan_amount` DECIMAL(18,2) NOT NULL COMMENT '计划金额',
  `plan_date` DATE NOT NULL COMMENT '计划付款日期',
  `payment_status` VARCHAR(20) DEFAULT 'PENDING' COMMENT '付款状态',
  `actual_amount` DECIMAL(18,2) COMMENT '实际付款金额',
  `actual_date` DATE COMMENT '实际付款日期',
  `payment_method` VARCHAR(50) COMMENT '付款方式',
  `bank_account` VARCHAR(100) COMMENT '收款账户',
  `remark` TEXT COMMENT '备注',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_contract_id` (`contract_id`),
  KEY `idx_plan_date` (`plan_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='付款计划表';
```

#### 4.2.4 产品管理模块

**9. 产品表 (crm_product)**

```sql
CREATE TABLE `crm_product` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `product_code` VARCHAR(50) NOT NULL COMMENT '产品编码',
  `product_name` VARCHAR(200) NOT NULL COMMENT '产品名称',
  `category_id` BIGINT COMMENT '分类ID',
  `category_name` VARCHAR(200) COMMENT '分类名称',
  `specification` TEXT COMMENT '规格参数',
  `unit` VARCHAR(20) COMMENT '单位',
  `weight` DECIMAL(10,2) COMMENT '重量',
  `volume` DECIMAL(10,2) COMMENT '体积',
  `standard_price` DECIMAL(18,2) COMMENT '标准价格',
  `cost_price` DECIMAL(18,2) COMMENT '成本价格',
  `status` VARCHAR(20) DEFAULT 'ACTIVE' COMMENT '产品状态',
  `images` JSON COMMENT '产品图片',
  `documents` JSON COMMENT '产品文档',
  `description` TEXT COMMENT '产品描述',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` BIGINT COMMENT '更新人ID',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` TINYINT DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_product_code` (`product_code`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_product_name` (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品表';
```

**10. 价格表 (crm_price)**

```sql
CREATE TABLE `crm_price` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '价格ID',
  `product_id` BIGINT NOT NULL COMMENT '产品ID',
  `price_type` VARCHAR(20) NOT NULL COMMENT '价格类型',
  `min_quantity` DECIMAL(18,2) COMMENT '最小数量',
  `max_quantity` DECIMAL(18,2) COMMENT '最大数量',
  `price` DECIMAL(18,2) NOT NULL COMMENT '价格',
  `effective_from` DATE COMMENT '生效日期',
  `effective_to` DATE COMMENT '失效日期',
  `customer_id` BIGINT COMMENT '客户ID（专属价格）',
  `activity_id` BIGINT COMMENT '活动ID（促销价）',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_price_type` (`price_type`),
  KEY `idx_customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='价格表';
```

#### 4.2.5 系统管理模块

**11. 用户表 (sys_user)**

```sql
CREATE TABLE `sys_user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` VARCHAR(50) NOT NULL COMMENT '用户名',
  `password` VARCHAR(100) NOT NULL COMMENT '密码（加密）',
  `real_name` VARCHAR(100) NOT NULL COMMENT '真实姓名',
  `email` VARCHAR(100) COMMENT '邮箱',
  `mobile` VARCHAR(20) COMMENT '手机号',
  `avatar` VARCHAR(500) COMMENT '头像URL',
  `department_id` BIGINT COMMENT '部门ID',
  `position` VARCHAR(100) COMMENT '职位',
  `status` VARCHAR(20) DEFAULT 'ACTIVE' COMMENT '用户状态',
  `last_login_time` DATETIME COMMENT '最后登录时间',
  `last_login_ip` VARCHAR(50) COMMENT '最后登录IP',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` BIGINT COMMENT '更新人ID',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` TINYINT DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`),
  UNIQUE KEY `uk_email` (`email`),
  UNIQUE KEY `uk_mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';
```

**12. 角色表 (sys_role)**

```sql
CREATE TABLE `sys_role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_code` VARCHAR(50) NOT NULL COMMENT '角色编码',
  `role_name` VARCHAR(100) NOT NULL COMMENT '角色名称',
  `role_level` INT COMMENT '角色级别',
  `description` VARCHAR(500) COMMENT '角色描述',
  `status` VARCHAR(20) DEFAULT 'ACTIVE' COMMENT '状态',
  `created_by` BIGINT COMMENT '创建人ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_code` (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';
```

**13. 用户角色关联表 (sys_user_role)**

```sql
CREATE TABLE `sys_user_role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` BIGINT NOT NULL COMMENT '用户ID',
  `role_id` BIGINT NOT NULL COMMENT '角色ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户角色关联表';
```

**14. 权限表 (sys_permission)**

```sql
CREATE TABLE `sys_permission` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_code` VARCHAR(100) NOT NULL COMMENT '权限编码',
  `permission_name` VARCHAR(100) NOT NULL COMMENT '权限名称',
  `resource_type` VARCHAR(20) NOT NULL COMMENT '资源类型',
  `resource_url` VARCHAR(200) COMMENT '资源URL',
  `method` VARCHAR(10) COMMENT '请求方法',
  `parent_id` BIGINT COMMENT '父权限ID',
  `sort_order` INT COMMENT '排序',
  `status` VARCHAR(20) DEFAULT 'ACTIVE' COMMENT '状态',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_permission_code` (`permission_code`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限表';
```

**15. 角色权限关联表 (sys_role_permission)**

```sql
CREATE TABLE `sys_role_permission` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` BIGINT NOT NULL COMMENT '角色ID',
  `permission_id` BIGINT NOT NULL COMMENT '权限ID',
  `created_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色权限关联表';
```

### 4.3 数据库索引优化

**索引设计原则**：
- 为所有外键字段创建索引
- 为常查询字段创建索引
- 为排序字段创建索引
- 复合索引遵循最左前缀原则

**索引优化示例**：

```sql
-- 客户表索引优化
CREATE INDEX idx_customer_search ON crm_customer(company_name, customer_level, pool_type);
CREATE INDEX idx_customer_purchase ON crm_customer(owner_id, created_time);

-- 跟进记录索引优化
CREATE INDEX idx_followup_search ON crm_follow_up(customer_id, created_time, follow_type);
```

---

## 五、RESTful API接口规范

### 5.1 API设计原则

**RESTful设计规范**：
- 使用HTTP动词（GET/POST/PUT/DELETE）表示操作类型
- 使用名词表示资源
- URL层级清晰，不超过3层
- 统一版本控制（/api/v1/）
- 统一响应格式

### 5.2 URL命名规范

**格式**：`/api/{version}/{module}/{resource}/{id}/{sub-resource}`

**示例**：
- `GET /api/v1/customers` - 获取客户列表
- `GET /api/v1/customers/{id}` - 获取客户详情
- `POST /api/v1/customers` - 创建客户
- `PUT /api/v1/customers/{id}` - 更新客户
- `DELETE /api/v1/customers/{id}` - 删除客户
- `GET /api/v1/customers/{id}/contacts` - 获取客户联系人列表
- `POST /api/v1/customers/{id}/contacts` - 创建联系人

### 5.3 统一响应格式

**成功响应**：

```json
{
  "code": 200,
  "message": "success",
  "data": {
    // 业务数据
  },
  "timestamp": 1711707873000
}
```

**分页响应**：

```json
{
  "code": 200,
  "message": "success",
  "data": {
    "list": [
      // 数据列表
    ],
    "pagination": {
      "page": 1,
      "size": 20,
      "total": 100,
      "pages": 5
    }
  },
  "timestamp": 1711707873000
}
```

**错误响应**：

```json
{
  "code": 400,
  "message": "参数校验失败",
  "errors": [
    {
      "field": "customerName",
      "message": "客户名称不能为空"
    }
  ],
  "timestamp": 1711707873000
}
```

### 5.4 HTTP状态码规范

| 状态码 | 说明 | 使用场景 |
|-------|------|---------|
| 200 | OK | 请求成功 |
| 201 | Created | 资源创建成功 |
| 204 | No Content | 删除成功，无返回内容 |
| 400 | Bad Request | 请求参数错误 |
| 401 | Unauthorized | 未认证 |
| 403 | Forbidden | 无权限 |
| 404 | Not Found | 资源不存在 |
| 409 | Conflict | 资源冲突（如重复创建） |
| 500 | Internal Server Error | 服务器内部错误 |

### 5.5 业务错误码规范

**格式**：`{模块码}{错误类别}{具体错误}`

**错误码表**：

| 错误码 | 说明 | HTTP状态码 |
|-------|------|-----------|
| 10001 | 参数校验失败 | 400 |
| 10002 | 数据不存在 | 404 |
| 10003 | 数据重复 | 409 |
| 20001 | 未登录 | 401 |
| 20002 | Token过期 | 401 |
| 20003 | 无权限 | 403 |
| 30001 | 客户不存在 | 404 |
| 30002 | 客户编号重复 | 409 |
| 40001 | 报价单不存在 | 404 |
| 50001 | 文件上传失败 | 500 |

### 5.6 核心API接口定义

#### 5.6.1 客户管理接口

**1. 获取客户列表**

```http
GET /api/v1/customers?page=1&size=20&keyword=&level=&poolType=
```

**请求参数**：

| 参数名 | 类型 | 必填 | 说明 |
|-------|------|------|------|
| page | Integer | 否 | 页码，默认1 |
| size | Integer | 否 | 每页数量，默认20 |
| keyword | String | 否 | 搜索关键词 |
| level | String | 否 | 客户等级 |
| poolType | String | 否 | 资源池类型 |
| ownerId | Long | 否 | 负责人ID |

**响应示例**：

```json
{
  "code": 200,
  "message": "success",
  "data": {
    "list": [
      {
        "id": 1,
        "customerCode": "C20260101001",
        "companyName": "某某纸业有限公司",
        "creditCode": "91330000XXXXXXXXXX",
        "industryL2": "纸品",
        "companyScale": "中型",
        "customerLevel": "A",
        "poolType": "PRIVATE",
        "ownerId": 1001,
        "ownerName": "张三",
        "healthScore": 85,
        "totalPurchase": 1500000.00,
        "createdTime": "2026-01-01 10:00:00"
      }
    ],
    "pagination": {
      "page": 1,
      "size": 20,
      "total": 100,
      "pages": 5
    }
  },
  "timestamp": 1711707873000
}
```

**2. 创建客户**

```http
POST /api/v1/customers
Content-Type: application/json
Authorization: Bearer {token}
```

**请求体**：

```json
{
  "companyName": "某某纸业有限公司",
  "creditCode": "91330000XXXXXXXXXX",
  "registeredCapital": 5000000.00,
  "establishedDate": "2010-05-01",
  "companyType": "有限责任公司",
  "businessScope": "纸品制造、销售",
  "registeredAddress": "浙江省杭州市",
  "industryL1": "制造业",
  "industryL2": "纸品",
  "industryL3": "包装纸",
  "companyScale": "中型",
  "supplyChainPosition": "生产",
  "businessType": "OEM",
  "customerLevel": "A",
  "ownerId": 1001,
  "remark": "备注信息"
}
```

**响应示例**：

```json
{
  "code": 201,
  "message": "创建成功",
  "data": {
    "id": 1,
    "customerCode": "C20260101001"
  },
  "timestamp": 1711707873000
}
```

**3. 更新客户**

```http
PUT /api/v1/customers/{id}
Content-Type: application/json
Authorization: Bearer {token}
```

**4. 删除客户**

```http
DELETE /api/v1/customers/{id}
Authorization: Bearer {token}
```

**5. 批量导入客户**

```http
POST /api/v1/customers/import
Content-Type: multipart/form-data
Authorization: Bearer {token}
```

**请求参数**：

| 参数名 | 类型 | 必填 | 说明 |
|-------|------|------|------|
| file | File | 是 | Excel文件 |

**响应示例**：

```json
{
  "code": 200,
  "message": "导入成功",
  "data": {
    "taskId": "IMPORT_20260129123456",
    "totalCount": 1000,
    "successCount": 950,
    "failCount": 50,
    "failDetails": [
      {
        "row": 10,
        "reason": "信用代码格式错误"
      }
    ]
  },
  "timestamp": 1711707873000
}
```

#### 5.6.2 销售机会接口

**1. 获取销售漏斗数据**

```http
GET /api/v1/sales/funnel?teamId=&startDate=&endDate=
```

**响应示例**：

```json
{
  "code": 200,
  "message": "success",
  "data": {
    "stages": [
      {
        "stage": "LEAD",
        "stageName": "线索",
        "count": 100,
        "amount": 5000000.00,
        "conversionRate": 20.0
      },
      {
        "stage": "INTENTION",
        "stageName": "意向",
        "count": 80,
        "amount": 4000000.00,
        "conversionRate": 30.0
      },
      {
        "stage": "PROPOSAL",
        "stageName": "方案",
        "count": 60,
        "amount": 3000000.00,
        "conversionRate": 50.0
      },
      {
        "stage": "NEGOTIATION",
        "stageName": "谈判",
        "count": 40,
        "amount": 2000000.00,
        "conversionRate": 70.0
      },
      {
        "stage": "CLOSED",
        "stageName": "成交",
        "count": 30,
        "amount": 1500000.00,
        "conversionRate": 90.0
      }
    ],
    "totalConversionRate": 30.0,
    "totalAmount": 15000000.00
  },
  "timestamp": 1711707873000
}
```

#### 5.6.3 文件上传接口

**1. 上传文件**

```http
POST /api/v1/files/upload
Content-Type: multipart/form-data
Authorization: Bearer {token}
```

**请求参数**：

| 参数名 | 类型 | 必填 | 说明 |
|-------|------|------|------|
| file | File | 是 | 文件 |
| category | String | 否 | 文件分类 |

**响应示例**：

```json
{
  "code": 200,
  "message": "上传成功",
  "data": {
    "fileId": "FILE_20260129123456",
    "fileName": "合同.pdf",
    "fileSize": 1024000,
    "fileType": "application/pdf",
    "url": "https://files.example.com/contracts/FILE_20260129123456.pdf",
    "thumbnailUrl": "https://files.example.com/thumbnails/FILE_20260129123456.jpg"
  },
  "timestamp": 1711707873000
}
```

---

## 六、接口文档方案

### 6.1 Swagger/OpenAPI集成

**技术选型**：SpringDoc OpenAPI 3

**依赖配置**：

```xml
<dependency>
    <groupId>org.springdoc</groupId>
    <artifactId>springdoc-openapi-starter-webmvc-ui</artifactId>
    <version>2.3.0</version>
</dependency>
```

**配置类**：

```java
@Configuration
public class OpenApiConfig {
    
    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
            .info(new Info()
                .title("制造业CRM系统API文档")
                .version("v1.0")
                .description("提供客户管理、销售管理、订单管理等功能的RESTful API")
                .contact(new Contact()
                    .name("开发团队")
                    .email("dev@crm.com")))
            .servers(List.of(
                new Server().url("http://localhost:9000/api/v1").description("开发环境"),
                new Server().url("https://api.crm.com/api/v1").description("生产环境")
            ))
            .components(new Components()
                .addSecuritySchemes("Bearer", 
                    new SecurityScheme()
                        .type(SecurityScheme.Type.HTTP)
                        .scheme("bearer")
                        .bearerFormat("JWT")));
    }
    
    @Bean
    public GroupedOpenApi publicApi() {
        return GroupedOpenApi.builder()
            .group("公共接口")
            .pathsToMatch("/api/v1/public/**")
            .build();
    }
    
    @Bean
    public GroupedOpenApi customerApi() {
        return GroupedOpenApi.builder()
            .group("客户管理")
            .pathsToMatch("/api/v1/customers/**", "/api/v1/contacts/**")
            .build();
    }
    
    @Bean
    public GroupedOpenApi salesApi() {
        return GroupedOpenApi.builder()
            .group("销售管理")
            .pathsToMatch("/api/v1/sales/**", "/api/v1/opportunities/**", "/api/v1/followups/**")
            .build();
    }
}
```

**访问地址**：
- Swagger UI: `http://localhost:9000/swagger-ui.html`
- OpenAPI JSON: `http://localhost:9000/v3/api-docs`

### 6.2 接口注解规范

**Controller注解示例**：

```java
@RestController
@RequestMapping("/api/v1/customers")
@Tag(name = "客户管理", description = "客户档案管理相关接口")
@RequiredArgsConstructor
public class CustomerController {
    
    private final CustomerService customerService;
    
    @Operation(summary = "获取客户列表", description = "分页查询客户列表，支持多条件筛选")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "查询成功"),
        @ApiResponse(responseCode = "400", description = "参数错误")
    })
    @GetMapping
    public Result<PageResult<CustomerVO>> getCustomers(
        @Parameter(description = "页码", example = "1")
        @RequestParam(defaultValue = "1") Integer page,
        
        @Parameter(description = "每页数量", example = "20")
        @RequestParam(defaultValue = "20") Integer size,
        
        @Parameter(description = "搜索关键词")
        @RequestParam(required = false) String keyword,
        
        @Parameter(description = "客户等级")
        @RequestParam(required = false) String level,
        
        @Parameter(description = "资源池类型")
        @RequestParam(required = false) String poolType
    ) {
        PageResult<CustomerVO> result = customerService.getCustomers(page, size, keyword, level, poolType);
        return Result.success(result);
    }
    
    @Operation(summary = "创建客户", description = "创建新客户档案")
    @PostMapping
    public Result<Long> createCustomer(
        @Parameter(description = "客户信息", required = true)
        @RequestBody @Valid CustomerDTO customerDTO
    ) {
        Long customerId = customerService.createCustomer(customerDTO);
        return Result.success(customerId);
    }
    
    @Operation(summary = "获取客户详情", description = "根据客户ID获取详细信息")
    @GetMapping("/{id}")
    public Result<CustomerDetailVO> getCustomer(
        @Parameter(description = "客户ID", required = true)
        @PathVariable Long id
    ) {
        CustomerDetailVO customer = customerService.getCustomerById(id);
        return Result.success(customer);
    }
    
    @Operation(summary = "更新客户", description = "更新客户信息")
    @PutMapping("/{id}")
    public Result<Void> updateCustomer(
        @Parameter(description = "客户ID", required = true)
        @PathVariable Long id,
        
        @Parameter(description = "客户信息", required = true)
        @RequestBody @Valid CustomerDTO customerDTO
    ) {
        customerService.updateCustomer(id, customerDTO);
        return Result.success();
    }
    
    @Operation(summary = "删除客户", description = "删除客户（软删除）")
    @DeleteMapping("/{id}")
    public Result<Void> deleteCustomer(
        @Parameter(description = "客户ID", required = true)
        @PathVariable Long id
    ) {
        customerService.deleteCustomer(id);
        return Result.success();
    }
    
    @Operation(summary = "批量导入客户", description = "通过Excel批量导入客户数据")
    @PostMapping("/import")
    public Result<ImportResultVO> importCustomers(
        @Parameter(description = "Excel文件", required = true)
        @RequestParam("file") MultipartFile file
    ) {
        ImportResultVO result = customerService.importCustomers(file);
        return Result.success(result);
    }
}
```

**DTO注解示例**：

```java
@Data
@Schema(description = "客户信息DTO")
public class CustomerDTO {
    
    @Schema(description = "企业名称", required = true, example = "某某纸业有限公司")
    @NotBlank(message = "企业名称不能为空")
    @Length(max = 200, message = "企业名称长度不能超过200字符")
    private String companyName;
    
    @Schema(description = "统一社会信用代码", example = "91330000XXXXXXXXXX")
    @Pattern(regexp = "^[0-9A-HJ-NPQ-RTUW-Y]{18}$", message = "信用代码格式错误")
    private String creditCode;
    
    @Schema(description = "注册资本", example = "5000000.00")
    @DecimalMin(value = "0", message = "注册资本不能小于0")
    private BigDecimal registeredCapital;
    
    @Schema(description = "成立日期", example = "2010-05-01")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate establishedDate;
    
    @Schema(description = "企业类型", example = "有限责任公司")
    private String companyType;
    
    @Schema(description = "经营范围", example = "纸品制造、销售")
    private String businessScope;
    
    @Schema(description = "注册地址")
    private String registeredAddress;
    
    @Schema(description = "一级行业", example = "制造业")
    private String industryL1;
    
    @Schema(description = "二级行业", example = "纸品")
    private String industryL2;
    
    @Schema(description = "三级行业", example = "包装纸")
    private String industryL3;
    
    @Schema(description = "企业规模", example = "中型", enum = { "小微", "中小", "大型" })
    private String companyScale;
    
    @Schema(description = "供应链位置", example = "生产")
    private String supplyChainPosition;
    
    @Schema(description = "业务类型", example = "OEM")
    private String businessType;
    
    @Schema(description = "客户等级", example = "A", enum = { "A", "B", "C" })
    private String customerLevel;
    
    @Schema(description = "负责人ID", example = "1001")
    private Long ownerId;
    
    @Schema(description = "备注")
    private String remark;
}
```

### 6.3 接口测试方案

**工具选择**：
- **Postman**：手动测试、接口集合、环境变量
- **Swagger UI**：在线测试、文档查看
- **JUnit + MockMvc**：单元测试、集成测试

**Postman Collection结构**：

```
CRM API Collection
├── 公共接口
│   ├── 登录
│   ├── 刷新Token
│   └── 退出登录
├── 客户管理
│   ├── 获取客户列表
│   ├── 创建客户
│   ├── 获取客户详情
│   ├── 更新客户
│   ├── 删除客户
│   └── 批量导入客户
├── 销售管理
│   ├── 销售漏斗
│   ├── 获取商机列表
│   ├── 创建商机
│   └── 更新商机状态
└── 文件管理
    ├── 上传文件
    ├── 下载文件
    └── 删除文件
```

---

## 七、测试策略

### 7.1 关于MCP的说明

**MCP (Model Context Protocol) 是什么？**

MCP是OpenAI提出的一种协议，用于在LLM（大语言模型）和外部工具/数据源之间建立标准化的连接。它**不是测试工具**，而是一种**协议标准**，用于：

1. **模型工具调用**：让LLM能够调用外部API和工具
2. **上下文管理**：管理LLM与外部系统的数据交互
3. **能力扩展**：为LLM提供访问外部系统的能力

**MCP在项目中的应用场景**：

如果我们的CRM系统需要集成AI能力（如智能推荐、自动生成标签等），可以考虑使用MCP协议，但：

- **MCP不是测试工具**：不用于自动化测试
- **MCP是可选的**：当前项目可以不使用MCP
- **MCP用于AI集成**：如果需要集成LLM能力时再考虑

**测试工具推荐**：

| 测试类型 | 推荐工具 | 说明 |
|---------|---------|------|
| **单元测试** | JUnit 5 + Mockito | Java后端单元测试 |
| **集成测试** | Spring Boot Test + TestContainers | 集成测试，包含真实数据库 |
| **API测试** | Postman + Newman | 接口测试和自动化 |
| **前端测试** | Vitest + Vue Test Utils | Vue组件测试 |
| **E2E测试** | Playwright / Cypress | 端到端测试 |
| **性能测试** | JMeter / Gatling | 性能压力测试 |

### 7.2 测试分层策略

```
┌────────────────────────────────────────────────────────┐
│                  E2E测试 (5%)                          │
│        Playwright - 完整业务流程验证                   │
└────────────────────────────────────────────────────────┘
                          │
┌────────────────────────────────────────────────────────┐
│               集成测试 (30%)                           │
│      TestContainers - API + 数据库集成验证             │
└────────────────────────────────────────────────────────┘
                          │
┌────────────────────────────────────────────────────────┐
│                单元测试 (65%)                          │
│       JUnit + Mockito - 业务逻辑单元验证               │
└────────────────────────────────────────────────────────┘
```

### 7.3 测试覆盖率目标

| 测试类型 | 覆盖率目标 | 说明 |
|---------|-----------|------|
| **单元测试** | ≥80% | 核心业务逻辑覆盖率 |
| **集成测试** | ≥60% | API接口覆盖率 |
| **E2E测试** | 核心流程 | 关键业务流程100%覆盖 |

### 7.4 测试环境规划

| 环境 | 用途 | 端口 | 数据库 |
|-----|------|------|-------|
| **开发环境** | 本地开发 | 3000/9000 | H2内存数据库 |
| **测试环境** | 自动化测试 | 9001 | MySQL测试库 |
| **预发布环境** | 预发布验证 | 9002 | MySQL预发布库 |
| **生产环境** | 正式运行 | 9003 | MySQL生产库 |

---

## 八、部署架构

### 8.1 Docker Compose部署方案

**docker-compose.yml**：

```yaml
version: '3.8'

services:
  # 前端
  crm-frontend:
    image: crm-frontend:latest
    container_name: crm-frontend
    ports:
      - "3000:80"
    depends_on:
      - crm-gateway

  # 网关
  crm-gateway:
    image: crm-gateway:latest
    container_name: crm-gateway
    ports:
      - "9000:9000"
    environment:
      - NACOS_SERVER_ADDR=nacos:8848
    depends_on:
      - nacos

  # 客户服务
  crm-customer-service:
    image: crm-customer-service:latest
    container_name: crm-customer-service
    ports:
      - "8001:8001"
    environment:
      - NACOS_SERVER_ADDR=nacos:8848
      - MYSQL_HOST=mysql
      - REDIS_HOST=redis
    depends_on:
      - nacos
      - mysql
      - redis

  # 销售服务
  crm-sales-service:
    image: crm-sales-service:latest
    container_name: crm-sales-service
    ports:
      - "8002:8002"
    environment:
      - NACOS_SERVER_ADDR=nacos:8848
      - MYSQL_HOST=mysql
      - REDIS_HOST=redis
    depends_on:
      - nacos
      - mysql
      - redis

  # 订单服务
  crm-order-service:
    image: crm-order-service:latest
    container_name: crm-order-service
    ports:
      - "8003:8003"
    environment:
      - NACOS_SERVER_ADDR=nacos:8848
      - MYSQL_HOST=mysql
      - REDIS_HOST=redis
    depends_on:
      - nacos
      - mysql
      - redis

  # Nacos
  nacos:
    image: nacos/nacos-server:v2.3.0
    container_name: nacos
    ports:
      - "8848:8848"
    environment:
      - MODE=standalone

  # MySQL
  mysql:
    image: mysql:8.0
    container_name: mysql
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=root123
      - MYSQL_DATABASE=crm_db
    volumes:
      - mysql-data:/var/lib/mysql

  # Redis
  redis:
    image: redis:7.2-alpine
    container_name: redis
    ports:
      - "6379:6379"
    volumes:
      - redis-data:/data

  # RabbitMQ
  rabbitmq:
    image: rabbitmq:3.12-management
    container_name: rabbitmq
    ports:
      - "5672:5672"
      - "15672:15672"
    environment:
      - RABBITMQ_DEFAULT_USER=admin
      - RABBITMQ_DEFAULT_PASS=admin123

  # Elasticsearch
  elasticsearch:
    image: elasticsearch:8.11.0
    container_name: elasticsearch
    ports:
      - "9200:9200"
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false
    volumes:
      - es-data:/usr/share/elasticsearch/data

  # MinIO
  minio:
    image: minio/minio:latest
    container_name: minio
    ports:
      - "9002:9000"
      - "9001:9001"
    environment:
      - MINIO_ROOT_USER=admin
      - MINIO_ROOT_PASSWORD=admin123
    command: server /data --console-address ":9001"
    volumes:
      - minio-data:/data

volumes:
  mysql-data:
  redis-data:
  es-data:
  minio-data:
```

### 8.2 部署命令

```bash
# 启动所有服务
docker-compose up -d

# 查看服务状态
docker-compose ps

# 查看日志
docker-compose logs -f crm-gateway

# 停止所有服务
docker-compose down

# 停止并删除数据卷
docker-compose down -v
```

### 8.3 CI/CD流程

**GitLab CI/CD示例**：

```yaml
# .gitlab-ci.yml
stages:
  - build
  - test
  - deploy

# 构建阶段
build-frontend:
  stage: build
  image: node:20
  script:
    - cd frontend
    - npm install
    - npm run build
    - docker build -t crm-frontend:latest .
  only:
    - main
    - develop

build-backend:
  stage: build
  image: maven:3.9-eclipse-temurin-17
  script:
    - cd backend
    - mvn clean package -DskipTests
    - docker build -t crm-gateway:latest ./gateway
    - docker build -t crm-customer-service:latest ./customer-service
    - docker build -t crm-sales-service:latest ./sales-service
  only:
    - main
    - develop

# 测试阶段
test-backend:
  stage: test
  image: maven:3.9-eclipse-temurin-17
  services:
    - mysql:8.0
    - redis:7.2-alpine
  variables:
    MYSQL_HOST: mysql
    REDIS_HOST: redis
  script:
    - cd backend
    - mvn test
  coverage: '/Total.*?([0-9]{1,3})%/'
  artifacts:
    reports:
      coverage_report:
        coverage_format: cobertura
        path: target/site/jacoco/jacoco.xml
  only:
    - main
    - develop

# 部署阶段
deploy-dev:
  stage: deploy
  image: docker:24
  services:
    - docker:24-dind
  script:
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker-compose -f docker-compose.dev.yml up -d
  only:
    - develop
  when: manual

deploy-prod:
  stage: deploy
  image: docker:24
  services:
    - docker:24-dind
  script:
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker-compose -f docker-compose.prod.yml up -d
  only:
    - main
  when: manual
```

---

## 九、总结

### 9.1 技术架构核心要点

1. **前端技术栈**：Vue 3 + TypeScript + Vite + Element Plus
2. **后端技术栈**：Spring Boot 3.x + Spring Cloud Alibaba + MyBatis Plus
3. **统一端口规划**：
   - 前端开发：3000
   - 后端网关：9000
   - 数据库：3306（MySQL）、6379（Redis）
4. **微服务划分**：8个核心服务，端口8001-8008
5. **数据库设计**：15+核心表，完整的审计字段
6. **接口规范**：RESTful + Swagger/OpenAPI文档
7. **测试策略**：单元测试65% + 集成测试30% + E2E测试5%

### 9.2 下一步行动

1. **环境准备**：配置开发环境（JDK 17、Node 20、Docker）
2. **项目初始化**：创建前端和后端项目骨架
3. **数据库初始化**：执行建表SQL脚本
4. **基础功能开发**：完成用户认证和客户管理核心功能
5. **接口文档编写**：配置Swagger，完善API文档
6. **测试用例编写**：编写单元测试和集成测试

### 9.3 关键注意事项

1. **端口管理**：严格遵守端口规划，避免冲突
2. **接口规范**：统一使用RESTful风格，遵循命名规范
3. **数据安全**：敏感信息加密存储，使用HTTPS传输
4. **性能优化**：合理使用缓存，数据库索引优化
5. **代码质量**：代码审查、单元测试、代码规范检查

---

**文档结束**
