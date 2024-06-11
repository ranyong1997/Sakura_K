#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023-04-14 16:33:42
# @Author  :
# @Site    :
# @File    : crud.py
# @Software: PyCharm
# @desc    : 数据库 增删改查操作
from motor.motor_asyncio import AsyncIOMotorDatabase
from sqlalchemy.ext.asyncio import AsyncSession
from apps.cruds.base.mongo import MongoCrud
from apps.models import login_model, sms_model
from apps.schemas import login_schema, sms_schema, operation_schema
from core.crud import DalBase


class LoginRecordDal(DalBase):

    def __init__(self, db: AsyncSession):
        super(LoginRecordDal, self).__init__()
        self.db = db
        self.model = login_model.LoginModel
        self.schema = login_schema.LoginRecordSimpleOut


class SMSSendRecordDal(DalBase):

    def __init__(self, db: AsyncSession):
        super(SMSSendRecordDal, self).__init__()
        self.db = db
        self.model = sms_model.SmsModel
        self.schema = sms_schema.SMSSendRecordSimpleOut


class OperationRecordDal(MongoCrud):

    def __init__(self, db: AsyncIOMotorDatabase):
        super(OperationRecordDal, self).__init__()
        self.db = db
        self.collection = db["operation_record"]
        self.schema = operation_schema.OperationRecordSimpleOut
        self.is_object_id = True
