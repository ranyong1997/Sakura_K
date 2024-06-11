#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/18 17:45
# @Author  : 冉勇
# @Site    :
# @File    : login.py
# @Software: PyCharm
# @desc    : 安全认证试图
"""
JWT 表示 「JSON Web Tokens」。https://jwt.io/
它是一个将 JSON 对象编码为密集且没有空格的长字符串的标准。
通过这种方式，你可以创建一个有效期为 1 周的令牌。然后当用户第二天使用令牌重新访问时，你知道该用户仍然处于登入状态。
一周后令牌将会过期，用户将不会通过认证，必须再次登录才能获得一个新令牌。
我们需要安装 python-jose 以在 Python 中生成和校验 JWT 令牌：pip3 install python-jose[cryptography]
PassLib 是一个用于处理哈希密码的很棒的 Python 包。它支持许多安全哈希算法以及配合算法使用的实用程序。
推荐的算法是 「Bcrypt」：pip3 install passlib[bcrypt]
"""
import jwt
from datetime import timedelta
from fastapi import APIRouter, Depends, Request, Body
from fastapi.security import OAuth2PasswordRequestForm
from redis.asyncio import Redis
from sqlalchemy.ext.asyncio import AsyncSession
from application import settings
from db.orm.asyncio import ORMDatabase
from db.redis.asyncio import RedisDatabase
from utils.response import RestfulResponse
from core.exception import CustomException
from utils import status
from utils.response_code import Status
from utils.wx.oauth import WXOAuth
from .current import FullAdminAuth
from apps.models.user_model import VadminUser
from .login_manage import LoginManage
from .validation.auth import Auth
from .validation.login import LoginForm, WXLoginForm
from ..cruds import auth_crud
from ..cruds.auth_crud import UserDal
from ..models.login_model import VadminLoginRecord

app = APIRouter()


@app.post("/api/login", summary="API 手机号密码登录", description="Swagger API 文档登录认证")
async def api_login_for_access_token(
        request: Request,
        data: OAuth2PasswordRequestForm = Depends(),
        db: AsyncSession = Depends(ORMDatabase.db_getter)
):
    user = await UserDal(db).get_data(telephone=data.username, v_return_none=True)
    if not user:
        raise CustomException(status_code=Status.HTTP_401, code=Status.HTTP_401, message="该手机号不存在")
    result = VadminUser.verify_password(data.password, user.password)
    if not result:
        raise CustomException(status_code=Status.HTTP_401, code=Status.HTTP_401, message="手机号或密码错误")
    if not user.is_active:
        raise CustomException(status_code=Status.HTTP_401, code=Status.HTTP_401, message="此手机号已被冻结")
    elif not user.is_staff:
        raise CustomException(status_code=Status.HTTP_401, code=Status.HTTP_401, message="此手机号无权限")
    access_token = LoginManage.create_token({"sub": user.telephone, "password": user.password})
    record = LoginForm(platform='2', method='0', telephone=data.username, password=data.password)
    resp = {"access_token": access_token, "token_type": "Bearer"}
    await VadminLoginRecord.create_login_record(db, record, True, request, resp)
    return resp


@app.post("/login", summary="手机号密码登录", description="员工登录通道，限制最多输错次数，达到最大值后将is_active=False")
async def login_for_access_token(
        request: Request,
        data: LoginForm,
        manage: LoginManage = Depends(),
        db: AsyncSession = Depends(ORMDatabase.db_getter)
):
    try:
        if data.method == "0":
            result = await manage.password_login(data, db, request)
        elif data.method == "1":
            result = await manage.sms_login(data, db, request)
        else:
            raise ValueError("无效参数")

        if not result.status:
            raise ValueError(result.msg)

        access_token = LoginManage.create_token(
            {"sub": result.user.telephone, "is_refresh": False, "password": result.user.password}
        )
        expires = timedelta(minutes=settings.settings.auth.REFRESH_TOKEN_EXPIRE_MINUTES)
        refresh_token = LoginManage.create_token({"sub": result.user.telephone, "is_refresh": True}, expires=expires)
        resp = {
            "access_token": access_token,
            "refresh_token": refresh_token,
            "token_type": "Bearer",
            "is_reset_password": result.user.is_reset_password,
            "is_wx_server_openid": result.user.is_wx_server_openid
        }
        await VadminLoginRecord.create_login_record(db, data, True, request, resp)
        return RestfulResponse.success(data=resp)
    except ValueError as e:
        await VadminLoginRecord.create_login_record(db, data, False, request, {"message": str(e)})
        return RestfulResponse.error(message=str(e))


