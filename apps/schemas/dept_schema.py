#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2024/1/8 15:10
# @Author   : 冉勇
# @File     : dept.py
# @Software : PyCharm
# @Desc     : 部门数据模型
from pydantic import ConfigDict, Field
from apps.schemas.base.base import BaseSchema
from core.types import DatetimeStr


class Dept(BaseSchema):
    name: str = Field(..., description="部门名称")
    dept_key: str = Field(..., description="部门标识")
    disabled: bool = Field(False, description="是否禁用")
    order: int | None = Field(None, description="排序")
    desc: str | None = Field(None, description="描述")
    owner: str | None = Field(None, description="负责人")
    phone: str | None = Field(None, description="手机号")
    email: str | None = Field(None, description="邮箱")

    parent_id: int | None = None


class DeptSimpleOut(Dept):
    model_config = ConfigDict(from_attributes=True)

    id: int
    create_datetime: DatetimeStr
    update_datetime: DatetimeStr


class DeptTreeListOut(DeptSimpleOut):
    model_config = ConfigDict(from_attributes=True)

    children: list[dict] = []
