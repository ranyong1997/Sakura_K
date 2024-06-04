#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 17:04
# @Author  : 冉勇
# @Site    : 
# @File    : views.py
# @Software: PyCharm
# @desc    : 路由，视图文件
from motor.motor_asyncio import AsyncIOMotorClientSession
from fastapi import APIRouter, Depends, Query
from apps.cruds.scheduler_task_list_crud import SchedulerTaskListCURD
from apps.routers.scheduler_task.params import PageParams
from apps.schemas import scheduler_task_list_schema
from core.mongo_manage import ReturnType
from db.database_factory import DatabaseFactory
from utils.response import ResponseSchema, RestfulResponse, PageResponseSchema

router = APIRouter(prefix="/scheduler/task", tags=["通用调度任务管理"])


@router.post("/create", response_model=ResponseSchema[str], summary="创建任务，添加任务")
async def create(
        data: scheduler_task_list_schema.TaskCreateSchema,
        session: AsyncIOMotorClientSession = Depends(DatabaseFactory.get_db_instance("mongo").db_transaction_getter),
):
    """
    添加任务示例：

    :param data: 添加任务数据

        interval 任务添加示例：

        {
          "name": "测试任务`1",
          "group": "test",
          "job_class": "test.main.Test",
          "job_params": {
            "name": "kinit",
            "age": 3
          },
          "exec_strategy": "interval",
          "expression": "10 * * * *",
          "remark": "这是描述",
          "is_active": true
        }

        cron 任务添加示例：

        {
          "name": "测试任务2_cron",
          "group": "test",
          "job_class": "test.main.Test",
          "job_params": {
            "name": "kinit_cron",
            "age": 10
          },
          "exec_strategy": "cron",
          "expression": "* */1 * * * ?",
          "remark": "这是cron任务测试",
          "is_active": true
        }

    :param session:
    :return: 添加任务结果
    """
    return RestfulResponse.success(await SchedulerTaskListCURD(session).add_task(data=data))


@router.get(
    "/list/query",
    response_model=PageResponseSchema[list[scheduler_task_list_schema.TaskSimpleOutSchema]],
    summary="获取任务列表",
)
async def list_query(
        params: PageParams = Depends(),
        session: AsyncIOMotorClientSession = Depends(DatabaseFactory.get_db_instance("mongo").db_transaction_getter),
):
    datas = await SchedulerTaskListCURD(session).get_datas(**params.dict(), v_return_type=ReturnType.DICT)
    total = await SchedulerTaskListCURD(session).get_count(**params.to_count())
    return RestfulResponse.success(data=datas, total=total, page=params.page, limit=params.limit)


@router.get(
    "/one/query", response_model=ResponseSchema[scheduler_task_list_schema.TaskSimpleOutSchema], summary="获取任务信息"
)
async def one_query(
        data_id: str = Query(..., description="任务编号"),
        session: AsyncIOMotorClientSession = Depends(DatabaseFactory.get_db_instance("mongo").db_transaction_getter),
):
    data = await SchedulerTaskListCURD(session).get_data(data_id, v_return_type=ReturnType.DICT)
    return RestfulResponse.success(data=data)


@router.put("/stop/task/update", response_model=ResponseSchema[str], summary="暂停任务")
async def stop_task_update(
        data_id: str = Query(..., description="任务编号"),
        session: AsyncIOMotorClientSession = Depends(DatabaseFactory.get_db_instance("mongo").db_transaction_getter),
):
    data = await SchedulerTaskListCURD(session).stop_task(data_id)
    return RestfulResponse.success(data=data)


@router.put("/start/task/update", response_model=ResponseSchema[str], summary="开启任务")
async def start_task_update(
        data_id: str = Query(..., description="任务编号"),
        session: AsyncIOMotorClientSession = Depends(DatabaseFactory.get_db_instance("mongo").db_transaction_getter),
):
    data = await SchedulerTaskListCURD(session).start_task(data_id)
    return RestfulResponse.success(data=data)
