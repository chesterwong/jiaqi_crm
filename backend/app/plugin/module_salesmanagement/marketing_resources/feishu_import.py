"""飞书表格 → crm_xiaoe_contacts / crm_marketing_resources 导入。"""

from __future__ import annotations

import re
from datetime import datetime
from pathlib import Path
from decimal import Decimal, InvalidOperation
from typing import Any

import pandas as pd
from sqlalchemy import select, text

from app.api.v1.module_system.auth.schema import AuthSchema
from app.api.v1.module_system.user.model import UserModel
from app.config.setting import settings
from app.core.exceptions import CustomException
from app.core.logger import log
from app.utils.feishu_client import FeishuClient

from .crud import MarketingResourceCRUD, XiaoeContactCRUD
from .resource_field_utils import (
    is_blank,
    normalize_phone_digits,
    parse_datetime,
    resolve_month_period,
)
from .schema import MarketingResourceCreateSchema
from .service import MarketingResourceService

SHEET_XIAOE = "小鹅通客户名单"
SHEET_MARKETING = "资源统计"

# 表头别名 → 字段名
XIAOE_HEADER_MAP: dict[str, list[str]] = {
    "serial_no": ["序号", "serial", "no"],
    "username": ["用户名", "用户名称", "昵称", "名称", "姓名"],
    "phone": ["手机号", "手机", "电话", "手机号码"],
    "xiaoe_updated_at": ["更新时间", "小鹅通更新时间", "最后更新时间", "更新日期"],
}

MARKETING_HEADER_MAP: dict[str, list[str]] = {
    "serial_no": ["序号"],
    "month_period": ["月份"],
    "resource_acquired_at": ["资源获取时间", "获取时间", "留资时间"],
    "contact_name": ["姓名", "联系人", "客户姓名"],
    "phone": ["手机号", "手机", "电话"],
    "xiaoe_duplicate_check": ["小鹅通查重", "查重"],
    "resource_source": ["资源来源", "来源"],
    "resource_path": ["资源路径", "资源路径/地址", "路径", "地址"],
    "owner_name": ["归属", "负责人", "销售", "归属人"],
    "lead_question": ["留资问题", "问题"],
    "is_wechat_added": ["是否加v", "加v", "是否加V"],
    "real_name": ["真实姓名"],
    "has_industry_background": ["是否有产业背景", "产业背景"],
    "trades_etf": ["是否交易etf", "交易etf"],
    "trades_hk_us_stocks": ["是否交易港美股", "港美股"],
    "trades_commodity_futures": ["是否交易商品期货", "商品期货"],
    "trading_capital": ["交易资金"],
    "customer_profile": ["客户基本情况", "基本情况"],
    "customer_demand": ["客户需求", "需求"],
    "planned_recommendation": ["计划推荐"],
    "is_deal_closed": ["是否成交", "成交"],
    "deal_amount": ["成交金额", "金额"],
    "wechat_id": ["微信号", "微信"],
    "other_contact": ["其他联系方式", "其他联系"],
    "importance": ["重要性", "优先级"],
    "description": ["备注", "说明"],
}


def _norm_header(value: Any) -> str:
    text = str(value or "").strip().lower()
    return re.sub(r"[\s_\-/（）()]+", "", text)


def _build_col_index(headers: list[Any], mapping: dict[str, list[str]]) -> dict[str, int]:
    norm_headers = [_norm_header(h) for h in headers]
    alias_norm: dict[str, str] = {}
    for field, aliases in mapping.items():
        for alias in aliases:
            alias_norm[_norm_header(alias)] = field

    col_index: dict[str, int] = {}
    for idx, nh in enumerate(norm_headers):
        if not nh:
            continue
        field = alias_norm.get(nh)
        if field and field not in col_index:
            col_index[field] = idx
    return col_index


def _cell(row: list[Any], col_index: dict[str, int], field: str) -> Any:
    idx = col_index.get(field)
    if idx is None or idx >= len(row):
        return None
    val = row[idx]
    if val is None:
        return None
    if isinstance(val, str) and not val.strip():
        return None
    return val


def _parse_bool(value: Any) -> bool | None:
    if value is None or (isinstance(value, str) and not value.strip()):
        return None
    if isinstance(value, bool):
        return value
    if isinstance(value, (int, float)):
        if value == 1:
            return True
        if value == 0:
            return False
        return None
    s = str(value).strip().lower()
    if s in {"是", "yes", "true", "y", "1", "已", "已成交", "√", "有"}:
        return True
    if s in {"否", "no", "false", "n", "0", "未", "未成交", "×", "无"}:
        return False
    return None