@app.post("/wx/login", summary="微信服务端一键登录", description="员工登录通道")
async def wx_login_for_access_token(
        request: Request,
        data: WXLoginForm,
        db: AsyncSession = Depends(ORMDatabase.db_getter),
        rd: Redis = Depends(RedisDatabase.db_getter)
):
    try:
        if data.platform != "1" or data.method != "2":
            raise ValueError("无效参数")
        wx = WXOAuth(rd)
        telephone = await wx.parsing_phone_number(data.code)
        if not telephone:
            raise ValueError("无效Code")
        data.telephone = telephone
        user = await UserDal(db).get_data(telephone=telephone, v_return_none=True)
        if not user:
            raise ValueError("手机号不存在")
        elif not user.is_active:
            raise ValueError("手机号已被冻结")
    except ValueError as e:
        await VadminLoginRecord.create_login_record(db, data, False, request, {"message": str(e)})
        return RestfulResponse.error(message=str(e))

    # 更新登录时间
    await UserDal(db).update_login_info(user, request.client.host)

    # 登录成功创建 token
    access_token = LoginManage.create_token({"sub": user.telephone, "is_refresh": False, "password": user.password})
    expires = timedelta(minutes=settings.settings.auth.REFRESH_TOKEN_EXPIRE_MINUTES)
    refresh_token = LoginManage.create_token(
        payload={"sub": user.telephone, "is_refresh": True, "password": user.password},
        expires=expires
    )
    resp = {
        "access_token": access_token,
        "refresh_token": refresh_token,
        "token_type": "Bearer",
        "is_reset_password": user.is_reset_password,
        "is_wx_server_openid": user.is_wx_server_openid
    }
    await VadminLoginRecord.create_login_record(db, data, True, request, resp)
    return RestfulResponse.success(data=resp)


@app.get("/getMenuList", summary="获取当前用户菜单树")
async def get_menu_list(auth: Auth = Depends(FullAdminAuth())):
    return RestfulResponse.success(data=await auth_crud.MenuDal(auth.db).get_routers(auth.user))


@app.post("/token/refresh", summary="刷新Token")
async def token_refresh(refresh: str = Body(..., title="刷新Token")):
    Status.HTTP_401 = status.HTTP_401_UNAUTHORIZED
    try:
        payload = jwt.decode(refresh, settings.settings.auth.SECRET_KEY, algorithms=[settings.settings.auth.ALGORITHM])
        telephone: str = payload.get("sub")
        is_refresh: bool = payload.get("is_refresh")
        password: str = payload.get("password")
        if not telephone or not is_refresh or not password:
            return RestfulResponse.error(message="未认证，请您重新登录", code=Status.HTTP_401, status_code=Status.HTTP_401)
    except jwt.exceptions.InvalidSignatureError:
        return RestfulResponse.error(message="无效认证，请您重新登录", code=Status.HTTP_401, status_code=Status.HTTP_401)
    except jwt.exceptions.ExpiredSignatureError:
        return RestfulResponse.error("登录已超时，请您重新登录", code=Status.HTTP_401, status_code=Status.HTTP_401)

    access_token = LoginManage.create_token({"sub": telephone, "is_refresh": False, "password": password})
    expires = timedelta(minutes=settings.settings.auth.REFRESH_TOKEN_EXPIRE_MINUTES)
    refresh_token = LoginManage.create_token(
        payload={"sub": telephone, "is_refresh": True, "password": password},
        expires=expires
    )
    resp = {
        "access_token": access_token,
        "refresh_token": refresh_token,
        "token_type": "Bearer"
    }
    return RestfulResponse.success(data=resp)
