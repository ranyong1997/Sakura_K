#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/7/5 11:00
# @Author  : 冉勇
# @Site    : 
# @File    : pydantic_annotation.py
# @Software: PyCharm
# @desc    : pydantic 接受查询参数(高级用法)
import inspect
from typing import Type
from fastapi import Query, Form
from pydantic import BaseModel
from pydantic.fields import FieldInfo


def as_query(cls: Type[BaseModel]):
    """
    pydantic模型查询参数装饰器，用于将 Pydantic 模型转换为查询参数
    """
    # 创建新参数列表
    new_parameters = []
    # 遍历模型字段 循环遍历 Pydantic 模型的所有字段
    for field_name, model_field in cls.model_fields.items():
        model_field: FieldInfo  # type: ignore
        if not model_field.is_required():
            new_parameters.append(
                inspect.Parameter(
                    model_field.alias,
                    inspect.Parameter.POSITIONAL_ONLY,
                    default=Query(default=model_field.default, description=model_field.description),
                    annotation=model_field.annotation
                )
            )
        else:
            new_parameters.append(
                inspect.Parameter(
                    model_field.alias,
                    inspect.Parameter.POSITIONAL_ONLY,
                    default=Query(..., description=model_field.description),
                    annotation=model_field.annotation
                )
            )

    # 定义内部函数
    async def as_query_func(**data):
        return cls(**data)

    sig = inspect.signature(as_query_func)
    sig = sig.replace(parameters=new_parameters)
    as_query_func.__signature__ = sig  # type: ignore
    setattr(cls, 'as_query', as_query_func)
    return cls


def as_form(cls: Type[BaseModel]):
    """
    pydantic模型表单参数装饰器，将pydantic模型用于接收表单参数
    """
    new_parameters = []

    for field_name, model_field in cls.model_fields.items():
        model_field: FieldInfo  # type: ignore

        if not model_field.is_required():
            new_parameters.append(
                inspect.Parameter(
                    model_field.alias,
                    inspect.Parameter.POSITIONAL_ONLY,
                    default=Form(default=model_field.default, description=model_field.description),
                    annotation=model_field.annotation
                )
            )
        else:
            new_parameters.append(
                inspect.Parameter(
                    model_field.alias,
                    inspect.Parameter.POSITIONAL_ONLY,
                    default=Form(..., description=model_field.description),
                    annotation=model_field.annotation
                )
            )

    async def as_form_func(**data):
        return cls(**data)

    sig = inspect.signature(as_form_func)
    sig = sig.replace(parameters=new_parameters)
    as_form_func.__signature__ = sig  # type: ignore
    setattr(cls, 'as_form', as_form_func)
    return cls
