#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/8 11:24
# @Author  : 冉勇
# @Site    : 
# @File    : help_issue.py
# @Software: PyCharm
# @desc    :
from sqlalchemy import String, Boolean, Integer, ForeignKey, Text
from sqlalchemy.orm import relationship, Mapped, mapped_column
from apps.models.base.orm import AbstractORMModel


class HelpIssue(AbstractORMModel):
    __tablename__ = "help_issue"
    __table_args__ = ({'comment': '常见问题记录表'})

    category_id: Mapped[int] = mapped_column(
        Integer,
        ForeignKey("issue.id", ondelete='CASCADE'),
        comment="类别"
    )
    category: Mapped[list[set["IssueModel"]]] = relationship(foreign_keys=category_id, back_populates='issues')
    title: Mapped[str] = mapped_column(String(255), index=True, nullable=False, comment="标题")
    content: Mapped[str] = mapped_column(Text, comment="内容")
    view_number: Mapped[int] = mapped_column(Integer, default=0, comment="查看次数")
    is_active: Mapped[bool] = mapped_column(Boolean, default=True, comment="是否可见")
    create_user_id: Mapped[int] = mapped_column(
        Integer,
        ForeignKey("user.id", ondelete='RESTRICT'),
        comment="创建人"
    )
    create_user: Mapped[set["User"]] = relationship(foreign_keys=create_user_id)
