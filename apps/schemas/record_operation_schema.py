#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/4 12:10
# @Author  : 冉勇
# @Site    : 
# @File    : record_operation_schema.py
# @Software: PyCharm
# @desc    : 操作日志
from pydantic import Field
from apps.schemas.base.base import BaseSchema
from core.types import ObjectIdStr, DatetimeStr


class OperationSchema(BaseSchema):
    status_code: int | None = Field(None, description="响应状态 Code")
    client_ip: str | None = Field(None, description="客户端 IP")
    request_method: str | None = Field(None, description="请求方式")
    api_path: str | None = Field(None, description="请求路径")
    system: str | None = Field(None, description="客户端系统")
    browser: str | None = Field(None, description="客户端浏览器")
    summary: str | None = Field(None, description="接口名称")
    route_name: str | None = Field(None, description="路由函数名称")
    description: str | None = Field(None, description="路由文档")
    tags: list[str] | None = Field(None, description="路由标签")
    process_time: float | None = Field(None, description="耗时")
    params: str | None = Field(None, description="请求参数")


class OperationSimpleOutSchema(OperationSchema):
    id: ObjectIdStr = Field(..., alias="_id")
    create_datetime: DatetimeStr = Field(..., description="创建时间")
    update_datetime: DatetimeStr = Field(..., description="更新时间")
