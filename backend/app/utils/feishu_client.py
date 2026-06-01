"""飞书开放平台：知识库 Wiki 电子表格读取。"""

from __future__ import annotations

import time
from typing import Any
from urllib.parse import quote

import httpx

from app.config.setting import settings
from app.core.exceptions import CustomException


class FeishuClient:
    """飞书 API 客户端（tenant_access_token）。"""

    BASE = "https://open.feishu.cn/open-apis"

    def __init__(
        self,
        app_id: str | None = None,
        app_secret: str | None = None,
        timeout: float | None = None,
    ) -> None:
        self.app_id = app_id or settings.FEISHU_APP_ID
        self.app_secret = app_secret or settings.FEISHU_APP_SECRET
        self.timeout = timeout or settings.HTTPX_DEFAULT_TIMEOUT
        self._token: str | None = None
        self._token_expire_at: float = 0.0

        if not self.app_id or not self.app_secret:
            raise CustomException(
                msg="未配置飞书应用凭证，请在 env 中设置 FEISHU_APP_ID / FEISHU_APP_SECRET"
            )

    def _headers(self) -> dict[str, str]:
        return {"Authorization": f"Bearer {self.get_tenant_access_token()}"}

    def get_tenant_access_token(self) -> str:
        if self._token and time.time() < self._token_expire_at - 60:
            return self._token

        url = f"{self.BASE}/auth/v3/tenant_access_token/internal"
        with httpx.Client(timeout=self.timeout) as client:
            resp = client.post(
                url,
                json={"app_id": self.app_id, "app_secret": self.app_secret},
            )
            data = resp.json()
        if data.get("code") != 0:
            raise CustomException(msg=f"飞书鉴权失败: {data.get('msg')}")

        self._token = data["tenant_access_token"]
        self._token_expire_at = time.time() + int(data.get("expire", 7200))
        return self._token

    def _request(
        self,
        method: str,
        path: str,
        *,
        params: dict | None = None,
        json_body: dict | None = None,
    ) -> dict[str, Any]:
        url = f"{self.BASE}{path}"
        with httpx.Client(timeout=self.timeout) as client:
            resp = client.request(
                method,
                url,
                headers=self._headers(),
                params=params,
                json=json_body,
            )
            payload = resp.json()
        if payload.get("code") != 0:
            raise CustomException(msg=f"飞书 API 失败 [{path}]: {payload.get('msg')}")
        return payload.get("data") or {}

    def get_wiki_spreadsheet_token(self, wiki_node_token: str) -> str:
        """Wiki 节点 token → 电子表格 spreadsheetToken（obj_token）。"""
        data = self._request(
            "GET",
            "/wiki/v2/spaces/get_node",
            params={"token": wiki_node_token},
        )
        node = data.get("node") or {}
        obj_token = node.get("obj_token")
        obj_type = node.get("obj_type")
        if not obj_token:
            raise CustomException(msg="无法从 Wiki 节点解析 obj_token，请检查节点 token 与应用权限")
        if obj_type and obj_type not in ("sheet", "sheets"):
            raise CustomException(msg=f"Wiki 节点类型为 {obj_type}，不是电子表格(sheet)")
        return obj_token

    def list_sheets(self, spreadsheet_token: str) -> list[dict[str, Any]]:
        data = self._request(
            "GET",
            f"/sheets/v3/spreadsheets/{spreadsheet_token}/sheets/query",
        )
        return data.get("sheets") or []

    def find_sheet_id(
        self,
        spreadsheet_token: str,
        *,
        title: str | None = None,
        sheet_id_hint: str | None = None,
    ) -> str:
        sheets = self.list_sheets(spreadsheet_token)
        if title:
            for s in sheets:
                if (s.get("title") or "").strip() == title.strip():
                    return s["sheet_id"]
        if sheet_id_hint:
            for s in sheets:
                if s.get("sheet_id") == sheet_id_hint:
                    return sheet_id_hint
        titles = [s.get("title") for s in sheets]
        raise CustomException(
            msg=f"未找到工作表「{title}」，当前表格含: {titles}。可用 --list-sheets 查看 sheet_id"
        )

    def read_sheet_values(
        self,
        spreadsheet_token: str,
        sheet_id: str,
        *,
        range_end_col: str = "AZ",
        max_rows: int = 5000,
    ) -> list[list[Any]]:
        """读取整张工作表（含表头行）。"""
        range_str = f"{sheet_id}!A1:{range_end_col}{max_rows}"
        encoded_range = quote(range_str, safe="")
        data = self._request(
            "GET",
            f"/sheets/v2/spreadsheets/{spreadsheet_token}/values/{encoded_range}",
        )
        value_range = data.get("valueRange") or {}
        return value_range.get("values") or []
