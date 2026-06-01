"""营销资源字段解析（月份、小鹅通查重等）。"""

from __future__ import annotations

import re
from datetime import datetime
from typing import Any

import pandas as pd

INVALID_MONTH_VALUES = frozenset({"1970-01", "nan", "none", ""})


def is_blank(value: Any) -> bool:
    if value is None:
        return True
    if isinstance(value, float) and pd.isna(value):
        return True
    s = str(value).strip().lower()
    return s in {"", "nan", "none", "null", "nat"}


def parse_datetime(value: Any) -> datetime | None:
    if is_blank(value):
        return None
    if isinstance(value, datetime):
        return value
    try:
        ts = pd.to_datetime(value, errors="coerce")
        if pd.isna(ts):
            return None
        dt = ts.to_pydatetime()
        if dt.year < 1990:
            return None
        return dt
    except Exception:
        return None


def parse_yymm_compact(value: Any) -> str | None:
    """Excel 月份列常见格式：2512 → 2025-12，2605 → 2026-05。"""
    if is_blank(value):
        return None
    if isinstance(value, (int, float)) and not isinstance(value, bool):
        try:
            n = int(float(value))
        except (ValueError, OverflowError):
            return None
    else:
        s = str(value).strip()
        if not re.fullmatch(r"\d{4}", s):
            return None
        n = int(s)
    if not 1000 <= n <= 9999:
        return None
    yy, mm = divmod(n, 100)
    if not (1 <= mm <= 12 and 0 <= yy <= 99):
        return None
    return f"20{yy:02d}-{mm:02d}"


def parse_month(value: Any) -> str | None:
    if is_blank(value):
        return None
    yymm = parse_yymm_compact(value)
    if yymm:
        return yymm
    if isinstance(value, datetime):
        return value.strftime("%Y-%m") if value.year >= 1990 else None
    s = str(value).strip()
    if s.lower() in INVALID_MONTH_VALUES:
        return None
    if re.fullmatch(r"\d{4}-\d{1,2}", s):
        parts = s.split("-")
        year, month = int(parts[0]), int(parts[1])
        if year >= 1990 and 1 <= month <= 12:
            return f"{year}-{month:02d}"
    dt = parse_datetime(value)
    return dt.strftime("%Y-%m") if dt else None


def resolve_month_period(
    month_raw: Any,
    resource_acquired_at: Any,
) -> str | None:
    """优先有效月份列，否则从资源获取时间推导 YYYY-MM。"""
    month = parse_month(month_raw)
    if month and month.lower() not in INVALID_MONTH_VALUES:
        return month
    acquired = parse_datetime(resource_acquired_at)
    return acquired.strftime("%Y-%m") if acquired else None


def xiaoe_duplicate_label(hit: bool) -> str:
    return "重复" if hit else "未重复"


def normalize_phone_digits(phone: str | None) -> str:
    """仅保留数字；修正 Excel 将 11 位手机号读成 12 位（末尾多 0）的情况。"""
    if not phone:
        return ""
    digits = re.sub(r"\D", "", str(phone).strip())
    if len(digits) == 12 and digits.endswith("0"):
        digits = digits[:11]
    return digits


def phone_lookup_keys(phone: str | None) -> set[str]:
    """生成用于关联 crm_xiaoe_contacts.phone 的候选键（含历史脏数据形态）。"""
    if not phone or not str(phone).strip():
        return set()
    raw = str(phone).strip()
    digits = normalize_phone_digits(raw)
    keys: set[str] = {raw}
    if digits:
        keys.add(digits)
        if len(digits) == 11:
            keys.add(digits + "0")
        elif len(digits) == 12 and digits.endswith("0"):
            keys.add(digits[:11])
    return keys
