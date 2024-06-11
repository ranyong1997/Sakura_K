#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 18:05
# @Author  : 冉勇
# @Site    : 
# @File    : params.py
# @Software: PyCharm
# @desc    : 角色
from fastapi import Depends

from apps.depends.Paging import QueryParams, Paging


class PageParams(QueryParams):
    def __init__(self, params: Paging = Depends()):
        super().__init__(params)
