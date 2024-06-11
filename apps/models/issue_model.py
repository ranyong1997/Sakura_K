#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/18 15:11
# @Author  : 冉勇
# @Site    :
# @File    : issue.py
# @Software: PyCharm
# @desc    : 常见问题
from sqlalchemy import String, Boolean, Integer, ForeignKey
from sqlalchemy.orm import relationship, Mapped, mapped_column
from apps.models.base.orm import AbstractORMModel
from apps.models.user_model import UserModel


class IssueModel(AbstractORMModel):
    __tablename__ = "issue"
    __table_args__ = ({'comment': '常见问题类别表'})

    name: Mapped[str] = mapped_column(String(50), index=True, nullable=False, comment="类别名称")
    platform: Mapped[str] = mapped_column(String(8), index=True, nullable=False, comment="展示平台")
    is_active: Mapped[bool] = mapped_column(Boolean, default=True, comment="是否可见")
    issues: Mapped[list[set["Help_Issue"]]] = relationship(back_populates='category')
    create_user_id: Mapped[int] = mapped_column(
        Integer,
        ForeignKey("user.id", ondelete='RESTRICT'),
        comment="创建人"
    )
    create_user: Mapped[UserModel] = relationship(foreign_keys=create_user_id)
