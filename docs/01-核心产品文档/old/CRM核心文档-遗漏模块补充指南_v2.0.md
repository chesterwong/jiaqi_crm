# CRM核心文档-遗漏模块补充指南（v2.0）

> **版本**: v2.0（补充版）  
> **日期**: 2026-04-25  
> **目标**: 补充3份核心文档遗漏的模块（工作流引擎、发票管理、订单生产跟踪等）  
> **适用范围**: CRM核心-代码生成器使用指南 + CRM核心-开发任务执行清单 + CRM核心-完整数据库表结构与模块映射  
> **依据**: CRM核心文档深度分析与任务清单补充方案（2026-04-25）

---

## 📌 重要说明

本补充文档是对3份CRM核心文档的**增量补充**,不是替代原文档。原文档的核心内容保持不变,本文档补充以下内容:

1. ✅ **工作流引擎模块**（5张表）- 原核心文档遗漏
2. ✅ **发票管理模块**（2张表）- 原商务合同模块不完整
3. ✅ **订单生产跟踪** - 原有文档只提到订单,缺少生产跟踪细节
4. ✅ **自定义界面开发指南** - 原代码生成器指南缺少
5. ✅ **数据权限过滤器** - 所有业务表必须实现

---

## 一、工作流引擎模块（5张表）⭐新增

### 1.1 表结构清单

| 表名 | 功能说明 | 表类型 | 关联主表 | 优先级 |
|------|---------|-------|---------|-------|
| crm_workflow_rules | 工作流规则表 | **核心主表** | - | P0 |
| crm_workflow_approvals | 工作流审批表 | 从表 | crm_workflow_rules | P0 |
| crm_workflow_logs | 工作流日志表 | 从表 | crm_workflow_rules | P0 |
| crm_workflow_actions | 工作流动作表 | 从表 | crm_workflow_rules | P0 |
| crm_workflow_triggers | 工作流触发器表 | 从表 | crm_workflow_rules | P0 |

### 1.2 业务场景

**场景1: 报价单审批流**
```
销售提交报价单（>10万）
  ↓ 触发工作流规则
主管审批（<20万）/经理审批（20-50万）/总经理审批（>50万）
  ↓ 审批通过
报价单状态变更为"已批准"
  ↓ 触发动作
自动发送邮件通知销售
```

**场景2: 合同变更审批流**
```
销售发起合同变更申请
  ↓ 触发工作流规则
影响评估（金额变化>10%需财务审批）
  ↓ 分级审批
部门经理→财务总监→总经理
  ↓ 审批通过
合同版本+1，记录变更历史
```

**场景3: 客户自动回收规则**
```
定时任务每日扫描
  ↓ 触发条件
客户30天无跟进记录
  ↓ 执行动作
自动移入公海池
  ↓ 记录日志
记录回收原因、时间、操作人
```

### 1.3 详细任务清单（42项任务）

#### 1.3.1 工作流规则配置（crm_workflow_rules）- 12项任务

| 序号 | 任务名称 | 技术实现 | 验收标准 | 优先级 | 备注 |
|------|---------|---------|---------|-------|------|
| 1 | 工作流规则列表API | GET /api/workflow-rules，分页筛选 | 加载<2秒 | P0 | 框架固定布局 |
| 2 | 创建规则API | POST /api/workflow-rules，配置触发条件+执行动作 | 规则校验完整 | P0 | - |
| 3 | 更新规则API | PUT /api/workflow-rules/{id}，禁用状态可编辑 | 编辑流畅 | P0 | - |
| 4 | 删除规则API | DELETE /api/workflow-rules/{id}，软删除 | 可恢复 | P0 | - |
| 5 | **触发条件配置器** | 4种类型：字段变更/状态变更/定时/自定义事件 | 配置灵活 | P0 | **需自定义** |
| 6 | **执行动作配置器** | 6种类型：状态变更/通知/审批/字段更新/调用API/创建任务 | 动作可组合 | P0 | **需自定义** |
| 7 | 规则启用/禁用 | PATCH /api/workflow-rules/{id}/toggle | 即时生效 | P0 | - |
| 8 | 规则优先级设置 | 数字越小优先级越高 | 排序准确 | P0 | - |
| 9 | **规则冲突检测** | 检测相同触发条件的规则，提示冲突 | 检测准确 | P1 | **需自定义算法** |
| 10 | 规则复制 | 复制现有规则生成新草稿 | 复制完整 | P1 | - |
| 11 | 规则导入导出 | Excel导入规则配置 | 导入<5秒 | P1 | - |
| 12 | 规则数据权限 | 管理员只能管理有权限的规则 | 数据隔离100% | P0 | - |

