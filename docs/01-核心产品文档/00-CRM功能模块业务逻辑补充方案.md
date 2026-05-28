# CRM功能模块业务逻辑补充方案

> 文档版本: v1.0
> 创建日期: 2026-04-14
> 状态: ✅ 补充完成

---

## 一、功能覆盖度分析总览

### 1.1 模块覆盖度矩阵

| 模块 | 功能点数量 | 已覆盖 | 部分覆盖 | 完全缺失 | 覆盖率 |
|------|----------|--------|----------|----------|--------|
| **线索管理** | 15+ | 评分模型基础 | 5维度权重配置、分配策略 | 防撞单规则详细实现 | 60% |
| **客户管理** | 45+ | 公海池基础、查重基础 | 客户画像4维模型 | 健康度详细配置、行动计划对照表 | 70% |
| **商机管理** | 20+ | 漏斗基础 | 智能排序算法 | 详细排序权重代码 | 65% |
| **销售管理** | 15+ | 跟进记录 | 自动化工作流规则 | 工作流引擎详细实现 | 50% |
| **商务合同** | 40+ | 报价单、审批流基础 | 付款计划 | 订单管理、交付管理、发票管理 | 45% |
| **产品管理** | 15+ | 基础CRUD | 规格参数基础 | 价格计算器公式实现 | 55% |
| **客户成功** | 15+ | 健康度基础 | 评分模型基础 | 详细权重配置、行动计划 | 50% |
| **AI智能** | 15+ | 画像框架 | 推荐框架 | 推荐要素详细实现 | 40% |

### 1.2 关键缺失清单

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                            关键缺失功能清单                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│ P0级缺失（必须实现）                                                          │
│ ├── 1. 订单管理模块（合同签署后的订单创建、生产跟踪、分批交货）                      │
│ ├── 2. 交付管理模块（交货进度、物流跟踪、客户签收）                               │
│ ├── 3. 发票管理模块（发票申请、开具、邮寄、红冲）                                │
│ ├── 4. 自动化工作流引擎（4种触发条件+6种执行动作完整实现）                       │
│ ├── 5. 线索防撞单规则（先占先得/活跃优先/联合跟进详细实现）                       │
│ ├── 6. 客户健康度详细配置（5维度权重可配置+行动计划对照表）                       │
│ └── 7. 制造业价格计算器公式（面积×单价×数量×(1+损耗率)+工艺费用）               │
│                                                                             │
│ P1级缺失（建议实现）                                                          │
│ ├── 1. 线索评分模型详细配置（5维度权重可配置）                                  │
│ ├── 2. 客户画像4维模型详细实现（基础/业务/行为/预测）                          │
│ ├── 3. 智能排序算法详细实现（跟进紧急度+客户价值+健康度综合排序）                │
│ ├── 4. 智能推荐系统详细实现（推荐理由+置信度+一键执行）                         │
│ └── 5. 多层级回收规则（未跟进回收/未转化回收/低效回收/超量回收）                 │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 二、订单与交付管理模块（完全新增）

> ⚠️ 业务逻辑方案中完全缺失，需完整实现

### 2.1 订单管理业务逻辑

```python
# crm/services/order_service.py
"""
制造业CRM订单管理服务
功能：订单创建、生产跟踪、分批交货、订单变更
"""

from typing import Optional
from decimal import Decimal
from datetime import datetime, date, timedelta
from enum import Enum
from pydantic import BaseModel, Field
from app.core.database import AsyncSession
from app.core.exceptions import BusinessError


class OrderStatus(str, Enum):
    """订单状态枚举"""
    DRAFT = "draft"              # 草稿
    CONFIRMED = "confirmed"       # 已确认
    PRODUCTION = "production"     # 生产中
    QUALITY_CHECK = "quality_check"  # 质检中
    SHIPPING = "shipping"        # 发货中
    PARTIALLY_SHIPPED = "partially_shipped"  # 部分发货
    COMPLETED = "completed"      # 已完成
    CANCELLED = "cancelled"      # 已取消


class DeliveryStatus(str, Enum):
    """交货状态枚举"""
    PENDING = "pending"           # 待发货
    SHIPPED = "shipped"          # 已发货
    IN_TRANSIT = "in_transit"    # 运输中
    DELIVERED = "delivered"      # 已签收
    SIGNED = "signed"            # 已确认签收


class OrderCreateSchema(BaseModel):
    """订单创建schema"""
    contract_id: int = Field(..., description="关联合同ID")
    order_type: str = Field(default="standard", description="订单类型: standard/replenishment/sample")
    delivery_type: str = Field(default="single", description="交货方式: single(一次性)/batch(分批)")
    planned_delivery_date: date = Field(..., description="计划交货日期")
    notes: Optional[str] = None
    items: list["OrderItemSchema"] = []


class OrderItemSchema(BaseModel):
    """订单明细schema"""
    product_id: int
    product_name: str
    product_code: str
    specification: Optional[str] = None  # 规格参数
    quantity: int = Field(..., gt=0)
    unit: str = "个"
    unit_price: Decimal
    delivered_quantity: int = 0  # 已交货数量
    amount: Decimal = 0


class DeliveryBatchSchema(BaseModel):
    """交货批次schema"""
    batch_no: int  # 批次号
    delivery_date: date
    items: list["DeliveryItemSchema"]
    logistics_company: Optional[str] = None
    tracking_no: Optional[str] = None
    status: DeliveryStatus = DeliveryStatus.PENDING


class OrderService:
    """订单管理服务"""
    
    async def create_order(
        self,
        data: OrderCreateSchema,
        user_id: int,
        db: AsyncSession
    ) -> dict:
        """创建订单（从合同一键生成）"""
        
        # 1. 获取合同信息
        contract = await self.get_contract(data.contract_id, db)
        if not contract:
            raise BusinessError("关联合同不存在")
        
        # 2. 校验合同状态（必须已签署）
        if contract.status != "signed" and contract.status != "executing":
            raise BusinessError("合同状态不允许创建订单")
        
        # 3. 生成订单编号
        order_no = await self.generate_order_no(db)
        
        # 4. 创建订单
        order = Order(
            order_no=order_no,
            contract_id=data.contract_id,
            customer_id=contract.customer_id,
            order_type=data.order_type,
            delivery_type=data.delivery_type,
            planned_delivery_date=data.planned_delivery_date,
            status=OrderStatus.DRAFT,
            total_amount=sum(item.amount for item in data.items),
            creator_id=user_id,
        )
        db.add(order)
        await db.flush()
        
        # 5. 创建订单明细
        for item in data.items:
            order_item = OrderItem(
                order_id=order.id,
                product_id=item.product_id,
                product_name=item.product_name,
                product_code=item.product_code,
                specification=item.specification,
                quantity=item.quantity,
                unit=item.unit,
                unit_price=item.unit_price,
                delivered_quantity=0,
                amount=item.quantity * item.unit_price,
            )
            db.add(order_item)
        
        # 6. 记录操作日志
        await self.log_operation(
            db, order.id, "create", user_id, 
            f"从合同{data.contract_id}创建订单"
        )
        
        # 7. 发送通知给客户
        await self.notify_customer(order, "订单已创建")
        
        return {"order_id": order.id, "order_no": order_no}
    
    async def generate_order_no(self, db: AsyncSession) -> str:
        """生成订单编号: ORD-YYYYMMDD-XXX"""
        today = date.today().strftime("%Y%m%d")
        
        # 查询今天的订单数量
        result = await db.execute(
            f"""SELECT COUNT(*) as count FROM crm_order 
                WHERE order_no LIKE 'ORD-{today}%'"""
        )
        count = result.scalar() or 0
        
        return f"ORD-{today}-{str(count + 1).zfill(3)}"
    
    async def update_order_status(
        self,
        order_id: int,
        new_status: OrderStatus,
        user_id: int,
        db: AsyncSession
    ) -> bool:
        """更新订单状态（状态机流转）"""
        
        order = await self.get_order(order_id, db)
        current_status = order.status
        
        # 校验状态流转规则
        valid_transitions = {
            OrderStatus.DRAFT: [OrderStatus.CONFIRMED, OrderStatus.CANCELLED],
            OrderStatus.CONFIRMED: [OrderStatus.PRODUCTION, OrderStatus.CANCELLED],
            OrderStatus.PRODUCTION: [OrderStatus.QUALITY_CHECK, OrderStatus.CANCELLED],
            OrderStatus.QUALITY_CHECK: [OrderStatus.SHIPPING, OrderStatus.PRODUCTION],
            OrderStatus.SHIPPING: [OrderStatus.PARTIALLY_SHIPPED, OrderStatus.COMPLETED],
            OrderStatus.PARTIALLY_SHIPPED: [OrderStatus.SHIPPING, OrderStatus.COMPLETED],
        }
        
        if new_status not in valid_transitions.get(current_status, []):
            raise BusinessError(
                f"订单状态不允许从{current_status}流转到{new_status}"
            )
        
        # 执行状态更新
        order.status = new_status
        order.update_time = datetime.now()
        
        # 记录状态变更历史
        history = OrderStatusHistory(
            order_id=order_id,
            from_status=current_status,
            to_status=new_status,
            operator_id=user_id,
        )
        db.add(history)
        
        # 触发后续动作
        await self.trigger_status_actions(order, new_status, db)
        
        return True
    
    async def create_delivery_batch(
        self,
        order_id: int,
        data: DeliveryBatchSchema,
        user_id: int,
        db: AsyncSession
    ) -> dict:
        """创建交货批次"""
        
        order = await self.get_order(order_id, db)
        
        # 1. 校验订单状态
        if order.status not in [OrderStatus.PRODUCTION, OrderStatus.QUALITY_CHECK, 
                                 OrderStatus.SHIPPING, OrderStatus.PARTIALLY_SHIPPED]:
            raise BusinessError("订单状态不允许创建交货批次")
        
        # 2. 校验交货数量不超过订单总量
        for item in data.items:
            total_delivered = await self.get_delivered_quantity(order_id, item.product_id, db)
            remaining = item.product.quantity - total_delivered
            if item.quantity > remaining:
                raise BusinessError(
                    f"产品{item.product_name}交货数量{item.quantity}超过剩余可交货数量{remaining}"
                )
        
        # 3. 创建交货批次
        batch = DeliveryBatch(
            order_id=order_id,
            batch_no=data.batch_no,
            delivery_date=data.delivery_date,
            logistics_company=data.logistics_company,
            tracking_no=data.tracking_no,
            status=DeliveryStatus.PENDING,
            creator_id=user_id,
        )
        db.add(batch)
        await db.flush()
        
        # 4. 创建交货明细
        for item in data.items:
            batch_item = DeliveryBatchItem(
                batch_id=batch.id,
                product_id=item.product_id,
                quantity=item.quantity,
            )
            db.add(batch_item)
        
        # 5. 更新订单状态
        await self.update_order_status(order_id, OrderStatus.SHIPPING, user_id, db)
        
        # 6. 发送通知
        await self.notify_customer_delivery(order, batch)
        
        return {"batch_id": batch.id, "batch_no": data.batch_no}
```

### 2.2 交付管理业务逻辑

```python
# crm/services/delivery_service.py
"""
制造业CRM交付管理服务
功能：交货进度跟踪、物流管理、客户签收、异常预警
"""

class DeliveryService:
    """交付管理服务"""
    
    # 交期预警规则（天数）
    DELIVERY_WARNING_DAYS = [7, 3, 1]
    
    # 物流超时规则（天）
    LOGISTICS_TIMEOUT_DAYS = 7
    
    async def get_delivery_progress(self, order_id: int, db: AsyncSession) -> dict:
        """获取交货进度（客户视角）"""
        
        order = await self.get_order(order_id, db)
        
        # 1. 获取订单明细
        items = await self.get_order_items(order_id, db)
        
        # 2. 计算各维度进度
        total_quantity = sum(item.quantity for item in items)
        
        # 已发货数量
        shipped_quantity = sum(
            batch.total_quantity 
            for batch in await self.get_delivery_batches(order_id, db)
            if batch.status in [DeliveryStatus.SHIPPED, DeliveryStatus.DELIVERED, 
                               DeliveryStatus.SIGNED]
        )
        
        # 已签收数量
        signed_quantity = sum(
            batch_item.quantity
            for batch in await self.get_delivery_batches(order_id, db)
            if batch.status == DeliveryStatus.SIGNED
            for batch_item in batch.items
        )
        
        # 计算百分比
        production_progress = await self.get_production_progress(order_id, db)
        shipping_progress = round(shipped_quantity / total_quantity * 100, 1) if total_quantity > 0 else 0
        sign_progress = round(signed_quantity / total_quantity * 100, 1) if total_quantity > 0 else 0
        
        return {
            "order_id": order_id,
            "order_no": order.order_no,
            "production_progress": production_progress,
            "shipping_progress": shipping_progress,
            "sign_progress": sign_progress,
            "total_quantity": total_quantity,
            "shipped_quantity": shipped_quantity,
            "signed_quantity": signed_quantity,
            "planned_delivery_date": order.planned_delivery_date,
            "is_overdue": date.today() > order.planned_delivery_date and sign_progress < 100,
        }
    
    async def record_logistics(
        self,
        batch_id: int,
        logistics_company: str,
        tracking_no: str,
        user_id: int,
        db: AsyncSession
    ) -> bool:
        """记录物流信息"""
        
        batch = await self.get_delivery_batch(batch_id, db)
        
        batch.logistics_company = logistics_company
        batch.tracking_no = tracking_no
        batch.status = DeliveryStatus.IN_TRANSIT
        batch.ship_time = datetime.now()
        
        # 记录操作
        await self.log_operation(db, batch_id, "logistics_update", user_id,
                                 f"录入物流: {logistics_company} {tracking_no}")
        
        # 发送发货通知给客户
        await self.notify_customer_shipped(batch)
        
        return True
    
    async def confirm_sign(
        self,
        batch_id: int,
        sign_data: dict,
        user_id: int,
        db: AsyncSession
    ) -> bool:
        """确认客户签收"""
        
        batch = await self.get_delivery_batch(batch_id, db)
        order = await self.get_order(batch.order_id, db)
        
        # 1. 更新批次状态
        batch.status = DeliveryStatus.SIGNED
        batch.sign_time = datetime.now()
        batch.signer = sign_data.get("signer")
        batch.sign_images = sign_data.get("sign_images", [])
        
        # 2. 更新订单明细已交货数量
        for batch_item in batch.items:
            await self.update_delivered_quantity(
                order.id, batch_item.product_id, batch_item.quantity, db
            )
        
        # 3. 检查是否全部签收
        all_signed = await self.check_all_delivered(order.id, db)
        if all_signed:
            await self.update_order_status(order.id, OrderStatus.COMPLETED, user_id, db)
            await self.notify_customer_completed(order)
        
        # 4. 记录操作
        await self.log_operation(db, batch_id, "sign_confirm", user_id,
                                 f"客户签收，签收人: {sign_data.get('signer')}")
        
        return True
    
    async def check_delivery_exceptions(self, db: AsyncSession) -> list:
        """检查交付异常（定时任务）"""
        
        exceptions = []
        
        # 1. 交期预警
        upcoming_orders = await self.get_orders_near_delivery(
            days=self.DELIVERY_WARNING_DAYS[0], db
        )
        for order in upcoming_orders:
            days_left = (order.planned_delivery_date - date.today()).days
            if days_left in self.DELIVERY_WARNING_DAYS:
                exceptions.append({
                    "type": "delivery_warning",
                    "order_id": order.id,
                    "order_no": order.order_no,
                    "days_left": days_left,
                    "message": f"订单{order.order_no}距计划交货日期还剩{days_left}天",
                })
        
        # 2. 物流超时
        in_transit_batches = await self.get_in_transit_batches(db)
        for batch in in_transit_batches:
            days_in_transit = (date.today() - batch.ship_time.date()).days
            if days_in_transit > self.LOGISTICS_TIMEOUT_DAYS:
                exceptions.append({
                    "type": "logistics_timeout",
                    "batch_id": batch.id,
                    "order_no": batch.order.order_no,
                    "tracking_no": batch.tracking_no,
                    "days_in_transit": days_in_transit,
                    "message": f"物流{batch.tracking_no}运输超过{days_in_transit}天",
                })
        
        # 3. 签收失败预警
        failed_signs = await self.get_failed_signs(db)
        for fail in failed_signs:
            exceptions.append({
                "type": "sign_failed",
                "batch_id": fail.batch_id,
                "message": f"签收失败: {fail.reason}",
            })
        
        return exceptions
```

### 2.3 发票管理业务逻辑

