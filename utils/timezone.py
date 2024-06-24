#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/24 11:40
# @Author  : 冉勇
# @Site    : 
# @File    : timezone.py
# @Software: PyCharm
# @desc    : 获取时区时间
import zoneinfo
from datetime import datetime
from application import settings


class TimeZone:
    def __init__(self, tz: str = settings.DATETIME_TIMEZONE):
        self.tz_info = zoneinfo.ZoneInfo(tz)

    def now(self) -> datetime:
        """
        获取时区时间

        :return:
        """
        return datetime.now(self.tz_info)

    def f_datetime(self, dt: datetime) -> datetime:
        """
        datetime 时间转时区时间

        :param dt:
        :return:
        """
        return dt.astimezone(self.tz_info)

    def f_str(self, date_str: str, format_str: str = settings.DATETIME_FORMAT) -> datetime:
        """
        时间字符串转时区时间

        :param date_str:
        :param format_str:
        :return:
        """
        return datetime.strptime(date_str, format_str).replace(tzinfo=self.tz_info)


timezone = TimeZone()
