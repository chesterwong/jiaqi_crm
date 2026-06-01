from datetime import datetime
from decimal import Decimal
from typing import TYPE_CHECKING, Optional

from sqlalchemy import Boolean, DateTime, ForeignKey, Integer, Numeric, String, Text
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.core.base_model import MappedBase, UserMixin
from app.utils.common_util import uuid4_str

if TYPE_CHECKING:
    from app.api.v1.module_system.user.model import UserModel


class CrmAuditMixin(MappedBase):
    """CRM 表审计字段（无 status 列）"""

    __abstract__ = True

    id: Mapped[int] = mapped_column(
        Integer, primary_key=True, autoincrement=True, comment="主键ID", index=True
    )
    uuid: Mapped[str] = mapped_column(
        String(64), default=uuid4_str, nullable=False, unique=True, comment="UUID", index=True
    )
    description: Mapped[str | None] = mapped_column(Text, default=None, nullable=True, comment="备注")
    created_time: Mapped[datetime] = mapped_column(
        DateTime, default=datetime.now, nullable=False, comment="创建时间", index=True
    )
    updated_time: Mapped[datetime] = mapped_column(
        DateTime,
        default=datetime.now,
        onupdate=datetime.now,
        nullable=False,
        comment="更新时间",
        index=True,
    )
    is_deleted: Mapped[bool] = mapped_column(
        Boolean, default=False, nullable=False, comment="是否已删除", index=True
    )
    deleted_time: Mapped[datetime | None] = mapped_column(
        DateTime, default=None, nullable=True, comment="删除时间", index=True
    )


class CrmMarketingResourcesModel(CrmAuditMixin, UserMixin):
    """营销资源台账"""

    __tablename__: str = "crm_marketing_resources"
    __table_args__: dict[str, str] = {"comment": "营销资源台账"}
    __loader_options__: list[str] = ["created_by", "updated_by", "owner"]

    serial_no: Mapped[int | None] = mapped_column(Integer, nullable=True, comment="台账序号")
    month_period: Mapped[str | None] = mapped_column(String(7), nullable=True, comment="月份")
    resource_acquired_at: Mapped[datetime | None] = mapped_column(
        DateTime, nullable=True, comment="资源获取时间"
    )
    contact_name: Mapped[str | None] = mapped_column(String(100), nullable=True, comment="姓名")
    phone: Mapped[str | None] = mapped_column(String(50), nullable=True, comment="手机号")
    xiaoe_duplicate_check: Mapped[str | None] = mapped_column(
        String(200), nullable=True, comment="小鹅通查重"
    )
    resource_source: Mapped[str | None] = mapped_column(String(100), nullable=True, comment="资源来源")
    resource_path: Mapped[str | None] = mapped_column(Text, nullable=True, comment="资源路径")
    owner_id: Mapped[int | None] = mapped_column(
        Integer,
        ForeignKey("sys_user.id", ondelete="SET NULL", onupdate="CASCADE"),
        nullable=True,
        index=True,
        comment="归属人ID",
    )
    lead_question: Mapped[str | None] = mapped_column(Text, nullable=True, comment="留资问题")
    is_wechat_added: Mapped[bool | None] = mapped_column(Boolean, nullable=True, comment="是否加V")
    real_name: Mapped[str | None] = mapped_column(String(100), nullable=True, comment="真实姓名")
    has_industry_background: Mapped[bool | None] = mapped_column(
        Boolean, nullable=True, comment="是否有产业背景"
    )
    trades_etf: Mapped[bool | None] = mapped_column(Boolean, nullable=True, comment="是否交易ETF")
    trades_hk_us_stocks: Mapped[bool | None] = mapped_column(
        Boolean, nullable=True, comment="是否交易港美股"
    )
    trades_commodity_futures: Mapped[bool | None] = mapped_column(
        Boolean, nullable=True, comment="是否交易商品期货"
    )
    trading_capital: Mapped[str | None] = mapped_column(String(100), nullable=True, comment="交易资金")
    customer_profile: Mapped[str | None] = mapped_column(Text, nullable=True, comment="客户基本情况")
    customer_demand: Mapped[str | None] = mapped_column(Text, nullable=True, comment="客户需求")
    planned_recommendation: Mapped[str | None] = mapped_column(Text, nullable=True, comment="计划推荐")
    is_deal_closed: Mapped[bool | None] = mapped_column(Boolean, nullable=True, comment="是否成交")
    deal_amount: Mapped[Decimal | None] = mapped_column(Numeric(15, 2), nullable=True, comment="成交金额")
    wechat_id: Mapped[str | None] = mapped_column(String(100), nullable=True, comment="微信号")
    other_contact: Mapped[str | None] = mapped_column(Text, nullable=True, comment="其他联系方式")
    importance: Mapped[str | None] = mapped_column(
        String(20), nullable=True, default="normal", comment="重要性（字典）"
    )
    dept_id: Mapped[int | None] = mapped_column(Integer, nullable=True, index=True, comment="部门ID")

    owner: Mapped[Optional["UserModel"]] = relationship(
        "UserModel",
        lazy="selectin",
        foreign_keys=[owner_id],
        uselist=False,
    )


class CrmXiaoeContactsModel(CrmAuditMixin, UserMixin):
    """小鹅通联系表（只读关联）"""

    __tablename__: str = "crm_xiaoe_contacts"
    __table_args__: dict[str, str] = {"comment": "小鹅通联系表"}

    serial_no: Mapped[int | None] = mapped_column(Integer, nullable=True, comment="序号")
    username: Mapped[str | None] = mapped_column(String(100), nullable=True, comment="用户名")
    phone: Mapped[str | None] = mapped_column(String(50), nullable=True, comment="手机号", index=True)
    xiaoe_updated_at: Mapped[datetime | None] = mapped_column(
        DateTime, nullable=True, comment="小鹅通更新时间"
    )
    dept_id: Mapped[int | None] = mapped_column(Integer, nullable=True, index=True, comment="部门ID")
