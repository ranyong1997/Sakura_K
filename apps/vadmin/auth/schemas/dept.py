#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2024/1/8 15:10
# @Author   : 冉勇
# @File     : dept.py
# @Software : PyCharm
# @Desc     : pydantic 模型，用于数据库序列化操作

from pydantic import BaseModel, ConfigDict

from core.data_types import DatetimeStr


class Dept(BaseModel):
    name: str
    dept_key: str
    disabled: bool = False
    order: int | None = None
    desc: str | None = None
    owner: str | None = None
    phone: str | None = None
    email: str | None = None

    parent_id: int | None = None


class DeptSimpleOut(Dept):
    model_config = ConfigDict(from_attributes=True)

    id: int
    create_datetime: DatetimeStr
    update_datetime: DatetimeStr


class DeptTreeListOut(DeptSimpleOut):
    model_config = ConfigDict(from_attributes=True)

    children: list[dict] = []