```python
# crm/services/invoice_service.py
"""
制造业CRM发票管理服务
功能：发票申请、开具、邮寄、归档、红冲
"""

class InvoiceType(str, Enum):
    """发票类型枚举"""
    SPECIAL = "special"      # 增值税专用发票
    NORMAL = "normal"        # 增值税普通发票
    ELECTRONIC = "electronic"  # 电子发票


class InvoiceStatus(str, Enum):
    """发票状态枚举"""
    PENDING = "pending"      # 待开票
    APPROVED = "approved"    # 已审核
    ISSUED = "issued"        # 已开具
    MAILING = "mailing"      # 邮寄中
    SIGNED = "signed"        # 已签收
    ARCHIVED = "archived"    # 已归档
    RED_FLUSHED = "red_flushed"  # 已红冲


class InvoiceService:
    """发票管理服务"""
    
    # 税率配置
    TAX_RATES = {
        InvoiceType.SPECIAL: Decimal("0.13"),  # 13%
        InvoiceType.NORMAL: Decimal("0.03"),    # 3%
        InvoiceType.ELECTRONIC: Decimal("0.13"),
    }
    
    async def create_invoice_application(
        self,
        contract_id: int,
        payment_record_id: int,
        invoice_amount: Decimal,
        invoice_type: InvoiceType,
        user_id: int,
        db: AsyncSession
    ) -> dict:
        """从回款一键申请开票"""
        
        # 1. 获取回款记录
        payment = await self.get_payment_record(payment_record_id, db)
        contract = await self.get_contract(contract_id, db)
        
        # 2. 校验开票金额不超过已回款金额
        total_paid = await self.get_total_paid_amount(contract_id, db)
        total_invoiced = await self.get_total_invoiced_amount(contract_id, db)
        can_invoice_amount = total_paid - total_invoiced
        
        if invoice_amount > can_invoice_amount:
            raise BusinessError(
                f"开票金额{invoice_amount}超过可开票金额{can_invoice_amount}"
            )
        
        # 3. 生成发票编号
        invoice_no = await self.generate_invoice_no(db)
        
        # 4. 创建发票记录
        tax_rate = self.TAX_RATES[invoice_type]
        tax_amount = invoice_amount * tax_rate
        total_with_tax = invoice_amount + tax_amount
        
        invoice = Invoice(
            invoice_no=invoice_no,
            contract_id=contract_id,
            payment_record_id=payment_record_id,
            customer_id=contract.customer_id,
            invoice_type=invoice_type,
            tax_rate=tax_rate,
            invoice_amount=invoice_amount,
            tax_amount=tax_amount,
            total_amount=total_with_tax,
            status=InvoiceStatus.PENDING,
            applicant_id=user_id,
        )
        db.add(invoice)
        
        # 5. 记录操作
        await self.log_operation(db, invoice.id, "create_application", user_id,
                                 f"申请开票，发票号: {invoice_no}")
        
        return {"invoice_id": invoice.id, "invoice_no": invoice_no}
    
    async def issue_invoice(
        self,
        invoice_id: int,
        invoice_number: str,
        invoice_date: date,
        remarks: Optional[str],
        user_id: int,
        db: AsyncSession
    ) -> bool:
        """开具发票"""
        
        invoice = await self.get_invoice(invoice_id, db)
        
        # 校验状态
        if invoice.status != InvoiceStatus.PENDING:
            raise BusinessError("发票状态不允许开具")
        
        # 更新发票信息
        invoice.invoice_number = invoice_number
        invoice.invoice_date = invoice_date
        invoice.status = InvoiceStatus.ISSUED
        invoice.issuer_id = user_id
        invoice.remarks = remarks
        
        # 更新合同已开票金额
        contract = await self.get_contract(invoice.contract_id, db)
        contract.invoiced_amount = (contract.invoiced_amount or Decimal("0")) + invoice.total_amount
        
        # 记录操作
        await self.log_operation(db, invoice_id, "issue", user_id,
                                 f"开具发票，发票号: {invoice_number}")
        
        # 通知客户发票已开具
        await self.notify_customer_invoice_issued(invoice)
        
        return True
    
    async def record_mailling(
        self,
        invoice_id: int,
        logistics_company: str,
        tracking_no: str,
        mailing_date: date,
        user_id: int,
        db: AsyncSession
    ) -> bool:
        """记录发票邮寄"""
        
        invoice = await self.get_invoice(invoice_id, db)
        
        if invoice.status != InvoiceStatus.ISSUED:
            raise BusinessError("发票状态不允许邮寄")
        
        invoice.logistics_company = logistics_company
        invoice.tracking_no = tracking_no
        invoice.mailing_date = mailing_date
        invoice.status = InvoiceStatus.MAILING
        
        await self.log_operation(db, invoice_id, "mailing", user_id,
                                 f"发票邮寄: {logistics_company} {tracking_no}")
        
        return True
    
    async def red_flush_invoice(
        self,
        invoice_id: int,
        reason: str,
        user_id: int,
        db: AsyncSession
    ) -> bool:
        """发票红冲"""
        
        invoice = await self.get_invoice(invoice_id, db)
        
        # 校验状态（只能红冲已开具或已签收的发票）
        if invoice.status not in [InvoiceStatus.ISSUED, InvoiceStatus.SIGNED]:
            raise BusinessError("发票状态不允许红冲")
        
        # 创建红冲记录
        red_flush = InvoiceRedFlush(
            invoice_id=invoice_id,
            original_invoice_number=invoice.invoice_number,
            red_flush_invoice_number=await self.generate_red_flush_number(db),
            reason=reason,
            red_flush_date=date.today(),
            operator_id=user_id,
        )
        db.add(red_flush)
        
        # 更新原发票状态
        invoice.status = InvoiceStatus.RED_FLUSHED
        invoice.red_flush_id = red_flush.id
        
        # 更新合同已开票金额（扣除红冲金额）
        contract = await self.get_contract(invoice.contract_id, db)
        contract.invoiced_amount = contract.invoiced_amount - invoice.total_amount
        
        await self.log_operation(db, invoice_id, "red_flush", user_id,
                                 f"发票红冲，原因: {reason}")
        
        return True
```

---

## 三、自动化工作流引擎补充方案

### 3.1 工作流引擎核心架构

```python
# crm/services/workflow_engine.py
"""
制造业CRM自动化工作流引擎
功能：支持4种触发条件 + 6种执行动作
"""

from typing import Optional, Any
from datetime import datetime, timedelta
from enum import Enum
from pydantic import BaseModel
import json


class TriggerType(str, Enum):
    """触发条件类型"""
    TIME = "time"                      # 时间触发
    STATUS_CHANGE = "status_change"   # 状态触发
    BEHAVIOR = "behavior"             # 行为触发
    DATA_THRESHOLD = "data_threshold" # 数据阈值触发


class ActionType(str, Enum):
    """执行动作类型"""
    CREATE_TASK = "create_task"       # 创建任务
    SEND_NOTIFICATION = "send_notification"  # 发送通知
    GENERATE_DOCUMENT = "generate_document"  # 生成文档
    UPDATE_DATA = "update_data"        # 更新数据
    ESCALATION = "escalation"          # 升级预警
    ASSIGN_CUSTOMER = "assign_customer"  # 分配客户


class WorkflowRule(BaseModel):
    """工作流规则模型"""
    id: int
    name: str
    description: str
    trigger_type: TriggerType
    trigger_config: dict  # 触发条件配置
    actions: list[dict]   # 执行动作列表
    is_active: bool
    priority: int = 0
    execution_limit: Optional[int] = None  # 执行次数限制
    failure_retry: int = 3  # 失败重试次数


class WorkflowEngine:
    """自动化工作流引擎"""
    
    def __init__(self):
        self.rules_cache = {}  # 规则缓存
        self.execution_history = []  # 执行历史
    
    async def evaluate_trigger(
        self,
        trigger_type: TriggerType,
        trigger_config: dict,
        context: dict
    ) -> bool:
        """评估触发条件是否满足"""
        
        if trigger_type == TriggerType.TIME:
            return await self._evaluate_time_trigger(trigger_config, context)
        elif trigger_type == TriggerType.STATUS_CHANGE:
            return await self._evaluate_status_trigger(trigger_config, context)
        elif trigger_type == TriggerType.BEHAVIOR:
            return await self._evaluate_behavior_trigger(trigger_config, context)
        elif trigger_type == TriggerType.DATA_THRESHOLD:
            return await self._evaluate_threshold_trigger(trigger_config, context)
        
        return False
    
    async def _evaluate_time_trigger(
        self,
        config: dict,
        context: dict
    ) -> bool:
        """
        时间触发评估
        配置示例: {"type": "relative", "field": "protect_end_time", "offset": -3, "unit": "day"}
        含义: 保护期结束前3天触发
        """
        
        trigger_type = config.get("type")  # relative(相对时间)/absolute(绝对时间)/cron
        
        if trigger_type == "relative":
            field = config.get("field")
            offset = config.get("offset", 0)
            unit = config.get("unit", "day")
            
            # 获取触发字段的时间值
            trigger_time = context.get(field)
            if not trigger_time:
                return False
            
            # 计算目标时间
            if isinstance(trigger_time, datetime):
                if unit == "day":
                    target_time = trigger_time + timedelta(days=offset)
                elif unit == "hour":
                    target_time = trigger_time + timedelta(hours=offset)
                else:
                    target_time = trigger_time + timedelta(days=offset)
            else:
                return False
            
            # 判断当前时间是否在目标时间点
            now = datetime.now()
            time_diff = abs((target_time - now).total_seconds())
            return time_diff < 3600  # 1小时内认为是触发点
            
        elif trigger_type == "cron":
            # cron表达式触发（简化实现）
            cron_expr = config.get("expression")
            # 使用APScheduler的CronTrigger
            return self._evaluate_cron(cron_expr, datetime.now())
        
        return False
    
    async def _evaluate_status_trigger(
        self,
        config: dict,
        context: dict
    ) -> bool:
        """
        状态触发评估
        配置示例: {"field": "status", "from": "PROSPECT", "to": "NEGOTIATING"}
        含义: 客户状态从潜在客户变为谈判中时触发
        """
        
        field = config.get("field")
        from_status = config.get("from")
        to_status = config.get("to")
        
        # 获取上下文中的状态变更信息
        old_value = context.get(f"{field}_old")
        new_value = context.get(f"{field}_new")
        
        if from_status and str(old_value) != str(from_status):
            return False
        if to_status and str(new_value) != str(to_status):
            return False
        
        return True
    
    async def _evaluate_behavior_trigger(
        self,
        config: dict,
        context: dict
    ) -> bool:
        """
        行为触发评估
        配置示例: {"behavior": "downloaded_brochure", "customer_id": 123}
        含义: 客户下载产品手册时触发
        """
        
        behavior_type = config.get("behavior")
        expected_behavior = context.get("behavior_type")
        
        return str(behavior_type) == str(expected_behavior)
    
    async def _evaluate_threshold_trigger(
        self,
        config: dict,
        context: dict
    ) -> bool:
        """
        数据阈值触发评估
        配置示例: {"field": "lead_score", "operator": ">", "value": 80}
        含义: 线索评分大于80分时触发
        """
        
        field = config.get("field")
        operator = config.get("operator")  # >, <, >=, <=, ==, !=
        threshold = config.get("value")
        
        current_value = context.get(field)
        if current_value is None:
            return False
        
        if operator == ">":
            return current_value > threshold
        elif operator == "<":
            return current_value < threshold
        elif operator == ">=":
            return current_value >= threshold
        elif operator == "<=":
            return current_value <= threshold
        elif operator == "==":
            return current_value == threshold
        elif operator == "!=":
            return current_value != threshold
        
        return False
    
    async def execute_action(
        self,
        action_type: ActionType,
        action_config: dict,
        context: dict
    ) -> dict:
        """执行动作"""
        
        if action_type == ActionType.CREATE_TASK:
            return await self._action_create_task(action_config, context)
        elif action_type == ActionType.SEND_NOTIFICATION:
            return await self._action_send_notification(action_config, context)
        elif action_type == ActionType.GENERATE_DOCUMENT:
            return await self._action_generate_document(action_config, context)
        elif action_type == ActionType.UPDATE_DATA:
            return await self._action_update_data(action_config, context)
        elif action_type == ActionType.ESCALATION:
            return await self._action_escalation(action_config, context)
        elif action_type == ActionType.ASSIGN_CUSTOMER:
            return await self._action_assign_customer(action_config, context)
        
        return {"success": False, "error": "Unknown action type"}
    
    async def _action_create_task(
        self,
        config: dict,
        context: dict
    ) -> dict:
        """动作：创建任务"""
        
        task_title = self._render_template(config.get("title"), context)
        task_type = config.get("task_type")
        due_offset = config.get("due_offset", 3)  # 默认3天
        owner_id = config.get("owner_id") or context.get("owner_id")
        
        # 计算截止日期
        due_date = datetime.now() + timedelta(days=due_offset)
        
        # 创建任务
        task = Task(
            title=task_title,
            task_type=task_type,
            related_type=config.get("related_type"),
            related_id=config.get("related_id") or context.get("customer_id"),
            owner_id=owner_id,
            due_date=due_date,
            priority=config.get("priority", "medium"),
            source="workflow_auto",
        )
        
        return {"success": True, "task_id": task.id}
    
    async def _action_send_notification(
        self,
        config: dict,
        context: dict
    ) -> dict:
        """动作：发送通知"""
        
        notify_targets = config.get("targets", [])  # [owner, manager, custom]
        channels = config.get("channels", ["system"])  # [system, email, sms, wechat]
        template = config.get("template")
        content = self._render_template(template, context)
        
        for target in notify_targets:
            if target == "owner":
                user_id = context.get("owner_id")
            elif target == "manager":
                user_id = await self.get_manager_id(context.get("owner_id"))
            else:
                user_id = target
            
            for channel in channels:
                await self.send_notification(
                    user_id=user_id,
                    channel=channel,
                    title=config.get("title", "系统通知"),
                    content=content,
                )
        
        return {"success": True, "notify_count": len(notify_targets) * len(channels)}
    
    async def _action_update_data(
        self,
        config: dict,
        context: dict
    ) -> dict:
        """动作：更新数据"""
        
        entity_type = config.get("entity_type")
        entity_id = config.get("entity_id") or context.get("customer_id")
        updates = config.get("updates", {})
        
        # 渲染更新值（支持变量替换）
        rendered_updates = {}
        for field, value in updates.items():
            rendered_updates[field] = self._render_template(value, context)
        
        # 执行更新
        await self.update_entity(entity_type, entity_id, rendered_updates)
        
        return {"success": True, "updated_fields": list(updates.keys())}
    
    async def _action_escalation(
        self,
        config: dict,
        context: dict
    ) -> dict:
        """动作：升级预警"""
        
        escalation_level = config.get("level", 1)
        reason = self._render_template(config.get("reason", "触发升级预警"), context)
        
        # 获取相关人员
        owner_id = context.get("owner_id")
        customer_id = context.get("customer_id")
        
        # 升级通知
        if escalation_level == 1:
            # 通知直接主管
            manager_id = await self.get_manager_id(owner_id)
            await self.send_notification(manager_id, "urgent", reason)
        elif escalation_level == 2:
            # 通知部门经理
            manager_id = await self.get_manager_id(owner_id)
            dept_manager = await self.get_department_manager(owner_id)
            await self.send_notification(manager_id, "urgent", reason)
            await self.send_notification(dept_manager, "urgent", reason)
        
        return {"success": True, "escalation_level": escalation_level}
    
    def _render_template(self, template: str, context: dict) -> str:
        """渲染模板（简单变量替换）"""
        if not template:
            return template
        
        result = template
        for key, value in context.items():
            result = result.replace(f"{{{key}}}", str(value))
        
        return result
    
    async def process_workflow(
        self,
        trigger_type: TriggerType,
        trigger_config: dict,
        context: dict,
        db: AsyncSession
    ) -> list[dict]:
        """处理工作流（匹配规则并执行）"""
        
        results = []
        
        # 1. 获取所有启用的规则
        rules = await self.get_active_rules(db)
        
        # 2. 筛选匹配的规则
        for rule in rules:
            if rule.trigger_type != trigger_type:
                continue
            
            # 评估触发条件
            triggered = await self.evaluate_trigger(trigger_type, rule.trigger_config, context)
            
            if triggered:
                # 3. 执行所有动作
                for action_config in rule.actions:
                    result = await self.execute_action(
                        ActionType(action_config["type"]),
                        action_config["config"],
                        context
                    )
                    results.append({
                        "rule_id": rule.id,
                        "rule_name": rule.name,
                        "action": action_config["type"],
                        "result": result,
                    })
                
                # 4. 记录执行日志
                await self.log_execution(rule.id, context, results, db)
        
        return results
```

### 3.2 预置规则模板配置

```python
# 预置工作流规则配置
PRESET_WORKFLOW_RULES = [
    {
        "name": "新客户跟进提醒",
        "description": "客户分配后24小时无跟进，自动创建任务并发送提醒",
        "trigger_type": "time",
        "trigger_config": {
            "type": "relative",
            "field": "claim_time",
            "offset": 24,
            "unit": "hour",
            "condition": {
                "field": "last_followup_time",
                "operator": "==",
                "value": None
            }
        },
        "actions": [
            {
                "type": "create_task",
                "config": {
                    "title": "跟进客户{company_name}",
                    "task_type": "followup",
                    "related_type": "customer",
                    "due_offset": 1,
                    "priority": "high"
                }
            },
            {
                "type": "send_notification",
                "config": {
                    "targets": ["owner"],
                    "channels": ["system", "wechat"],
                    "title": "新客户待跟进提醒",
                    "template": "您有客户{company_name}已分配24小时未跟进，请及时处理"
                }
            }
        ],
        "is_active": True,
        "priority": 10,
    },
    {
        "name": "保护期预警",
        "description": "保护期剩余3天/1天时，发送预警提醒",
        "trigger_type": "time",
        "trigger_config": {
            "type": "relative",
            "field": "protection_end_time",
            "offset_days": [3, 1],
            "unit": "day"
        },
        "actions": [
            {
                "type": "send_notification",
                "config": {
                    "targets": ["owner", "manager"],
                    "channels": ["system", "email"],
                    "title": "客户保护期即将到期",
                    "template": "客户{company_name}保护期将在{remaining_days}天后到期，请及时跟进"
                }
            },
            {
                "type": "create_task",
                "config": {
                    "title": "客户保护期到期前跟进",
                    "task_type": "followup",
                    "related_type": "customer",
                    "due_offset": 0,
                    "priority": "urgent"
                }
            }
        ],
        "is_active": True,
        "priority": 20,
    },
    {
        "name": "续约启动提醒",
        "description": "合同到期前90/60/30天，自动创建续约任务并发送提醒",
        "trigger_type": "time",
        "trigger_config": {
            "type": "relative",
            "field": "contract_end_date",
            "offset_days": [90, 60, 30],
            "unit": "day"
        },
        "actions": [
            {
                "type": "create_task",
                "config": {
                    "title": "合同续约跟进",
                    "task_type": "renewal",
                    "related_type": "contract",
                    "due_offset": 7,
                    "priority": "high"
                }
            },
            {
                "type": "send_notification",
                "config": {
                    "targets": ["owner", "customer_success"],
                    "channels": ["system", "email", "sms"],
                    "title": "合同即将到期提醒",
                    "template": "客户{company_name}的合同将在{days_until}天后到期，请启动续约流程"
                }
            }
        ],
        "is_active": True,
        "priority": 30,
    },
    {
        "name": "健康度下降预警",
        "description": "客户健康度下降超过10分，通知客户成功人员",
        "trigger_type": "status_change",
        "trigger_config": {
            "field": "health_score",
            "change_type": "decrease",
            "threshold": 10
        },
        "actions": [
            {
                "type": "send_notification",
                "config": {
                    "targets": ["customer_success"],
                    "channels": ["system", "wechat"],
                    "title": "客户健康度下降预警",
                    "template": "客户{company_name}健康度下降{score_change}分，请关注"
                }
            },
            {
                "type": "create_task",
                "config": {
                    "title": "客户健康度干预",
                    "task_type": "intervention",
                    "related_type": "customer",
                    "due_offset": 3,
                    "priority": "high"
                }
            },
            {
                "type": "escalation",
                "config": {
                    "level": 1,
                    "reason": "客户{company_name}健康度持续下降"
                }
            }
        ],
        "is_active": True,
        "priority": 40,
    },
    {
        "name": "高价值线索分配",
        "description": "线索评分超过80分，自动分配给高级销售",
        "trigger_type": "data_threshold",
        "trigger_config": {
            "field": "lead_score",
            "operator": ">=",
            "value": 80
        },
        "actions": [
            {
                "type": "assign_customer",
                "config": {
                    "assignment_type": "capability_match",
                    "target_role": "senior_sales",
                    "preferred_owner": "history_win_rate_high"
                }
            },
            {
                "type": "create_task",
                "config": {
                    "title": "高价值线索跟进",
                    "task_type": "followup",
                    "related_type": "lead",
                    "due_offset": 1,
                    "priority": "urgent"
                }
            },
            {
                "type": "send_notification",
                "config": {
                    "targets": ["assigned_owner"],
                    "channels": ["system", "wechat"],
                    "title": "新分配高价值线索",
                    "template": "您有新分配的高价值线索{lead_name}，评分{lead_score}分，请优先跟进"
                }
            }
        ],
        "is_active": True,
        "priority": 50,
    },
    {
        "name": "超期未跟进回收",
        "description": "客户30天无跟进，自动回收到公海池",
        "trigger_type": "time",
        "trigger_config": {
            "type": "relative",
            "field": "last_followup_time",
            "offset": 30,
            "unit": "day",
            "condition": {
                "field": "pool_type",
                "operator": "!=",
                "value": "public"
            }
        },
        "actions": [
            {
                "type": "update_data",
                "config": {
                    "entity_type": "customer",
                    "updates": {
                        "pool_type": "public",
                        "owner_id": "null",
                        "recycle_reason": "超期{no_followup_days}天未跟进自动回收"
                    }
                }
            },
            {
                "type": "send_notification",
                "config": {
                    "targets": ["original_owner"],
                    "channels": ["system"],
                    "title": "客户已回收至公海",
                    "template": "客户{company_name}因{no_followup_days}天未跟进已被回收到公海池"
                }
            }
        ],
        "is_active": True,
        "priority": 60,
    },
]
```