#### 1.3.2 审批流引擎（crm_workflow_approvals）- 14项任务

| 序号 | 任务名称 | 技术实现 | 验收标准 | 优先级 | 备注 |
|------|---------|---------|---------|-------|------|
| 1 | **审批节点配置** | 支持串行/并行/条件分支 | 配置灵活 | P0 | **需自定义** |
| 2 | **审批人分配规则** | 指定人员/角色/部门负责人/动态计算 | 分配准确 | P0 | **需自定义** |
| 3 | 审批列表API | GET /api/workflow-approvals，按状态/申请人筛选 | 加载<2秒 | P0 | - |
| 4 | 审批详情API | 含审批流程、当前节点、历史记录 | 详情完整 | P0 | - |
| 5 | **审批操作API** | POST /api/workflow-approvals/{id}/action，通过/拒绝/转交 | 操作记录完整 | P0 | **需自定义** |
| 6 | 审批意见必填 | 拒绝时必须填写原因 | 校验准确 | P0 | - |
| 7 | 审批附件上传 | 支持上传相关文件 | 上传流畅 | P1 | - |
| 8 | **审批超时升级** | 超时24h提醒/48h升级/72h自动通过 | 升级准确 | P0 | **需自定义** |
| 9 | 审批提醒通知 | 待审批消息+邮件+钉钉提醒 | 通知到达率>95% | P0 | - |
| 10 | **审批流程可视化** | 流程图展示当前节点和历史路径 | 流程图直观 | P0 | **需自定义ECharts** |
| 11 | 审批委托 | 审批人出差时可委托他人 | 委托流程完整 | P1 | - |
| 12 | 审批撤回 | 申请人可撤回待审批的申请 | 撤回安全 | P1 | - |
| 13 | 审批统计API | 按时间段/部门/审批人统计审批数量、通过率 | 统计准确 | P1 | - |
| 14 | 审批数据权限 | 申请人/审批人/主管可见 | 数据隔离100% | P0 | - |

#### 1.3.3 工作流日志（crm_workflow_logs）- 8项任务

| 序号 | 任务名称 | 技术实现 | 验收标准 | 优先级 | 备注 |
|------|---------|---------|---------|-------|------|
| 1 | 日志记录服务 | 统一日志记录服务，各模块调用 | 记录完整率100% | P0 | - |
| 2 | 日志列表API | GET /api/workflow-logs，按规则/时间筛选 | 加载<2秒 | P0 | - |
| 3 | 日志详情API | 含触发条件、执行动作、执行结果 | 详情完整 | P0 | - |
| 4 | 日志不可删除 | 日志记录禁止修改/删除 | 数据完整性100% | P0 | - |
| 5 | 日志导出 | 导出日志为Excel | 导出<5秒 | P1 | - |
| 6 | 失败日志告警 | 执行失败时发送告警通知 | 告警及时 | P0 | - |
| 7 | 日志统计分析 | 按规则/时间统计触发次数、成功率 | 统计准确 | P1 | - |
| 8 | 日志归档 | 90天前的日志自动归档 | 归档安全 | P1 | 定时任务 |

#### 1.3.4 工作流动作（crm_workflow_actions）- 4项任务

| 序号 | 任务名称 | 技术实现 | 验收标准 | 优先级 | 备注 |
|------|---------|---------|---------|-------|------|
| 1 | 动作类型定义 | STATUS_CHANGE/NOTIFICATION/APPROVAL等6种 | 类型可扩展 | P0 | - |
| 2 | 动作执行引擎 | 根据配置执行对应动作 | 执行准确率100% | P0 | - |
| 3 | 动作失败重试 | 失败后重试3次，间隔5分钟 | 重试机制完整 | P0 | - |
| 4 | 自定义动作扩展 | 支持注册自定义动作处理器 | 扩展灵活 | P1 | - |

