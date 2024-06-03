#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/3 22:29
# @Author  : 冉勇
# @Site    : 
# @File    : scheduler_task_record.py
# @Software: PyCharm
# @desc    : 文件描述信息
from motor.motor_asyncio import AsyncIOMotorClientSession
from apps.schemas import scheduler_task_record_schema
from core.mongo_manage import MongoCrud


class SchedulerTaskRecordCURD(MongoCrud):
    def __init__(self, session: AsyncIOMotorClientSession | None = None):
        super().__init__()
        self.session = session
        self.collection = self.db["scheduler_task_record"]
        self.simple_out_schema = scheduler_task_record_schema.TaskRecordSimpleOutSchema
        self.is_object_id = True