---

## 四、线索管理补充方案

### 4.1 线索防撞单规则详细实现

```python
# crm/services/lead_anti_collision_service.py
"""
线索防撞单规则服务
功能：先占先得、活跃优先、联合跟进、主管仲裁
"""

class AntiCollisionStrategy(str, Enum):
    """防撞单策略"""
    FIRST_COME = "first_come"      # 先占先得
    ACTIVE_FIRST = "active_first"  # 活跃优先
    JOINT_FOLLOWUP = "joint_followup"  # 联合跟进
    MANAGER_ARBITRATION = "manager_arbitration"  # 主管仲裁


class LeadAntiCollisionService:
    """线索防撞单服务"""
    
    # 防撞单策略配置
    STRATEGY_CONFIG = {
        AntiCollisionStrategy.FIRST_COME: {
            "name": "先占先得",
            "description": "谁先创建/领取线索/客户，归属谁",
            "active_days": 30,  # 30天无跟进可被抢
        },
        AntiCollisionStrategy.ACTIVE_FIRST: {
            "name": "活跃优先",
            "description": "谁的跟进频率高，谁优先",
            "min_followup_per_week": 2,  # 最少每周2次跟进
        },
        AntiCollisionStrategy.JOINT_FOLLOWUP: {
            "name": "联合跟进",
            "description": "大客户需求多人协作",
            "max_joint_count": 3,  # 最多3人联合跟进
        },
    }
    
    async def check_collision(
        self,
        customer_data: dict,
        user_id: int,
        db: AsyncSession
    ) -> CollisionCheckResult:
        """检测碰撞（查重+防撞单）"""
        
        result = CollisionCheckResult()
        
        # 1. 多维度查重（5维）
        duplicates = await self.check_duplicates(customer_data, db)
        if duplicates:
            result.has_collision = True
            result.duplicates = duplicates
            result.collision_type = "duplicate"
            return result
        
        # 2. 检查是否已被他人领取
        if customer_data.get("pool_type") == "personal":
            owner_id = await self.get_customer_owner(customer_data["id"], db)
            if owner_id and owner_id != user_id:
                # 检查是否在保护期内
                in_protection = await self.check_in_protection(customer_data["id"], db)
                if in_protection:
                    result.has_collision = True
                    result.collision_type = "protected"
                    result.existing_owner = owner_id
                    result.protection_end_time = await self.get_protection_end_time(
                        customer_data["id"], db
                    )
                    return result
        
        # 3. 检查是否可被抢（活跃优先策略）
        if await self.is_collidable(customer_data["id"], db):
            result.has_collision = True
            result.collision_type = "抢单"
            result.message = "该客户已被他人领取但长期未跟进，您可以选择抢单"
        
        return result
    
    async def handle_collision(
        self,
        collision_type: str,
        customer_id: int,
        user_id: int,
        action: str,  # view/joint/force/quit
        db: AsyncSession
    ) -> dict:
        """处理碰撞"""
        
        if collision_type == "duplicate":
            return await self._handle_duplicate(customer_id, user_id, action, db)
        elif collision_type in ["protected", "抢单"]:
            return await self._handle_claim_competition(customer_id, user_id, action, db)
        elif collision_type == "joint":
            return await self._handle_joint_followup(customer_id, user_id, db)
    
    async def _handle_joint_followup(
        self,
        customer_id: int,
        user_id: int,
        db: AsyncSession
    ) -> dict:
        """处理联合跟进申请"""
        
        customer = await self.get_customer(customer_id, db)
        original_owner = customer.owner_id
        
        # 1. 创建联合跟进申请
        application = JointFollowupApplication(
            customer_id=customer_id,
            applicant_id=user_id,
            original_owner_id=original_owner,
            status="pending",
            apply_time=datetime.now(),
        )
        db.add(application)
        
        # 2. 发送通知给原负责人
        await self.notify_user(
            user_id=original_owner,
            title="联合跟进申请",
            content=f"用户{user_id}申请与您联合跟进客户{customer.company_name}",
        )
        
        # 3. 通知主管审批
        manager_id = await self.get_manager_id(original_owner)
        await self.notify_user(
            user_id=manager_id,
            title="联合跟进待审批",
            content=f"用户{user_id}申请与{original_owner}联合跟进客户{customer.company_name}，请审批",
        )
        
        return {
            "application_id": application.id,
            "status": "pending_approval",
            "message": "联合跟进申请已提交，等待审批"
        }
    
    async def approve_joint_followup(
        self,
        application_id: int,
        approver_id: int,
        share_ratio: float,  # 业绩分成比例，如0.3表示30%
        db: AsyncSession
    ) -> bool:
        """审批联合跟进申请"""
        
        application = await self.get_application(application_id, db)
        
        # 更新申请状态
        application.status = "approved"
        application.approver_id = approver_id
        application.approve_time = datetime.now()
        application.share_ratio = share_ratio
        
        # 添加联合跟进人
        joint_followup = JointFollowup(
            customer_id=application.customer_id,
            user_id=application.applicant_id,
            main_owner_id=application.original_owner_id,
            share_ratio=share_ratio,
            start_time=datetime.now(),
        )
        db.add(joint_followup)
        
        # 记录日志
        await self.log_operation(
            db, application.customer_id, "joint_followup_approved",
            approver_id, f"联合跟进审批通过，分成比例{share_ratio*100}%"
        )
        
        # 发送通知
        await self.notify_user(
            user_id=application.applicant_id,
            title="联合跟进申请已通过",
            content=f"您与客户{application.customer_id}的联合跟进申请已通过"
        )
        
        return True
    
    async def is_collidable(self, customer_id: int, db: AsyncSession) -> bool:
        """检查客户是否可被抢"""
        
        customer = await self.get_customer(customer_id, db)
        
        # 1. 检查是否在保护期内
        if customer.protection_end_time and datetime.now() < customer.protection_end_time:
            return False
        
        # 2. 检查无跟进天数
        last_followup = await self.get_last_followup_time(customer_id, db)
        if last_followup:
            days_since_followup = (datetime.now() - last_followup).days
        else:
            days_since_followup = (datetime.now() - customer.create_time).days
        
        # 30天无跟进可被抢
        if days_since_followup < 30:
            return False
        
        # 3. 检查是否有进行中的商机
        active_opportunities = await self.count_active_opportunities(customer_id, db)
        if active_opportunities > 0:
            return False
        
        return True
    
    async def force_claim(
        self,
        customer_id: int,
        user_id: int,
        reason: str,
        db: AsyncSession
    ) -> bool:
        """强制抢单（需主管授权）"""
        
        customer = await self.get_customer(customer_id, db)
        manager_id = await self.get_manager_id(customer.owner_id)
        
        # 只有主管可以执行强制抢单
        if user_id != manager_id:
            raise PermissionError("只有主管可以执行强制抢单")
        
        # 记录原负责人
        original_owner = customer.owner_id
        
        # 执行抢单
        customer.owner_id = user_id
        customer.claim_time = datetime.now()
        customer.protection_end_time = datetime.now() + timedelta(days=7)
        
        # 记录日志
        await self.log_operation(
            db, customer_id, "force_claim", user_id,
            f"强制抢单，原负责人:{original_owner}，原因:{reason}"
        )
        
        # 发送通知给原负责人
        await self.notify_user(
            user_id=original_owner,
            title="客户已被强制转移",
            content=f"客户{customer.company_name}已被主管强制转移至{user_id}，原因:{reason}"
        )
        
        return True
```

### 4.2 线索评分模型详细配置（5维度权重可配置）

```python
# crm/services/lead_scoring_service.py
"""
线索评分服务
功能：5维度评分模型，权重可配置
"""

class LeadScoringModel:
    """线索评分模型"""
    
    # 评分维度配置（可配置）
    SCORING_DIMENSIONS = {
        "demographic": {
            "name": "企业属性",
            "weight": 0.30,  # 权重可配置
            "enabled": True,
            "factors": {
                "company_size": {
                    "name": "企业规模",
                    "scoring_rules": [
                        {"value": "large", "score": 30, "label": "大型企业(500人以上)"},
                        {"value": "medium", "score": 20, "label": "中型企业(100-500人)"},
                        {"value": "small", "score": 10, "label": "小型企业(50-100人)"},
                        {"value": "micro", "score": 5, "label": "微型企业(50人以下)"},
                    ]
                },
                "industry_match": {
                    "name": "行业匹配度",
                    "scoring_rules": [
                        {"value": "target", "score": 25, "label": "目标行业"},
                        {"value": "related", "score": 15, "label": "相关行业"},
                        {"value": "other", "score": 5, "label": "其他行业"},
                    ]
                },
                "has_budget": {
                    "name": "是否有预算",
                    "scoring_rules": [
                        {"value": "confirmed", "score": 15, "label": "预算已确认"},
                        {"value": "planning", "score": 10, "label": "预算规划中"},
                        {"value": "none", "score": 0, "label": "暂无预算"},
                    ]
                },
                "has_authority": {
                    "name": "是否有决策权",
                    "scoring_rules": [
                        {"value": "decision_maker", "score": 20, "label": "决策人"},
                        {"value": "influencer", "score": 10, "label": "影响者"},
                        {"value": "user", "score": 5, "label": "使用者"},
                    ]
                },
                "has_timeline": {
                    "name": "是否有时间线",
                    "scoring_rules": [
                        {"value": "within_1month", "score": 15, "label": "1个月内"},
                        {"value": "within_3month", "score": 10, "label": "3个月内"},
                        {"value": "within_6month", "score": 5, "label": "6个月内"},
                        {"value": "exploring", "score": 0, "label": "探索阶段"},
                    ]
                },
            }
        },
        "behavioral": {
            "name": "行为活跃度",
            "weight": 0.25,
            "enabled": True,
            "factors": {
                "website_visit": {
                    "name": "网站访问",
                    "scoring_rules": [
                        {"condition": "page_views > 10", "score": 10},
                        {"condition": "page_views > 5", "score": 7},
                        {"condition": "page_views > 0", "score": 3},
                    ]
                },
                "content_download": {
                    "name": "内容下载",
                    "scoring_rules": [
                        {"condition": "downloaded_product_pdf", "score": 15},
                        {"condition": "downloaded_case_study", "score": 12},
                        {"condition": "downloaded_brochure", "score": 8},
                    ]
                },
                "email_engagement": {
                    "name": "邮件互动",
                    "scoring_rules": [
                        {"condition": "opened >= 5", "score": 20},
                        {"condition": "opened >= 3", "score": 15},
                        {"condition": "opened >= 1", "score": 10},
                    ]
                },
                "event_attendance": {
                    "name": "活动参与",
                    "scoring_rules": [
                        {"condition": "attended_webinar", "score": 25},
                        {"condition": "attended_exhibition", "score": 30},
                        {"condition": "submitted_form", "score": 35},
                    ]
                },
                "direct_contact": {
                    "name": "主动联系",
                    "scoring_rules": [
                        {"condition": "called_company", "score": 40},
                        {"condition": "submitted_inquiry", "score": 35},
                    ]
                },
            }
        },
        "engagement_depth": {
            "name": "互动深度",
            "weight": 0.20,
            "enabled": True,
            "factors": {
                "followup_count": {
                    "name": "跟进次数",
                    "scoring_rules": [
                        {"condition": "count >= 5", "score": 20},
                        {"condition": "count >= 3", "score": 15},
                        {"condition": "count >= 1", "score": 10},
                    ]
                },
                "response_rate": {
                    "name": "回复率",
                    "scoring_rules": [
                        {"condition": "rate >= 80%", "score": 20},
                        {"condition": "rate >= 50%", "score": 15},
                        {"condition": "rate >= 20%", "score": 10},
                    ]
                },
                "meeting_completed": {
                    "name": "完成会议/拜访",
                    "scoring_rules": [
                        {"condition": "visits >= 3", "score": 25},
                        {"condition": "visits >= 1", "score": 20},
                        {"condition": "meetings >= 1", "score": 15},
                    ]
                },
            }
        },
        "demand_clarity": {
            "name": "需求明确度",
            "weight": 0.15,
            "enabled": True,
            "factors": {
                "requirement_description": {
                    "name": "需求描述完整度",
                    "scoring_rules": [
                        {"condition": "description_length > 500", "score": 15},
                        {"condition": "description_length > 200", "score": 10},
                        {"condition": "description_length > 50", "score": 5},
                    ]
                },
                "budget_clarity": {
                    "name": "预算明确度",
                    "scoring_rules": [
                        {"condition": "has_exact_amount", "score": 15},
                        {"condition": "has_range", "score": 10},
                        {"condition": "mentioned_budget", "score": 5},
                    ]
                },
                "timeline_clarity": {
                    "name": "时间线明确度",
                    "scoring_rules": [
                        {"condition": "has_specific_date", "score": 15},
                        {"condition": "has_time_range", "score": 10},
                    ]
                },
            }
        },
        "decision_chain": {
            "name": "决策链完整度",
            "weight": 0.10,
            "enabled": True,
            "factors": {
                "decision_maker_identified": {
                    "name": "决策人识别",
                    "scoring_rules": [
                        {"condition": "identified_and_contacted", "score": 10},
                        {"condition": "identified_not_contacted", "score": 5},
                    ]
                },
                "influencer_identified": {
                    "name": "影响者识别",
                    "scoring_rules": [
                        {"condition": "identified >= 3", "score": 10},
                        {"condition": "identified >= 1", "score": 5},
                    ]
                },
                "budget_holder_identified": {
                    "name": "预算审批人识别",
                    "scoring_rules": [
                        {"condition": "identified", "score": 10},
                    ]
                },
            }
        },
    }
    
    async def calculate_lead_score(
        self,
        lead_id: int,
        scoring_config: dict = None,
        db: AsyncSession = None
    ) -> LeadScoreResult:
        """计算线索评分"""
        
        lead = await self.get_lead(lead_id, db)
        
        # 获取评分配置（优先使用传入配置，否则使用默认配置）
        config = scoring_config or self.SCORING_DIMENSIONS
        
        total_score = 0
        dimension_scores = {}
        
        for dimension_key, dimension_config in config.items():
            if not dimension_config.get("enabled", True):
                continue
            
            dimension_score = 0
            factor_scores = {}
            
            for factor_key, factor_config in dimension_config.get("factors", {}).items():
                factor_value = await self.get_factor_value(lead, factor_key, db)
                factor_score = self.evaluate_factor(factor_value, factor_config["scoring_rules"])
                factor_scores[factor_key] = factor_score
                dimension_score += factor_score
            
            # 应用维度权重
            weighted_score = dimension_score * dimension_config["weight"]
            total_score += weighted_score
            
            dimension_scores[dimension_key] = {
                "name": dimension_config["name"],
                "raw_score": dimension_score,
                "weight": dimension_config["weight"],
                "weighted_score": weighted_score,
                "factors": factor_scores,
            }
        
        # 确定等级
        grade = self.get_score_grade(total_score)
        
        return LeadScoreResult(
            lead_id=lead_id,
            total_score=round(total_score, 0),
            grade=grade,
            dimension_scores=dimension_scores,
            calculated_at=datetime.now(),
        )
    
    def evaluate_factor(self, value: Any, rules: list) -> float:
        """评估因素得分"""
        
        for rule in rules:
            condition = rule.get("condition")
            score = rule.get("score")
            
            if condition and self._evaluate_condition(condition, value):
                return float(score)
            elif rule.get("value") == value:
                return float(score)
        
        return 0.0
    
    def get_score_grade(self, score: int) -> str:
        """获取评分等级"""
        
        if score >= 80:
            return "A"  # 热线索
        elif score >= 60:
            return "B"  # 温线索
        elif score >= 40:
            return "C"  # 冷线索
        else:
            return "D"  # 无效线索
```

---

## 五、客户健康度详细配置方案

### 5.1 健康度5维度权重可配置实现

