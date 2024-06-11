#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/5 17:26
# @Author  : 冉勇
# @Site    : 
# @File    : params.py
# @Software: PyCharm
# @desc    :
from fastapi import Depends, Query

from apps.depends.Paging import QueryParams, Paging


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


class RoleParams(QueryParams):
    """
    角色列表查询含模糊查询
    代码解释：
    定义了一个名为RoleParams的类，该类继承了QueryParams类，实现了对角色列表的查询。
    通过FastAPI中的Depends注入查询参数，其中包括name、role_key和disabled三个参数，以及Paging依赖项。
    在初始化方法中，首先调用了父类的初始化方法。然后，通过self.name将name参数赋值为('like', name)，表示进行模糊查询。
    同理，通过self.role_key将role_key参数赋值为('like', role_key)，同样表示进行模糊查询。
    最后，将disabled参数直接赋值给self.disabled。
    """

    def __init__(
            self,
            name: str | None = Query(None, title="角色名称"),
            role_key: str | None = Query(None, title="权限字符"),
            disabled: bool | None = Query(None, title="是否禁用"),
            params: Paging = Depends()
    ):
        super().__init__(params)
        self.name = ("like", name)
        self.role_key = ("like", role_key)
        self.disabled = disabled


class UserParams(QueryParams):
    """
    用户列表查询含模糊查询
    代码解释：
    定义了一个名为UserParams的类，该类继承了QueryParams类，实现了对用户列表的查询。
    同样地，通过FastAPI中的Depends注入查询参数，其中包括name、telephone、email、is_active和is_staff五个参数，以及Paging依赖项。
    在初始化方法中，首先调用了父类的初始化方法。
    然后，通过self.name将name参数赋值为('like', name)，表示进行模糊查询。
    同理，通过self.telephone将telephone参数赋值为('like', telephone)，表示进行模糊查询；
    通过self.email将email参数赋值为('like', email)，同样表示进行模糊查询。
    最后，将is_active和is_staff参数直接赋值给self.is_active和self.is_staff。
    """

    def __init__(
            self,
            name: str | None = Query(None, title="用户名称"),
            telephone: str | None = Query(None, title="手机号"),
            email: str | None = Query(None, title="邮箱"),
            is_active: bool | None = Query(None, title="是否可用"),
            is_staff: bool | None = Query(None, title="是否为工作人员"),
            params: Paging = Depends()
    ):
        super().__init__(params)
        self.name = ("like", name)
        self.telephone = ("like", telephone)
        self.email = ("like", email)
        self.is_active = is_active
        self.is_staff = is_staff
