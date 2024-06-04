#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 17:55
# @Author  : 冉勇
# @Site    : 
# @File    : auth_role_crud.py
# @Software: PyCharm
# @desc    : 数据操作
from sqlalchemy.ext.asyncio import AsyncSession
from apps.cruds.base.orm import ORMCrud
from apps.models.auth_role_model import AuthRoleModel
from apps.schemas import auth_role_schema


class AuthRoleCRUD(ORMCrud[AuthRoleModel]):
    def __init__(self, session: AsyncSession):
        super().__init__()
        self.session = session
        self.model = AuthRoleModel
        self.simple_out_schema = auth_role_schema.AuthRoleSimpleOutSchema
