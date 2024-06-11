#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 18:02
# @Author  : 冉勇
# @Site    : 
# @File    : scheduler_task_record_crud.py
# @Software: PyCharm
# @desc    :
from motor.motor_asyncio import AsyncIOMotorClientSession
from apps.schemas import scheduler_task_record_schema
from from apps.cruds.base.mongo import MongoCrud import MongoCrud


class SchedulerTaskRecordCURD(MongoCrud):
    def __init__(self, session: AsyncIOMotorClientSession | None = None):
        super().__init__()
        self.session = session
        self.collection = self.db["scheduler_task_record"]
        self.simple_out_schema = scheduler_task_record_schema.TaskRecordSimpleOutSchema
        self.is_object_id = True
