#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/18 19:57
# @Author  : 冉勇
# @Site    :
# @File    : dict_type_model.py
# @Software: PyCharm
# @desc    : 系统字典模型
from sqlalchemy import String, Boolean
from sqlalchemy.orm import relationship, Mapped, mapped_column
from apps.models.base.orm import AbstractORMModel
from apps.models.dict_details_model import DictDetailsModel


class DictTypeModel(AbstractORMModel):
    __tablename__ = "dict_type"
    __table_args__ = ({'comment': '字典类型表'})

    dict_name: Mapped[str] = mapped_column(String(50), index=True, nullable=False, comment="字典名称")
    dict_type: Mapped[str] = mapped_column(String(50), index=True, nullable=False, comment="字典类型")
    disabled: Mapped[bool] = mapped_column(Boolean, default=False, comment="字典状态，是否禁用")
    remark: Mapped[str | None] = mapped_column(String(255), comment="备注")
    details: Mapped[list[set["DictDetailsModel"]]] = relationship(back_populates="dict_type")
