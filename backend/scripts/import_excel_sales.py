#!/usr/bin/env python3
"""从本地 Excel 导入销售数据（资源统计 + 小鹅通客户名单）。"""

from __future__ import annotations

import argparse
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
from app.plugin.module_salesmanagement.marketing_resources.feishu_import import (
    FeishuSalesImportService,
)


async def _get_admin_auth(session) -> AuthSchema:
    result = await session.execute(
        select(UserModel).where(
            UserModel.is_superuser == True,  # noqa: E712
            UserModel.is_deleted == False,  # noqa: E712
        )
    )
    user = result.scalars().first()
    if not user:
        result = await session.execute(
            select(UserModel).where(UserModel.is_deleted == False).limit(1)  # noqa: E712
        )
        user = result.scalars().first()
    if not user:
        raise RuntimeError("未找到可用于导入的系统用户")
    return AuthSchema(user=user, db=session, check_data_scope=False)


async def main() -> None:
    parser = argparse.ArgumentParser(description="Excel 导入 CRM 销售数据")
    parser.add_argument("file", help="xlsx 文件路径")
    parser.add_argument("--skip-xiaoe", action="store_true")
    parser.add_argument("--skip-marketing", action="store_true")
    parser.add_argument(
        "--replace-marketing",
        action="store_true",
        help="导入前清空 crm_marketing_resources 再全量写入",
    )
    args = parser.parse_args()

    async with async_db_session() as session:
        auth = await _get_admin_auth(session)
        report = await FeishuSalesImportService.import_from_excel(
            auth,
            args.file,
            skip_xiaoe=args.skip_xiaoe,
            skip_marketing=args.skip_marketing,
            replace_marketing=args.replace_marketing,
        )
        print(report)


if __name__ == "__main__":
    asyncio.run(main())
