#!/usr/bin/env python3
"""回填营销资源：月份（由资源获取时间推导）、小鹅通查重（按手机号关联）。"""

from __future__ import annotations

import asyncio
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
os.environ.setdefault("ENVIRONMENT", "dev")

from sqlalchemy import select

from app.api.v1.module_system.auth.schema import AuthSchema
from app.api.v1.module_system.user.model import UserModel
from app.core.database import async_db_session
from app.plugin.module_salesmanagement.marketing_resources.crud import (
    MarketingResourceCRUD,
    XiaoeContactCRUD,
)
from app.plugin.module_salesmanagement.marketing_resources.model import CrmMarketingResourcesModel
from app.plugin.module_salesmanagement.marketing_resources.resource_field_utils import (
    is_blank,
    normalize_phone_digits,
    resolve_month_period,
    xiaoe_duplicate_label,
)


async def main() -> None:
    async with async_db_session() as session:
        result = await session.execute(
            select(UserModel).where(
                UserModel.is_superuser == True,  # noqa: E712
                UserModel.is_deleted == False,  # noqa: E712
            )
        )
        user = result.scalars().first()
        auth = AuthSchema(user=user, db=session, check_data_scope=False)

        rows = list(await MarketingResourceCRUD(auth).list(search={}))
        xiaoe_map = await XiaoeContactCRUD(auth).map_by_phones(
            [r.phone for r in rows if r.phone]
        )

        month_fixed = dup_fixed = 0
        for row in rows:
            new_month = resolve_month_period(row.month_period, row.resource_acquired_at)
            phone_key = row.phone
            norm = normalize_phone_digits(phone_key) if phone_key else ""
            xiaoe = None
            if phone_key:
                xiaoe = (
                    xiaoe_map.get(str(phone_key).strip())
                    or xiaoe_map.get(norm)
                    or xiaoe_map.get(norm + "0" if len(norm) == 11 else "")
                )
            if phone_key:
                new_dup = xiaoe_duplicate_label(xiaoe is not None)
            else:
                new_dup = None

            invalid_month = is_blank(row.month_period) or str(row.month_period).strip().lower() in {
                "nan",
                "1970-01",
            }
            need_month = (new_month and row.month_period != new_month) or (
                invalid_month and not new_month
            )
            need_dup = phone_key and (
                is_blank(row.xiaoe_duplicate_check)
                or str(row.xiaoe_duplicate_check).strip().lower() in {"nan", "none"}
                or row.xiaoe_duplicate_check != new_dup
            )

            if need_month:
                row.month_period = new_month
                month_fixed += 1
            if need_dup:
                row.xiaoe_duplicate_check = new_dup
                dup_fixed += 1
            elif not phone_key and (
                is_blank(row.xiaoe_duplicate_check)
                or str(row.xiaoe_duplicate_check).strip().lower() == "nan"
            ):
                row.xiaoe_duplicate_check = None
                dup_fixed += 1

        await session.commit()
        print(
            {
                "total": len(rows),
                "month_updated": month_fixed,
                "xiaoe_dup_updated": dup_fixed,
                "xiaoe_contacts_indexed": len(xiaoe_map),
            }
        )


if __name__ == "__main__":
    asyncio.run(main())
