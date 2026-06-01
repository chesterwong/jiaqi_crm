from app.api.v1.module_system.auth.schema import AuthSchema
from app.core.exceptions import CustomException

from .crud import MarketingResourceCRUD, XiaoeContactCRUD
from .resource_field_utils import (
    is_blank,
    normalize_phone_digits,
    phone_lookup_keys,
    resolve_month_period,
    xiaoe_duplicate_label,
)
from .schema import (
    MarketingResourceCreateSchema,
    MarketingResourceOutSchema,
    MarketingResourceQueryParam,
    MarketingResourceUpdateSchema,
    XiaoeContactBriefSchema,
)


class MarketingResourceService:
    """营销资源服务层"""

    @classmethod
    async def _resolve_xiaoe_duplicate(cls, auth: AuthSchema, phone: str | None) -> str | None:
        if not phone or not phone.strip():
            return None
        hit = await XiaoeContactCRUD(auth).get_first_by_phone(phone.strip())
        return xiaoe_duplicate_label(hit is not None)

    @classmethod
    def _normalize_item_fields(cls, item: dict, xiaoe_map: dict | None = None) -> dict:
        """列表/详情出参：月份、小鹅通查重、小鹅通用户名。"""
        out = dict(item)
        out["month_period"] = resolve_month_period(
            out.get("month_period"), out.get("resource_acquired_at")
        )
        dup = out.get("xiaoe_duplicate_check")
        if is_blank(dup) or str(dup).strip().lower() == "nan":
            out["xiaoe_duplicate_check"] = None

        phone = out.get("phone")
        if phone:
            norm = normalize_phone_digits(str(phone))
            xiaoe = (
                (xiaoe_map or {}).get(str(phone))
                or (xiaoe_map or {}).get(norm)
                or (xiaoe_map or {}).get(norm + "0" if len(norm) == 11 else "")
            )
            if xiaoe:
                out["xiaoe_contact"] = XiaoeContactBriefSchema.model_validate(xiaoe).model_dump()
                out["xiaoe_duplicate_check"] = xiaoe_duplicate_label(True)
            else:
                out["xiaoe_contact"] = out.get("xiaoe_contact")
                if is_blank(out.get("xiaoe_duplicate_check")):
                    out["xiaoe_duplicate_check"] = xiaoe_duplicate_label(False)
        else:
            out["xiaoe_contact"] = None
        return out

    @classmethod
    async def _enrich_page_items(cls, auth: AuthSchema, result: dict) -> dict:
        items = result.get("items") or []
        phones: list[str] = []
        for i in items:
            p = i.get("phone")
            if not p:
                continue
            phones.extend(phone_lookup_keys(str(p)))
        xiaoe_map = await XiaoeContactCRUD(auth).map_by_phones(list(set(phones)))
        result["items"] = [cls._normalize_item_fields(dict(i), xiaoe_map) for i in items]
        return result

    @classmethod
    async def detail_service(cls, auth: AuthSchema, id: int) -> dict:
        obj = await MarketingResourceCRUD(auth).get_by_id_crud(id=id, preload=["owner"])
        if not obj:
            raise CustomException(msg="该数据不存在")
        data = MarketingResourceOutSchema.model_validate(obj).model_dump()
        xiaoe_map: dict = {}
        if obj.phone:
            xiaoe = await XiaoeContactCRUD(auth).get_first_by_phone(obj.phone)
            if xiaoe and xiaoe.phone:
                xiaoe_map[xiaoe.phone] = xiaoe
            if obj.phone not in xiaoe_map and xiaoe:
                xiaoe_map[obj.phone] = xiaoe
        return cls._normalize_item_fields(data, xiaoe_map)

    @classmethod
    async def page_service(
        cls,
        auth: AuthSchema,
        page_no: int,
        page_size: int,
        search: MarketingResourceQueryParam | None = None,
        order_by: list[dict[str, str]] | None = None,
    ) -> dict:
        search_dict = dict(search.__dict__) if search else {}
        order_by_list = order_by or [{"id": "desc"}]
        offset = (page_no - 1) * page_size
        result = await MarketingResourceCRUD(auth).page_crud(
            offset=offset,
            limit=page_size,
            order_by=order_by_list,
            search=search_dict,
            preload=["owner"],
        )
        return await cls._enrich_page_items(auth, result)

    @classmethod
    async def create_service(cls, auth: AuthSchema, data: MarketingResourceCreateSchema) -> dict:
        payload = data.model_dump()
        payload["month_period"] = resolve_month_period(
            payload.get("month_period"), payload.get("resource_acquired_at")
        )
        payload["xiaoe_duplicate_check"] = await cls._resolve_xiaoe_duplicate(auth, data.phone)
        obj = await MarketingResourceCRUD(auth).create_crud(
            data=MarketingResourceCreateSchema(**payload)
        )
        return await cls.detail_service(auth, obj.id)  # type: ignore[union-attr]

    @classmethod
    async def update_service(
        cls, auth: AuthSchema, id: int, data: MarketingResourceUpdateSchema
    ) -> dict:
        obj = await MarketingResourceCRUD(auth).get_by_id_crud(id=id)
        if not obj:
            raise CustomException(msg="更新失败，该数据不存在")
        payload = data.model_dump(exclude_unset=True)
        if "month_period" in payload or "resource_acquired_at" in payload:
            payload["month_period"] = resolve_month_period(
                payload.get("month_period", obj.month_period),
                payload.get("resource_acquired_at", obj.resource_acquired_at),
            )
        phone = payload.get("phone", obj.phone)
        if phone:
            payload["xiaoe_duplicate_check"] = await cls._resolve_xiaoe_duplicate(auth, phone)
        await MarketingResourceCRUD(auth).update_crud(
            id=id, data=MarketingResourceUpdateSchema(**payload)
        )
        return await cls.detail_service(auth, id)

    @classmethod
    async def delete_service(cls, auth: AuthSchema, ids: list[int]) -> None:
        if len(ids) < 1:
            raise CustomException(msg="删除失败，删除对象不能为空")
        for row_id in ids:
            obj = await MarketingResourceCRUD(auth).get_by_id_crud(id=row_id)
            if not obj:
                raise CustomException(msg=f"删除失败，ID为{row_id}的数据不存在")
        await MarketingResourceCRUD(auth).delete_crud(ids=ids)

    @classmethod
    async def import_feishu_service(
        cls,
        auth: AuthSchema,
        *,
        wiki_node_token: str | None = None,
        xiaoe_sheet_title: str = "小鹅通客户名单",
        marketing_sheet_title: str = "资源统计",
        skip_xiaoe: bool = False,
        skip_marketing: bool = False,
    ) -> dict:
        from .feishu_import import FeishuSalesImportService

        return await FeishuSalesImportService.import_from_wiki(
            auth,
            wiki_node_token=wiki_node_token,
            xiaoe_sheet_title=xiaoe_sheet_title,
            marketing_sheet_title=marketing_sheet_title,
            skip_xiaoe=skip_xiaoe,
            skip_marketing=skip_marketing,
        )