```python
# crm/services/health_score_service.py
"""
客户健康度评分服务
功能：5维度权重可配置+行动计划对照表
"""

class HealthScoreModel:
    """客户健康度评分模型"""
    
    # 健康度维度配置（可配置）
    HEALTH_DIMENSIONS = {
        "product_usage": {
            "name": "产品使用频率",
            "weight": 0.25,  # 权重可配置
            "enabled": True,
            "metrics": {
                "login_frequency": {
                    "name": "登录频率",
                    "weight": 0.40,
                    "scoring_rules": [
                        {"condition": "logins_per_week >= 5", "score": 100},
                        {"condition": "logins_per_week >= 3", "score": 80},
                        {"condition": "logins_per_week >= 1", "score": 60},
                        {"condition": "logins_per_month >= 2", "score": 40},
                        {"condition": "logins_per_month < 2", "score": 20},
                    ]
                },
                "feature_adoption": {
                    "name": "功能使用率",
                    "weight": 0.30,
                    "scoring_rules": [
                        {"condition": "adoption_rate >= 80%", "score": 100},
                        {"condition": "adoption_rate >= 50%", "score": 75},
                        {"condition": "adoption_rate >= 30%", "score": 50},
                        {"condition": "adoption_rate < 30%", "score": 25},
                    ]
                },
                "data_volume": {
                    "name": "数据量增长",
                    "weight": 0.30,
                    "scoring_rules": [
                        {"condition": "growth_rate >= 20%", "score": 100},
                        {"condition": "growth_rate >= 10%", "score": 80},
                        {"condition": "growth_rate >= 0%", "score": 60},
                        {"condition": "growth_rate < 0%", "score": 30},
                    ]
                },
            }
        },
        "service_interaction": {
            "name": "服务交互次数",
            "weight": 0.20,
            "enabled": True,
            "metrics": {
                "support_ticket_count": {
                    "name": "服务工单数",
                    "weight": 0.30,
                    "scoring_rules": [
                        # 少量工单表示自主使用能力强
                        {"condition": "tickets_per_month <= 2", "score": 100},
                        {"condition": "tickets_per_month <= 5", "score": 80},
                        {"condition": "tickets_per_month <= 10", "score": 60},
                        {"condition": "tickets_per_month > 10", "score": 40},
                    ],
                    "is_negative": False,  # 不是负向指标
                },
                "feedback_response": {
                    "name": "反馈响应率",
                    "weight": 0.35,
                    "scoring_rules": [
                        {"condition": "response_rate >= 90%", "score": 100},
                        {"condition": "response_rate >= 70%", "score": 80},
                        {"condition": "response_rate >= 50%", "score": 60},
                        {"condition": "response_rate < 50%", "score": 40},
                    ]
                },
                "nps_score": {
                    "name": "NPS评分",
                    "weight": 0.35,
                    "scoring_rules": [
                        {"condition": "nps >= 9", "score": 100},
                        {"condition": "nps >= 7", "score": 80},
                        {"condition": "nps >= 5", "score": 60},
                        {"condition": "nps < 5", "score": 30},
                    ]
                },
            }
        },
        "payment_behavior": {
            "name": "支付行为",
            "weight": 0.25,
            "enabled": True,
            "metrics": {
                "payment_timeliness": {
                    "name": "付款及时性",
                    "weight": 0.40,
                    "scoring_rules": [
                        {"condition": "on_time_rate >= 95%", "score": 100},
                        {"condition": "on_time_rate >= 85%", "score": 80},
                        {"condition": "on_time_rate >= 70%", "score": 60},
                        {"condition": "on_time_rate < 70%", "score": 30},
                    ]
                },
                "overdue_count": {
                    "name": "逾期次数",
                    "weight": 0.30,
                    "scoring_rules": [
                        # 逾期越少越好
                        {"condition": "overdue_count = 0", "score": 100},
                        {"condition": "overdue_count <= 2", "score": 70},
                        {"condition": "overdue_count <= 5", "score": 50},
                        {"condition": "overdue_count > 5", "score": 20},
                    ],
                    "is_negative": True,  # 负向指标
                },
                "payment_trend": {
                    "name": "付款趋势",
                    "weight": 0.30,
                    "scoring_rules": [
                        {"condition": "trend = 'improving'", "score": 100},
                        {"condition": "trend = 'stable'", "score": 80},
                        {"condition": "trend = 'declining'", "score": 50},
                    ]
                },
            }
        },
        "followup_response": {
            "name": "跟进响应率",
            "weight": 0.15,
            "enabled": True,
            "metrics": {
                "followup_response_rate": {
                    "name": "跟进响应率",
                    "weight": 0.50,
                    "scoring_rules": [
                        {"condition": "rate >= 90%", "score": 100},
                        {"condition": "rate >= 70%", "score": 80},
                        {"condition": "rate >= 50%", "score": 60},
                        {"condition": "rate < 50%", "score": 30},
                    ]
                },
                "response_speed": {
                    "name": "响应速度",
                    "weight": 0.30,
                    "scoring_rules": [
                        {"condition": "avg_response_hours <= 4", "score": 100},
                        {"condition": "avg_response_hours <= 24", "score": 80},
                        {"condition": "avg_response_hours <= 48", "score": 60},
                        {"condition": "avg_response_hours > 48", "score": 30},
                    ]
                },
                "engagement_rate": {
                    "name": "互动参与率",
                    "weight": 0.20,
                    "scoring_rules": [
                        {"condition": "engagement_rate >= 80%", "score": 100},
                        {"condition": "engagement_rate >= 50%", "score": 75},
                        {"condition": "engagement_rate >= 30%", "score": 50},
                        {"condition": "engagement_rate < 30%", "score": 25},
                    ]
                },
            }
        },
        "cooperation_stability": {
            "name": "合作稳定性",
            "weight": 0.15,
            "enabled": True,
            "metrics": {
                "contract_duration": {
                    "name": "合作年限",
                    "weight": 0.35,
                    "scoring_rules": [
                        {"condition": "years >= 5", "score": 100},
                        {"condition": "years >= 3", "score": 85},
                        {"condition": "years >= 1", "score": 70},
                        {"condition": "years < 1", "score": 50},
                    ]
                },
                "renewal_history": {
                    "name": "续约历史",
                    "weight": 0.35,
                    "scoring_rules": [
                        {"condition": "renewed_count >= 3", "score": 100},
                        {"condition": "renewed_count >= 1", "score": 80},
                        {"condition": "first_contract", "score": 60},
                        {"condition": "not_renewed", "score": 20},
                    ]
                },
                "contract_value_stability": {
                    "name": "合同金额稳定性",
                    "weight": 0.30,
                    "scoring_rules": [
                        {"condition": "trend = 'growing'", "score": 100},
                        {"condition": "trend = 'stable'", "score": 80},
                        {"condition": "trend = 'declining'", "score": 40},
                    ]
                },
            }
        },
    }
    
    # 健康度等级定义
    HEALTH_GRADES = {
        "excellent": {"name": "优秀", "min_score": 80, "max_score": 100, "color": "green"},
        "good": {"name": "良好", "min_score": 60, "max_score": 79, "color": "yellow"},
        "risk": {"name": "风险", "min_score": 40, "max_score": 59, "color": "orange"},
        "dangerous": {"name": "危险", "min_score": 0, "max_score": 39, "color": "red"},
    }
    
    # 行动计划对照表
    ACTION_PLAN_MATRIX = {
        # 按降分原因匹配行动计划
        "low_usage": {
            "name": "使用频率下降",
            "indicators": ["login_frequency < 2", "feature_adoption < 30%"],
            "recommended_actions": [
                {"action": "主动关怀回访", "owner": "客户成功", "deadline_days": 3},
                {"action": "产品功能培训", "owner": "技术支持", "deadline_days": 7},
                {"action": "发送使用教程", "owner": "客户成功", "deadline_days": 1},
            ]
        },
        "payment_overdue": {
            "name": "逾期付款",
            "indicators": ["overdue_count > 0", "payment_timeliness < 70%"],
            "recommended_actions": [
                {"action": "催款电话", "owner": "财务+销售", "deadline_days": 0},
                {"action": "发送催款邮件", "owner": "财务", "deadline_days": 1},
                {"action": "上门拜访催款", "owner": "销售", "deadline_days": 3},
            ]
        },
        "low_engagement": {
            "name": "互动减少",
            "indicators": ["followup_response_rate < 50%", "response_speed > 48h"],
            "recommended_actions": [
                {"action": "主动关怀回访", "owner": "客户成功", "deadline_days": 3},
                {"action": "了解客户情况", "owner": "销售", "deadline_days": 2},
                {"action": "发送有价值内容", "owner": "市场", "deadline_days": 1},
            ]
        },
        "complaint_increase": {
            "name": "投诉增加",
            "indicators": ["support_ticket_count > 10", "nps_score < 5"],
            "recommended_actions": [
                {"action": "专人跟进处理投诉", "owner": "客服主管", "deadline_days": 1},
                {"action": "回访安抚客户", "owner": "客户成功", "deadline_days": 2},
                {"action": "产品/服务改进方案", "owner": "产品", "deadline_days": 7},
            ]
        },
        "no_interaction": {
            "name": "近期无互动",
            "indicators": ["last_interaction_days > 30"],
            "recommended_actions": [
                {"action": "主动电话回访", "owner": "客户成功", "deadline_days": 3},
                {"action": "发送问候邮件", "owner": "客户成功", "deadline_days": 1},
                {"action": "邀请参加活动", "owner": "市场", "deadline_days": 5},
            ]
        },
        "contract_expiring": {
            "name": "合同即将到期",
            "indicators": ["contract_end_days <= 90"],
            "recommended_actions": [
                {"action": "启动续约流程", "owner": "销售", "deadline_days": 7},
                {"action": "续约方案准备", "owner": "销售", "deadline_days": 14},
                {"action": "高层拜访", "owner": "销售负责人", "deadline_days": 30},
            ]
        },
    }
    
    async def calculate_health_score(
        self,
        customer_id: int,
        scoring_config: dict = None,
        db: AsyncSession = None
    ) -> HealthScoreResult:
        """计算客户健康度"""
        
        customer = await self.get_customer(customer_id, db)
        
        # 获取评分配置
        config = scoring_config or self.HEALTH_DIMENSIONS
        
        total_score = 0
        dimension_scores = {}
        
        for dimension_key, dimension_config in config.items():
            if not dimension_config.get("enabled", True):
                continue
            
            dimension_score = 0
            metric_scores = {}
            
            for metric_key, metric_config in dimension_config.get("metrics", {}).items():
                metric_value = await self.get_metric_value(customer_id, metric_key, db)
                metric_score = self.evaluate_metric(metric_value, metric_config["scoring_rules"])
                
                # 负向指标处理
                if metric_config.get("is_negative"):
                    metric_score = 100 - metric_score
                
                weighted_score = metric_score * metric_config["weight"]
                dimension_score += weighted_score
                metric_scores[metric_key] = {
                    "name": metric_config["name"],
                    "value": metric_value,
                    "raw_score": metric_score,
                    "weight": metric_config["weight"],
                    "weighted_score": weighted_score,
                }
            
            # 应用维度权重
            weighted_dimension_score = dimension_score * dimension_config["weight"]
            total_score += weighted_dimension_score
            
            dimension_scores[dimension_key] = {
                "name": dimension_config["name"],
                "raw_score": dimension_score,
                "weight": dimension_config["weight"],
                "weighted_score": weighted_dimension_score,
                "metrics": metric_scores,
            }
        
        # 确定健康等级
        health_grade = self.get_health_grade(total_score)
        
        # 生成降分原因分析
        reasons = await self.analyze_decline_reasons(customer_id, dimension_scores, db)
        
        # 生成推荐行动计划
        action_plan = self.generate_action_plan(reasons)
        
        return HealthScoreResult(
            customer_id=customer_id,
            total_score=round(total_score, 1),
            health_grade=health_grade,
            dimension_scores=dimension_scores,
            decline_reasons=reasons,
            recommended_actions=action_plan,
            calculated_at=datetime.now(),
        )
    
    def generate_action_plan(self, reasons: list) -> list:
        """根据降分原因生成行动计划"""
        
        action_plan = []
        
        for reason in reasons:
            reason_type = reason.get("type")
            actions = self.ACTION_PLAN_MATRIX.get(reason_type, {}).get("recommended_actions", [])
            
            for action in actions:
                action_plan.append({
                    "reason": self.ACTION_PLAN_MATRIX[reason_type]["name"],
                    "action": action["action"],
                    "owner": action["owner"],
                    "deadline": datetime.now() + timedelta(days=action["deadline_days"]),
                    "priority": "high" if action["deadline_days"] <= 1 else "medium",
                })
        
        # 按优先级和截止日期排序
        action_plan.sort(key=lambda x: (0 if x["priority"] == "high" else 1, x["deadline"]))
        
        return action_plan
```

---

## 六、制造业价格计算器补充方案

### 6.1 完整价格计算器公式实现

```python
# crm/services/manufacturing_price_calculator.py
"""
制造业价格计算器
功能：支持纸张克重、印刷色数、覆膜工艺等规格参数的价格计算
公式：总价 = 面积 × 单价 × 数量 × (1 + 损耗率) + 工艺费用
"""

from decimal import Decimal, ROUND_HALF_UP


class ManufacturingPriceCalculator:
    """制造业价格计算器"""
    
    # 损耗率配置（百分比）
    LOSS_RATE_CONFIG = {
        "paper_box": Decimal("0.05"),    # 纸箱 5%
        "paper_bag": Decimal("0.08"),     # 纸袋 8%
        "color_printing": Decimal("0.03"),  # 彩印 3%
        "soft_packaging": Decimal("0.06"), # 软包装 6%
    }
    
    # 工艺费用配置
    CRAFT_FEE_CONFIG = {
        "lamination_glossy": Decimal("0.50"),    # 亮膜(元/平方分米)
        "lamination_matte": Decimal("0.60"),     # 哑膜(元/平方分米)
        "foil_stamping": Decimal("2.00"),       # 烫金(元/个)
        "uv_coating": Decimal("1.50"),           # UV(元/个)
        "die_cutting": Decimal("0.30"),          # 模切(元/个)
        "embossing": Decimal("1.00"),            # 压纹(元/个)
    }
    
    # 印刷色数单价加成
    COLOR_FEE_CONFIG = {
        1: Decimal("0"),      # 单色
        2: Decimal("0.50"),  # 双色(+0.5元/平方分米)
        4: Decimal("1.00"),  # 四色(+1元/平方分米)
        6: Decimal("1.50"),  # 六色(+1.5元/平方分米)
        8: Decimal("2.00"),  # 八色(+2元/平方分米)
    }
    
    # 纸张克重单价系数
    GSM_PRICE_COEFFICIENT = {
        120: Decimal("0.80"),
        150: Decimal("0.90"),
        200: Decimal("1.00"),
        250: Decimal("1.10"),
        300: Decimal("1.20"),
        350: Decimal("1.30"),
        400: Decimal("1.40"),
    }
    
    def calculate_price(
        self,
        product_id: int,
        specifications: dict,
        quantity: int,
        customer_id: int = None,
        db: AsyncSession = None
    ) -> PriceCalculationResult:
        """
        计算制造业产品价格
        
        Args:
            product_id: 产品ID
            specifications: 规格参数
                - length_cm: 长度(cm)
                - width_cm: 宽度(cm)
                - gsm: 克重(g/m²)
                - color_count: 印刷色数(1/2/4/6/8)
                - lamination: 覆膜工艺(glossy/matte/none)
                - crafts: 特殊工艺列表([foil_stamping, uv, die_cutting])
            quantity: 数量
            customer_id: 客户ID(用于客户专属价)
        
        Returns:
            PriceCalculationResult: 价格计算结果
        """
        
        # 1. 获取基础产品信息
        product = self.get_product(product_id, db)
        
        # 2. 计算面积(平方分米)
        length_dm = Decimal(str(specifications.get("length_cm", 0))) / 10
        width_dm = Decimal(str(specifications.get("width_cm", 0))) / 10
        area_dm2 = length_dm * width_dm  # 单个面积
        
        # 3. 获取克重系数
        gsm = specifications.get("gsm", 200)
        gsm_coefficient = self.GSM_PRICE_COEFFICIENT.get(gsm, Decimal("1.00"))
        
        # 4. 获取基础单价
        base_unit_price = product.standard_price or Decimal("1.00")
        
        # 5. 应用克重系数
        adjusted_price = base_unit_price * gsm_coefficient
        
        # 6. 应用印刷色数加成
        color_count = specifications.get("color_count", 1)
        color_fee = self.COLOR_FEE_CONFIG.get(color_count, Decimal("0"))
        adjusted_price += color_fee
        
        # 7. 计算覆膜费用
        lamination_fee = Decimal("0")
        lamination = specifications.get("lamination")
        if lamination == "glossy":
            lamination_fee = self.CRAFT_FEE_CONFIG["lamination_glossy"] * area_dm2
        elif lamination == "matte":
            lamination_fee = self.CRAFT_FEE_CONFIG["lamination_matte"] * area_dm2
        
        # 8. 计算特殊工艺费用
        craft_fee = Decimal("0")
        crafts = specifications.get("crafts", [])
        for craft in crafts:
            if craft == "foil_stamping":
                craft_fee += self.CRAFT_FEE_CONFIG["foil_stamping"] * quantity
            elif craft == "uv":
                craft_fee += self.CRAFT_FEE_CONFIG["uv_coating"] * quantity
            elif craft == "die_cutting":
                craft_fee += self.CRAFT_FEE_CONFIG["die_cutting"] * quantity
            elif craft == "embossing":
                craft_fee += self.CRAFT_FEE_CONFIG["embossing"] * quantity
        
        # 9. 获取损耗率
        loss_rate = self.get_loss_rate(product.category, db)
        
        # 10. 计算小计
        # 公式: (面积 × 单价 × 数量 × (1 + 损耗率)) + 工艺费用 + 覆膜费用
        subtotal = (area_dm2 * adjusted_price * quantity * (1 + loss_rate)) + craft_fee + lamination_fee
        
        # 11. 获取客户专属折扣
        customer_discount = self.get_customer_discount(customer_id, product_id, db)
        discounted_subtotal = subtotal * customer_discount
        
        # 12. 获取阶梯价格
        tiered_price = self.calculate_tiered_price(
            product_id, quantity, discounted_subtotal, db
        )
        
        # 13. 应用阶梯价格
        if tiered_price:
            final_unit_price = tiered_price
            final_subtotal = tiered_price * quantity * area_dm2 * (1 + loss_rate) + craft_fee + lamination_fee
        else:
            final_unit_price = discounted_subtotal / (quantity * area_dm2 * (1 + loss_rate))
            final_subtotal = discounted_subtotal
        
        # 14. 计算税额
        tax_rate = specifications.get("tax_rate", Decimal("0.13"))
        tax_amount = final_subtotal * tax_rate
        total_amount = final_subtotal + tax_amount
        
        return PriceCalculationResult(
            product_id=product_id,
            specifications=specifications,
            quantity=quantity,
            unit_price=final_unit_price.quantize(Decimal("0.01"), rounding=ROUND_HALF_UP),
            subtotal=final_subtotal.quantize(Decimal("0.01"), rounding=ROUND_HALF_UP),
            tax_amount=tax_amount.quantize(Decimal("0.01"), rounding=ROUND_HALF_UP),
            total_amount=total_amount.quantize(Decimal("0.01"), rounding=ROUND_HALF_UP),
            breakdown={
                "area_dm2": float(area_dm2),
                "base_price": float(adjusted_price),
                "gsm_coefficient": float(gsm_coefficient),
                "color_fee": float(color_fee),
                "lamination_fee": float(lamination_fee),
                "craft_fee": float(craft_fee),
                "loss_rate": float(loss_rate),
                "customer_discount": float(customer_discount),
            }
        )
    
    def get_loss_rate(self, category: str, db: AsyncSession) -> Decimal:
        """获取产品类别的损耗率"""
        return self.LOSS_RATE_CONFIG.get(category, Decimal("0.05"))
    
    def calculate_tiered_price(
        self,
        product_id: int,
        quantity: int,
        base_price: Decimal,
        db: AsyncSession
    ) -> Optional[Decimal]:
        """计算阶梯价格"""
        
        tiers = self.get_price_tiers(product_id, db)
        
        for tier in sorted(tiers, key=lambda x: x["min_quantity"], reverse=True):
            if quantity >= tier["min_quantity"]:
                # 应用阶梯折扣
                return base_price * tier["discount_rate"]
        
        return None
    
    async def generate_quote_from_calculator(
        self,
        customer_id: int,
        items: list[dict],
        db: AsyncSession
    ) -> dict:
        """从价格计算器生成报价单"""
        
        quote_items = []
        total_amount = Decimal("0")
        
        for item in items:
            calc_result = self.calculate_price(
                product_id=item["product_id"],
                specifications=item["specifications"],
                quantity=item["quantity"],
                customer_id=customer_id,
                db=db
            )
            
            quote_items.append({
                "product_id": item["product_id"],
                "specifications": item["specifications"],
                "quantity": item["quantity"],
                "unit_price": calc_result.unit_price,
                "subtotal": calc_result.subtotal,
                "breakdown": calc_result.breakdown,
            })
            
            total_amount += calc_result.subtotal
        
        # 生成报价单编号
        quote_no = await self.generate_quote_no(db)
        
        return {
            "quote_no": quote_no,
            "customer_id": customer_id,
            "items": quote_items,
            "total_amount": total_amount,
            "status": "draft",
        }


class PriceCalculationResult(BaseModel):
    """价格计算结果"""
    product_id: int
    specifications: dict
    quantity: int
    unit_price: Decimal  # 单价
    subtotal: Decimal     # 小计
    tax_amount: Decimal   # 税额
    total_amount: Decimal  # 总计
    breakdown: dict       # 费用明细
```

