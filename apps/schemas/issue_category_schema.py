#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/18 16:47
# @Author  : 冉勇
# @Site    :
# @File    : issue_category_schema.py
# @Software: PyCharm
# @desc    : 常见问题类别
from pydantic import Field, ConfigDict
from apps.schemas.user_schema import UserSimpleOut
from core.types import DatetimeStr
from apps.schemas.base.base import BaseSchema


class IssueCategory(BaseSchema):
    name: str | None = None
    platform: str | None = None
    is_active: bool | None = None

    create_user_id: int | None = None


class IssueCategorySimpleOut(IssueCategory):
    model_config = ConfigDict(from_attributes=True)

    id: int
    update_datetime: DatetimeStr
    create_datetime: DatetimeStr


class IssueCategoryListOut(IssueCategorySimpleOut):
    model_config = ConfigDict(from_attributes=True)

    create_user: UserSimpleOut


class IssueCategoryOptionsOut(BaseSchema):
    model_config = ConfigDict(from_attributes=True)

    label: str = Field(alias='name')
    value: int = Field(alias='id')
