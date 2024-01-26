#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time     : 2024/1/8 14:14
# @Author   : 冉勇
# @File     : dept.py
# @Software : PyCharm
# @Desc     : 部门模型
from sqlalchemy import String, Boolean, Integer, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column

from db.db_base import BaseModel


class VadminDept(BaseModel):
    __tablename__ = "vadmin_auth_dept"
    __table_args__ = ({'comment': '部门表'})

    name: Mapped[str] = mapped_column(String(50), index=True, nullable=False, comment="部门名称")
    dept_key: Mapped[str] = mapped_column(String(50), index=True, nullable=False, comment="部门标识")
    disabled: Mapped[bool] = mapped_column(Boolean, default=False, comment="是否禁用")
    order: Mapped[int | None] = mapped_column(Integer, comment="显示排序")
    desc: Mapped[str | None] = mapped_column(String(255), comment="描述")
    owner: Mapped[str | None] = mapped_column(String(255), comment="负责人")
    phone: Mapped[str | None] = mapped_column(String(255), comment="联系电话")
    email: Mapped[str | None] = mapped_column(String(255), comment="邮箱")

    parent_id: Mapped[int | None] = mapped_column(
        Integer,
        ForeignKey("vadmin_auth_dept.id", ondelete='CASCADE'),
        comment="上级部门"
    )
