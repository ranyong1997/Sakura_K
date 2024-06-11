# #!/usr/bin/env python
# # -*- coding: utf-8 -*-
# # @Time    : 2023/4/18 17:45
# # @Author  : 冉勇
# # @Site    :
# # @File    : login.py
# # @Software: PyCharm
# # @desc    : 安全认证试图
# """
# JWT 表示 「JSON Web Tokens」。https://jwt.io/
# 它是一个将 JSON 对象编码为密集且没有空格的长字符串的标准。
# 通过这种方式，你可以创建一个有效期为 1 周的令牌。然后当用户第二天使用令牌重新访问时，你知道该用户仍然处于登入状态。
# 一周后令牌将会过期，用户将不会通过认证，必须再次登录才能获得一个新令牌。
# 我们需要安装 python-jose 以在 Python 中生成和校验 JWT 令牌：pip3 install python-jose[cryptography]
# PassLib 是一个用于处理哈希密码的很棒的 Python 包。它支持许多安全哈希算法以及配合算法使用的实用程序。
# 推荐的算法是 「Bcrypt」：pip3 install passlib[bcrypt]
# """
# import jwt
# from datetime import timedelta
# from fastapi import APIRouter, Depends, Request, Body
# from fastapi.security import OAuth2PasswordRequestForm
# from redis.asyncio import Redis
# from sqlalchemy.ext.asyncio import AsyncSession
# from application import settings
# from db.orm.asyncio import ORMDatabase
# from db.redis.asyncio import RedisDatabase
# from utils.response import RestfulResponse
# from core.exception import CustomException
# from utils import status
# from utils.response_code import Status
# from utils.wx.oauth import WXOAuth
# from .current import FullAdminAuth
# from .login_manage import LoginManage
# from .validation.auth import Auth
# from .validation.login import LoginForm, WXLoginForm
# from ..cruds import auth_crud
# from ..cruds.auth_crud import UserDal
# from ..models.login_model import LoginModel
# from ..models.user_model import UserModel
#
# router = APIRouter(prefix="/auth", tags=["系统认证"])
#
#
