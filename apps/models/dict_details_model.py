#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/18 19:57
# @Author  : 冉勇
# @Site    :
# @File    : dict_details_model.py
# @Software: PyCharm
# @desc    : 系统字典模型
from sqlalchemy import String, Boolean, ForeignKey, Integer
from sqlalchemy.orm import relationship, Mapped, mapped_column
from apps.models.base.orm import AbstractORMModel


class DictDetailsModel(AbstractORMModel):
    __tablename__ = "dict_details"
    __table_args__ = ({'comment': '字典详情表'})

    label: Mapped[str] = mapped_column(String(50), index=True, nullable=False, comment="字典标签")
    value: Mapped[str] = mapped_column(String(50), index=True, nullable=False, comment="字典键值")
    disabled: Mapped[bool] = mapped_column(Boolean, default=False, comment="字典状态，是否禁用")
    is_default: Mapped[bool] = mapped_column(Boolean, default=False, comment="是否默认")
    order: Mapped[int] = mapped_column(Integer, comment="字典排序")
    dict_type_id: Mapped[int] = mapped_column(
        Integer,
        ForeignKey("dict_type.id", ondelete='CASCADE'),
        comment="关联字典类型"
    )
    dict_type: Mapped[set["DictType"]] = relationship(foreign_keys=dict_type_id, back_populates="details")
    remark: Mapped[str | None] = mapped_column(String(255), comment="备注")
