#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/3 22:15
# @Author  : 冉勇
# @Site    : 
# @File    : types.py
# @Software: PyCharm
# @desc    : 自定义数据类型
"""
自定义数据类型 - 官方文档：https://docs.pydantic.dev/dev/concepts/types/#adding-validation-and-serialization
"""
import datetime
from typing import Annotated, Any
from pydantic import AfterValidator, PlainSerializer, WithJsonSchema
from utils.validator import object_id_str_vali, \
    dict_str_vali, \
    vali_telephone, \
    vali_email, \
    datetime_str_vali, \
    date_str_vali

# -----------------------------------------------
# 实现自定义一个日期时间字符串的数据类型
# 输入类型：str | datetime.datetime | int | float | dict
# 输出类型：str
# -----------------------------------------------

DatetimeStr = Annotated[
    str | datetime.datetime | int | float | dict,
    AfterValidator(datetime_str_vali),
    PlainSerializer(lambda x: x, return_type=str),
    WithJsonSchema({"type": "string"}, mode="serialization"),
]

# -----------------------------------------------
# 实现自定义一个手机号验证类型
# 输入类型：str
# 输出类型：str
# -----------------------------------------------
Telephone = Annotated[
    str,
    AfterValidator(lambda x: vali_telephone(x)),
    PlainSerializer(lambda x: x, return_type=str),
    WithJsonSchema({"type": "string"}, mode="serialization"),
]

# -----------------------------------------------
# 实现自定义一个邮箱验证类型
# 输入类型：str
# 输出类型：str
# -----------------------------------------------
Email = Annotated[
    str,
    AfterValidator(lambda x: vali_email(x)),
    PlainSerializer(lambda x: x, return_type=str),
    WithJsonSchema({"type": "string"}, mode="serialization"),
]

# -----------------------------------------------
# 实现自定义一个日期字符串的数据类型
# 输入类型：str | datetime.date | int | float
# 输出类型：str
# -----------------------------------------------
DateStr = Annotated[
    str | datetime.date | int | float,
    AfterValidator(date_str_vali),
    PlainSerializer(lambda x: x, return_type=str),
    WithJsonSchema({"type": "string"}, mode="serialization"),
]

# -----------------------------------------------
# 实现自定义一个ObjectId字符串的数据类型
# 输入类型：str | dict | ObjectId
# 输出类型：str
# -----------------------------------------------
ObjectIdStr = Annotated[
    Any,
    AfterValidator(object_id_str_vali),
    PlainSerializer(lambda x: x, return_type=str),
    WithJsonSchema({"type": "string"}, mode="serialization"),
]

# -----------------------------------------------
# 实现自定义一个字典字符串的数据类型
# 输入类型：str | dict
# 输出类型：str
# -----------------------------------------------
DictStr = Annotated[
    str | dict,
    AfterValidator(dict_str_vali),
    PlainSerializer(lambda x: x, return_type=str),
    WithJsonSchema({"type": "string"}, mode="serialization"),
]
