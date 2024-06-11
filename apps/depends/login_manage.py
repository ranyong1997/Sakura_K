#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/20 15:04
# @Author  : 冉勇
# @Site    :
# @File    : login_manage.py
# @Software: PyCharm
# @desc    : 登录管理
import jwt
from datetime import datetime, timedelta
from fastapi import Request
from application import settings
from apps.depends.validation.login import LoginForm, LoginValidation, LoginResult
from apps.models.user_model import UserModel
from db.redis.asyncio import RedisDatabase
from utils.sms.code import CodeSMS


class LoginManage:
    """
    登录认证工具
    """

    @LoginValidation
    async def password_login(self, data: LoginForm, user: UserModel, **kwargs) -> LoginResult:
        """
        验证用户密码
        """
        result = UserModel.verify_password(data.password, user.password)
        if result:
            return LoginResult(status=True, msg="验证成功")
        return LoginResult(status=False, msg="手机号或密码错误")

    @LoginValidation
    async def sms_login(self, data: LoginForm, request: Request, **kwargs) -> LoginResult:
        """
        验证用户短信验证码
        """
        rd = RedisDatabase.db_getter(request)
        sms = CodeSMS(data.telephone, rd)
        result = await sms.check_sms_code(data.password)
        if result:
            return LoginResult(status=True, msg="验证成功")
        return LoginResult(status=False, msg="验证码错误")

    @staticmethod
    def create_token(payload: dict, expires: timedelta = None):
        """
        创建一个生成新的访问令牌的工具函数。

        pyjwt：https://github.com/jpadilla/pyjwt/blob/master/docs/usage.rst
        jwt 博客：https://geek-docs.com/python/python-tutorial/j_python-jwt.html

        #TODO 传入的时间为UTC时间datetime.datetime类型，但是在解码时获取到的是本机时间的时间戳
        """
        if expires:
            expire = datetime.utcnow() + expires
        else:
            expire = datetime.utcnow() + timedelta(minutes=settings.settings.auth.ACCESS_TOKEN_EXPIRE_MINUTES)
        payload.update({"exp": expire})
        encoded_jwt = jwt.encode(payload, settings.settings.auth.SECRET_KEY, algorithm=settings.settings.auth.ALGORITHM)
        return encoded_jwt
