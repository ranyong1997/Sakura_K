#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 17:56
# @Author  : 冉勇
# @Site    : 
# @File    : auth_role_model.py
# @Software: PyCharm
# @desc    : 角色表
from sqlalchemy import String
from sqlalchemy.orm import relationship, Mapped, mapped_column
from apps.models.auth_user_to_role_model import auth_user_to_role_model
from apps.models.base.orm import AbstractORMModel


class AuthRoleModel(AbstractORMModel):
    __tablename__ = "auth_role"
    __table_args__ = {"comment": "角色表"}

    users: Mapped[set["AuthUserModel"]] = relationship(secondary=auth_user_to_role_model, back_populates="roles")

    name: Mapped[str] = mapped_column(String(255), index=True, comment="角色名称")
    role_key: Mapped[str] = mapped_column(String(11), comment="标识")
    is_active: Mapped[bool] = mapped_column(default=True, comment="是否可用")
