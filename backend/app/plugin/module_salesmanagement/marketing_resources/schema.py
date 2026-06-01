from dataclasses import dataclass
from datetime import datetime
from decimal import Decimal

from fastapi import Query
from pydantic import BaseModel, ConfigDict, Field, field_validator

from app.common.enums import QueueEnum
from app.core.base_schema import CommonSchema, UserBySchema
from app.core.validator import DateTimeStr


class XiaoeContactBriefSchema(BaseModel):
    """小鹅通联系人摘要"""

    model_config = ConfigDict(from_attributes=True)

    id: int | None = Field(default=None, description="主键ID")
    username: str | None = Field(default=None, description="小鹅通用户名")
    phone: str | None = Field(default=None, description="手机号")
    xiaoe_updated_at: DateTimeStr | None = Field(default=None, description="小鹅通更新时间")


class MarketingResourceAuditSchema(BaseModel):
    """营销资源审计字段（无 status）"""

    model_config = ConfigDict(from_attributes=True)

    id: int | None = Field(default=None, description="主键ID")
    uuid: str | None = Field(default=None, description="UUID")
    description: str | None = Field(default=None, description="备注")
    created_time: DateTimeStr | None = Field(default=None, description="创建时间")
    updated_time: DateTimeStr | None = Field(default=None, description="更新时间")
    is_deleted: bool = Field(default=False, description="是否已删除")
    deleted_time: DateTimeStr | None = Field(default=None, description="删除时间")


class MarketingResourceCreateSchema(BaseModel):
    """新增营销资源"""

    serial_no: int | None = Field(default=None, description="台账序号")
    month_period: str | None = Field(default=None, description="月份 YYYY-MM")
    resource_acquired_at: datetime | None = Field(default=None, description="资源获取时间")
    contact_name: str | None = Field(default=None, description="姓名")
    phone: str | None = Field(default=None, description="手机号")
    xiaoe_duplicate_check: str | None = Field(default=None, description="小鹅通查重")
    resource_source: str | None = Field(default=None, description="资源来源")
    resource_path: str | None = Field(default=None, description="资源路径")
    owner_id: int | None = Field(default=None, description="归属人ID")
    lead_question: str | None = Field(default=None, description="留资问题")
    is_wechat_added: bool | None = Field(default=None, description="是否加V")
    real_name: str | None = Field(default=None, description="真实姓名")
    has_industry_background: bool | None = Field(default=None, description="是否有产业背景")
    trades_etf: bool | None = Field(default=None, description="是否交易ETF")
    trades_hk_us_stocks: bool | None = Field(default=None, description="是否交易港美股")
    trades_commodity_futures: bool | None = Field(default=None, description="是否交易商品期货")
    trading_capital: str | None = Field(default=None, description="交易资金")
    customer_profile: str | None = Field(default=None, description="客户基本情况")
    customer_demand: str | None = Field(default=None, description="客户需求")
    planned_recommendation: str | None = Field(default=None, description="计划推荐")
    is_deal_closed: bool | None = Field(default=None, description="是否成交")
    deal_amount: Decimal | None = Field(default=None, description="成交金额")
    wechat_id: str | None = Field(default=None, description="微信号")
    other_contact: str | None = Field(default=None, description="其他联系方式")
    importance: str | None = Field(default="normal", description="重要性（字典 normal/urgent）")
    dept_id: int | None = Field(default=None, description="部门ID")
    description: str | None = Field(default=None, description="备注")

    @field_validator("phone", "contact_name", "resource_source", mode="before")
    @classmethod
    def strip_optional_str(cls, v: str | None) -> str | None:
        if v is None:
            return None
        s = str(v).strip()
        return s or None


class MarketingResourceUpdateSchema(MarketingResourceCreateSchema):
    """更新营销资源"""


class MarketingResourceOutSchema(
    MarketingResourceCreateSchema, MarketingResourceAuditSchema, UserBySchema
):
    """营销资源出参"""

    model_config = ConfigDict(from_attributes=True)

    owner: CommonSchema | None = Field(default=None, description="归属人")
    xiaoe_contact: XiaoeContactBriefSchema | None = Field(default=None, description="小鹅通关联")


class FeishuImportSchema(BaseModel):
    """飞书导入参数（均可选，默认读环境变量）"""

    wiki_node_token: str | None = Field(default=None, description="Wiki node token")
    xiaoe_sheet_title: str = Field(default="小鹅通客户名单", description="小鹅通 sheet 名称")
    marketing_sheet_title: str = Field(default="资源统计", description="资源统计 sheet 名称")
    skip_xiaoe: bool = Field(default=False, description="跳过小鹅通表")
    skip_marketing: bool = Field(default=False, description="跳过营销资源表")


@dataclass
class MarketingResourceQueryParam:
    """营销资源查询参数"""

    def __init__(
        self,
        phone: str | None = Query(None, description="手机号"),
        contact_name: str | None = Query(None, description="姓名"),
        resource_source: str | None = Query(None, description="资源来源"),
        month_period: str | None = Query(None, description="月份"),
        owner_id: int | None = Query(None, description="归属人ID"),
        importance: str | None = Query(None, description="重要性"),
    ) -> None:
        if phone:
            self.phone = (QueueEnum.like.value, phone.strip())
        if contact_name:
            self.contact_name = (QueueEnum.like.value, contact_name.strip())
        if resource_source:
            self.resource_source = (QueueEnum.like.value, resource_source.strip())
        if month_period:
            self.month_period = (QueueEnum.eq.value, month_period.strip())
        if owner_id:
            self.owner_id = (QueueEnum.eq.value, owner_id)
        if importance:
            self.importance = (QueueEnum.eq.value, importance.strip())
