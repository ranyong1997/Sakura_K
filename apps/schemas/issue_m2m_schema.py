#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/18 17:23
# @Author  : 冉勇
# @Site    :
# @File    : issue_m2m_schema.py
# @Software: PyCharm
# @desc    :
from pydantic import ConfigDict
from apps.schemas.issue_schema import IssueSimpleOut
from core.types import DatetimeStr
from apps.schemas.base.base import BaseSchema


class IssueCategoryPlatformOut(BaseSchema):
    model_config = ConfigDict(from_attributes=True)

    name: str | None = None
    platform: str | None = None
    is_active: bool | None = None
    create_user_id: int | None = None

    id: int
    update_datetime: DatetimeStr
    create_datetime: DatetimeStr

    issues: list[IssueSimpleOut] = None