#### 1.3.5 工作流触发器（crm_workflow_triggers）- 4项任务

| 序号 | 任务名称 | 技术实现 | 验收标准 | 优先级 | 备注 |
|------|---------|---------|---------|-------|------|
| 1 | 触发器类型定义 | FIELD_CHANGE/STATUS_CHANGE/SCHEDULED/CUSTOM_EVENT | 类型可扩展 | P0 | - |
| 2 | **定时触发器** | APScheduler配置cron表达式 | 执行准确 | P0 | **需自定义** |
| 3 | 事件触发器 | 监听业务事件（如创建客户、更新商机） | 事件监听完整 | P0 | - |
| 4 | 触发器条件过滤 | 支持条件表达式（如customer.level == 'A'） | 过滤准确 | P0 | - |

### 1.4 工作流引擎开发指南

#### Step 1: 创建规则配置界面

```vue
<!-- views/workflow/WorkflowRules.vue -->
<template>
  <div>
    <el-card>
      <template #header>工作流规则配置</template>
      <el-form :model="ruleForm">
        <el-form-item label="规则名称">
          <el-input v-model="ruleForm.name" />
        </el-form-item>
        
        <!-- 触发条件配置 -->
        <el-form-item label="触发条件">
          <el-select v-model="ruleForm.trigger_type">
            <el-option label="字段变更" value="FIELD_CHANGE" />
            <el-option label="状态变更" value="STATUS_CHANGE" />
            <el-option label="定时触发" value="SCHEDULED" />
          </el-select>
        </el-form-item>
        
        <!-- 执行动作配置 -->
        <el-form-item label="执行动作">
          <el-checkbox-group v-model="ruleForm.actions">
            <el-checkbox label="STATUS_CHANGE">状态变更</el-checkbox>
            <el-checkbox label="NOTIFICATION">发送通知</el-checkbox>
            <el-checkbox label="APPROVAL">发起审批</el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>
```

#### Step 2: 审批流引擎实现

```python
# services/workflow_engine.py

class WorkflowEngine:
    """工作流引擎"""
    
    async def execute_rule(self, rule_id: int, context: dict):
        """执行工作流规则"""
        # 1. 获取规则配置
        rule = await self.get_rule(rule_id)
        
        # 2. 检查触发条件
        if not self.check_trigger(rule.trigger, context):
            return
        
        # 3. 执行动作
        for action in rule.actions:
            await self.execute_action(action, context)
            
        # 4. 记录日志
        await self.log_execution(rule_id, context)
    
    async def execute_action(self, action: WorkflowAction, context: dict):
        """执行工作流动作"""
        if action.type == "STATUS_CHANGE":
            await self.change_status(action.config, context)
        elif action.type == "NOTIFICATION":
            await self.send_notification(action.config, context)
        elif action.type == "APPROVAL":
            await self.start_approval(action.config, context)
```

#### Step 3: 数据权限过滤实现

```python
# repositories/base_repository.py

class BaseRepository:
    """基础数据仓库（所有业务表继承）"""
    
    async def get_list(self, filters: dict, user: User):
        """获取列表（自动应用数据权限过滤）"""
        query = self.model.select()
        
        # 数据权限过滤
        if user.role == "sales":
            # 销售只能看自己的数据
            query = query.where(self.model.owner_id == user.id)
        elif user.role == "manager":
            # 经理看本部门的数据
            query = query.where(self.model.department_id == user.department_id)
        # 管理员看全部数据
        
        # 应用其他筛选条件
        for key, value in filters.items():
            query = query.where(getattr(self.model, key) == value)
            
        return await self.db.execute(query)
```

---

## 二、发票管理模块补充（2张表）

### 2.1 表结构清单

> ⚠️ 原商务合同模块遗漏发票管理独立主表

| 表名 | 功能说明 | 表类型 | 关联主表 | 优先级 |
|------|---------|-------|---------|-------|
| crm_invoices | 发票表 | **独立主表** | - | P0 |
| crm_invoice_payments | 发票回款关联表 | 从表 | crm_invoices | P0 |

### 2.2 发票业务流程

