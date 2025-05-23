#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/7/5 10:44
# @Author  : 冉勇
# @Site    : 
# @File    : response_util.py
# @Software: PyCharm
# @desc    : 响应工具
from datetime import datetime
from fastapi import status
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse, Response, StreamingResponse
from pydantic import BaseModel
from starlette.background import BackgroundTask
from typing import Any, Dict, Mapping, Optional
from config.constant import HttpStatusConstant
from utils.log_util import get_trace_id


class ResponseUtil:
    """
    响应工具类
    """

    @classmethod
    def success(
            cls,
            msg: str = '操作成功',
            data: Optional[Any] = None,
            rows: Optional[Any] = None,
            dict_content: Optional[Dict] = None,
            model_content: Optional[BaseModel] = None,
            headers: Optional[Mapping[str, str]] = None,
            media_type: Optional[str] = None,
            background: Optional[BackgroundTask] = None,
    ) -> Response:
        """
        成功响应方法

        :param msg: 可选，自定义成功响应信息
        :param data: 可选，成功响应结果中属性为data的值
        :param rows: 可选，成功响应结果中属性为rows的值
        :param dict_content: 可选，dict类型，成功响应结果中自定义属性的值
        :param model_content: 可选，BaseModel类型，成功响应结果中自定义属性的值
        :param headers: 可选，响应头信息
        :param media_type: 可选，响应结果媒体类型
        :param background: 可选，响应返回后执行的后台任务
        :return: 成功响应结果
        """
        result = {'code': HttpStatusConstant.SUCCESS, 'msg': msg}

        if data is not None:
            result['data'] = data
        if rows is not None:
            result['rows'] = rows
        if dict_content is not None:
            result.update(dict_content)
        if model_content is not None:
            result.update(model_content.model_dump(by_alias=True))

        # 添加trace_id到响应
        result.update({'success': True, 'time': datetime.now(), 'trace_id': get_trace_id()})

        # 确保headers存在
        if headers is None:
            headers = {}
        
        # 添加trace_id到响应头
        headers_dict = dict(headers)
        headers_dict['X-Trace-ID'] = get_trace_id()

        return JSONResponse(
            status_code=status.HTTP_200_OK,
            content=jsonable_encoder(result),
            headers=headers_dict,
            media_type=media_type,
            background=background,
        )

    @classmethod
    def failure(
            cls,
            msg: str = '操作失败',
            data: Optional[Any] = None,
            rows: Optional[Any] = None,
            dict_content: Optional[Dict] = None,
            model_content: Optional[BaseModel] = None,
            headers: Optional[Mapping[str, str]] = None,
            media_type: Optional[str] = None,
            background: Optional[BackgroundTask] = None,
    ) -> Response:
        """
        失败响应方法

        :param msg: 可选，自定义失败响应信息
        :param data: 可选，失败响应结果中属性为data的值
        :param rows: 可选，失败响应结果中属性为rows的值
        :param dict_content: 可选，dict类型，失败响应结果中自定义属性的值
        :param model_content: 可选，BaseModel类型，失败响应结果中自定义属性的值
        :param headers: 可选，响应头信息
        :param media_type: 可选，响应结果媒体类型
        :param background: 可选，响应返回后执行的后台任务
        :return: 失败响应结果
        """
        result = {'code': HttpStatusConstant.WARN, 'msg': msg}

        if data is not None:
            result['data'] = data
        if rows is not None:
            result['rows'] = rows
        if dict_content is not None:
            result.update(dict_content)
        if model_content is not None:
            result.update(model_content.model_dump(by_alias=True))

        # 添加trace_id到响应
        result.update({'success': False, 'time': datetime.now(), 'trace_id': get_trace_id()})

        # 确保headers存在
        if headers is None:
            headers = {}
        
        # 添加trace_id到响应头
        headers_dict = dict(headers)
        headers_dict['X-Trace-ID'] = get_trace_id()

        return JSONResponse(
            status_code=status.HTTP_200_OK,
            content=jsonable_encoder(result),
            headers=headers_dict,
            media_type=media_type,
            background=background,
        )

    @classmethod
    def unauthorized(
            cls,
            msg: str = '登录信息已过期，访问系统资源失败',
            data: Optional[Any] = None,
            rows: Optional[Any] = None,
            dict_content: Optional[Dict] = None,
            model_content: Optional[BaseModel] = None,
            headers: Optional[Mapping[str, str]] = None,
            media_type: Optional[str] = None,
            background: Optional[BackgroundTask] = None,
    ) -> Response:
        """
        未认证响应方法

        :param msg: 可选，自定义未认证响应信息
        :param data: 可选，未认证响应结果中属性为data的值
        :param rows: 可选，未认证响应结果中属性为rows的值
        :param dict_content: 可选，dict类型，未认证响应结果中自定义属性的值
        :param model_content: 可选，BaseModel类型，未认证响应结果中自定义属性的值
        :param headers: 可选，响应头信息
        :param media_type: 可选，响应结果媒体类型
        :param background: 可选，响应返回后执行的后台任务
        :return: 未认证响应结果
        """
        result = {'code': HttpStatusConstant.UNAUTHORIZED, 'msg': msg}

        if data is not None:
            result['data'] = data
        if rows is not None:
            result['rows'] = rows
        if dict_content is not None:
            result.update(dict_content)
        if model_content is not None:
            result.update(model_content.model_dump(by_alias=True))

        # 添加trace_id到响应
        result.update({'success': False, 'time': datetime.now(), 'trace_id': get_trace_id()})

        # 确保headers存在
        if headers is None:
            headers = {}
        
        # 添加trace_id到响应头
        headers_dict = dict(headers)
        headers_dict['X-Trace-ID'] = get_trace_id()

        return JSONResponse(
            status_code=status.HTTP_200_OK,
            content=jsonable_encoder(result),
            headers=headers_dict,
            media_type=media_type,
            background=background,
        )

    @classmethod
    def forbidden(
            cls,
            msg: str = '该用户无此接口权限',
            data: Optional[Any] = None,
            rows: Optional[Any] = None,
            dict_content: Optional[Dict] = None,
            model_content: Optional[BaseModel] = None,
            headers: Optional[Mapping[str, str]] = None,
            media_type: Optional[str] = None,
            background: Optional[BackgroundTask] = None,
    ) -> Response:
        """
        未授权响应方法

        :param msg: 可选，自定义未授权响应信息
        :param data: 可选，未授权响应结果中属性为data的值
        :param rows: 可选，未授权响应结果中属性为rows的值
        :param dict_content: 可选，dict类型，未授权响应结果中自定义属性的值
        :param model_content: 可选，BaseModel类型，未授权响应结果中自定义属性的值
        :param headers: 可选，响应头信息
        :param media_type: 可选，响应结果媒体类型
        :param background: 可选，响应返回后执行的后台任务
        :return: 未授权响应结果
        """
        result = {'code': HttpStatusConstant.FORBIDDEN, 'msg': msg}

        if data is not None:
            result['data'] = data
        if rows is not None:
            result['rows'] = rows
        if dict_content is not None:
            result.update(dict_content)
        if model_content is not None:
            result.update(model_content.model_dump(by_alias=True))

        # 添加trace_id到响应
        result.update({'success': False, 'time': datetime.now(), 'trace_id': get_trace_id()})

        # 确保headers存在
        if headers is None:
            headers = {}
        
        # 添加trace_id到响应头
        headers_dict = dict(headers)
        headers_dict['X-Trace-ID'] = get_trace_id()

        return JSONResponse(
            status_code=status.HTTP_200_OK,
            content=jsonable_encoder(result),
            headers=headers_dict,
            media_type=media_type,
            background=background,
        )

    @classmethod
    def error(
            cls,
            msg: str = '接口异常',
            data: Optional[Any] = None,
            rows: Optional[Any] = None,
            dict_content: Optional[Dict] = None,
            model_content: Optional[BaseModel] = None,
            headers: Optional[Mapping[str, str]] = None,
            media_type: Optional[str] = None,
            background: Optional[BackgroundTask] = None,
    ) -> Response:
        """
        错误响应方法

        :param msg: 可选，自定义错误响应信息
        :param data: 可选，错误响应结果中属性为data的值
        :param rows: 可选，错误响应结果中属性为rows的值
        :param dict_content: 可选，dict类型，错误响应结果中自定义属性的值
        :param model_content: 可选，BaseModel类型，错误响应结果中自定义属性的值
        :param headers: 可选，响应头信息
        :param media_type: 可选，响应结果媒体类型
        :param background: 可选，响应返回后执行的后台任务
        :return: 错误响应结果
        """
        result = {'code': HttpStatusConstant.ERROR, 'msg': msg}

        if data is not None:
            result['data'] = data
        if rows is not None:
            result['rows'] = rows
        if dict_content is not None:
            result.update(dict_content)
        if model_content is not None:
            result.update(model_content.model_dump(by_alias=True))

        # 添加trace_id到响应
        result.update({'success': False, 'time': datetime.now(), 'trace_id': get_trace_id()})

        # 确保headers存在
        if headers is None:
            headers = {}
        
        # 添加trace_id到响应头
        headers_dict = dict(headers)
        headers_dict['X-Trace-ID'] = get_trace_id()

        return JSONResponse(
            status_code=status.HTTP_200_OK,
            content=jsonable_encoder(result),
            headers=headers_dict,
            media_type=media_type,
            background=background,
        )

    @classmethod
    def streaming(
            cls,
            *,
            data: Any = None,
            headers: Optional[Mapping[str, str]] = None,
            media_type: Optional[str] = None,
            background: Optional[BackgroundTask] = None,
    ) -> Response:
        """
        流式响应方法

        :param data: 流式传输的内容
        :param headers: 可选，响应头信息
        :param media_type: 可选，响应结果媒体类型
        :param background: 可选，响应返回后执行的后台任务
        :return: 流式响应结果
        """
        # 确保headers存在
        if headers is None:
            headers = {}
        
        # 添加trace_id到响应头
        headers_dict = dict(headers)
        headers_dict['X-Trace-ID'] = get_trace_id()

        return StreamingResponse(
            status_code=status.HTTP_200_OK, 
            content=data, 
            headers=headers_dict, 
            media_type=media_type, 
            background=background
        )
