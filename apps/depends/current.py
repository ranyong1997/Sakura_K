#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/18 17:45
# @Author  : 冉勇
# @Site    :
# @File    : current.py
# @Software: PyCharm
# @desc    : 获取认证后的信息工具
from typing import Annotated
from fastapi import Request, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import joinedload
from application import settings
from apps.cruds.auth_crud import UserDal
from apps.depends.validation.auth import AuthValidation, Auth
from apps.models.role_model import RoleModel
from apps.models.user_model import UserModel
from core.exception import CustomException
from db.orm.asyncio import ORMDatabase
from utils.response_code import Status


class OpenAuth(AuthValidation):
    """
    开放认证，无认证也可以访问
    认证了以后可以获取到用户信息，无认证则获取不到
    """

    async def __call__(
            self,
            request: Request,
            token: Annotated[str, Depends(settings.settings.auth.OAUTH2_SCHEMA)],
            db: AsyncSession = Depends(ORMDatabase.db_getter)
    ):
        """
        每次调用依赖此类的接口会执行该方法
        """
        if not settings.settings.auth.OAUTH_ENABLE:
            return Auth(db=db)
        try:
            telephone, password = self.validate_token(request, token)
            user = await UserDal(db).get_data(telephone=telephone, password=password, v_return_none=True)
            return await self.validate_user(request, user, db)
        except CustomException:
            return Auth(db=db)


class AllUserAuth(AuthValidation):
    """
    支持所有用户认证
    获取用户基本信息
    """

    async def __call__(
            self,
            request: Request,
            token: str = Depends(settings.settings.auth.OAUTH2_SCHEMA),
            db: AsyncSession = Depends(ORMDatabase.db_getter)
    ):
        """
        每次调用依赖此类的接口会执行该方法
        """
        if not settings.settings.auth.OAUTH_ENABLE:
            return Auth(db=db)
        telephone, password = self.validate_token(request, token)
        user = await UserDal(db).get_data(telephone=telephone, password=password, v_return_none=True)
        return await self.validate_user(request, user, db)


class FullAdminAuth(AuthValidation):
    """
    只支持员工用户认证
    获取员工用户完整信息
    如果有权限，那么会验证该用户是否包括权限列表中的其中一个权限
    """

    def __init__(self, permissions: list[str] | None = None):
        if permissions:
            self.permissions = set(permissions)
        else:
            self.permissions = None

    async def __call__(
            self,
            request: Request,
            token: str = Depends(settings.settings.auth.OAUTH2_SCHEMA),
            db: AsyncSession = Depends(ORMDatabase.db_getter)
    ) -> Auth:
        """
        每次调用依赖此类的接口会执行该方法
        """
        if not settings.settings.auth.OAUTH_ENABLE:
            return Auth(db=db)
        telephone, password = self.validate_token(request, token)
        options = [
            joinedload(UserModel.roles).subqueryload(RoleModel.menus),
            joinedload(UserModel.roles).subqueryload(RoleModel.depts),
            joinedload(UserModel.depts)
        ]
        user = await UserDal(db).get_data(
            telephone=telephone,
            password=password,
            v_return_none=True,
            v_options=options,
            is_staff=True
        )
        result = await self.validate_user(request, user, db, is_all=False)
        permissions = self.get_user_permissions(user)
        if permissions != {'*.*.*'} and self.permissions:
            if not (self.permissions & permissions):
                raise CustomException(message="无权限操作", code=Status.HTTP_403)
        return result