---

## 七、多层级回收规则补充方案

### 7.1 多层级回收规则详细实现

```python
# crm/services/multi_level_recycle_service.py
"""
多层级客户回收规则服务
功能：未跟进回收/未转化回收/低效回收/超量回收
"""

from enum import Enum


class RecycleType(str, Enum):
    """回收类型"""
    NO_FOLLOWUP = "no_followup"       # 未跟进回收
    NO_CONVERSION = "no_conversion"     # 未转化回收
    LOW_EFFICIENCY = "low_efficiency"   # 低效回收
    EXCEED_LIMIT = "exceed_limit"      # 超量回收


class MultiLevelRecycleRule:
    """多层级回收规则"""
    
    # 回收规则配置
    RECYCLE_RULES = {
        RecycleType.NO_FOLLOWUP: {
            "name": "未跟进回收",
            "description": "客户在当前池中超过指定天数无跟进记录，自动回收到上级池",
            "condition": {
                "field": "last_followup_days",
                "operator": ">",
                "personal_pool_days": 7,      # 个人池7天无跟进
                "team_pool_days": 14,          # 团队池14天无跟进
            },
            "target_pool": {
                "personal": "team",   # 个人池 → 团队池
                "team": "public",     # 团队池 → 公海池
            },
            "priority": 1,
        },
        RecycleType.NO_CONVERSION: {
            "name": "未转化回收",
            "description": "线索领取后超过30天未转化为商机，自动回收到公海池",
            "condition": {
                "field": "days_since_claim",
                "operator": ">",
                "threshold_days": 30,
            },
            "target_pool": "public",
            "exclude_stages": ["negotiating", "contracted"],  # 排除谈判中/已签约
            "priority": 2,
        },
        RecycleType.LOW_EFFICIENCY: {
            "name": "低效回收",
            "description": "连续60天跟进但未产生成交，自动回收到公海池",
            "condition": {
                "field": "consecutive_no_deal_days",
                "operator": ">=",
                "threshold_days": 60,
            },
            "target_pool": "public",
            "check_opportunity_count": True,  # 检查是否有意向商机
            "priority": 3,
        },
        RecycleType.EXCEED_LIMIT: {
            "name": "超量回收",
            "description": "销售持有客户数超过上限，自动回收超量客户到公海池",
            "condition": {
                "field": "customer_count",
                "operator": ">",
                "junior_limit": 20,     # 初级销售上限
                "senior_limit": 30,     # 高级销售上限
            },
            "target_pool": "public",
            "sort_by": "last_followup_days",  # 按最后跟进时间排序回收
            "priority": 4,
        },
    }
    
    async def check_and_execute_recycle(
        self,
        user_id: int = None,
        customer_id: int = None,
        db: AsyncSession = None
    ) -> list[dict]:
        """检查并执行回收"""
        
        results = []
        
        # 获取待检查的客户列表
        customers = await self.get_customers_for_recycle_check(
            user_id=user_id,
            customer_id=customer_id,
            db=db
        )
        
        for customer in customers:
            # 按优先级检查各回收规则
            for recycle_type in sorted(
                self.RECYCLE_RULES.keys(),
                key=lambda x: self.RECYCLE_RULES[x]["priority"]
            ):
                rule = self.RECYCLE_RULES[recycle_type]
                
                if await self.check_recycle_condition(customer, recycle_type, rule, db):
                    # 执行回收
                    result = await self.execute_recycle(
                        customer, recycle_type, rule, db
                    )
                    results.append(result)
                    
                    # 一个客户只执行一次回收（优先级最高的）
                    break
        
        return results
    
    async def check_recycle_condition(
        self,
        customer: dict,
        recycle_type: RecycleType,
        rule: dict,
        db: AsyncSession
    ) -> bool:
        """检查是否满足回收条件"""
        
        condition = rule["condition"]
        
        if recycle_type == RecycleType.NO_FOLLOWUP:
            pool_type = customer["pool_type"]
            days = condition["condition"]["personal_pool_days"] if pool_type == "personal" \
                   else condition["condition"]["team_pool_days"]
            last_followup_days = customer.get("last_followup_days", 0)
            return last_followup_days > days
        
        elif recycle_type == RecycleType.NO_CONVERSION:
            # 检查是否在排除阶段
            current_stage = customer.get("stage_name", "")
            if current_stage in rule.get("exclude_stages", []):
                return False
            
            days_since_claim = customer.get("days_since_claim", 0)
            return days_since_claim > condition["condition"]["threshold_days"]
        
        elif recycle_type == RecycleType.LOW_EFFICIENCY:
            # 检查是否有意向商机
            if rule.get("check_opportunity_count"):
                active_opps = customer.get("active_opportunity_count", 0)
                if active_opps > 0:
                    return False
            
            consecutive_days = customer.get("consecutive_no_deal_days", 0)
            return consecutive_days >= condition["condition"]["threshold_days"]
        
        elif recycle_type == RecycleType.EXCEED_LIMIT:
            # 检查是否超过持有上限
            user_level = customer.get("user_level", "junior")
            limit = condition["condition"]["junior_limit"] if user_level == "junior" \
                    else condition["condition"]["senior_limit"]
            
            customer_count = await self.count_user_customers(customer["owner_id"], db)
            return customer_count > limit
        
        return False
    
    async def execute_recycle(
        self,
        customer: dict,
        recycle_type: RecycleType,
        rule: dict,
        db: AsyncSession
    ) -> dict:
        """执行回收"""
        
        # 确定目标池
        current_pool = customer["pool_type"]
        if recycle_type == RecycleType.EXCEED_LIMIT:
            target_pool = rule["target_pool"]
        else:
            target_pool = rule["target_pool"].get(current_pool, "public")
        
        # 获取原负责人
        original_owner = customer["owner_id"]
        
        # 执行回收
        await self.update_customer_pool(
            customer_id=customer["id"],
            new_pool_type=target_pool,
            new_owner_id=None,
            recycle_type=recycle_type.value,
            recycle_reason=rule["description"],
            db=db
        )
        
        # 记录流转日志
        await self.log_pool_transfer(
            customer_id=customer["id"],
            from_pool=current_pool,
            to_pool=target_pool,
            from_owner=original_owner,
            to_owner=None,
            recycle_type=recycle_type.value,
            reason=rule["description"],
            db=db
        )
        
        # 发送通知
        await self.notify_recycle(customer, recycle_type, rule, original_owner, db)
        
        return {
            "customer_id": customer["id"],
            "customer_name": customer["company_name"],
            "recycle_type": recycle_type.value,
            "from_pool": current_pool,
            "to_pool": target_pool,
            "original_owner": original_owner,
        }
    
    async def notify_recycle(
        self,
        customer: dict,
        recycle_type: RecycleType,
        rule: dict,
        original_owner: int,
        db: AsyncSession
    ) -> None:
        """发送回收通知"""
        
        # 通知原负责人
        await self.send_notification(
            user_id=original_owner,
            title=f"客户已被回收: {customer['company_name']}",
            content=f"客户{customer['company_name']}因\"{rule['description']}\"已被回收到公海池",
            channel="system",
        )
        
        # 通知销售经理
        manager_id = await self.get_manager_id(original_owner, db)
        await self.send_notification(
            user_id=manager_id,
            title=f"团队客户被回收: {customer['company_name']}",
            content=f"{customer['company_name']}已被回收，原因: {rule['description']}",
            channel="system",
        )
```

---

## 八、智能推荐系统补充方案

### 8.1 推荐要素详细实现

```python
# crm/services/intelligent_recommendation_service.py
"""
智能推荐系统
功能：推荐理由+置信度+一键执行
"""

from typing import Optional
from datetime import datetime, timedelta


class RecommendationType(str, Enum):
    """推荐类型"""
    FOLLOWUP_SUGGESTION = "followup_suggestion"    # 跟进建议
    PRODUCT_RECOMMENDATION = "product_recommendation"  # 产品推荐
    ACTION_REMINDER = "action_reminder"            # 行动提醒
    STRATEGY_SUGGESTION = "strategy_suggestion"     # 策略建议


class IntelligentRecommendationService:
    """智能推荐服务"""
    
    # 推荐置信度阈值
    CONFIDENCE_THRESHOLDS = {
        "high": 0.80,    # 高置信度
        "medium": 0.60,  # 中置信度
        "low": 0.40,     # 低置信度
    }
    
    async def generate_recommendations(
        self,
        user_id: int,
        context_type: str,  # customer/opportunity/lead
        context_id: int,
        max_count: int = 5,
        db: AsyncSession = None
    ) -> list[RecommendationResult]:
        """生成智能推荐列表"""
        
        recommendations = []
        
        # 1. 跟进建议推荐
        followup_recs = await self._generate_followup_suggestions(
            context_type, context_id, db
        )
        recommendations.extend(followup_recs)
        
        # 2. 产品推荐
        product_recs = await self._generate_product_recommendations(
            context_type, context_id, db
        )
        recommendations.extend(product_recs)
        
        # 3. 行动提醒
        action_recs = await self._generate_action_reminders(
            context_type, context_id, db
        )
        recommendations.extend(action_recs)
        
        # 4. 策略建议
        strategy_recs = await self._generate_strategy_suggestions(
            context_type, context_id, db
        )
        recommendations.extend(strategy_recs)
        
        # 按置信度排序
        recommendations.sort(key=lambda x: x.confidence_score, reverse=True)
        
        # 返回top N
        return recommendations[:max_count]
    
    async def _generate_followup_suggestions(
        self,
        context_type: str,
        context_id: int,
        db: AsyncSession
    ) -> list[RecommendationResult]:
        """生成跟进建议"""
        
        recommendations = []
        
        if context_type == "customer":
            customer = await self.get_customer(context_id, db)
            
            # 分析最佳联系时间
            best_time = await self.analyze_best_contact_time(
                customer["id"], db
            )
            
            # 分析最佳联系方式
            best_channel = await self.analyze_best_contact_channel(
                customer["id"], db
            )
            
            if best_time and best_channel:
                recommendations.append(RecommendationResult(
                    type=RecommendationType.FOLLOWUP_SUGGESTION,
                    title=f"建议{self._get_day_name(best_time)}{self._get_time_period(best_time)}联系",
                    reason=f"该客户在{self._get_day_name(best_time)}{self._get_time_period(best_time)}的响应率最高({best_time.get('response_rate', 0)*100:.0f}%)",
                    confidence_score=best_time.get("confidence", 0.75),
                    expected_outcome=f"推进到下一阶段概率提升{best_time.get('stage_progress_rate', 0)*100:.0f}%",
                    action_config={
                        "action_type": "create_followup",
                        "suggested_channel": best_channel.get("channel"),
                        "suggested_day": best_time.get("day_of_week"),
                        "suggested_hour": best_time.get("hour"),
                    },
                    one_click_enabled=True,
                ))
            
            # 跟进话术推荐
            talk_points = await self.generate_talk_points(customer["id"], db)
            if talk_points:
                recommendations.append(RecommendationResult(
                    type=RecommendationType.STRATEGY_SUGGESTION,
                    title="推荐跟进话题",
                    reason="基于历史互动分析，以下话题最能引起客户兴趣",
                    confidence_score=0.70,
                    expected_outcome="提升客户互动意愿",
                    action_config={
                        "action_type": "show_talk_points",
                        "talk_points": talk_points,
                    },
                    one_click_enabled=False,
                ))
        
        return recommendations
    
    async def _generate_product_recommendations(
        self,
        context_type: str,
        context_id: int,
        db: AsyncSession
    ) -> list[RecommendationResult]:
        """生成产品推荐"""
        
        recommendations = []
        
        if context_type == "customer":
            customer = await self.get_customer(context_id, db)
            
            # 基于历史购买推荐
            historical_products = await self.get_historical_products(
                customer["id"], db
            )
            
            # 基于同行业推荐
            similar_customer_products = await self.get_similar_customer_products(
                customer["industry"], customer["scale"], db
            )
            
            for product in similar_customer_products[:3]:
                # 检查是否已购买
                if product["id"] in [p["id"] for p in historical_products]:
                    continue
                
                # 计算推荐置信度
                purchase_likelihood = await self.calculate_purchase_likelihood(
                    customer["id"], product["id"], db
                )
                
                if purchase_likelihood > self.CONFIDENCE_THRESHOLDS["low"]:
                    recommendations.append(RecommendationResult(
                        type=RecommendationType.PRODUCT_RECOMMENDATION,
                        title=f"推荐产品: {product['name']}",
                        reason=product.get("recommendation_reason", 
                            f"同行业{product.get('similar_customer_count', 0)}家客户已购买"),
                        confidence_score=purchase_likelihood,
                        expected_outcome=f"预估增购金额: {product.get('estimated_amount', 0)}元",
                        action_config={
                            "action_type": "send_recommendation",
                            "product_id": product["id"],
                            "customer_id": context_id,
                        },
                        one_click_enabled=True,
                    ))
        
        return recommendations
    
    async def _generate_action_reminders(
        self,
        context_type: str,
        context_id: int,
        db: AsyncSession
    ) -> list[RecommendationResult]:
        """生成行动提醒"""
        
        recommendations = []
        
        if context_type == "customer":
            customer = await self.get_customer(context_id, db)
            
            # 合同到期提醒
            expiring_contracts = await self.get_expiring_contracts(
                customer["id"], days=90, db=db
            )
            for contract in expiring_contracts:
                days_left = (contract["end_date"] - datetime.now().date()).days
                
                recommendations.append(RecommendationResult(
                    type=RecommendationType.ACTION_REMINDER,
                    title=f"合同即将到期(剩余{days_left}天)",
                    reason=f"续约概率{contract.get('renewal_probability', 0)*100:.0f}%，历史续约率{contract.get('historical_renewal_rate', 0)*100:.0f}%",
                    confidence_score=contract.get("renewal_probability", 0.75),
                    expected_outcome=f"续约金额预估: {contract.get('estimated_renewal_amount', 0)}元",
                    action_config={
                        "action_type": "create_renewal_task",
                        "contract_id": contract["id"],
                        "suggested_deadline_days": min(days_left - 30, 7),
                    },
                    priority="high" if days_left <= 30 else "medium",
                    one_click_enabled=True,
                ))
            
            # 健康度下降提醒
            health_decline = await self.check_health_decline(
                customer["id"], db
            )
            if health_decline:
                recommendations.append(RecommendationResult(
                    type=RecommendationType.ACTION_REMINDER,
                    title=f"健康度下降预警({health_decline['decline_score']}分)",
                    reason=health_decline.get("decline_reasons", "近期互动减少"),
                    confidence_score=0.85,
                    expected_outcome="及时干预可挽回客户",
                    action_config={
                        "action_type": "create_intervention_task",
                        "customer_id": context_id,
                        "suggested_actions": health_decline.get("suggested_actions"),
                    },
                    priority="high",
                    one_click_enabled=True,
                ))
        
        return recommendations
    
    async def execute_recommendation(
        self,
        recommendation: RecommendationResult,
        user_id: int,
        db: AsyncSession
    ) -> dict:
        """执行推荐（一键执行）"""
        
        action_config = recommendation.action_config
        action_type = action_config.get("action_type")
        
        if action_type == "create_followup":
            # 创建跟进任务
            followup = await self.create_followup_task(
                customer_id=recommendation.context_id,
                channel=action_config.get("suggested_channel"),
                planned_date=datetime.combine(
                    self._get_next_day(action_config.get("suggested_day", 1)),
                    datetime.min.time().replace(hour=action_config.get("suggested_hour", 10))
                ) if action_config.get("suggested_day") else None,
                user_id=user_id,
                db=db
            )
            return {"success": True, "followup_id": followup.id}
        
        elif action_type == "send_recommendation":
            # 发送产品推荐
            await self.send_product_recommendation(
                customer_id=recommendation.context_id,
                product_id=action_config.get("product_id"),
                user_id=user_id,
                db=db
            )
            return {"success": True, "message": "推荐已发送"}
        
        elif action_type == "create_renewal_task":
            # 创建续约任务
            task = await self.create_task(
                title=f"合同续约跟进: {recommendation.title}",
                task_type="renewal",
                related_type="contract",
                related_id=action_config.get("contract_id"),
                due_date=datetime.now() + timedelta(days=action_config.get("suggested_deadline_days", 7)),
                owner_id=user_id,
                db=db
            )
            return {"success": True, "task_id": task.id}
        
        elif action_type == "create_intervention_task":
            # 创建干预任务
            task = await self.create_task(
                title=f"客户健康度干预: {recommendation.title}",
                task_type="intervention",
                related_type="customer",
                related_id=recommendation.context_id,
                due_date=datetime.now() + timedelta(days=3),
                owner_id=user_id,
                priority="high",
                db=db
            )
            return {"success": True, "task_id": task.id}
        
        return {"success": False, "error": "Unknown action type"}


class RecommendationResult(BaseModel):
    """推荐结果"""
    type: RecommendationType
    title: str
    reason: str  # 推荐理由
    confidence_score: float  # 置信度 0-1
    expected_outcome: Optional[str]  # 预期效果
    action_config: dict  # 动作配置
    priority: str = "medium"  # high/medium/low
    one_click_enabled: bool = True  # 是否支持一键执行
    context_type: Optional[str] = None
    context_id: Optional[int] = None
```

---

## 九、数据库表补充设计

### 9.1 订单管理相关表