def _parse_int(value: Any) -> int | None:
    if value is None or value == "":
        return None
    try:
        return int(float(str(value).strip()))
    except (ValueError, TypeError):
        return None


def _parse_decimal(value: Any) -> Decimal | None:
    if value is None or value == "":
        return None
    if isinstance(value, float) and pd.isna(value):
        return None
    try:
        s = str(value).strip().replace(",", "").replace("元", "")
        if not s or s.lower() == "nan":
            return None
        dec = Decimal(s)
        if dec.is_nan() or dec.is_infinite():
            return None
        return dec
    except (InvalidOperation, ValueError):
        return None


def _parse_datetime(value: Any) -> datetime | None:
    if value is None or value == "":
        return None
    if isinstance(value, datetime):
        return value
    try:
        ts = pd.to_datetime(value, errors="coerce")
        if pd.isna(ts):
            return None
        return ts.to_pydatetime()
    except Exception:
        return None


def _parse_month(value: Any) -> str | None:
    if value is None or value == "":
        return None
    if isinstance(value, datetime):
        return value.strftime("%Y-%m")
    s = str(value).strip()
    if re.fullmatch(r"\d{4}-\d{1,2}", s):
        parts = s.split("-")
        return f"{parts[0]}-{int(parts[1]):02d}"
    dt = _parse_datetime(value)
    return dt.strftime("%Y-%m") if dt else None


def _parse_phone(value: Any) -> str | None:
    if value is None:
        return None
    s = normalize_phone_digits(str(value).strip())
    if len(s) < 7:
        raw = str(value).strip()
        return raw or None
    return s


def _normalize_cell_str(value: Any) -> str | None:
    if value is None or (isinstance(value, float) and pd.isna(value)):
        return None
    if isinstance(value, (int, float)) and not isinstance(value, bool):
        try:
            fv = float(value)
            if fv == int(fv):
                return str(int(fv))
        except (ValueError, OverflowError):
            pass
    s = str(value).strip()
    return s or None


def _is_pure_digit_string(value: Any) -> bool:
    """「手机号」列是否为纯数字（含 Excel 数字单元格）。"""
    s = _normalize_cell_str(value)
    if not s:
        return False
    return s.isdigit()


def _split_phone_wechat(raw_phone_cell: Any, existing_wechat: Any = None) -> tuple[str | None, str | None]:
    """
    资源统计「手机号」列：纯数字 → phone；否则 → wechat_id。
    """
    if _is_pure_digit_string(raw_phone_cell):
        phone = _normalize_cell_str(raw_phone_cell)
        wechat = _normalize_cell_str(existing_wechat)
        return phone, wechat
    wechat_from_phone = _normalize_cell_str(raw_phone_cell)
    wechat = wechat_from_phone or _normalize_cell_str(existing_wechat)
    return None, wechat


def _dataframe_to_values(df: pd.DataFrame) -> list[list[Any]]:
    headers = [str(c) if not (isinstance(c, float) and pd.isna(c)) else "" for c in df.columns]
    values: list[list[Any]] = [headers]
    for row in df.itertuples(index=False, name=None):
        values.append(list(row))
    return values


def _rows_to_dicts(values: list[list[Any]], mapping: dict[str, list[str]]) -> list[dict[str, Any]]:
    if not values:
        return []
    headers = values[0]
    col_index = _build_col_index(headers, mapping)
    if not col_index:
        raise CustomException(msg=f"表头无法识别，首行: {headers}")

    rows: list[dict[str, Any]] = []
    for line_no, row in enumerate(values[1:], start=2):
        if not row or all(v is None or str(v).strip() == "" for v in row):
            continue
        item = {"_line": line_no}
        for field in mapping:
            item[field] = _cell(row, col_index, field)
        rows.append(item)
    return rows


def _normalize_owner_name(owner_name: Any) -> str | None:
    if not owner_name:
        return None
    name = str(owner_name).strip()
    if not name:
        return None
    for sep in ("——", "—", "–", "-"):
        if sep in name:
            name = name.split(sep, 1)[0].strip()
    return name or None


def _parse_importance(value: Any) -> str:
    if value is None or (isinstance(value, str) and not value.strip()):
        return "normal"
    label = str(value).strip()
    mapping = {
        "普通": "normal",
        "normal": "normal",
        "紧急": "urgent",
        "urgent": "urgent",
    }
    return mapping.get(label, mapping.get(label.lower(), "normal"))


