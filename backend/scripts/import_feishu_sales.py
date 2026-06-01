#!/usr/bin/env python3
"""从飞书 Wiki 表格导入小鹅通联系人 + 营销资源台账。

用法:
  cd backend
  ENVIRONMENT=dev .venv/bin/python scripts/import_feishu_sales.py
  ENVIRONMENT=dev .venv/bin/python scripts/import_feishu_sales.py --list-sheets
  ENVIRONMENT=dev .venv/bin/python scripts/import_feishu_sales.py --skip-marketing
"""

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
    parser = argparse.ArgumentParser(description="飞书表格导入 CRM 销售数据")
    parser.add_argument("--list-sheets", action="store_true", help="仅列出 Wiki 内工作表")
    parser.add_argument("--wiki-token", default=None, help="覆盖 FEISHU_WIKI_NODE_TOKEN")
    parser.add_argument("--skip-xiaoe", action="store_true", help="跳过小鹅通客户名单")
    parser.add_argument("--skip-marketing", action="store_true", help="跳过资源统计")
    args = parser.parse_args()

    if args.list_sheets:
        sheets = FeishuSalesImportService.list_wiki_sheets(args.wiki_token)
        for s in sheets:
            print(f"  sheet_id={s.get('sheet_id')}\ttitle={s.get('title')}")
        return

    async with async_db_session() as session:
        auth = await _get_admin_auth(session)
        report = await FeishuSalesImportService.import_from_wiki(
            auth,
            wiki_node_token=args.wiki_token,
            skip_xiaoe=args.skip_xiaoe,
            skip_marketing=args.skip_marketing,
        )
        print(report)


if __name__ == "__main__":
    asyncio.run(main())
