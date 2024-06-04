#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 12:10
# @Author  : 冉勇
# @Site    : 
# @File    : record_operation_crud.py
# @Software: PyCharm
# @desc    : 数据库 增删改查操作
from motor.motor_asyncio import AsyncIOMotorClientSession
from apps.schemas import record_operation_schema
from core.mongo_manage import MongoCrud


class OperationCURD(MongoCrud):
    def __init__(self, session: AsyncIOMotorClientSession | None = None):
        super().__init__()
        self.session = session
        self.collection = self.db["record_operation"]
        self.simple_out_schema = record_operation_schema.OperationSimpleOutSchema
        self.is_object_id = True