```
回款确认
  ↓ 触发发票申请
销售申请开票（填写发票类型、金额）
  ↓ 财务审核
财务审核通过，录入发票号码
  ↓ 发票开具
开具发票（纸质/电子）
  ↓ 发票邮寄
录入快递信息
  ↓ 客户签收
客户确认签收
  ↓ 发票归档
存储发票PDF
```

### 2.3 详细任务清单（16项任务）

| 序号 | 任务名称 | 对应表 | 技术实现 | 验收标准 | 优先级 | 备注 |
|------|---------|--------|---------|---------|-------|------|
| 1 | **发票申请** | crm_invoices | POST /api/invoices/apply | 申请流程完整 | P0 | **新补充** |
| 2 | **发票开具** | crm_invoices | POST /api/invoices/{id}/issue | 开具记录完整 | P0 | **新补充** |
| 3 | **发票类型管理** | crm_invoices | SPECIAL(13%)/NORMAL(3%)/ELECTRONIC | 类型可配置 | P0 | **新补充** |
| 4 | **发票邮寄** | crm_invoices | POST /api/invoices/{id}/ship | 邮寄记录完整 | P0 | **新补充** |
| 5 | **发票签收** | crm_invoices | POST /api/invoices/{id}/sign | 签收确认 | P0 | **新补充** |
| 6 | **发票红冲** | crm_invoices | POST /api/invoices/{id}/void | 红冲流程完整 | P0 | **需自定义** |
| 7 | **发票归档** | crm_invoices | 存储PDF，支持下载 | 归档安全 | P0 | - |
| 8 | 客户发票查询 | crm_invoices | GET /api/invoices/customer/{id} | 查询流畅 | P1 | - |
| 9 | **发票金额校验** | crm_invoices | 累计开票≤已回款 | 校验准确 | P0 | **需自定义** |
| 10 | 发票统计 | crm_invoices | 按时间段统计开票金额 | 统计准确 | P1 | - |
| 11 | 发票导出 | crm_invoices | 导出发票清单 | 导出<5秒 | P1 | - |
| 12 | 电子发票开具 | crm_invoices | 对接百望云平台 | 集成成功 | P2 | 第三方API |
| 13 | 发票影像附件 | crm_invoices | 上传发票PDF/图片 | 上传流畅 | P1 | - |
| 14 | 发票数据权限 | crm_invoices | 财务只能看有权限的发票 | 数据隔离100% | P0 | - |
| 15 | 发票列表API | crm_invoices | GET /api/invoices | 加载<2秒 | P0 | - |
| 16 | 发票审批流 | crm_invoices | 大额发票需审批 | 审批流完整 | P1 | **需自定义** |

---

## 三、订单生产跟踪补充（⚠️ 原任务清单遗漏）

### 3.1 制造业订单生产流程

```
合同签署
  ↓ 创建订单
订单确认（DRAFT→CONFIRMED）
  ↓ 排产
生产开始（PRODUCTION，记录进度0%-100%）
  ↓ 质检
质量检验（QUALITY_CHECK）
  ↓ 发货
发货出库（SHIPPING）
  ↓ 交付
客户签收（COMPLETED）
```

### 3.2 订单状态机定义

| 状态 | 说明 | 前置状态 | 后置状态 | 操作人 |
|------|------|---------|---------|-------|
| DRAFT | 草稿 | - | CONFIRMED | 销售 |
| CONFIRMED | 已确认 | DRAFT | PRODUCTION | 生产主管 |
| PRODUCTION | 生产中 | CONFIRMED | QUALITY_CHECK | 生产人员 |
| QUALITY_CHECK | 质检中 | PRODUCTION | SHIPPING | 质检员 |
| SHIPPING | 发货中 | QUALITY_CHECK | COMPLETED | 仓库人员 |
| COMPLETED | 已完成 | SHIPPING | - | 系统 |
| CANCELLED | 已取消 | 任意状态 | - | 管理员 |

### 3.3 详细任务清单（20项任务）

