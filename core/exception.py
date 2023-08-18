#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/11 15:56
# @Author  : 冉勇
# @Site    : 
# @File    : exception.py
# @Software: PyCharm
# @desc    : 全局异常处理
from fastapi import FastAPI
from fastapi import Request
from fastapi.encoders import jsonable_encoder
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from starlette import status
from starlette.exceptions import HTTPException as StarletteHTTPException

from core.logger import logger


class CustomException(Exception):

    def __init__(
            self,
            msg: str,
            code: int = status.HTTP_400_BAD_REQUEST,
            status_code: int = status.HTTP_200_OK,
            desc: str = None
    ):
        """
        :param msg: 响应消息的字符串
        :param code: 表示错误代码的整数值，默认为status.HTTP_400_BAD_REQUEST，即表示请求的格式不正确或请求无效。
        :param status_code: 表示HTTP响应状态码的整数值，默认为status.HTTP_200_OK，即表示请求成功。
        :param desc: 描述
        """
        self.msg = msg
        self.code = code
        self.status_code = status_code
        self.desc = desc


def register_exception(app: FastAPI):
    """
    异常捕获
    :return:
    """

    @app.exception_handler(CustomException)
    async def custom_exception_handler(request: Request, exc: CustomException):
        """
        自定义异常
        :param request:
        :param exc:
        :return:
        """
        print("请求地址", request.url.__str__())
        print("捕捉到重写CustomException异常异常：custom_exception_handler")
        logger.error(exc.desc)
        logger.error(exc.msg)
        print(exc.desc)
        print(exc.msg)
        return JSONResponse(
            status_code=exc.status_code,
            content={"message": exc.msg, "code": exc.code},
        )

    @app.exception_handler(StarletteHTTPException)
    async def unicorn_exception_handler(request: Request, exc: StarletteHTTPException):
        """
        重写HttpException异常处理器
        :param request:
        :param exc:
        :return:
        """
        print("请求地址", request.url.__str__())
        print("捕捉到重写HTTPException异常异常：unicorn_exception_handler")
        logger.error(exc.detail)
        print(exc.detail)
        return JSONResponse(
            status_code=200,
            content={
                "code": status.HTTP_400_BAD_REQUEST,
                "message": exc.detail
            }
        )

    @app.exception_handler(RequestValidationError)
    async def validation_exception_handler(request: Request, exc: RequestValidationError):
        """
        重写请求验证异常处理器
        :param request:
        :param exc:
        :return:
        """
        print("请求地址", request.url.__str__())
        print("捕捉到重写请求验证异常异常：validation_exception_handler")
        logger.error(exc.errors())
        print(exc.errors())
        msg = exc.errors()[0].get("msg")
        if msg == "field required":
            msg = "请求失败，缺少必填项！"
        elif msg == "value is not a valid list":
            print(exc.errors())
            msg = f"类型错误，提交参数应该为列表！"
        elif msg == "value is not a valid int":
            msg = f"类型错误，提交参数应该为整数！"
        elif msg == "value could not be parsed to a boolean":
            msg = f"类型错误，提交参数应该为布尔值！"
        return JSONResponse(
            status_code=200,
            content=jsonable_encoder(
                {
                    "message": msg,
                    "body": exc.body,
                    "code": status.HTTP_400_BAD_REQUEST
                }
            )
        )

    @app.exception_handler(ValueError)
    async def value_exception_handler(request: Request, exc: ValueError):
        """
        捕获值异常
        """
        print("请求地址", request.url.__str__())
        print("捕捉到值异常：value_exception_handler")
        logger.error(exc.__str__())
        print(exc.__str__())
        return JSONResponse(
            status_code=200,
            content=jsonable_encoder(
                {
                    "message": exc.__str__(),
                    "code": status.HTTP_400_BAD_REQUEST
                }
            )
        )

    @app.exception_handler(Exception)
    async def all_exception_handler(request: Request, exc: Exception):
        """
        捕获全部异常
        """
        print("请求地址", request.url.__str__())
        print("捕捉到全局异常：all_exception_handler")
        logger.error(exc.__str__())
        return JSONResponse(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            content=jsonable_encoder(
                {
                    "message": "接口异常！",
                    "code": status.HTTP_500_INTERNAL_SERVER_ERROR
                }
            )
        )