```sql
-- 订单主表
CREATE TABLE crm_order (
    id SERIAL PRIMARY KEY,
    order_no VARCHAR(50) NOT NULL UNIQUE,  -- 订单编号: ORD-YYYYMMDD-XXX
    contract_id INT NOT NULL REFERENCES crm_contract(id),
    customer_id INT NOT NULL REFERENCES crm_customer(id),
    order_type VARCHAR(20) NOT NULL DEFAULT 'standard',  -- standard/replenishment/sample
    delivery_type VARCHAR(20) NOT NULL DEFAULT 'single',  -- single/batch
    planned_delivery_date DATE,  -- 计划交货日期
    actual_delivery_date DATE,   -- 实际交货日期
    status VARCHAR(20) NOT NULL DEFAULT 'draft',
    total_amount DECIMAL(15,2) DEFAULT 0,
    notes TEXT,
    creator_id INT NOT NULL,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_order_no (order_no),
    INDEX idx_contract_id (contract_id),
    INDEX idx_customer_id (customer_id),
    INDEX idx_status (status),
    INDEX idx_planned_date (planned_delivery_date),
);

-- 订单明细表
CREATE TABLE crm_order_item (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES crm_order(id) ON DELETE CASCADE,
    product_id INT NOT NULL REFERENCES crm_product(id),
    product_name VARCHAR(200) NOT NULL,
    product_code VARCHAR(50),
    specification TEXT,  -- JSON格式，存储规格参数
    quantity INT NOT NULL,
    unit VARCHAR(20) DEFAULT '个',
    unit_price DECIMAL(15,4) NOT NULL,
    delivered_quantity INT DEFAULT 0,  -- 已交货数量
    amount DECIMAL(15,2) NOT NULL,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_order_id (order_id),
    INDEX idx_product_id (product_id),
);

-- 交货批次表
CREATE TABLE crm_delivery_batch (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES crm_order(id),
    batch_no INT NOT NULL,  -- 批次号
    delivery_date DATE,  -- 交货日期
    logistics_company VARCHAR(100),  -- 物流公司
    tracking_no VARCHAR(100),  -- 运单号
    ship_time TIMESTAMP,  -- 发货时间
    sign_time TIMESTAMP,  -- 签收时间
    signer VARCHAR(100),  -- 签收人
    sign_images JSONB,  -- 签收单图片
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    notes TEXT,
    creator_id INT,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_order_id (order_id),
    INDEX idx_status (status),
);

-- 交货批次明细表
CREATE TABLE crm_delivery_batch_item (
    id SERIAL PRIMARY KEY,
    batch_id INT NOT NULL REFERENCES crm_delivery_batch(id) ON DELETE CASCADE,
    product_id INT NOT NULL,
    product_name VARCHAR(200),
    quantity INT NOT NULL,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_batch_id (batch_id),
);

-- 订单状态变更历史表
CREATE TABLE crm_order_status_history (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES crm_order(id),
    from_status VARCHAR(20),
    to_status VARCHAR(20) NOT NULL,
    operator_id INT NOT NULL,
    notes TEXT,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_order_id (order_id),
);
```

### 9.2 发票管理相关表

```sql
-- 发票主表
CREATE TABLE crm_invoice (
    id SERIAL PRIMARY KEY,
    invoice_no VARCHAR(50) NOT NULL UNIQUE,  -- 发票编号: FP-YYYYMMDD-XXX
    contract_id INT NOT NULL REFERENCES crm_contract(id),
    customer_id INT NOT NULL REFERENCES crm_customer(id),
    payment_record_id INT REFERENCES crm_payment_record(id),  -- 关联回款记录
    invoice_type VARCHAR(20) NOT NULL,  -- special/normal/electronic
    tax_rate DECIMAL(5,4) NOT NULL,  -- 税率
    invoice_amount DECIMAL(15,2) NOT NULL,  -- 发票金额（不含税）
    tax_amount DECIMAL(15,2) NOT NULL,  -- 税额
    total_amount DECIMAL(15,2) NOT NULL,  -- 总金额（含税）
    invoice_number VARCHAR(50),  -- 发票号码（开具后录入）
    invoice_date DATE,  -- 开票日期
    invoice_issuer_id INT,  -- 开票人
    logistics_company VARCHAR(100),  -- 邮寄物流公司
    tracking_no VARCHAR(100),  -- 邮寄运单号
    mailing_date DATE,  -- 邮寄日期
    signer VARCHAR(100),  -- 签收人
    sign_date DATE,  -- 签收日期
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    red_flush_id INT,  -- 关联红冲记录
    remarks TEXT,
    applicant_id INT NOT NULL,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_invoice_no (invoice_no),
    INDEX idx_contract_id (contract_id),
    INDEX idx_customer_id (customer_id),
    INDEX idx_status (status),
);

-- 发票红冲记录表
CREATE TABLE crm_invoice_red_flush (
    id SERIAL PRIMARY KEY,
    invoice_id INT NOT NULL REFERENCES crm_invoice(id),
    original_invoice_number VARCHAR(50) NOT NULL,
    red_flush_invoice_number VARCHAR(50),  -- 红冲发票号
    reason TEXT NOT NULL,
    red_flush_date DATE NOT NULL,
    operator_id INT NOT NULL,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_invoice_id (invoice_id),
);

-- 发票影像附件表
CREATE TABLE crm_invoice_attachment (
    id SERIAL PRIMARY KEY,
    invoice_id INT NOT NULL REFERENCES crm_invoice(id),
    file_name VARCHAR(200) NOT NULL,
    file_url VARCHAR(500) NOT NULL,
    file_type VARCHAR(20),  -- pdf/image
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_invoice_id (invoice_id),
);
```

### 9.3 工作流引擎相关表

```sql
-- 工作流规则表
CREATE TABLE crm_workflow_rule (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    trigger_type VARCHAR(20) NOT NULL,  -- time/status_change/behavior/data_threshold
    trigger_config JSONB NOT NULL,  -- 触发条件配置
    actions JSONB NOT NULL,  -- 执行动作列表
    is_active BOOLEAN DEFAULT TRUE,
    priority INT DEFAULT 0,
    execution_limit INT,  -- 执行次数限制
    failure_retry INT DEFAULT 3,  -- 失败重试次数
    execution_count INT DEFAULT 0,  -- 已执行次数
    last_executed_at TIMESTAMP,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_trigger_type (trigger_type),
    INDEX idx_is_active (is_active),
);

-- 工作流执行记录表
CREATE TABLE crm_workflow_execution_log (
    id SERIAL PRIMARY KEY,
    rule_id INT NOT NULL REFERENCES crm_workflow_rule(id),
    trigger_type VARCHAR(20) NOT NULL,
    trigger_context JSONB,  -- 触发上下文
    execution_result JSONB,  -- 执行结果
    status VARCHAR(20) NOT NULL,  -- success/failed/partial
    error_message TEXT,
    execution_time_ms INT,  -- 执行耗时（毫秒）
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_rule_id (rule_id),
    INDEX idx_status (status),
    INDEX idx_create_time (create_time),
);

-- 工作流执行明细表
CREATE TABLE crm_workflow_action_log (
    id SERIAL PRIMARY KEY,
    execution_id INT NOT NULL REFERENCES crm_workflow_execution_log(id),
    action_type VARCHAR(30) NOT NULL,
    action_config JSONB,
    result JSONB,
    status VARCHAR(20) NOT NULL,
    error_message TEXT,
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_execution_id (execution_id),
);
```

---

## 十、6张P0核心表业务逻辑补充（v3.0新增）

> **更新日期**: 2026-04-25
> **来源**: CRM核心文档更新-6张P0核心表补充指南_v3.0
> **说明**: 补充竞争对手、服务工单、通话记录、拜访记录、审批记录、预警规则6张核心表的业务逻辑代码

### 10.1 竞争对手管理 (crm_competitors)

```python
# crm/services/competitor_service.py
"""制造业CRM竞争对手管理服务"""

from typing import Optional
from enum import Enum
from pydantic import BaseModel, Field
from app.core.database import AsyncSession
from app.core.exceptions import BusinessError


class ThreatLevel(str, Enum):
    HIGH = "high"
    MEDIUM = "medium"
    LOW = "low"


class CompetitorSchema(BaseModel):
    competitor_name: str = Field(..., max_length=200)
    competitor_code: str = Field(..., max_length=50)
    industry: Optional[str] = None
    strengths: Optional[str] = None
    weaknesses: Optional[str] = None
    market_share: Optional[float] = Field(None, ge=0, le=100)
    threat_level: ThreatLevel = ThreatLevel.MEDIUM


class CompetitorService:
    """竞争对手管理服务"""
    
    async def create_competitor(self, data: CompetitorSchema, user_id: int, db: AsyncSession):
        # 1. 校验编码唯一性
        exists = await db.fetch_one(
            "SELECT id FROM crm_competitors WHERE competitor_code = $1", data.competitor_code
        )
        if exists:
            raise BusinessError("竞争对手编码已存在")
        
        # 2. 创建竞争对手
        competitor = Competitor(
            competitor_name=data.competitor_name,
            competitor_code=data.competitor_code,
            industry=data.industry,
            strengths=data.strengths,
            weaknesses=data.weaknesses,
            market_share=data.market_share,
            threat_level=data.threat_level,
            owner_id=user_id
        )
        db.add(competitor)
        await db.flush()
        return {"id": competitor.id, "competitor_code": competitor.competitor_code}
    
    async def get_swot_analysis(self, competitor_id: int, db: AsyncSession) -> dict:
        """SWOT分析：优势/劣势/机会/威胁"""
        competitor = await db.fetch_one(
            "SELECT * FROM crm_competitors WHERE id = $1", competitor_id
        )
        return {
            "strengths": competitor.strengths,
            "weaknesses": competitor.weaknesses,
            "market_share": competitor.market_share,
            "threat_level": competitor.threat_level
        }
```

### 10.2 服务工单管理 (crm_service_tickets)

```python
# crm/services/ticket_service.py
"""制造业CRM服务工单管理服务"""

from datetime import datetime, timedelta
from enum import Enum
from pydantic import BaseModel, Field


class TicketStatus(str, Enum):
    OPEN = "open"
    PROCESSING = "processing"  
    RESOLVED = "resolved"
    CLOSED = "closed"


class TicketPriority(str, Enum):
    URGENT = "urgent"
    HIGH = "high"
    MEDIUM = "medium"
    LOW = "low"


class TicketType(str, Enum):
    REPAIR = "repair"
    CONSULTATION = "consultation"
    COMPLAINT = "complaint"
    OTHER = "other"


class TicketCreateSchema(BaseModel):
    customer_id: int
    contact_id: Optional[int] = None
    contract_id: Optional[int] = None
    ticket_type: TicketType
    priority: TicketPriority = TicketPriority.MEDIUM
    description: str
    sla_hours: int = 24


class TicketService:
    """服务工单管理服务"""
    
    async def create_ticket(self, data: TicketCreateSchema, user_id: int, db: AsyncSession) -> dict:
        # 1. 生成工单编号
        ticket_no = await self._generate_ticket_no(db)
        
        # 2. 根据优先级设置SLA
        sla_map = {"urgent": 4, "high": 8, "medium": 24, "low": 48}
        sla_hours = sla_map.get(data.priority, 24)
        
        # 3. 创建工单
        ticket = ServiceTicket(
            ticket_no=ticket_no,
            customer_id=data.customer_id,
            contact_id=data.contact_id,
            contract_id=data.contract_id,
            ticket_type=data.ticket_type,
            priority=data.priority,
            status=TicketStatus.OPEN,
            sla_hours=sla_hours,
            sla_deadline=datetime.now() + timedelta(hours=sla_hours),
            creator_id=user_id
        )
        db.add(ticket)
        await db.flush()
        return {"ticket_id": ticket.id, "ticket_no": ticket_no}
    
    async def update_status(self, ticket_id: int, new_status: TicketStatus, 
                            handler_id: int, db: AsyncSession):
        """工单状态流转: open→processing→resolved→closed"""
        valid_transitions = {
            TicketStatus.OPEN: [TicketStatus.PROCESSING],
            TicketStatus.PROCESSING: [TicketStatus.RESOLVED],
            TicketStatus.RESOLVED: [TicketStatus.CLOSED],
        }
        ticket = await db.fetch_one("SELECT * FROM crm_service_tickets WHERE id = $1", ticket_id)
        current = TicketStatus(ticket.status)
        
        if new_status not in valid_transitions.get(current, []):
            raise BusinessError(f"不允许从{current}变更为{new_status}")
        
        await db.execute(
            "UPDATE crm_service_tickets SET status = $1, assignee_id = $2 WHERE id = $3",
            new_status, handler_id, ticket_id
        )
        
        # 关闭后触发满意度调查
        if new_status == TicketStatus.CLOSED:
            await self._trigger_satisfaction_survey(ticket.customer_id, db)
    
    async def _generate_ticket_no(self, db: AsyncSession) -> str:
        today = datetime.now().strftime("%Y%m%d")
        result = await db.fetch_one(
            "SELECT COUNT(*) as cnt FROM crm_service_tickets WHERE ticket_no LIKE $1",
            f"TKT-{today}%"
        )
        seq = (result.cnt or 0) + 1
        return f"TKT-{today}-{seq:04d}"
```

### 10.3 通话记录 (crm_call_records)

```python
# crm/services/call_record_service.py
"""制造业CRM通话记录管理服务"""

from datetime import datetime
from enum import Enum
from pydantic import BaseModel, Field


class CallDirection(str, Enum):
    INBOUND = "inbound"
    OUTBOUND = "outbound"


class CallType(str, Enum):
    SALES_FOLLOWUP = "sales_followup"
    AFTER_SALES = "after_sales"
    NEGOTIATION = "negotiation"
    OTHER = "other"


class CallRecordSchema(BaseModel):
    customer_id: int
    contact_id: Optional[int] = None
    call_type: CallType
    direction: CallDirection
    duration_seconds: int = Field(0, ge=0)
    summary: Optional[str] = None
    follow_up_action: Optional[str] = None


class CallRecordService:
    """通话记录服务"""
    
    async def create_record(self, data: CallRecordSchema, user_id: int, db: AsyncSession) -> dict:
        record = CallRecord(
            customer_id=data.customer_id,
            contact_id=data.contact_id,
            call_type=data.call_type,
            direction=data.direction,
            duration_seconds=data.duration_seconds,
            call_time=datetime.now(),
            summary=data.summary,
            follow_up_action=data.follow_up_action,
            recorder_id=user_id
        )
        db.add(record)
        await db.flush()
        
        # 自动生成跟进记录
        if data.follow_up_action:
            await self._create_follow_record(record, data.follow_up_action, db)
        
        return {"record_id": record.id}
```

### 10.4 拜访记录 (crm_visit_records)

```python
# crm/services/visit_record_service.py
"""制造业CRM拜访记录管理服务"""

from datetime import date, datetime
from decimal import Decimal
from enum import Enum
from pydantic import BaseModel, Field


class VisitType(str, Enum):
    FIRST_VISIT = "first_visit"
    REQUIREMENT = "requirement"
    DEMO = "demo"
    NEGOTIATION = "negotiation"
    RETURN_VISIT = "return_visit"
    OTHER = "other"


class VisitRecordSchema(BaseModel):
    customer_id: int
    opportunity_id: Optional[int] = None
    visit_type: VisitType
    visit_date: date
    duration_minutes: int = Field(0, ge=0)
    location: Optional[str] = None
    purpose: Optional[str] = None
    summary: Optional[str] = None
    next_action: Optional[str] = None
    expense_amount: Decimal = Decimal("0.00")


class VisitRecordService:
    """拜访记录服务"""
    
    async def create_visit(self, data: VisitRecordSchema, user_id: int, db: AsyncSession) -> dict:
        visit = VisitRecord(
            customer_id=data.customer_id,
            opportunity_id=data.opportunity_id,
            visit_type=data.visit_type,
            visit_date=data.visit_date,
            duration_minutes=data.duration_minutes,
            location=data.location,
            purpose=data.purpose,
            summary=data.summary,
            next_action=data.next_action,
            expense_amount=data.expense_amount,
            visitor_id=user_id
        )
        db.add(visit)
        await db.flush()
        
        # 自动创建跟进任务
        if data.next_action:
            await self._create_task(visit, data.next_action, db)
        
        return {"visit_id": visit.id}
```

### 10.5 审批记录 (crm_approval_records)

```python
# crm/services/approval_service.py
"""制造业CRM审批记录管理服务"""

from datetime import datetime, timedelta
from enum import Enum
from pydantic import BaseModel, Field


class ApprovalStatus(str, Enum):
    PENDING = "pending"
    APPROVING = "approving"
    APPROVED = "approved"
    REJECTED = "rejected"
    CANCELLED = "cancelled"


class ApprovalType(str, Enum):
    CONTRACT = "contract"
    QUOTATION = "quotation"
    DISCOUNT = "discount"
    EXPENSE = "expense"
    OTHER = "other"


class ApprovalCreateSchema(BaseModel):
    approval_type: ApprovalType
    related_table: str
    related_id: int
    title: str
    description: Optional[str] = None
    amount: Optional[float] = None
    total_steps: int = 1
    deadline_hours: int = 48


class ApprovalService:
    """审批记录管理服务"""
    
    async def create_approval(self, data: ApprovalCreateSchema, applicant_id: int, db: AsyncSession):
        # 生成审批编号
        approval_no = await self._generate_approval_no(db)
        
        approval = ApprovalRecord(
            approval_no=approval_no,
            approval_type=data.approval_type,
            related_table=data.related_table,
            related_id=data.related_id,
            title=data.title,
            description=data.description,
            amount=data.amount,
            applicant_id=applicant_id,
            approval_status=ApprovalStatus.PENDING,
            current_step=1,
            total_steps=data.total_steps,
            deadline=datetime.now() + timedelta(hours=data.deadline_hours)
        )
        db.add(approval)
        await db.flush()
        
        # 通知审批人
        await self._notify_approvers(approval, db)
        
        return {"approval_id": approval.id, "approval_no": approval_no}
    
    async def approve(self, approval_id: int, approver_id: int, 
                      comment: str, db: AsyncSession) -> dict:
        approval = await db.fetch_one(
            "SELECT * FROM crm_approval_records WHERE id = $1", approval_id
        )
        if approval.approval_status != ApprovalStatus.PENDING:
            raise BusinessError("审批已处理，不能重复操作")
        
        # 更新审批状态
        new_status = ApprovalStatus.APPROVED if approval.current_step >= approval.total_steps else ApprovalStatus.PENDING
        new_step = approval.current_step + 1
        
        await db.execute(
            """UPDATE crm_approval_records 
               SET approval_status = $1, current_step = $2, current_approver_id = $3
               WHERE id = $4""",
            new_status, new_step, approver_id, approval_id
        )
        return {"status": new_status}
    
    async def _generate_approval_no(self, db: AsyncSession) -> str:
        today = datetime.now().strftime("%Y%m%d")
        result = await db.fetch_one(
            "SELECT COUNT(*) as cnt FROM crm_approval_records WHERE approval_no LIKE $1",
            f"APP-{today}%"
        )
        seq = (result.cnt or 0) + 1
        return f"APP-{today}-{seq:04d}"
```

### 10.6 预警规则配置 (crm_alert_rules)

