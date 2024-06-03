#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/3 21:52
# @Author  : 冉勇
# @Site    : 
# @File    : async_base.py
# @Software: PyCharm
# @desc    : 数据库操作抽象类
from abc import ABC, abstractmethod


class AsyncAbstractDatabase(ABC):
    """
    数据库操作抽象类
    """

    @abstractmethod
    def create_connection(self):
        """
        创建数据库连接

        :return:
        """

    @abstractmethod
    def db_getter(self):
        """
        获取数据库连接

        :return:
        """

    @abstractmethod
    async def db_transaction_getter(self):
        """
        获取数据库事务

        :return:
        """

    @abstractmethod
    async def test_connection(self):
        """
        测试数据库连接

        :return:
        """

    @abstractmethod
    async def close_connection(self):
        """
        关闭数据库连接

        :return:
        """