| 序号 | 任务名称 | 对应表 | 技术实现 | 验收标准 | 优先级 | 备注 |
|------|---------|--------|---------|---------|-------|------|
| 1 | 订单列表API | crm_orders | GET /api/orders，按状态/客户/合同筛选 | 加载<2秒 | P0 | **已补充到任务清单** |
| 2 | 订单详情API | crm_orders | 含基本信息、产品明细、交货记录 | 加载<2秒 | P0 | - |
| 3 | **从合同创建订单** | crm_orders | 合同签署后一键生成 | 转换完整 | P0 | **需自定义** |
| 4 | 手动创建订单 | crm_orders | 独立创建，关联合同 | 创建流畅 | P0 | - |
| 5 | **订单状态流转** | crm_orders | 状态机控制 | 流转正确 | P0 | **需自定义** |
| 6 | **生产进度跟踪** | crm_orders | 记录进度0%-100% | 进度准确 | P0 | **需自定义** |
| 7 | **分批交货管理** | crm_deliveries | 支持多次交货 | 交货记录完整 | P0 | **需自定义** |
| 8 | 订单变更审批 | crm_orders | 变更数量/规格/交期需审批 | 审批流完整 | P0 | **需自定义** |
| 9 | **交期预警** | crm_orders | 7天/3天/1天自动预警 | 预警准确 | P0 | **需自定义** |
| 10 | **订单进度看板** | crm_orders | ECharts进度图 | 看板直观 | P1 | **需自定义ECharts** |
| 11 | 订单关联发货 | crm_orders+crm_deliveries | 发货时选择订单 | 扣减准确 | P0 | - |
| 12 | 订单质检记录 | crm_orders | 记录质检结果 | 记录完整 | P1 | - |
| 13 | **订单异常处理** | crm_orders | 生产异常/延期/质量问题 | 处理流程完整 | P0 | **需自定义** |
| 14 | 订单客户通知 | crm_orders | 状态变更自动通知 | 通知到达率>95% | P0 | - |
| 15 | 订单打印 | crm_orders | 生成标准订单PDF | 打印格式正确 | P1 | - |
| 16 | 订单批量导入 | crm_orders | Excel导入 | 导入<5秒 | P1 | - |
| 17 | 订单导出 | crm_orders | 导出订单明细 | 导出<5秒 | P1 | - |
| 18 | 订单统计API | crm_orders | 按时间段统计订单金额、交付率 | 统计准确 | P1 | - |
| 19 | 订单数据权限 | crm_orders | 销售只能看自己的订单 | 数据隔离100% | P0 | - |
| 20 | **订单成本核算** | crm_orders | 记录生产成本，计算毛利 | 计算准确 | P2 | - |

---

## 四、自定义界面开发指南（⭐新增）

### 4.1 框架固定布局限制

vue-fastapi-admin框架提供的固定布局：
- ✅ 标准列表页（表格+分页+搜索）
- ✅ 标准表单页（新增/编辑）
- ✅ 标准详情页（字段展示）
- ❌ **不支持**自定义复杂布局
- ❌ **不支持**多Tab视图
- ❌ **不支持**拖拽看板
- ❌ **不支持**图表可视化

### 4.2 P0级自定义界面（8个，必须开发）

| 序号 | 模块名称 | 技术方案 | 预估人天 | 开发指南 |
|------|---------|---------|---------|---------|
| 1 | **客户360°详情页** | Vue3 Tabs + 右侧概览卡片 + 时间线组件 | 5天 | 见下方示例 |
| 2 | **销售漏斗看板** | ECharts漏斗图 + Vue Draggable拖拽 | 4天 | 需自定义 |
| 3 | **报价单创建向导** | Vue3 Steps组件 + 3步表单 | 3天 | 需自定义 |
| 4 | **合同执行进度看板** | ECharts甘特图 + 双进度条 | 4天 | 需自定义 |
| 5 | **客户健康度监控页** | ECharts雷达图 + 趋势图 | 3天 | 需自定义 |
| 6 | **联系人关系图谱** | ECharts Graph决策链 | 3天 | 需自定义 |
| 7 | **交付进度看板** | ECharts时间轴 + 进度图 | 3天 | 需自定义 |
| 8 | **发票管理流程页** | Vue3流程图组件 | 2天 | 需自定义 |

### 4.3 客户360°详情页开发示例