```python
# crm/services/alert_rule_service.py
"""制造业CRM预警规则配置服务"""

from datetime import datetime, timedelta
from enum import Enum
from typing import Any
import json
from pydantic import BaseModel, Field


class AlertType(str, Enum):
    CONTRACT_EXPIRE = "contract_expire"
    CUSTOMER_CHURN = "customer_churn"
    OVERDUE_FOLLOWUP = "overdue_followup"
    HEALTH_DECLINE = "health_decline"
    OPPORTUNITY_STUCK = "opportunity_stuck"
    OTHER = "other"


class AlertSeverity(str, Enum):
    CRITICAL = "critical"
    HIGH = "high"
    MEDIUM = "medium"
    LOW = "low"


class AlertRuleSchema(BaseModel):
    rule_name: str = Field(..., max_length=200)
    rule_code: str = Field(..., max_length=50)
    alert_type: AlertType
    trigger_condition: str  # JSON或SQL条件表达式
    trigger_frequency: str = "daily"  # daily/hourly/realtime
    severity: AlertSeverity = AlertSeverity.MEDIUM
    notify_channels: list[str] = ["system"]
    suppress_hours: int = 24  # 静默期


class AlertRuleService:
    """预警规则管理服务"""
    
    async def create_rule(self, data: AlertRuleSchema, user_id: int, db: AsyncSession):
        # 校验编码唯一
        exists = await db.fetch_one(
            "SELECT id FROM crm_alert_rules WHERE rule_code = $1", data.rule_code
        )
        if exists:
            raise BusinessError("预警规则编码已存在")
        
        rule = AlertRule(
            rule_name=data.rule_name,
            rule_code=data.rule_code,
            alert_type=data.alert_type,
            trigger_condition=data.trigger_condition,
            trigger_frequency=data.trigger_frequency,
            severity=data.severity,
            notify_channels=json.dumps(data.notify_channels),
            suppress_hours=data.suppress_hours,
            is_active=True,
            creator_id=user_id
        )
        db.add(rule)
        await db.flush()
        return {"rule_id": rule.id, "rule_code": rule.rule_code}
    
    async def evaluate_rules(self, db: AsyncSession) -> list[dict]:
        """定时评估所有预警规则（Celery定时任务调用）"""
        rules = await db.fetch_all(
            "SELECT * FROM crm_alert_rules WHERE is_active = true"
        )
        triggered = []
        
        for rule in rules:
            # 检查静默期
            if await self._is_suppressed(rule.id, rule.suppress_hours, db):
                continue
            
            # 执行触发条件
            if await self._check_condition(rule, db):
                await self._trigger_alert(rule, db)
                triggered.append({"rule_id": rule.id, "rule_name": rule.rule_name})
        
        return triggered
    
    async def _check_condition(self, rule: AlertRule, db: AsyncSession) -> bool:
        """检查预警触发条件"""
        condition = json.loads(rule.trigger_condition)
        
        if rule.alert_type == AlertType.OVERDUE_FOLLOWUP:
            # 超期未跟进：检查超过N天未跟进的客户
            days = condition.get("days", 7)
            result = await db.fetch_all(
                """SELECT c.id FROM crm_customers c
                   LEFT JOIN crm_follow_records f ON c.id = f.customer_id
                   WHERE f.created_time IS NULL 
                      OR f.created_time < NOW() - INTERVAL '1 day' * $1""",
                days
            )
            return len(result) > 0
        
        if rule.alert_type == AlertType.HEALTH_DECLINE:
            # 健康度下降：检查健康度降幅超过阈值
            threshold = condition.get("threshold", 20)
            result = await db.fetch_all(
                """SELECT customer_id FROM crm_customer_health_scores
                   WHERE score < (SELECT AVG(score) FROM crm_customer_health_scores) - $1""",
                threshold
            )
            return len(result) > 0
        
        return False
    
    async def _is_suppressed(self, rule_id: int, suppress_hours: int, db: AsyncSession) -> bool:
        """检查静默期"""
        recent = await db.fetch_one(
            """SELECT 1 FROM crm_alert_logs 
               WHERE rule_id = $1 AND created_time > NOW() - INTERVAL '1 hour' * $2
               LIMIT 1""",
            rule_id, suppress_hours
        )
        return recent is not None
```

### 10.7 数据库表DDL（6张P0核心表）

```sql
-- 竞争对手表
CREATE TABLE crm_competitors (
    id SERIAL PRIMARY KEY,
    competitor_name VARCHAR(200) NOT NULL,
    competitor_code VARCHAR(50) NOT NULL UNIQUE,
    industry VARCHAR(100),
    strengths TEXT,
    weaknesses TEXT,
    market_share DECIMAL(5,2),
    threat_level VARCHAR(20) DEFAULT 'medium',
    dept_id INTEGER,
    owner_id INTEGER,
    -- 框架标准字段
    uuid VARCHAR(64) NOT NULL DEFAULT gen_random_uuid(),
    status VARCHAR(10) DEFAULT '0',
    description TEXT,
    created_time TIMESTAMP DEFAULT NOW(),
    updated_time TIMESTAMP DEFAULT NOW(),
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_time TIMESTAMP,
    created_id INTEGER,
    updated_id INTEGER,
    deleted_id INTEGER
);

-- 服务工单表
CREATE TABLE crm_service_tickets (
    id SERIAL PRIMARY KEY,
    ticket_no VARCHAR(50) NOT NULL UNIQUE,
    customer_id INTEGER NOT NULL,
    contact_id INTEGER,
    contract_id INTEGER,
    ticket_type VARCHAR(50) DEFAULT 'other',
    priority VARCHAR(20) DEFAULT 'medium',
    status VARCHAR(30) DEFAULT 'open',
    assignee_id INTEGER,
    sla_hours INTEGER DEFAULT 24,
    sla_deadline TIMESTAMP,
    is_overdue BOOLEAN DEFAULT FALSE,
    resolution TEXT,
    customer_satisfaction INTEGER CHECK (customer_satisfaction BETWEEN 1 AND 5),
    -- 框架标准字段 (同上11个字段)
    uuid VARCHAR(64) NOT NULL DEFAULT gen_random_uuid(),
    status VARCHAR(10) DEFAULT '0',
    description TEXT,
    created_time TIMESTAMP DEFAULT NOW(),
    updated_time TIMESTAMP DEFAULT NOW(),
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_time TIMESTAMP,
    created_id INTEGER,
    updated_id INTEGER,
    deleted_id INTEGER
);

-- 通话记录表
CREATE TABLE crm_call_records (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    contact_id INTEGER,
    call_type VARCHAR(30) DEFAULT 'sales_followup',
    direction VARCHAR(20) DEFAULT 'outbound',
    duration_seconds INTEGER DEFAULT 0,
    call_time TIMESTAMP DEFAULT NOW(),
    summary TEXT,
    follow_up_action VARCHAR(500),
    sentiment VARCHAR(20),
    is_recorded BOOLEAN DEFAULT FALSE,
    -- 框架标准字段
    uuid VARCHAR(64) NOT NULL DEFAULT gen_random_uuid(),
    status VARCHAR(10) DEFAULT '0',
    description TEXT,
    created_time TIMESTAMP DEFAULT NOW(),
    updated_time TIMESTAMP DEFAULT NOW(),
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_time TIMESTAMP,
    created_id INTEGER,
    updated_id INTEGER,
    deleted_id INTEGER
);

-- 拜访记录表
CREATE TABLE crm_visit_records (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    opportunity_id INTEGER,
    visit_type VARCHAR(50) DEFAULT 'first_visit',
    visit_date DATE NOT NULL,
    duration_minutes INTEGER DEFAULT 0,
    location VARCHAR(500),
    purpose TEXT,
    summary TEXT,
    next_action TEXT,
    expense_amount DECIMAL(10,2) DEFAULT 0.00,
    is_successful BOOLEAN DEFAULT FALSE,
    -- 框架标准字段
    uuid VARCHAR(64) NOT NULL DEFAULT gen_random_uuid(),
    status VARCHAR(10) DEFAULT '0',
    description TEXT,
    created_time TIMESTAMP DEFAULT NOW(),
    updated_time TIMESTAMP DEFAULT NOW(),
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_time TIMESTAMP,
    created_id INTEGER,
    updated_id INTEGER,
    deleted_id INTEGER
);

-- 审批记录表
CREATE TABLE crm_approval_records (
    id SERIAL PRIMARY KEY,
    approval_no VARCHAR(50) NOT NULL UNIQUE,
    approval_type VARCHAR(50) NOT NULL,
    title VARCHAR(200) NOT NULL,
    related_table VARCHAR(50),
    related_id INTEGER,
    amount DECIMAL(12,2),
    applicant_id INTEGER NOT NULL,
    approval_status VARCHAR(30) DEFAULT 'pending',
    current_approver_id INTEGER,
    current_step INTEGER DEFAULT 1,
    total_steps INTEGER DEFAULT 1,
    deadline TIMESTAMP,
    comment TEXT,
    -- 框架标准字段
    uuid VARCHAR(64) NOT NULL DEFAULT gen_random_uuid(),
    status VARCHAR(10) DEFAULT '0',
    description TEXT,
    created_time TIMESTAMP DEFAULT NOW(),
    updated_time TIMESTAMP DEFAULT NOW(),
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_time TIMESTAMP,
    created_id INTEGER,
    updated_id INTEGER,
    deleted_id INTEGER
);

-- 预警规则表
CREATE TABLE crm_alert_rules (
    id SERIAL PRIMARY KEY,
    rule_name VARCHAR(200) NOT NULL,
    rule_code VARCHAR(50) NOT NULL UNIQUE,
    alert_type VARCHAR(50) NOT NULL,
    trigger_condition TEXT,
    trigger_frequency VARCHAR(30) DEFAULT 'daily',
    severity VARCHAR(20) DEFAULT 'medium',
    is_active BOOLEAN DEFAULT TRUE,
    notify_channels TEXT DEFAULT '["system"]',
    suppress_hours INTEGER DEFAULT 24,
    escalation_rule TEXT,
    -- 框架标准字段
    uuid VARCHAR(64) NOT NULL DEFAULT gen_random_uuid(),
    status VARCHAR(10) DEFAULT '0',
    description TEXT,
    created_time TIMESTAMP DEFAULT NOW(),
    updated_time TIMESTAMP DEFAULT NOW(),
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_time TIMESTAMP,
    created_id INTEGER,
    updated_id INTEGER,
    deleted_id INTEGER
);
```

---

## 十一、数据库字段标准规范（框架兼容性）

> **来源**: CRM数据库表标准字段规范与修复方案
> **依据**: FastApiAdmin框架基类 `app/core/base_model.py` (ModelMixin + UserMixin)

### 11.1 框架标准字段（每张表必须包含）

| 序号 | 字段名 | 数据类型 | 必填 | 默认值 | 说明 |
|------|--------|---------|------|--------|------|
| 1 | id | Integer | ✅ | 自增 | 主键ID |
| 2 | uuid | String(64) | ✅ | gen_random_uuid() | UUID全局唯一标识 |
| 3 | status | String(10) | ✅ | '0' | 系统状态(0:正常 1:禁用) |
| 4 | description | Text | ❌ | NULL | 备注/描述 |
| 5 | created_time | DateTime | ✅ | now() | 创建时间 |
| 6 | updated_time | DateTime | ✅ | now() | 更新时间 |
| 7 | is_deleted | Boolean | ✅ | false | 是否已删除 |
| 8 | deleted_time | DateTime | ❌ | NULL | 删除时间 |
| 9 | created_id | Integer | ❌ | NULL | 创建人ID(FK→sys_user) |
| 10 | updated_id | Integer | ❌ | NULL | 更新人ID(FK→sys_user) |
| 11 | deleted_id | Integer | ❌ | NULL | 删除人ID(FK→sys_user) |

### 11.2 字段命名约束

| 规范 | 正确示例 | 错误示例 |
|------|---------|---------|
| 时间字段 | created_time, updated_time | created_at, updated_at |
| 用户字段 | created_id, updated_id | created_by, updated_by |
| 业务时间 | assigned_at, completed_at (保留) | 不可与框架时间字段冲突 |
| 状态字段 | 业务状态用独立字段名 | 不可占用框架 status 字段 |

---

## 十二、实施优先级与工作量评估

### 12.1 实施优先级

| 优先级 | 功能模块 | 关键功能点 | 预估工作量 |
|--------|---------|-----------|-----------|
| **P0-必须** | 订单与交付管理 | 订单创建/状态流转/分批交货/物流跟踪/签收确认 | 8天 |
| **P0-必须** | 发票管理 | 发票申请/开具/邮寄/红冲 | 5天 |
| **P0-必须** | 自动化工作流引擎 | 4种触发条件+6种执行动作 | 6天 |
| **P0-必须** | 线索防撞单规则 | 先占先得/活跃优先/联合跟进/主管仲裁 | 4天 |
| **P0-必须** | 健康度详细配置 | 5维度权重可配置+行动计划对照表 | 4天 |
| **P0-必须** | 制造业价格计算器 | 规格参数+损耗率+工艺费用计算 | 5天 |
| **P0-必须** | 竞争对手管理 | SWOT分析/威胁评估/商机竞品对比 | 3天 |
| **P0-必须** | 服务工单管理 | 工单流转/SLA时效/满意度回访 | 4天 |
| **P0-必须** | 审批记录管理 | 多级审批/超时升级/审批可视化 | 4天 |
| **P0-必须** | 预警规则引擎 | 条件评估/多渠道通知/静默期控制 | 4天 |
| **P1-建议** | 线索评分详细配置 | 5维度权重可配置 | 3天 |
| **P1-建议** | 多层级回收规则 | 4种回收类型详细实现 | 3天 |
| **P1-建议** | 智能推荐系统 | 推荐理由+置信度+一键执行 | 5天 |
| **P1-建议** | 通话记录 | 通话自动记录/情绪分析/跟进关联 | 2天 |
| **P1-建议** | 拜访记录 | 拜访计划/费用统计/任务关联 | 2天 |
| **P2-可选** | 客户画像4维模型 | 详细实现+可视化 | 4天 |
| **P2-可选** | 智能排序算法 | 综合排序详细实现 | 3天 |

### 12.2 补充方案总工作量

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           补充方案实施路线图（v3.0更新）                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  第一阶段（P0核心）：约50人天                                                  │
│  ├── 订单与交付管理（8天）                                                    │
│  ├── 发票管理（5天）                                                         │
│  ├── 自动化工作流引擎（6天）                                                   │
│  ├── 线索防撞单规则（4天）                                                    │
│  ├── 健康度详细配置（4天）                                                    │
│  ├── 制造业价格计算器（5天）                                                   │
│  ├── 竞争对手管理（3天）⭐新增                                                 │
│  ├── 服务工单管理（4天）⭐新增                                                 │
│  ├── 审批记录管理（4天）⭐新增                                                 │
│  └── 预警规则引擎（4天）⭐新增                                                 │
│                                                                             │
│  第二阶段（P1增强）：约13人天                                                  │
│  ├── 线索评分详细配置（3天）                                                   │
│  ├── 多层级回收规则（3天）                                                    │
│  ├── 智能推荐系统（5天）                                                       │
│  ├── 通话记录管理（2天）⭐新增                                                 │
│  └── 拜访记录管理（2天）⭐新增                                                 │
│                                                                             │
│  第三阶段（P2扩展）：约7人天                                                    │
│  ├── 客户画像4维模型详细实现（4天）                                             │
│  └── 智能排序算法详细实现（3天）                                               │
│                                                                             │
│  合计：70人天（v1.0: 50天 → v3.0: 70天，+20天）                              │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 十三、数据字典补充SQL（v3.0新增）

> **更新日期**: 2026-04-25
> **来源**: CRM核心-代码生成器使用指南_v3.0补充 §4
> **说明**: 为6张P0核心表创建10个数据字典，确保前端下拉框和表单枚举值可用

### 13.1 新增字典清单（10个）

| 序号 | 字典类型 | 字典名称 | 字典值 | 关联表 |
|------|---------|---------|--------|--------|
| 1 | competitor_threat_level | 竞争对手威胁级别 | high/medium/low | crm_competitors |
| 2 | call_type | 通话类型 | sales_followup/after_sales/negotiation/other | crm_call_records |
| 3 | visit_type | 拜访类型 | first_visit/requirement/demo/negotiation/revisit/other | crm_visit_records |
| 4 | ticket_type | 工单类型 | repair/consultation/complaint/other | crm_service_tickets |
| 5 | ticket_priority | 工单优先级 | urgent/high/medium/low | crm_service_tickets |
| 6 | ticket_status | 工单状态 | open/processing/resolved/closed | crm_service_tickets |
| 7 | approval_type | 审批类型 | contract/quotation/discount/expense/other | crm_approval_records |
| 8 | approval_status | 审批状态 | pending/approving/approved/rejected/cancelled | crm_approval_records |
| 9 | alert_type | 预警类型 | contract_expire/customer_churn/overdue_followup/health_decline/opportunity_stuck/other | crm_alert_rules |
| 10 | alert_severity | 预警严重程度 | critical/high/medium/low | crm_alert_rules |

### 13.2 字典创建SQL（完整可执行）

```sql
-- ============================================
-- v3.0 新增10个数据字典（6张P0核心表关联）
-- 执行方式: docker exec -i postgres psql -U crm_user -d crm < this_file.sql
-- ============================================

-- 1. 竞争对手威胁级别
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('竞争对手威胁级别', 'competitor_threat_level', 'on', '竞争对手威胁级别分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'competitor_threat_level', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['高威胁', '中威胁', '低威胁']) AS label,
    unnest(ARRAY['high', 'medium', 'low']) AS value,
    unnest(ARRAY[1, 2, 3]) AS sort,
    unnest(ARRAY['高风险竞争对手', '中等风险竞争对手', '低风险竞争对手']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'competitor_threat_level'
) t;

-- 2. 通话类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('通话类型', 'call_type', 'on', '客户通话类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'call_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['销售跟进', '售后服务', '商务谈判', '其他']) AS label,
    unnest(ARRAY['sales_followup', 'after_sales', 'negotiation', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['销售跟进相关通话', '售后服务相关通话', '商务谈判通话', '其他类型通话']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'call_type'
) t;

-- 3. 拜访类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('拜访类型', 'visit_type', 'on', '客户拜访类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'visit_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['初次拜访', '需求调研', '方案演示', '商务谈判', '售后回访', '其他']) AS label,
    unnest(ARRAY['first_visit', 'requirement', 'demo', 'negotiation', 'revisit', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4, 5, 6]) AS sort,
    unnest(ARRAY['首次客户拜访', '客户需求调研拜访', '产品方案演示拜访', '商务合同谈判拜访', '售后服务回访', '其他类型拜访']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'visit_type'
) t;

-- 4. 工单类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('工单类型', 'ticket_type', 'on', '服务工单类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'ticket_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['故障报修', '技术咨询', '投诉建议', '其他']) AS label,
    unnest(ARRAY['repair', 'consultation', 'complaint', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['产品故障报修工单', '技术使用咨询工单', '客户投诉建议工单', '其他类型工单']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'ticket_type'
) t;

-- 5. 工单优先级
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('工单优先级', 'ticket_priority', 'on', '服务工单优先级分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'ticket_priority', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['紧急', '高', '中', '低']) AS label,
    unnest(ARRAY['urgent', 'high', 'medium', 'low']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['紧急处理工单', '高优先级工单', '中优先级工单', '低优先级工单']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'ticket_priority'
) t;

-- 6. 工单状态
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('工单状态', 'ticket_status', 'on', '服务工单状态分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'ticket_status', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['待处理', '处理中', '已解决', '已关闭']) AS label,
    unnest(ARRAY['open', 'processing', 'resolved', 'closed']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['新建待处理工单', '正在处理中工单', '已解决问题工单', '已关闭工单']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'ticket_status'
) t;

-- 7. 审批类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('审批类型', 'approval_type', 'on', '审批类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'approval_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['合同审批', '报价审批', '折扣审批', '费用审批', '其他']) AS label,
    unnest(ARRAY['contract', 'quotation', 'discount', 'expense', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4, 5]) AS sort,
    unnest(ARRAY['合同签署审批', '报价单审批', '价格折扣审批', '费用报销审批', '其他类型审批']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'approval_type'
) t;

-- 8. 审批状态
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('审批状态', 'approval_status', 'on', '审批流程状态分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'approval_status', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['待提交', '审批中', '已通过', '已驳回', '已取消']) AS label,
    unnest(ARRAY['pending', 'approving', 'approved', 'rejected', 'cancelled']) AS value,
    unnest(ARRAY[1, 2, 3, 4, 5]) AS sort,
    unnest(ARRAY['草稿待提交审批', '正在审批流程中', '审批已通过', '审批已驳回', '审批已取消']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'approval_status'
) t;

-- 9. 预警类型
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('预警类型', 'alert_type', 'on', '预警规则类型分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'alert_type', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['合同到期', '客户流失', '超期未跟进', '健康度下降', '商机停滞', '其他']) AS label,
    unnest(ARRAY['contract_expire', 'customer_churn', 'overdue_followup', 'health_decline', 'opportunity_stuck', 'other']) AS value,
    unnest(ARRAY[1, 2, 3, 4, 5, 6]) AS sort,
    unnest(ARRAY['合同即将到期预警', '客户可能流失预警', '客户超期未跟进预警', '客户健康度下降预警', '商机长时间停滞预警', '其他类型预警']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'alert_type'
) t;

-- 10. 预警严重程度
INSERT INTO sys_dict_type (dict_name, dict_type, status, description, uuid, created_time, updated_time)
VALUES ('预警严重程度', 'alert_severity', 'on', '预警严重程度分类', gen_random_uuid()::text, NOW(), NOW())
ON CONFLICT (dict_type) DO NOTHING;

INSERT INTO sys_dict_data (dict_type_id, dict_label, dict_value, dict_sort, dict_type, is_default, status, description, uuid, created_time, updated_time)
SELECT dt.id, label, value, sort, 'alert_severity', false, 'on', desc_text, gen_random_uuid()::text, NOW(), NOW()
FROM (
  SELECT dt.id,
    unnest(ARRAY['严重', '高', '中', '低']) AS label,
    unnest(ARRAY['critical', 'high', 'medium', 'low']) AS value,
    unnest(ARRAY[1, 2, 3, 4]) AS sort,
    unnest(ARRAY['严重级别预警，需立即处理', '高级别预警，需优先处理', '中级别预警，需关注处理', '低级别预警，可延后处理']) AS desc_text
  FROM sys_dict_type dt 
  WHERE dt.dict_type = 'alert_severity'
) t;
```

