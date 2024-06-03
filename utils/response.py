#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/11 19:50
# @Author  : 冉勇
# @Site    : 
# @File    : response.py
# @Software: PyCharm
# @desc    : 响应
from pydantic import BaseModel, Field
from fastapi import status as http_status
from fastapi.responses import ORJSONResponse as Response
from typing import Generic, TypeVar
from utils import status as http
from utils.response_code import Status

DataT = TypeVar("DataT")


class SuccessResponse(Response):
    """
    成功响应
    """

    def __init__(self, data=None, msg="success", code=http.HTTP_SUCCESS, status=http_status.HTTP_200_OK, **kwargs):
        self.data = {
            "code": code,
            "message": msg,
            "data": data
        }
        self.data.update(kwargs)
        super().__init__(content=self.data, status_code=status)


class ErrorResponse(Response):
    """
    失败响应
    """

    def __init__(self, msg=None, code=http.HTTP_ERROR, status=http_status.HTTP_200_OK, **kwargs):
        self.data = {
            "code": code,
            "message": msg,
            "data": []
        }
        self.data.update(kwargs)
        super().__init__(content=self.data, status_code=status)


class ErrorResponseSchema(BaseModel, Generic[DataT]):
    """
    默认请求失败响应模型
    """

    code: int = Field(Status.HTTP_ERROR, description="响应状态码（响应体内）")
    message: str = Field("请求失败，请联系管理员", description="响应结果描述")
    data: DataT = Field(None, description="响应结果数据")
