#!/usr/bin/env python3
"""Apply a SQL migration file using project DB settings (backend/env/.env.dev)."""

from __future__ import annotations

import os
import sys
from pathlib import Path

import psycopg

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
os.environ.setdefault("ENVIRONMENT", "dev")

from app.config.setting import get_settings  # noqa: E402


def main() -> None:
    if len(sys.argv) < 2:
        print("Usage: python scripts/apply_sql_file.py <path-to.sql>")
        sys.exit(1)

    sql_path = Path(sys.argv[1]).resolve()
    if not sql_path.is_file():
        print(f"SQL file not found: {sql_path}")
        sys.exit(1)

    settings = get_settings()
    sql = sql_path.read_text(encoding="utf-8")
    conninfo = (
        f"host={settings.DATABASE_HOST} port={settings.DATABASE_PORT} "
        f"dbname={settings.DATABASE_NAME} user={settings.DATABASE_USER} "
        f"password={settings.DATABASE_PASSWORD}"
    )

    print(f"Connecting {settings.DATABASE_HOST}:{settings.DATABASE_PORT}/{settings.DATABASE_NAME} ...")
    with psycopg.connect(conninfo) as conn:
        conn.autocommit = True
        with conn.cursor() as cur:
            cur.execute(sql)
    print(f"OK: applied {sql_path.name}")


if __name__ == "__main__":
    main()
