#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/19 11:03
# @Author  : 冉勇
# @Site    :
# @File    : settings_model.py
# @Software: PyCharm
# @desc    : 系统字典模型

from sqlalchemy import String, Integer, ForeignKey, Boolean, Text
from sqlalchemy.orm import relationship, Mapped, mapped_column
from apps.models.base.orm import AbstractORMModel


class SettingsModel(AbstractORMModel):
    __tablename__ = "settings"
    __table_args__ = ({'comment': '系统配置表'})

    config_label: Mapped[str] = mapped_column(String(255), comment="配置表标签")
    config_key: Mapped[str] = mapped_column(String(255), index=True, nullable=False, unique=True, comment="配置表键")
    config_value: Mapped[str | None] = mapped_column(Text, comment="配置表内容")
    remark: Mapped[str | None] = mapped_column(String(255), comment="备注信息")
    disabled: Mapped[bool] = mapped_column(Boolean, default=False, comment="是否禁用")

    tab_id: Mapped[int] = mapped_column(
        Integer,
        ForeignKey("settings_table.id", ondelete='CASCADE'),
        comment="关联tab标签"
    )
    tab: Mapped[set["Settings_Table"]] = relationship(foreign_keys=tab_id, back_populates="settings")