```vue
<!-- views/customer/CustomerDetail.vue -->
<template>
  <div class="customer-detail">
    <el-row :gutter="20">
      <!-- 左侧：多Tab视图 -->
      <el-col :span="18">
        <el-tabs v-model="activeTab">
          <el-tab-pane label="基本信息" name="basic">
            <CustomerBasic :customer="customer" />
          </el-tab-pane>
          <el-tab-pane label="联系人" name="contacts">
            <ContactList :customer-id="customerId" />
          </el-tab-pane>
          <el-tab-pane label="动态时间线" name="timeline">
            <CustomerTimeline :customer-id="customerId" />
          </el-tab-pane>
          <el-tab-pane label="报价单" name="quotations">
            <QuotationList :customer-id="customerId" />
          </el-tab-pane>
          <el-tab-pane label="合同" name="contracts">
            <ContractList :customer-id="customerId" />
          </el-tab-pane>
        </el-tabs>
      </el-col>
      
      <!-- 右侧：概览卡片 -->
      <el-col :span="6">
        <el-card class="overview-card">
          <template #header>客户概览</template>
          <div class="overview-item">
            <span>客户等级：</span>
            <el-tag>{{ customer.level }}</el-tag>
          </div>
          <div class="overview-item">
            <span>健康度：</span>
            <CustomerHealthScore :score="customer.health_score" />
          </div>
          <div class="overview-item">
            <span>合同金额：</span>
            <span>¥{{ customer.total_contract_amount }}</span>
          </div>
          <div class="overview-item">
            <span>回款金额：</span>
            <span>¥{{ customer.total_payment_amount }}</span>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import CustomerBasic from './components/CustomerBasic.vue'
import ContactList from './components/ContactList.vue'
import CustomerTimeline from './components/CustomerTimeline.vue'
import QuotationList from './components/QuotationList.vue'
import ContractList from './components/ContractList.vue'
import CustomerHealthScore from '@/components/CustomerHealthScore.vue'

const route = useRoute()
const customerId = route.params.id
const activeTab = ref('basic')
const customer = ref({})

onMounted(async () => {
  // 加载客户详情
  customer.value = await fetchCustomerDetail(customerId)
})
</script>

<style scoped>
.customer-detail {
  padding: 20px;
}

.overview-card {
  position: sticky;
  top: 20px;
}

.overview-item {
  margin-bottom: 15px;
  display: flex;
  justify-content: space-between;
}
</style>
```

---

## 五、数据权限过滤器实现指南（⭐新增）

### 5.1 数据权限级别

| 级别 | 说明 | 适用角色 | 实现方式 |
|------|------|---------|---------|
| 个人级 | 只能看自己的数据 | 销售 | `owner_id == user.id` |
| 部门级 | 看本部门的数据 | 部门经理 | `department_id == user.department_id` |
| 公司级 | 看全公司数据 | 总经理 | 无过滤 |
| 自定义 | 根据规则动态计算 | 特殊角色 | 自定义规则引擎 |

### 5.2 统一数据权限过滤器实现

```python
# middlewares/data_permission.py

class DataPermissionMiddleware:
    """数据权限中间件"""
    
    async def filter_query(self, query, model, user):
        """自动应用数据权限过滤"""
        
        # 管理员跳过过滤
        if user.is_superuser:
            return query
        
        # 获取用户的数据权限级别
        permission_level = await self.get_permission_level(user)
        
        if permission_level == "personal":
            # 个人级：只能看自己的数据
            if hasattr(model, 'owner_id'):
                query = query.where(model.owner_id == user.id)
                
        elif permission_level == "department":
            # 部门级：看本部门的数据
            if hasattr(model, 'department_id'):
                query = query.where(model.department_id == user.department_id)
                
        # 公司级：无过滤
        
        return query
    
    async def get_permission_level(self, user):
        """获取用户的数据权限级别"""
        # 从角色配置中读取
        role = await self.get_user_role(user)
        return role.data_permission_level
```

### 5.3 在所有业务表中应用

```python
# repositories/customer_repository.py

class CustomerRepository(BaseRepository):
    """客户数据仓库"""
    
    async def get_list(self, filters: dict, user: User):
        """获取客户列表（自动应用数据权限）"""
        query = CrmCustomer.select()
        
        # 应用数据权限过滤
        query = await self.data_permission.filter_query(query, CrmCustomer, user)
        
        # 应用其他筛选条件
        for key, value in filters.items():
            query = query.where(getattr(CrmCustomer, key) == value)
            
        return await self.db.execute(query)
```

---

## 六、补充后的完整任务统计

