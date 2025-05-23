#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/7/5 11:41
# @Author  : 冉勇
# @Site    : 
# @File    : get_db.py
# @Software: PyCharm
# @desc    : 初始化数据库相关操作
from config.database import *
from utils.log_util import logger


async def get_db():
    """
    每一个请求处理完毕后会关闭当前连接，不同的请求使用不同的连接
    :return:
    """
    async with AsyncSessionLocal() as current_db:
        yield current_db


async def init_create_table():
    """
    应用启动时初始化数据库连接
    :return:
    """
    # 初始化数据库连接并创建所有尚不存在的表
    logger.info("初始化数据库连接...")
    async with async_engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
        # create_all 方法会创建所有尚不存在的表
    logger.info("数据库连接成功")
