#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023-04-14 16:33:42
# @Author  :
# @Site    :
# @File    : help_crud.py
# @Software: PyCharm
# @desc    : 帮助中心--增删改查
from sqlalchemy.ext.asyncio import AsyncSession
from apps.models import issue_model
from apps.schemas import issue_schema
from core.crud import DalBase


class IssueDal(DalBase):

    def __init__(self, db: AsyncSession):
        super(IssueDal, self).__init__()
        self.db = db
        self.model = issue_model.VadminIssue
        self.schema = issue_schema.IssueSimpleOut

    async def add_view_number(self, data_id: int) -> None:
        """
        更新常见问题查看次数+1
        """
        obj: issue_model.VadminIssue = await self.get_data(data_id)
        obj.view_number = obj.view_number + 1 if obj.view_number else 1
        await self.flush(obj)


class IssueCategoryDal(DalBase):

    def __init__(self, db: AsyncSession):
        super(IssueCategoryDal, self).__init__()
        self.db = db
        self.model = issue_model.VadminIssueCategory
        self.schema = issue_schema.IssueSimpleOut
