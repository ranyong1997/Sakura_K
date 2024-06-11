#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/19 11:03
# @Author  : 冉勇
# @Site    :
# @File    : settings_table.py
# @Software: PyCharm
# @desc    : 系统字典模型
from sqlalchemy import String, Boolean
from sqlalchemy.orm import relationship, Mapped, mapped_column
from apps.models.settings_model import SettingsModel
from apps.models.base.orm import AbstractORMModel


class SettingsTableModel(AbstractORMModel):
    __tablename__ = "settings_table"
    __table_args__ = ({'comment': '系统配置分类表'})

    title: Mapped[str] = mapped_column(String(255), comment="标题")
    classify: Mapped[str] = mapped_column(String(255), index=True, nullable=False, comment="分类键")
    tab_label: Mapped[str] = mapped_column(String(255), comment="tab标题")
    tab_name: Mapped[str] = mapped_column(String(255), index=True, nullable=False, unique=True, comment="tab标识符")
    hidden: Mapped[bool] = mapped_column(Boolean, default=False, comment="是否隐藏")
    disabled: Mapped[bool] = mapped_column(Boolean, default=False, comment="是否禁用")

    settings: Mapped[list["SettingsModel"]] = relationship(back_populates="tab")
