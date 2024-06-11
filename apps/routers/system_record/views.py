#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 18:15
# @Author  : 冉勇
# @Site    : 
# @File    : views.py
# @Software: PyCharm
# @desc    : 系统记录管理路由，视图文件
from fastapi import APIRouter, Depends

from apps.cruds.base.mongo import ReturnType
from apps.cruds.record_operation_crud import OperationCURD
from apps.routers.auth_role.params import PageParams
from apps.schemas import record_operation_schema
from utils.response import PageResponseSchema, RestfulResponse

router = APIRouter(prefix="/system/record", tags=["系统记录管理"])


@router.get(
    "/operation/list/query",
    response_model=PageResponseSchema[list[record_operation_schema.OperationSimpleOutSchema]],
    summary="获取系统操作记录列表",
)
async def operation_list_query(params: PageParams = Depends()):
    """
    可以在 application/settings.py:SystemSettings.OPERATION_LOG_RECORD 中选择开启或关闭系统操作记录功能
    """
    datas = await OperationCURD().get_datas(**params.dict(), v_return_type=ReturnType.DICT)
    total = await OperationCURD().get_count(**params.to_count())
    return RestfulResponse.success(data=datas, total=total, page=params.page, limit=params.limit)
