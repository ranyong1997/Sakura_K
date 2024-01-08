#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2024/1/8 15:09
# @Author   : 冉勇
# @File     : dept.py
# @Software : PyCharm
# @Desc     : 查询参数-类依赖项

"""
类依赖项-官方文档：https://fastapi.tiangolo.com/zh/tutorial/dependencies/classes-as-dependencies/
"""
from fastapi import Depends, Query

from core.dependencies import Paging, QueryParams


class DeptParams(QueryParams):
    """
    列表分页
    """

    def __init__(
            self,
            name: str | None = Query(None, title="部门名称"),
            dept_key: str | None = Query(None, title="部门标识"),
            disabled: bool | None = Query(None, title="是否禁用"),
            params: Paging = Depends()
    ):
        super().__init__(params)
        self.name = ("like", name)
        self.dept_key = ("like", dept_key)
        self.disabled = disabled
