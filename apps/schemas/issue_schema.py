#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/18 16:43
# @Author  : 冉勇
# @Site    :
# @File    : issue_schema.py
# @Software: PyCharm
# @desc    : 常见问题
from pydantic import ConfigDict
from apps.schemas.issue_category_schema import IssueCategorySimpleOut
from apps.schemas.user_schema import UserSimpleOut
from core.types import DatetimeStr
from apps.schemas.base.base import BaseSchema


class Issue(BaseSchema):
    category_id: int | None = None
    create_user_id: int | None = None

    title: str | None = None
    content: str | None = None
    view_number: int | None = None
    is_active: bool | None = None


class IssueSimpleOut(Issue):
    model_config = ConfigDict(from_attributes=True)

    id: int
    update_datetime: DatetimeStr
    create_datetime: DatetimeStr


class IssueListOut(IssueSimpleOut):
    model_config = ConfigDict(from_attributes=True)

    create_user: UserSimpleOut
    category: IssueCategorySimpleOut
