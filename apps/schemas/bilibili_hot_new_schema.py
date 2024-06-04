#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 17:06
# @Author  : 冉勇
# @Site    : 
# @File    : bilibili_hot_new_schema.py
# @Software: PyCharm
# @desc    : bilibili 热搜数据
from pydantic import Field

from apps.schemas.base.base import BaseSchema
from core.types import ObjectIdStr, DatetimeStr


class BilibiliHotNewSchema(BaseSchema):
    title: str = Field(..., description="热搜标题")
    heat: str = Field(..., description="热搜热度")
    link: str = Field(..., description="	b站链接")


class BilibiliHotNewSimpleOutSchema(BilibiliHotNewSchema):
    id: ObjectIdStr = Field(..., alias="_id")
    create_datetime: DatetimeStr = Field(..., description="创建时间")
    update_datetime: DatetimeStr = Field(..., description="更新时间")