| 模块 | 原任务数 | 补充任务 | 最终任务 | P0任务 | P1任务 | P2任务 |
|------|---------|---------|---------|-------|-------|-------|
| 模块1：系统基础与权限 | 118 | +0 | 118 | 85 | 25 | 8 |
| 模块2：客户管理 | 152 | +28 | **180** | 128 | 38 | 14 |
| 模块3：销售管理 | 135 | +15 | **150** | 98 | 40 | 12 |
| 模块4：产品管理 | 115 | +12 | **127** | 82 | 35 | 10 |
| 模块5：营销服务 | 118 | +0 | 118 | 68 | 38 | 12 |
| 模块6：客户成功 | 125 | +8 | **133** | 68 | 50 | 15 |
| 模块7：商务合同 | 148 | +27 | **175** | 128 | 35 | 12 |
| 模块8：AI智能 | 115 | +10 | **125** | 42 | 60 | 23 |
| 模块9：数据报表 | 120 | +0 | 120 | 70 | 38 | 12 |
| 模块10：工作流引擎 | 0 | **+42** | **42** | 32 | 8 | 2 |
| 模块11：系统集成 | 108 | +0 | 108 | 52 | 42 | 14 |
| **总计** | **1254** | **+142** | **1396** | **853** | **411** | **132** |

---

## 七、关键建议

### 7.1 必须优先实现的核心功能（P0）

1. ✅ **客户360°详情页** - 销售每天使用频率最高（5天）
2. ✅ **销售漏斗看板** - 经理监控团队业绩核心工具（4天）
3. ✅ **工作流规则配置界面** - 所有自动化流程基础（6天）⭐新增
4. ✅ **订单生产跟踪** - 制造业核心需求（5天）⭐新增
5. ✅ **分批交货管理** - 制造业特色（4天）⭐新增
6. ✅ **发票红冲流程** - 财务合规要求（3天）⭐新增
7. ✅ **数据权限过滤器** - 所有业务表必须实现（4天）⭐新增

### 7.2 可以延后的增强功能（P2）

1. 名片OCR识别（P2）
2. 电子签章集成（P2）
3. 数据大屏（P2）
4. 客户关联图谱（P2）
5. 移动端适配（P2）

### 7.3 技术实现注意事项

1. ⚠️ **框架限制**：复杂界面必须自定义，不要依赖框架固定布局
2. ⚠️ **主从表关系**：严格按照代码生成器指南配置外键和relationship
3. ⚠️ **数据权限**：所有业务表必须实现行级数据权限过滤
4. ⚠️ **审计追溯**：关键操作必须记录变更日志，不可删除
5. ⚠️ **并发安全**：资源池领取、查重等需要事务锁

---

## 八、与原文档的关联

### 8.1 本文档补充的原文档位置

| 原文档 | 补充位置 | 补充内容 |
|-------|---------|---------|
| CRM核心-完整数据库表结构与模块映射 | 模块10（原为系统管理与集成） | 工作流引擎5张表 |
| CRM核心-完整数据库表结构与模块映射 | 模块7（商务合同） | 发票表2张 |
| CRM核心-开发任务执行清单 | 第8批（商务合同） | 订单生产跟踪20项 |
| CRM核心-开发任务执行清单 | 第10批（数据报表） | 工作流引擎42项 |
| CRM核心-代码生成器使用指南 | 第八部分（总结） | 自定义界面开发指南 |

### 8.2 下一步行动

1. ✅ 确认补充任务清单（本文档）
2. ⏳ 更新CRM核心-完整数据库表结构与模块映射（添加工作流模块）
3. ⏳ 更新CRM核心-开发任务执行清单（添加工作流/发票任务）
4. ⏳ 更新CRM核心-代码生成器使用指南（添加自定义界面开发指南）
5. ⏳ 按优先级排期开发

---

**文档版本**: v2.0（补充版）  
**创建日期**: 2026-04-25  
**关联文档**: 
- CRM核心-代码生成器使用指南.md
- CRM核心-开发任务执行清单.md
- CRM核心-完整数据库表结构与模块映射.md
- CRM核心文档深度分析与任务清单补充方案.md

**维护说明**: 本文档为增量补充文档，原文档核心内容保持不变。开发时以本文档+原文档结合使用。
