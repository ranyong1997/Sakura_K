#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/5 11:48
# @Author  : 冉勇
# @Site    : 
# @File    : dept_model.py
# @Software: PyCharm
# @desc    : 部门表
from apps.models.base.orm import AbstractORMModel
from sqlalchemy import String, Boolean, Integer, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column


class DeptModel(AbstractORMModel):
    __tablename__ = "dept"
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
        ForeignKey("dept.id", ondelete='CASCADE'),
        comment="上级部门"
    )
