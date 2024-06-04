#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 17:56
# @Author  : 冉勇
# @Site    : 
# @File    : auth_user_to_role_model.py
# @Software: PyCharm
# @desc    : 用户角色 多对多关联表
from sqlalchemy import ForeignKey, Column, Table, Integer
from db.orm.async_base_model import AsyncBaseORMModel

auth_user_to_role_model = Table(
    "auth_user_to_role",
    AsyncBaseORMModel.metadata,
    Column("user_id", Integer, ForeignKey("auth_user.id", ondelete="CASCADE")),
    Column("role_id", Integer, ForeignKey("auth_role.id", ondelete="CASCADE")),
)
