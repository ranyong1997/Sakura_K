#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/3 22:03
# @Author  : 冉勇
# @Site    : 
# @File    : scheduler_task_list.py
# @Software: PyCharm
# @desc    : 调度任务
from motor.motor_asyncio import AsyncIOMotorClientSession

from apps.cruds.base.mongo import MongoCrud
from apps.schemas import scheduler_task_list_schema


class SchedulerTaskListCURD(MongoCrud):
    def __init__(self, session: AsyncIOMotorClientSession | None = None):
        super().__init__()
        self.session = session
        self.collection = self.db["scheduler_task_list"]
        self.simple_out_schema = scheduler_task_list_schema.TaskSimpleOutSchema
        self.is_object_id = True
