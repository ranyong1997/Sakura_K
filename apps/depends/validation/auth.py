#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/5 17:04
# @Author  : 冉勇
# @Site    : 
# @File    : auth.py
# @Software: PyCharm
# @desc    : 用户凭证验证装饰器
import jwt
from datetime import timedelta, datetime
from fastapi import Request
from pydantic import BaseModel
from sqlalchemy.ext.asyncio import AsyncSession
from application import settings
from apps.cruds.auth_crud import UserDal
from apps.models.user_model import UserModel
from core.exception import CustomException
from utils.response_code import Status


class Auth(BaseModel):
    user: UserModel = None
    db: AsyncSession
    data_range: int | None = None
    dept_ids: list | None = []

    class Config:
        # 接收任意类型
        arbitrary_types_allowed = True


class AuthValidation:
    """
    用于用户每次调用接口时，验证用户提交的token是否正确，并从token中获取用户信息
    """
    # status_code = 401 时，表示强制要求重新登录，因账号已冻结，账号已过期，手机号码错误，刷新token无效等问题导致
    # 只有 code = 401 时，表示 token 过期，要求刷新 token
    # 只有 code = 错误值时，只是报错，不重新登陆
    error_code = Status.HTTP_401
    warning_code = Status.HTTP_ERROR

    # status_code = 403 时，表示强制要求重新登录，因无系统权限，而进入到系统访问等问题导致

    @classmethod
    def validate_token(cls, request: Request, token: str | None) -> tuple[str, bool]:
        """
        验证用户 token
        """
        if not token:
            raise CustomException(
                message="请您先登录！",
                code=Status.HTTP_403,
                status_code=Status.HTTP_403
            )
        try:
            payload = jwt.decode(
                token,
                settings.settings.auth.SECRET_KEY,
                algorithms=[settings.settings.auth.ALGORITHM]
            )
            telephone: str = payload.get("sub")
            exp: int = payload.get("exp")
            is_refresh: bool = payload.get("is_refresh")
            password: bool = payload.get("password")
            if not telephone or is_refresh or not password:
                raise CustomException(
                    message="未认证，请您重新登录",
                    code=Status.HTTP_403,
                    status_code=Status.HTTP_403
                )
            # 计算当前时间 + 缓冲时间是否大于等于 JWT 过期时间
            buffer_time = (datetime.now() + timedelta(
                minutes=settings.settings.auth.ACCESS_TOKEN_CACHE_MINUTES
            )).timestamp()
            if buffer_time >= exp:
                request.scope["if-refresh"] = 1
            else:
                request.scope["if-refresh"] = 0
        except (jwt.exceptions.InvalidSignatureError, jwt.exceptions.DecodeError):
            raise CustomException(
                message="无效认证，请您重新登录",
                code=Status.HTTP_403,
                status_code=Status.HTTP_403
            )
        except jwt.exceptions.ExpiredSignatureError:
            raise CustomException(message="认证已失效，请您重新登录", code=cls.error_code, status_code=cls.error_code)
        return telephone, password

    @classmethod
    async def validate_user(cls, request: Request, user: UserModel, db: AsyncSession, is_all: bool = True) -> Auth:
        """
        验证用户信息
        :param request:
        :param user:
        :param db:
        :param is_all: 是否所有人访问，不加权限
        :return:
        """
        if user is None:
            raise CustomException(message="未认证，请您重新登陆", code=cls.error_code, status_code=cls.error_code)
        elif not user.is_active:
            raise CustomException(message="用户已被冻结！", code=cls.error_code, status_code=cls.error_code)
        request.scope["telephone"] = user.telephone
        request.scope["user_id"] = user.id
        request.scope["user_name"] = user.name
        try:
            request.scope["body"] = await request.body()
        except RuntimeError:
            request.scope["body"] = "获取失败"
        if is_all:
            return Auth(user=user, db=db)
        if user.roles:
            data_range, dept_ids = await cls.get_user_data_range(user, db)
        else:
            raise ValueError("用户角色不能为空.")
        return Auth(user=user, db=db, data_range=data_range, dept_ids=dept_ids)

    @classmethod
    def get_user_permissions(cls, user: UserModel) -> set:
        """
        获取员工用户所有权限列表
        :param user: 用户实例
        :return:
        """
        if user.is_admin():
            return {'*.*.*'}
        permissions = set()
        for role_obj in user.roles:
            for menu in role_obj.menus:
                if menu.perms and not menu.disabled:
                    permissions.add(menu.perms)
        return permissions

    @classmethod
    async def get_user_data_range(cls, user: UserModel, db: AsyncSession) -> tuple:
        """
        获取用户数据范围
        0 仅本人数据权限  create_user_id 查询
        1 本部门数据权限  部门 id 左连接查询
        2 本部门及以下数据权限 部门 id 左连接查询
        3 自定义数据权限  部门 id 左连接查询
        4 全部数据权限  无
        :param user:
        :param db:
        :return:
        """
        if user.is_admin():
            return 4, ["*"]
        data_range = max([i.data_range for i in user.roles])
        dept_ids = set()
        if data_range == 0:
            pass
        elif data_range == 1:
            for dept in user.depts:
                dept_ids.add(dept.id)
        elif data_range == 2:
            # 递归获取部门列表
            dept_ids = await UserDal(db).recursion_get_dept_ids(user)
        elif data_range == 3:
            for role_obj in user.roles:
                for dept in role_obj.depts:
                    dept_ids.add(dept.id)
        elif data_range == 4:
            dept_ids.add("*")
        return data_range, list(dept_ids)
