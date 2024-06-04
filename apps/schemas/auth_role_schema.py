#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 17:58
# @Author  : 冉勇
# @Site    : 
# @File    : auth_role_schema.py
# @Software: PyCharm
# @desc    : Pydantic 模型，用于数据库序列化操作
from pydantic import Field
from apps.schemas.base.base import BaseSchema
from core.types import DatetimeStr


class AuthRoleBaseSchema(BaseSchema):
    name: str = Field(..., description="角色名称")
    role_key: str = Field(..., description="标识")
    is_active: bool = Field(True, description="是否可用")


class AuthRoleCreateSchema(AuthRoleBaseSchema):
    pass


class AuthRoleUpdateSchema(AuthRoleBaseSchema):
    pass


class AuthRoleSimpleOutSchema(AuthRoleBaseSchema):
    id: int = Field(..., description="编号")
    create_datetime: DatetimeStr = Field(..., description="创建时间")
    update_datetime: DatetimeStr = Field(..., description="更新时间")