---

## 十四、数据权限过滤器实现指南

> **更新日期**: 2026-04-25
> **来源**: CRM核心文档-遗漏模块补充指南_v2.0 §5
> **说明**: 所有业务表必须实现行级数据权限过滤，确保销售人员只能查看自己的数据

### 14.1 数据权限级别定义

| 级别 | 说明 | 适用角色 | SQL过滤条件 |
|------|------|---------|------------|
| 个人级 | 只能看自己的数据 | 销售代表 | `owner_id = current_user.id` |
| 部门级 | 看本部门的数据 | 部门经理 | `dept_id = current_user.dept_id` |
| 公司级 | 看全公司数据 | 总经理 | 无过滤 |
| 自定义 | 根据规则动态计算 | 特殊角色 | 自定义规则引擎 |

### 14.2 统一数据权限中间件实现

```python
# middlewares/data_permission.py
"""数据权限中间件 - 所有业务表查询时自动应用行级过滤"""

from typing import Optional
from sqlalchemy import select, and_
from sqlalchemy.sql import Select

from app.core.models import User
from app.models.base import BaseModel


class DataPermissionLevel(str, Enum):
    PERSONAL = "personal"       # 个人级
    DEPARTMENT = "department"   # 部门级
    COMPANY = "company"         # 公司级
    CUSTOM = "custom"           # 自定义


class DataPermissionMiddleware:
    """统一数据权限过滤器"""
    
    def __init__(self, db: AsyncSession):
        self.db = db
    
    async def apply(self, query: Select, model: type[BaseModel], user: User) -> Select:
        """自动应用数据权限过滤到查询"""
        
        # 超管跳过所有过滤
        if user.is_superuser:
            return query
        
        # 获取用户的数据权限级别
        level = await self._get_permission_level(user)
        
        if level == DataPermissionLevel.PERSONAL:
            if hasattr(model, 'owner_id'):
                query = query.where(model.owner_id == user.id)
                
        elif level == DataPermissionLevel.DEPARTMENT:
            conditions = []
            if hasattr(model, 'dept_id'):
                conditions.append(model.dept_id == user.dept_id)
            if hasattr(model, 'owner_id'):
                # 部门经理可以看到本部门所有数据 + 自己创建的数据
                conditions.append(model.owner_id == user.id)
            if conditions:
                query = query.where(or_(*conditions))
                
        elif level == DataPermissionLevel.COMPANY:
            # 公司级：无过滤，可看全公司数据
            pass
            
        elif level == DataPermissionLevel.CUSTOM:
            # 自定义规则：从配置中读取
            rules = await self._get_custom_rules(user)
            for rule in rules:
                query = query.where(
                    getattr(model, rule.field).in_(rule.values)
                )
        
        return query
    
    async def _get_permission_level(self, user: User) -> DataPermissionLevel:
        """从用户角色中读取数据权限级别"""
        role = await self.db.fetch_one(
            """SELECT r.data_scope 
               FROM sys_roles r 
               JOIN sys_user_roles ur ON r.id = ur.role_id 
               WHERE ur.user_id = $1""",
            user.id
        )
        scope_map = {
            "personal": DataPermissionLevel.PERSONAL,
            "department": DataPermissionLevel.DEPARTMENT,
            "company": DataPermissionLevel.COMPANY,
            "custom": DataPermissionLevel.CUSTOM,
        }
        return scope_map.get(role.data_scope if role else "personal", DataPermissionLevel.PERSONAL)
    
    async def _get_custom_rules(self, user: User) -> list[dict]:
        """获取自定义数据权限规则"""
        rules = await self.db.fetch_all(
            """SELECT field_name, allowed_values 
               FROM sys_data_permission_rules 
               WHERE role_id IN (
                   SELECT role_id FROM sys_user_roles WHERE user_id = $1
               )""",
            user.id
        )
        return [{"field": r.field_name, "values": r.allowed_values} for r in rules]
```

### 14.3 在业务Repository中应用数据权限

```python
# repositories/base_repository.py
"""所有业务表Repository基类 - 自动注入数据权限过滤"""

class BaseRepository:
    model: type[BaseModel]
    permission: DataPermissionMiddleware
    
    def __init__(self, db: AsyncSession, user: Optional[User] = None):
        self.db = db
        self.user = user
        self.permission = DataPermissionMiddleware(db)
    
    async def get_list(self, filters: dict | None = None) -> list:
        """获取列表（自动应用数据权限过滤）"""
        query = select(self.model)
        
        # ⭐ 关键：自动应用数据权限过滤
        if self.user:
            query = await self.permission.apply(query, self.model, self.user)
        
        # 应用其他筛选条件
        if filters:
            for key, value in filters.items():
                if value is not None and hasattr(self.model, key):
                    query = query.where(getattr(self.model, key) == value)
        
        # 系统级：仅返回未删除记录
        if hasattr(self.model, 'is_deleted'):
            query = query.where(self.model.is_deleted == False)
        
        result = await self.db.execute(query)
        return result.scalars().all()


# 各业务Repository直接继承即可自动获得数据权限
class CompetitorRepository(BaseRepository):
    model = Competitor

class TicketRepository(BaseRepository):
    model = ServiceTicket

class CallRecordRepository(BaseRepository):
    model = CallRecord

class VisitRecordRepository(BaseRepository):
    model = VisitRecord
```

---

## 十五、工作流引擎代码补充

> **更新日期**: 2026-04-25
> **来源**: CRM核心文档-遗漏模块补充指南_v2.0 §1
> **说明**: 补充工作流规则引擎、审批流引擎核心代码，支持4种触发条件+6种执行动作

### 15.1 工作流规则引擎

```python
# services/workflow_engine.py
"""制造业CRM工作流规则引擎"""

from enum import Enum
from typing import Any, Optional
import json
from datetime import datetime

from app.core.database import AsyncSession


class TriggerType(str, Enum):
    FIELD_CHANGE = "FIELD_CHANGE"       # 字段变更触发
    STATUS_CHANGE = "STATUS_CHANGE"     # 状态变更触发
    SCHEDULED = "SCHEDULED"             # 定时触发
    CUSTOM_EVENT = "CUSTOM_EVENT"       # 自定义事件触发


class ActionType(str, Enum):
    STATUS_CHANGE = "STATUS_CHANGE"     # 变更状态
    NOTIFICATION = "NOTIFICATION"       # 发送通知
    APPROVAL = "APPROVAL"               # 发起审批
    FIELD_UPDATE = "FIELD_UPDATE"       # 更新字段
    API_CALL = "API_CALL"               # 调用外部API
    CREATE_TASK = "CREATE_TASK"         # 创建任务


class WorkflowEngine:
    """工作流规则引擎 - 监听业务事件并自动执行配置的规则链"""
    
    def __init__(self, db: AsyncSession):
        self.db = db
    
    async def execute_rule(self, rule_id: int, context: dict) -> dict:
        """执行指定工作流规则
        
        Args:
            rule_id: 规则ID
            context: 上下文数据（包含触发的业务对象信息）
        """
        # 1. 加载规则配置
        rule = await self.db.fetch_one(
            "SELECT * FROM crm_workflow_rules WHERE id = $1 AND is_active = true",
            rule_id
        )
        if not rule:
            return {"success": False, "error": "规则不存在或已禁用"}
        
        # 2. 检查触发条件是否满足
        if not await self._check_trigger(rule, context):
            return {"success": False, "error": "触发条件不满足"}
        
        # 3. 检查优先级冲突（高优先级规则优先执行）
        conflicting = await self._check_conflicts(rule, context)
        if conflicting:
            return {"success": False, "error": "存在更高优先级规则冲突", "conflict_id": conflicting}
        
        # 4. 按顺序执行动作链
        actions = json.loads(rule.action_config or "[]")
        results = []
        for action_config in actions:
            result = await self._execute_action(action_config, context)
            results.append(result)
            # 如果某个动作失败且配置了中断，则停止
            if not result.get("success") and action_config.get("break_on_failure"):
                break
        
        # 5. 记录执行日志
        await self._log_execution(rule_id, context, results)
        
        return {"success": True, "results": results}
    
    async def _check_trigger(self, rule: dict, context: dict) -> bool:
        """检查触发条件是否满足"""
        trigger_config = json.loads(rule.trigger_config or "{}")
        trigger_type = trigger_config.get("type")
        
        if trigger_type == TriggerType.FIELD_CHANGE:
            # 检查字段值是否变更到目标值
            entity = context.get("entity", {})
            field = trigger_config.get("field")
            target_value = trigger_config.get("target_value")
            return entity.get(field) == target_value
            
        elif trigger_type == TriggerType.STATUS_CHANGE:
            # 检查状态变更
            old_status = context.get("old_status")
            new_status = context.get("new_status")
            target_status = trigger_config.get("target_status")
            return new_status == target_status
            
        elif trigger_type == TriggerType.SCHEDULED:
            # 定时触发：由Celery Beat调用，始终满足
            return True
            
        elif trigger_type == TriggerType.CUSTOM_EVENT:
            # 自定义事件：检查事件名称匹配
            return context.get("event") == trigger_config.get("event_name")
        
        return False
    
    async def _check_conflicts(self, rule: dict, context: dict) -> Optional[int]:
        """检查是否有更高优先级的冲突规则"""
        conflicting = await self.db.fetch_one(
            """SELECT id FROM crm_workflow_rules 
               WHERE trigger_config->>'type' = $1 
               AND priority < $2 
               AND is_active = true 
               AND id != $3
               LIMIT 1""",
            json.loads(rule.trigger_config or "{}").get("type"),
            rule.priority,
            rule.id
        )
        return conflicting.id if conflicting else None
    
    async def _execute_action(self, action_config: dict, context: dict) -> dict:
        """执行单个动作"""
        action_type = action_config.get("type")
        
        try:
            if action_type == ActionType.STATUS_CHANGE:
                await self._change_status(action_config, context)
            elif action_type == ActionType.NOTIFICATION:
                await self._send_notification(action_config, context)
            elif action_type == ActionType.APPROVAL:
                await self._start_approval(action_config, context)
            elif action_type == ActionType.FIELD_UPDATE:
                await self._update_field(action_config, context)
            elif action_type == ActionType.API_CALL:
                await self._call_external_api(action_config, context)
            elif action_type == ActionType.CREATE_TASK:
                await self._create_task(action_config, context)
            
            return {"action": action_type, "success": True}
        except Exception as e:
            return {"action": action_type, "success": False, "error": str(e)}
    
    async def _change_status(self, config: dict, context: dict):
        """变更业务对象状态"""
        table = config.get("table")
        entity_id = context.get("entity_id")
        new_status = config.get("new_status")
        await self.db.execute(
            f"UPDATE {table} SET status = $1, updated_time = NOW() WHERE id = $2",
            new_status, entity_id
        )
    
    async def _send_notification(self, config: dict, context: dict):
        """发送通知"""
        notify_type = config.get("notify_type", "system")  # system/email/sms/wechat
        template = config.get("template", "")
        recipients = config.get("recipients", [])
        
        # 系统内通知
        if "system" in notify_type:
            for user_id in recipients:
                await self.db.execute(
                    """INSERT INTO sys_notifications (user_id, title, content, type, is_read, created_time)
                       VALUES ($1, '工作流通知', $2, 'workflow', false, NOW())""",
                    user_id, template
                )
        
        # TODO: 邮件/短信/微信通知集成
    
    async def _start_approval(self, config: dict, context: dict):
        """发起审批流程"""
        await self.db.execute(
            """INSERT INTO crm_approval_records 
               (approval_no, approval_type, related_table, related_id, title, 
                approval_status, current_step, total_steps, applicant_id, deadline,
                uuid, created_time, updated_time)
               VALUES ($1, $2, $3, $4, $5, 'pending', 1, $6, $7, NOW() + INTERVAL '$8 hours',
                       gen_random_uuid()::text, NOW(), NOW())""",
            config.get("approval_no"),
            config.get("approval_type"),
            config.get("related_table"),
            context.get("entity_id"),
            config.get("title", "工作流审批"),
            config.get("total_steps", 1),
            context.get("user_id"),
            config.get("deadline_hours", 48)
        )
    
    async def _update_field(self, config: dict, context: dict):
        """更新业务对象字段"""
        table = config.get("table")
        entity_id = context.get("entity_id")
        field = config.get("field")
        value = config.get("value")
        await self.db.execute(
            f"UPDATE {table} SET {field} = $1, updated_time = NOW() WHERE id = $2",
            value, entity_id
        )
    
    async def _call_external_api(self, config: dict, context: dict):
        """调用外部API（如ERP、MES等）"""
        # 预留：对接外部系统
        pass
    
    async def _create_task(self, config: dict, context: dict):
        """自动创建跟进任务"""
        await self.db.execute(
            """INSERT INTO crm_tasks 
               (task_type, title, description, assignee_id, related_type, related_id,
                priority, due_date, status, uuid, created_time, updated_time)
               VALUES ($1, $2, $3, $4, $5, $6, $7, $8, 'pending', 
                       gen_random_uuid()::text, NOW(), NOW())""",
            config.get("task_type", "follow_up"),
            config.get("title", "自动创建任务"),
            config.get("description", ""),
            config.get("assignee_id", context.get("user_id")),
            config.get("related_type", ""),
            context.get("entity_id"),
            config.get("priority", "medium"),
            datetime.now() + timedelta(days=config.get("due_days", 1))
        )
    
    async def _log_execution(self, rule_id: int, context: dict, results: list):
        """记录工作流执行日志"""
        await self.db.execute(
            """INSERT INTO crm_workflow_logs 
               (rule_id, trigger_context, execution_results, is_success, uuid, created_time, updated_time)
               VALUES ($1, $2::jsonb, $3::jsonb, $4, gen_random_uuid()::text, NOW(), NOW())""",
            rule_id,
            json.dumps(context),
            json.dumps(results),
            all(r.get("success") for r in results)
        )
```

### 15.2 事件触发器注册

```python
# services/workflow_triggers.py
"""工作流事件触发器 - 在业务Service中注册调用"""

class WorkflowTriggerService:
    """工作流触发器服务"""
    
    def __init__(self, db: AsyncSession):
        self.engine = WorkflowEngine(db)
        self.db = db
    
    async def on_status_change(self, table: str, entity_id: int, 
                                old_status: str, new_status: str, user_id: int):
        """状态变更事件 - 在业务对象状态变更后调用"""
        # 查找匹配的规则
        rules = await self.db.fetch_all(
            """SELECT id FROM crm_workflow_rules 
               WHERE is_active = true 
               AND trigger_config->>'type' = 'STATUS_CHANGE'
               AND trigger_config->>'target_status' = $1
               ORDER BY priority ASC""",
            new_status
        )
        
        context = {
            "table": table,
            "entity_id": entity_id,
            "old_status": old_status,
            "new_status": new_status,
            "user_id": user_id
        }
        
        for rule in rules:
            await self.engine.execute_rule(rule.id, context)
    
    async def on_field_change(self, table: str, entity_id: int,
                               field: str, new_value: Any, user_id: int):
        """字段变更事件"""
        rules = await self.db.fetch_all(
            """SELECT id FROM crm_workflow_rules 
               WHERE is_active = true 
               AND trigger_config->>'type' = 'FIELD_CHANGE'
               AND trigger_config->>'field' = $1
               AND trigger_config->>'target_value' = $2::text
               ORDER BY priority ASC""",
            field, str(new_value)
        )
        
        context = {"table": table, "entity_id": entity_id, 
                    "field": field, "new_value": new_value, "user_id": user_id}
        
        for rule in rules:
            await self.engine.execute_rule(rule.id, context)
    
    async def on_custom_event(self, event_name: str, entity_type: str, 
                               entity_id: int, user_id: int, extra: dict = None):
        """自定义事件触发"""
        rules = await self.db.fetch_all(
            """SELECT id FROM crm_workflow_rules 
               WHERE is_active = true 
               AND trigger_config->>'type' = 'CUSTOM_EVENT'
               AND trigger_config->>'event_name' = $1
               ORDER BY priority ASC""",
            event_name
        )
        
        context = {
            "event": event_name,
            "entity_type": entity_type,
            "entity_id": entity_id,
            "user_id": user_id,
            **(extra or {})
        }
        
        for rule in rules:
            await self.engine.execute_rule(rule.id, context)
```

---

**文档版本**: v3.0  
**创建日期**: 2026-04-14  
**更新日期**: 2026-04-25  
**状态**: ✅ 补充完成（已整合字典SQL+数据权限+工作流引擎代码）
