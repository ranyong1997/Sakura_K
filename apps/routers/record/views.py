#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023-04-14 16:33:42
# @Author  :
# @Site    :
# @File    : views.py
# @Software: PyCharm
# @desc    : 记录管理路由，视图文件
from fastapi import APIRouter, Depends
from motor.motor_asyncio import AsyncIOMotorDatabase
from apps.cruds import record_crud
from apps.depends.current import AllUserAuth
from apps.depends.validation.auth import Auth
from apps.routers.record.login import LoginParams
from apps.routers.record.operation import OperationParams
from apps.routers.record.sms import SMSParams
from db.mongo.asyncio import MongoDatabase
from utils.response import RestfulResponse

router = APIRouter(prefix="/vadmin/record", tags=["记录管理"])


###########################################################
#                      日志管理                            #
###########################################################
@router.get("/logins", summary="获取登录日志列表")
async def get_record_login(p: LoginParams = Depends(), auth: Auth = Depends(AllUserAuth())):
    datas, count = await record_crud.LoginRecordDal(auth.db).get_datas(**p.dict(), v_return_count=True)
    return RestfulResponse.success(datas, count=count)


@router.get("/operations", summary="获取操作日志列表")
async def get_record_operation(
        p: OperationParams = Depends(),
        db: AsyncIOMotorDatabase = Depends(MongoDatabase.db_getter),
        auth: Auth = Depends(AllUserAuth())
):
    count = await record_crud.OperationRecordDal(db).get_count(**p.to_count())
    datas = await record_crud.OperationRecordDal(db).get_datas(**p.dict())
    return RestfulResponse.success(datas, count=count)


@router.get("/sms/send/list", summary="获取短信发送列表")
async def get_sms_send_list(p: SMSParams = Depends(), auth: Auth = Depends(AllUserAuth())):
    datas, count = await record_crud.SMSSendRecordDal(auth.db).get_datas(**p.dict(), v_return_count=True)
    return RestfulResponse.success(datas, count=count)
