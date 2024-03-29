#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/10/28 00:06
# @Author  : 冉勇
# @Site    : 
# @File    : module.py
# @Software: PyCharm
# @desc    :

from pydantic import BaseModel, ConfigDict, field_validator

from core.data_types import DatetimeStr


class Module(BaseModel):
    module_name: str
    project_id: int
    config_id: int
    test_user: str
    simple_desc: str
    remarks: str
    module_packages: str
    leader_user: str
    priority: int = 4
    create_user_id: int

    @field_validator('priority')
    def validate_priority(cls, value):
        if value < 1 or value > 4:
            raise ValueError("priority必须在1到4之间")
        return value


class ModuleSimpleOut(Module):
    model_config = ConfigDict(from_attributes=True)
    id: int
    create_datetime: DatetimeStr
    update_datetime: DatetimeStr
