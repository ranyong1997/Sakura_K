#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/18 17:45
# @Author  : 冉勇
# @Site    :
# @File    : login.py
# @Software: PyCharm
# @desc    : 登录验证装饰器
from fastapi import Request
from pydantic import BaseModel, field_validator
from sqlalchemy.ext.asyncio import AsyncSession
from application import settings
from apps.cruds import auth_crud
from apps.schemas import user_schema
from db.redis.asyncio import RedisDatabase
from utils.count import Count
from utils.validator import vali_telephone


class LoginForm(BaseModel):
    telephone: str
    password: str
    method: str = '0'  # 认证方式，0：密码登录，1：短信登录，2：微信一键登录
    platform: str = '0'  # 登录平台，0：PC端管理系统，1：移动端管理系统

    # 重用验证器：https://docs.pydantic.dev/dev-v2/usage/validators/#reuse-validators
    normalize_telephone = field_validator('telephone')(vali_telephone)


class WXLoginForm(BaseModel):
    telephone: str | None = None
    code: str
    method: str = '2'  # 认证方式，0：密码登录，1：短信登录，2：微信一键登录
    platform: str = '1'  # 登录平台，0：PC端管理系统，1：移动端管理系统


class LoginResult(BaseModel):
    status: bool | None = False
    user: user_schema.UserPasswordOut | None = None
    msg: str | None = None

    class Config:
        arbitrary_types_allowed = True


class LoginValidation:
    """
    验证用户登录时提交的数据是否有效
    """

    def __init__(self, func):
        self.func = func

    async def __call__(self, data: LoginForm, db: AsyncSession, request: Request) -> LoginResult:
        self.result = LoginResult()
        if data.platform not in ["0", "1"] or data.method not in ["0", "1"]:
            self.result.msg = "无效参数"
            return self.result
        user = await auth_crud.UserDal(db).get_data(telephone=data.telephone, v_return_none=True)
        if not user:
            self.result.msg = "该手机号不存在！"
            return self.result

        result = await self.func(self, data=data, user=user, request=request)

        if settings.settings.db.REDIS_DB_ENABLE:
            count_key = f"{data.telephone}_password_auth" if data.method == '0' else f"{data.telephone}_sms_auth"
            count = Count(RedisDatabase.db_getter(request), count_key)
        else:
            count = None

        if not result.status:
            self.result.msg = result.msg
            if not settings.settings.demo.DEMO_ENV and count:
                number = await count.add(ex=86400)
                if number >= settings.settings.system.DEFAULT_AUTH_ERROR_MAX_NUMBER:
                    await count.reset()
                    # 如果等于最大次数，那么就将用户 is_active=False
                    user.is_active = False
                    await db.flush()
        elif not user.is_active:
            self.result.msg = "此手机号已被冻结！"
        elif data.platform in ["0", "1"] and not user.is_staff:
            self.result.msg = "此手机号无权限！"
        else:
            if not settings.settings.demo.DEMO_ENV and count:
                await count.delete()
            self.result.msg = "OK"
            self.result.status = True
            self.result.user = user_schema.UserPasswordOut.model_validate(user)
            await auth_crud.UserDal(db).update_login_info(user, request.client.host)
        return self.result
