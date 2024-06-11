#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/7 16:37
# @Author  : 冉勇
# @Site    : 
# @File    : db_getter.py
# @Software: PyCharm
# @desc    :
import re
import pymysql

from application import settings
from core.logger import logger


class DBGetter:

    def __init__(self):
        self.mysql_cursor = None
        self.mysql_conn = None

    def conn_mysql(self) -> None:
        """
        连接系统中配置的 mysql 数据库
        """
        try:
            connection_string = settings.settings.ORM_DATABASE_URL.db.split("//")[1]
            pattern = r'^(?P<username>[^:]+):(?P<password>[^@]+)@(?P<host>[^:/]+):(?P<port>\d+)/(?P<database>[^/]+)$'
            match = re.match(pattern, connection_string)
            username = match.group('username')
            password = match.group('password')
            host = match.group('host')
            port = int(match.group('port'))
            database = match.group('database')

            self.mysql_conn = pymysql.connect(
                host=host,
                port=port,
                user=username,
                password=password,
                database=database
            )
            self.mysql_cursor = self.mysql_conn.cursor()
        except pymysql.err.OperationalError as e:
            logger.error(f"数据库连接失败，{e}")
            raise ValueError("数据库连接失败！")
        except AttributeError as e:
            logger.error(f"数据库链接解析失败，{e}")
            raise ValueError("数据库链接解析失败！")

    def close_mysql(self) -> None:
        """
        关闭 mysql 链接
        """
        try:
            self.mysql_cursor.close()
            self.mysql_conn.close()
        except AttributeError as e:
            logger.error(f"未连接数据库，无需关闭！，{e}")
            raise ValueError("未连接数据库，无需关闭！")