async def _resolve_owner_id(auth: AuthSchema, owner_name: Any) -> int | None:
    name = _normalize_owner_name(owner_name)
    if not name:
        return None
    sql = select(UserModel).where(
        UserModel.name == name,
        UserModel.is_deleted == False,  # noqa: E712
    )
    result = await auth.db.execute(sql)
    user = result.scalars().first()
    if user:
        return user.id
    sql = select(UserModel).where(
        UserModel.name.like(f"{name}%"),
        UserModel.is_deleted == False,  # noqa: E712
    )
    result = await auth.db.execute(sql)
    user = result.scalars().first()
    return user.id if user else None


async def _clear_marketing_resources(auth: AuthSchema) -> None:
    await auth.db.execute(text("TRUNCATE TABLE crm_marketing_resources RESTART IDENTITY"))


class FeishuSalesImportService:
    """飞书销售数据导入。"""

    @classmethod
    async def import_from_wiki(
        cls,
        auth: AuthSchema,
        *,
        wiki_node_token: str | None = None,
        xiaoe_sheet_title: str = SHEET_XIAOE,
        marketing_sheet_title: str = SHEET_MARKETING,
        marketing_sheet_id: str | None = None,
        xiaoe_sheet_id: str | None = None,
        skip_xiaoe: bool = False,
        skip_marketing: bool = False,
    ) -> dict[str, Any]:
        token = wiki_node_token or settings.FEISHU_WIKI_NODE_TOKEN
        if not token:
            raise CustomException(msg="未配置 FEISHU_WIKI_NODE_TOKEN")

        client = FeishuClient()
        spreadsheet_token = client.get_wiki_spreadsheet_token(token)

        report: dict[str, Any] = {
            "spreadsheet_token": spreadsheet_token,
            "xiaoe": {},
            "marketing": {},
        }

        if not skip_xiaoe:
            xid = xiaoe_sheet_id or client.find_sheet_id(
                spreadsheet_token, title=xiaoe_sheet_title
            )
            x_values = client.read_sheet_values(spreadsheet_token, xid)
            report["xiaoe"] = await cls._import_xiaoe_rows(auth, x_values)

        if not skip_marketing:
            mid = marketing_sheet_id or client.find_sheet_id(
                spreadsheet_token, title=marketing_sheet_title
            )
            m_values = client.read_sheet_values(spreadsheet_token, mid)
            report["marketing"] = await cls._import_marketing_rows(auth, m_values)

        return report

    @classmethod
    async def _import_xiaoe_rows(
        cls, auth: AuthSchema, values: list[list[Any]]
    ) -> dict[str, int]:
        rows = _rows_to_dicts(values, XIAOE_HEADER_MAP)
        crud = XiaoeContactCRUD(auth)
        created = updated = skipped = 0

        for row in rows:
            phone = _parse_phone(row.get("phone"))
            if not phone:
                skipped += 1
                continue

            payload = {
                "serial_no": _parse_int(row.get("serial_no")),
                "username": str(row.get("username")).strip() if row.get("username") else None,
                "phone": phone,
                "xiaoe_updated_at": _parse_datetime(row.get("xiaoe_updated_at")),
            }
            existing = await crud.get_first_by_phone(phone)
            if existing:
                await crud.update(id=existing.id, data=payload)
                updated += 1
            else:
                await crud.create(data=payload)
                created += 1

        await auth.db.commit()
        log.info(f"小鹅通导入完成: 新增{created} 更新{updated} 跳过{skipped}")
        return {"created": created, "updated": updated, "skipped": skipped, "total": len(rows)}

    @classmethod
    async def _import_marketing_rows(
        cls, auth: AuthSchema, values: list[list[Any]], *, replace: bool = False
    ) -> dict[str, int]:
        if replace:
            await _clear_marketing_resources(auth)
        rows = _rows_to_dicts(values, MARKETING_HEADER_MAP)
        created = skipped = 0

        wechat_as_phone = 0
        for row in rows:
            phone, wechat_id = _split_phone_wechat(row.get("phone"), row.get("wechat_id"))
            if row.get("phone") and not _is_pure_digit_string(row.get("phone")):
                wechat_as_phone += 1
            contact_name = (
                str(row.get("contact_name")).strip()
                if not is_blank(row.get("contact_name"))
                else None
            )
            if not phone and not contact_name and not wechat_id:
                skipped += 1
                continue

            owner_id = await _resolve_owner_id(auth, row.get("owner_name"))
            resource_acquired_at = _parse_datetime(row.get("resource_acquired_at"))
            month_period = resolve_month_period(
                row.get("month_period"), resource_acquired_at
            )
            dup_check = None
            if phone:
                dup_check = await MarketingResourceService._resolve_xiaoe_duplicate(
                    auth, phone
                )

            data = MarketingResourceCreateSchema(
                serial_no=_parse_int(row.get("serial_no")),
                month_period=month_period,
                resource_acquired_at=resource_acquired_at,
                contact_name=contact_name,
                phone=phone,
                xiaoe_duplicate_check=dup_check,
                resource_source=(
                    str(row.get("resource_source")).strip()
                    if row.get("resource_source")
                    else None
                ),
                resource_path=(
                    str(row.get("resource_path")).strip() if row.get("resource_path") else None
                ),
                owner_id=owner_id,
                lead_question=(
                    str(row.get("lead_question")).strip() if row.get("lead_question") else None
                ),
                is_wechat_added=_parse_bool(row.get("is_wechat_added")),
                real_name=str(row.get("real_name")).strip() if row.get("real_name") else None,
                has_industry_background=_parse_bool(row.get("has_industry_background")),
                trades_etf=_parse_bool(row.get("trades_etf")),
                trades_hk_us_stocks=_parse_bool(row.get("trades_hk_us_stocks")),
                trades_commodity_futures=_parse_bool(row.get("trades_commodity_futures")),
                trading_capital=(
                    str(row.get("trading_capital")).strip()
                    if row.get("trading_capital")
                    else None
                ),
                customer_profile=(
                    str(row.get("customer_profile")).strip()
                    if row.get("customer_profile")
                    else None
                ),
                customer_demand=(
                    str(row.get("customer_demand")).strip()
                    if row.get("customer_demand")
                    else None
                ),
                planned_recommendation=(
                    str(row.get("planned_recommendation")).strip()
                    if row.get("planned_recommendation")
                    else None
                ),
                is_deal_closed=_parse_bool(row.get("is_deal_closed")),
                deal_amount=_parse_decimal(row.get("deal_amount")),
                wechat_id=wechat_id,
                other_contact=(
                    str(row.get("other_contact")).strip() if row.get("other_contact") else None
                ),
                importance=_parse_importance(row.get("importance")),
                description=(
                    str(row.get("description")).strip() if row.get("description") else None
                ),
            )
            await MarketingResourceCRUD(auth).create_crud(data=data)
            created += 1

        await auth.db.commit()
        log.info(f"营销资源导入完成: 新增{created} 跳过{skipped} 微信号列{wechat_as_phone}")
        return {
            "created": created,
            "skipped": skipped,
            "total": len(rows),
            "wechat_from_phone_column": wechat_as_phone,
        }

    @classmethod
    async def import_from_excel(
        cls,
        auth: AuthSchema,
        file_path: str,
        *,
        xiaoe_sheet: str = SHEET_XIAOE,
        marketing_sheet: str = SHEET_MARKETING,
        skip_xiaoe: bool = False,
        skip_marketing: bool = False,
        replace_marketing: bool = False,
    ) -> dict[str, Any]:
        path = Path(file_path).expanduser().resolve()
        if not path.is_file():
            raise CustomException(msg=f"Excel 文件不存在: {path}")

        report: dict[str, Any] = {"file": str(path), "xiaoe": {}, "marketing": {}}
        xls = pd.ExcelFile(path)

        if not skip_xiaoe:
            if xiaoe_sheet not in xls.sheet_names:
                raise CustomException(msg=f"未找到工作表「{xiaoe_sheet}」，现有: {xls.sheet_names}")
            xdf = pd.read_excel(path, sheet_name=xiaoe_sheet, header=0)
            report["xiaoe"] = await cls._import_xiaoe_rows(auth, _dataframe_to_values(xdf))

        if not skip_marketing:
            if marketing_sheet not in xls.sheet_names:
                raise CustomException(msg=f"未找到工作表「{marketing_sheet}」，现有: {xls.sheet_names}")
            mdf = pd.read_excel(path, sheet_name=marketing_sheet, header=0)
            report["marketing"] = await cls._import_marketing_rows(
                auth, _dataframe_to_values(mdf), replace=replace_marketing
            )

        return report

    @classmethod
    def list_wiki_sheets(cls, wiki_node_token: str | None = None) -> list[dict[str, Any]]:
        token = wiki_node_token or settings.FEISHU_WIKI_NODE_TOKEN
        client = FeishuClient()
        spreadsheet_token = client.get_wiki_spreadsheet_token(token)
        return client.list_sheets(spreadsheet_token)
