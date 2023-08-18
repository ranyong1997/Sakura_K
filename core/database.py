#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/11 19:09
# @Author  : 冉勇
# @Site    :
# @File    : database.py
# @Software: PyCharm
# @desc    : SQLAlchemy 部分
"""
导入SQLAlchemy 部分
安装： pip3 install sqlalchemy
中文文档：https://www.osgeo.cn/sqlalchemy/
"""
from aioredis import Redis
from fastapi import Request
from motor.motor_asyncio import AsyncIOMotorDatabase
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.ext.declarative import declared_attr, declarative_base
from sqlalchemy.orm import sessionmaker

from application.settings import SQLALCHEMY_DATABASE_URL, REDIS_DB_ENABLE, MONGO_DB_ENABLE
from core.exception import CustomException


def create_async_engine_session(database_url: str):
    """
    创建数据库会话

    相关配置文档：https://docs.sqlalchemy.org/en/14/core/engines.html#database-urls

    database_url  dialect+driver://username:password@host:port/database
    max_overflow 超过连接池大小外最多创建的连接
    pool_size=5,     # 连接池大小
    pool_timeout=20, # 池中没有连接最多等待的时间，否则报错
    pool_recycle=-1  # 多久之后对线程池中的线程进行一次连接的回收（重置）

    :param database_url: 数据库地址
    :return:
    """
    engine = create_async_engine(
        database_url,
        echo=False,
        pool_pre_ping=True,
        pool_recycle=3600,
        future=True,
        max_overflow=5,
        connect_args={}
    )
    return sessionmaker(autocommit=False, autoflush=False, bind=engine, expire_on_commit=True, class_=AsyncSession)


class Base:
    """将表名改为小写"""

    @declared_attr
    def __tablename__(self):
        # 如果有自定义表名就取自定义，没有就取小写类名
        table_name = self.__tablename__
        if not table_name:
            model_name = self.__name__
            ls = []
            for index, char in enumerate(model_name):
                if char.isupper() and index != 0:
                    ls.append("_")
                ls.append(char)
            table_name = "".join(ls).lower()
        return table_name


"""
创建基本映射类
稍后，我们将继承该类，创建每个 ORM 模型
"""
Model = declarative_base(name='Model', cls=Base)

""" 附上两个SQLAlchemy教程

Python3+SQLAlchemy+Sqlite3实现ORM教程
    https://www.cnblogs.com/jiangxiaobo/p/12350561.html

SQLAlchemy基础知识 Autoflush和Autocommit
    https://www.jianshu.com/p/b219c3dd4d1e
"""


async def db_getter():
    """
    获取主数据库

    数据库依赖项，它将在单个请求中使用，然后在请求完成后将其关闭。
    """
    async with create_async_engine_session(SQLALCHEMY_DATABASE_URL)() as session:
        async with session.begin():
            yield session


def redis_getter(request: Request) -> Redis:
    """
    获取 redis 数据库对象

    全局挂载，使用一个数据库对象
    """
    if not REDIS_DB_ENABLE:
        raise CustomException("请先配置Redis数据库链接并启用！", desc="请启用 application/settings.py: REDIS_DB_ENABLE")
    return request.app.state.redis


def mongo_getter(request: Request) -> AsyncIOMotorDatabase:
    """
    获取 mongo 数据库对象

    全局挂载，使用一个数据库对象
    """
    if not MONGO_DB_ENABLE:
        raise CustomException(
            msg="请先开启 MongoDB 数据库连接！", desc="请启用 application/settings.py: MONGO_DB_ENABLE"
        )
    return request.app.state.mongo
