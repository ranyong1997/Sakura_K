#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 18:00
# @Author  : 冉勇
# @Site    : 
# @File    : auth_user_model.py
# @Software: PyCharm
# @desc    : 用户表
from sqlalchemy.orm import relationship, Mapped, mapped_column

from sqlalchemy import String

from apps.models.auth_user_to_role_model import auth_user_to_role_model
from apps.models.base.orm import AbstractORMModel


class AuthUserModel(AbstractORMModel):
    __tablename__ = "auth_user"
    __table_args__ = {"comment": "用户表"}

    roles: Mapped[set["AuthRoleModel"]] = relationship(secondary=auth_user_to_role_model, back_populates="users")

    name: Mapped[str] = mapped_column(String(255), index=True, comment="用户名")
    telephone: Mapped[str] = mapped_column(String(11), comment="手机号")
    email: Mapped[str | None] = mapped_column(comment="邮箱")
    is_active: Mapped[bool] = mapped_column(default=True, comment="是否可用")
    age: Mapped[int] = mapped_column(comment="年龄")