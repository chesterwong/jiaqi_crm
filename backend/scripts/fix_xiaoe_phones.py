#!/usr/bin/env python3
"""将小鹅通联系人 phone 规范为 11 位（去掉 Excel 多读的一位尾 0）。"""

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
from app.plugin.module_salesmanagement.marketing_resources.model import CrmXiaoeContactsModel
from app.plugin.module_salesmanagement.marketing_resources.resource_field_utils import (
    normalize_phone_digits,
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
        _ = AuthSchema(user=user, db=session, check_data_scope=False)

        rows = (await session.execute(select(CrmXiaoeContactsModel))).scalars().all()
        fixed = 0
        for row in rows:
            if not row.phone:
                continue
            norm = normalize_phone_digits(row.phone)
            if norm and norm != row.phone:
                row.phone = norm
                fixed += 1
        await session.commit()
        print({"total": len(rows), "phone_normalized": fixed})


if __name__ == "__main__":
    asyncio.run(main())
