#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/3 22:30
# @Author  : 冉勇
# @Site    : 
# @File    : scheduler_task_record_schema.py
# @Software: PyCharm
# @desc    : 文件描述信息
from pydantic import Field

from apps.schemas.base.base import BaseSchema
from core.types import DatetimeStr, DictStr, ObjectIdStr
from task.schema import JobExecStrategy


class TaskRecordSchema(BaseSchema):
    task_id: str | None = Field(None, description="关联任务编号")
    start_datetime: DatetimeStr | None = Field(None, description="任务执行开始时间")
    end_datetime: DatetimeStr | None = Field(None, description="任务执行结束时间")
    process_time: float | None = Field(None, description="任务执行耗时")
    retval: str | None = Field(None, description="任务返回值")
    exception: str | None = Field(None, description="异常信息")
    traceback: str | None = Field(None, description="堆栈跟踪")
    name: str = Field(..., description="任务名称")
    group: str | None = Field(None, description="任务标签，任务组名")
    job_class: str = Field(..., description="任务执行实体类")
    job_params: DictStr = Field({}, description="任务执行实体类参数, dict 类型参数, 入参方式为：**kwargs")
    exec_strategy: JobExecStrategy = Field(..., description="执行策略")
    expression: str | None = Field(None, description="执行表达式, 一次任务可以不填")


class TaskRecordSimpleOutSchema(TaskRecordSchema):
    id: ObjectIdStr = Field(..., alias="_id")
    create_datetime: DatetimeStr = Field(..., description="创建时间")
    update_datetime: DatetimeStr = Field(..., description="更新时间")
