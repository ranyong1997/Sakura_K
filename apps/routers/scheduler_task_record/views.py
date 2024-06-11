#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 18:13
# @Author  : 冉勇
# @Site    : 
# @File    : views.py
# @Software: PyCharm
# @desc    : 调度任务执行记录管理路由，视图文件
from motor.motor_asyncio import AsyncIOMotorClientSession
from fastapi import APIRouter, Depends

from apps.cruds.base.mongo import ReturnType
from apps.cruds.scheduler_task_record_crud import SchedulerTaskRecordCURD
from apps.routers.auth_role.params import PageParams
from apps.schemas import scheduler_task_record_schema
from db.database_factory import DatabaseFactory
from utils.response import PageResponseSchema, RestfulResponse

router = APIRouter(prefix="/scheduler/task/record", tags=["调度任务执行记录管理"])


@router.get(
    "/list/query",
    response_model=PageResponseSchema[list[scheduler_task_record_schema.TaskRecordSimpleOutSchema]],
    summary="获取任务执行记录列表",
)
async def list_query(
        params: PageParams = Depends(),
        session: AsyncIOMotorClientSession = Depends(DatabaseFactory.get_db_instance("mongo").db_transaction_getter),
):
    datas = await SchedulerTaskRecordCURD(session).get_datas(**params.dict(), v_return_type=ReturnType.DICT)
    total = await SchedulerTaskRecordCURD(session).get_count(**params.to_count())
    return RestfulResponse.success(data=datas, total=total, page=params.page, limit=params.limit)
