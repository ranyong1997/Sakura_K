#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/3 17:20
# @Author  : 冉勇
# @Site    : 
# @File    : register.py
# @Software: PyCharm
# @desc    : 功能注册
import sys
import importlib
from fastapi import FastAPI
from contextlib import asynccontextmanager
from starlette.staticfiles import StaticFiles  # 依赖安装：poetry add aiofiles
from application.settings import settings
from core.exception import refactoring_exception
from utils.tools import import_modules_async, import_modules
from fastapi.middleware.cors import CORSMiddleware


@asynccontextmanager
async def register_event(app: FastAPI):
    await import_modules_async(settings.system.EVENTS, "全局事件", app=app, status=True)
    yield
    await import_modules_async(settings.system.EVENTS, "全局事件", app=app, status=False)


def register_middleware(app: FastAPI):
    """
    注册中间件
    """
    import_modules(settings.system.MIDDLEWARES, "中间件", app=app)

    if settings.system.CORS_ORIGIN_ENABLE:
        app.add_middleware(
            CORSMiddleware,
            allow_origins=settings.system.ALLOW_ORIGINS,
            allow_credentials=settings.system.ALLOW_CREDENTIALS,
            allow_methods=settings.system.ALLOW_METHODS,
            allow_headers=settings.system.ALLOW_HEADERS,
        )


def register_exception(app: FastAPI):
    """
    注册异常
    """
    refactoring_exception(app)


def register_static(app: FastAPI):
    """
    挂载静态文件目录
    """
    app.mount(settings.system.STATIC_URL, app=StaticFiles(directory=settings.system.STATIC_PATH))


def register_router(app: FastAPI):
    """
    注册路由
    """
    sys.path.append(settings.router.APPS_PATH)
    for app_module_str in settings.router.APPS:
        module_views = importlib.import_module(f"{app_module_str}.views")
        app.include_router(module_views.router)


def register_system_router(app: FastAPI):
    """
    注册系统路由
    """
    # from kinit_fast_task.app.system.docs import views as docs_views
    # from kinit_fast_task.app.system.tools import views as tools_views

    # docs_views.load_system_routes(app)
    # tools_views.load_system_routes(app)
    pass
