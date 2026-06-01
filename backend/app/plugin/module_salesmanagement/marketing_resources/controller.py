from typing import Annotated

from fastapi import APIRouter, Body, Depends, Path
from fastapi.responses import JSONResponse

from app.api.v1.module_system.auth.schema import AuthSchema
from app.common.response import ResponseSchema, SuccessResponse
from app.core.base_params import PaginationQueryParam
from app.core.dependencies import AuthPermission
from app.core.logger import log
from app.core.router_class import OperationLogRoute

from .schema import (
    FeishuImportSchema,
    MarketingResourceCreateSchema,
    MarketingResourceOutSchema,
    MarketingResourceQueryParam,
    MarketingResourceUpdateSchema,
)
from .service import MarketingResourceService

MarketingResourcesRouter = APIRouter(
    route_class=OperationLogRoute,
    prefix="/marketing_resources",
    tags=["销售资源管理"],
)


@MarketingResourcesRouter.get(
    "/detail/{id}",
    summary="获取营销资源详情",
    response_model=ResponseSchema[MarketingResourceOutSchema],
)
async def get_marketing_resource_detail_controller(
    id: Annotated[int, Path(description="营销资源ID")],
    auth: Annotated[
        AuthSchema,
        Depends(AuthPermission(["module_salesmanagement:marketing_resources:detail"])),
    ],
) -> JSONResponse:
    result_dict = await MarketingResourceService.detail_service(id=id, auth=auth)
    log.info(f"获取营销资源详情成功 {id}")
    return SuccessResponse(data=result_dict, msg="获取营销资源详情成功")


@MarketingResourcesRouter.get(
    "/list",
    summary="查询营销资源列表",
    response_model=ResponseSchema[list[MarketingResourceOutSchema]],
)
async def get_marketing_resource_list_controller(
    page: Annotated[PaginationQueryParam, Depends()],
    search: Annotated[MarketingResourceQueryParam, Depends()],
    auth: Annotated[
        AuthSchema,
        Depends(AuthPermission(["module_salesmanagement:marketing_resources:query"])),
    ],
) -> JSONResponse:
    result_dict = await MarketingResourceService.page_service(
        auth=auth,
        page_no=page.page_no,
        page_size=page.page_size,
        search=search,
        order_by=page.order_by,
    )
    log.info("查询营销资源列表成功")
    return SuccessResponse(data=result_dict, msg="查询营销资源列表成功")


@MarketingResourcesRouter.post(
    "/create",
    summary="创建营销资源",
    response_model=ResponseSchema[MarketingResourceOutSchema],
)
async def create_marketing_resource_controller(
    data: MarketingResourceCreateSchema,
    auth: Annotated[
        AuthSchema,
        Depends(AuthPermission(["module_salesmanagement:marketing_resources:create"])),
    ],
) -> JSONResponse:
    result_dict = await MarketingResourceService.create_service(auth=auth, data=data)
    log.info(f"创建营销资源成功: {result_dict.get('id')}")
    return SuccessResponse(data=result_dict, msg="创建营销资源成功")


@MarketingResourcesRouter.put(
    "/update/{id}",
    summary="修改营销资源",
    response_model=ResponseSchema[MarketingResourceOutSchema],
)
async def update_marketing_resource_controller(
    data: MarketingResourceUpdateSchema,
    id: Annotated[int, Path(description="营销资源ID")],
    auth: Annotated[
        AuthSchema,
        Depends(AuthPermission(["module_salesmanagement:marketing_resources:update"])),
    ],
) -> JSONResponse:
    result_dict = await MarketingResourceService.update_service(auth=auth, id=id, data=data)
    log.info(f"修改营销资源成功: {id}")
    return SuccessResponse(data=result_dict, msg="修改营销资源成功")


@MarketingResourcesRouter.delete(
    "/delete",
    summary="删除营销资源",
    response_model=ResponseSchema[None],
)
async def delete_marketing_resource_controller(
    ids: Annotated[list[int], Body(description="ID列表")],
    auth: Annotated[
        AuthSchema,
        Depends(AuthPermission(["module_salesmanagement:marketing_resources:delete"])),
    ],
) -> JSONResponse:
    await MarketingResourceService.delete_service(auth=auth, ids=ids)
    log.info(f"删除营销资源成功: {ids}")
    return SuccessResponse(msg="删除营销资源成功")


@MarketingResourcesRouter.post(
    "/import/feishu",
    summary="从飞书 Wiki 表格导入销售数据",
    response_model=ResponseSchema[dict],
)
async def import_marketing_from_feishu_controller(
    body: FeishuImportSchema,
    auth: Annotated[
        AuthSchema,
        Depends(AuthPermission(["module_salesmanagement:marketing_resources:import"])),
    ],
) -> JSONResponse:
    """
    从飞书知识库电子表格导入：
    - [小鹅通客户名单] → crm_xiaoe_contacts（按手机号 upsert）
    - [资源统计] → crm_marketing_resources（追加）
    """
    result = await MarketingResourceService.import_feishu_service(
        auth,
        wiki_node_token=body.wiki_node_token,
        xiaoe_sheet_title=body.xiaoe_sheet_title,
        marketing_sheet_title=body.marketing_sheet_title,
        skip_xiaoe=body.skip_xiaoe,
        skip_marketing=body.skip_marketing,
    )
    log.info(f"飞书导入完成: {result}")
    return SuccessResponse(data=result, msg="飞书数据导入完成")
