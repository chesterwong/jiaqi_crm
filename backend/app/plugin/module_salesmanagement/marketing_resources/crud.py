from pydantic import BaseModel

from app.api.v1.module_system.auth.schema import AuthSchema
from app.common.enums import QueueEnum
from app.core.base_crud import CRUDBase

from .model import CrmMarketingResourcesModel, CrmXiaoeContactsModel
from .resource_field_utils import normalize_phone_digits, phone_lookup_keys
from .schema import MarketingResourceCreateSchema, MarketingResourceOutSchema, MarketingResourceUpdateSchema


class MarketingResourceCRUD(
    CRUDBase[CrmMarketingResourcesModel, MarketingResourceCreateSchema, MarketingResourceUpdateSchema]
):
    """营销资源数据层"""

    def __init__(self, auth: AuthSchema) -> None:
        super().__init__(model=CrmMarketingResourcesModel, auth=auth)

    async def get_by_id_crud(
        self, id: int, preload: list[str] | None = None
    ) -> CrmMarketingResourcesModel | None:
        return await self.get(id=id, preload=preload)

    async def page_crud(
        self,
        offset: int,
        limit: int,
        order_by: list[dict] | None = None,
        search: dict | None = None,
        preload: list | None = None,
    ) -> dict:
        order_by_list = order_by or [{"id": "desc"}]
        search_dict = search or {}
        return await self.page(
            offset=offset,
            limit=limit,
            order_by=order_by_list,
            search=search_dict,
            out_schema=MarketingResourceOutSchema,
            preload=preload,
        )

    async def create_crud(self, data: MarketingResourceCreateSchema) -> CrmMarketingResourcesModel | None:
        return await self.create(data=data)

    async def update_crud(
        self, id: int, data: MarketingResourceUpdateSchema
    ) -> CrmMarketingResourcesModel | None:
        return await self.update(id=id, data=data)

    async def delete_crud(self, ids: list[int]) -> None:
        return await self.delete(ids=ids)


class XiaoeContactCRUD(CRUDBase[CrmXiaoeContactsModel, BaseModel, BaseModel]):
    """小鹅通联系人数据层（只读）"""

    def __init__(self, auth: AuthSchema) -> None:
        super().__init__(model=CrmXiaoeContactsModel, auth=auth)

    async def get_first_by_phone(self, phone: str) -> CrmXiaoeContactsModel | None:
        keys = phone_lookup_keys(phone)
        if not keys:
            return None
        objs = await self.list(search={"phone": (QueueEnum.in_.value, list(keys))})
        if not objs:
            return None
        target = normalize_phone_digits(phone)
        for obj in objs:
            if normalize_phone_digits(obj.phone) == target:
                return obj
        return objs[0]

    async def map_by_phones(self, phones: list[str]) -> dict[str, CrmXiaoeContactsModel]:
        lookup_keys: set[str] = set()
        for p in phones:
            lookup_keys |= phone_lookup_keys(p)
        if not lookup_keys:
            return {}
        objs = await self.list(search={"phone": (QueueEnum.in_.value, list(lookup_keys))})
        out: dict[str, CrmXiaoeContactsModel] = {}
        for obj in objs:
            if not obj.phone:
                continue
            for key in phone_lookup_keys(obj.phone):
                out[key] = obj
            norm = normalize_phone_digits(obj.phone)
            if norm:
                out[norm] = obj
        return out
