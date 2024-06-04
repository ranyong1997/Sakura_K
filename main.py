#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/27 19:50
# @Author  : 冉勇
# @Site    : 
# @File    : run.py
# @Software: PyCharm
# @desc    : 主程序入口
"""
FastApi 更新文档：https://github.com/tiangolo/fastapi/releases
FastApi Github：https://github.com/tiangolo/fastapi
Typer 官方文档：https://typer.tiangolo.com/
"""
import asyncio
import logging
import click
import typer
import uvicorn
from fastapi import FastAPI
from rich.padding import Padding
from rich.panel import Panel
from rich import print
from starlette.middleware.cors import CORSMiddleware
from starlette.staticfiles import StaticFiles  # 依赖安装：pip install aiofiles

from application import settings
from application import urls
from core.docs import custom_api_docs
from core.logger import log
from core.register import register_event, \
    register_exception, \
    register_middleware, \
    register_static, \
    register_router, \
    register_system_router
from scripts.create_app.main import CreateApp
# from scripts.initialize.initialize import InitializeData, Environment
from utils.response import ErrorResponseSchema
from utils.tools import import_modules, exec_shell_command

# shell_app = typer.Typer()
shell_app = typer.Typer(rich_markup_mode="rich")
# 关闭 Uvicorn HTTP 请求日志记录
uvicorn_access_logger = logging.getLogger("uvicorn.access")
uvicorn_access_logger.handlers = []
uvicorn_access_logger.propagate = False

# uvicorn 主日志处理器
uvicorn_logger = logging.getLogger("uvicorn")


def create_app():
    """
    启动项目
    docs_url：配置交互文档的路由地址，如果禁用则为None，默认为 /docs
    redoc_url： 配置 Redoc 文档的路由地址，如果禁用则为None，默认为 /redoc
    openapi_url：配置接口文件json数据文件路由地址，如果禁用则为None，默认为/openapi.json
    :return:
    """
    # 异常 Response 定义
    responses = {400: {"model": ErrorResponseSchema, "description": "请求失败"}}

    app = FastAPI(
        title="Sakura_K",  # 标题
        version=settings.VERSION,  # 版本号
        description=settings.PROJECT_DESCRIPTION,  # Swagger描述
        lifespan=register_event,  # 指定了应用程序的生命周期管理器
        docs_url=None,
        redoc_url=None,
        responses=responses
    )
    # 调用了 import_modules 函数来导入指定的中间件，该函数接受三个参数：modules 表示要导入的模块列表，message 表示当前导入的模块的消息，
    # app 表示 FastAPI 应用程序对象的引用。在这里，modules 和 message 都是 settings.MIDDLEWARES 和 "中间件"，而 app 则是传入的参数。
    import_modules(settings.settings.system.MIDDLEWARES, "中间件", app=app)

    # 全局异常捕捉处理
    register_exception(app)

    # 注册中间件
    register_middleware(app)

    # 挂在静态目录
    register_static(app)

    # 引入应用中的路由
    register_router(app)

    # 加载系统路由
    register_system_router(app)

    # 如果配置了跨域，使用 CORSMiddleware 中间件来解决跨域问题。
    if settings.settings.system.CORS_ORIGIN_ENABLE:
        app.add_middleware(
            CORSMiddleware,
            allow_origins=settings.settings.system.ALLOW_ORIGINS,
            allow_credentials=settings.settings.system.ALLOW_CREDENTIALS,
            allow_methods=settings.settings.system.ALLOW_METHODS,
            allow_headers=settings.settings.system.ALLOW_HEADERS
        )
    # 此外，如果启用了静态文件服务，使用 StaticFiles 中间件来挂载静态目录。
    if settings.settings.system.STATIC_ENABLE:
        app.mount(settings.settings.system.STATIC_URL, app=StaticFiles(directory=settings.settings.system.STATIC_PATH))
    # 引入应用中的路由
    for url in urls.urlpatterns:
        # 最后，使用 include_router 方法来引入应用程序中的路由。
        app.include_router(url["ApiRouter"], prefix=url["prefix"], tags=url["tags"])
    # 配置接口文档静态资源
    custom_api_docs(app)
    return app


# @shell_app.command()
# def run(
#         reload: bool = typer.Option(default=False, help='是否启用热加载')
# ):
#     """
#     启动项目
#     :return:
#     """
#     click.echo(settings.BANNER)
#     host = str(settings.settings.system.SERVER_HOST)
#     port = settings.settings.system.SERVER_PORT
#     server_address = f"http://{'127.0.0.1' if host == '0.0.0.0' else host}:{port}"
#     serving_str = f"[dim]API Server URL:[/dim] [link]http://{host}:{port}[/link]"
#     serving_str += f"\n\n[dim]Swagger UI Docs:[/dim] [link]{server_address}/docs[/link]"
#     serving_str += f"\n\n[dim]Redoc HTML Docs:[/dim] [link]{server_address}/redoc[/link]"
#     panel = Panel(
#         serving_str,
#         title=f"{settings.settings.system.PROJECT_NAME}",
#         expand=False,
#         padding=(1, 2),
#         style="black on yellow",
#     )
#     print(Padding(panel, 1))
#     uvicorn.run(app='main:create_app', host=host, port=port, lifespan="on", factory=True, reload=reload)


@shell_app.command()
def run(reload: bool = typer.Option(default=False, help="是否自动重载")):
    """
    项目启动

    命令行执行（自动重启）：python main.py run --reload
    命令行执行（不自动重启）：python main.py run

    原始命令行执行（uvicorn）：uvicorn kinit_fast_task.main:app

    # 在 pycharm 中使用自动重载是有 bug 的，很慢，截至 2024-04-30 还未修复，在使用 pycharm 开发时，不推荐使用 reload 功能

    :param reload: 是否自动重启
    :return:
    """  # noqa E501
    import uvicorn
    import sys
    import os
    from application import settings

    sys.path.append(os.path.abspath(__file__))

    uvicorn.run(
        app="main:create_app",
        host=str(settings.settings.system.SERVER_HOST),
        port=settings.settings.system.SERVER_PORT,
        reload=reload,
        lifespan="on",
    )


# @shell_app.command()  # 装饰器将该函数注册为命令行命令。当用户在命令行中输入 python run.py init 时，就会执行该函数。
# def init(env: Environment = Environment.pro):
#     """
#     初始化数据
#     比如要初始化开发环境，那么env参数应该为 dev，并且 application/settings.DEBUG 应该 = True
#     比如要初始化生产环境，那么env参数应该为 pro，并且 application/settings.DEBUG 应该 = False
#     :param env: 指定数据库环境 如果没有提供该参数，则默认为 Environment.pro。
#     :return:
#     """
#     print("开始初始化数据")
#     data = InitializeData()
#     asyncio.run(data.run(env))


# @shell_app.command()
# def migrate(env: Environment = Environment.pro):
#     """
#     将模型迁移到数据库，更新数据库表结构
#     :param env: 指定数据库环境。如果没有提供该参数，则默认为 Environment.pro。
#     :return:
#     """
#     print("开始更新数据库表")
#     InitializeData.migrate_model(env)


# @shell_app.command()  # 该函数注册为命令行命令。当用户在命令行中输入 python run.py init_app <path> 时，就会执行该函数。
# def init_app(path: str):
#     """
#     自动创建初始化APP结构
#     命令例子：python run.py init-app vadmin/test
#     :param path: app路径，根目录为apps，填写apps后面路径即可，例子：vadmin/auth
#     :return:
#     """
#     print(f"开始创建并初始化{path}APP")
#     app = CreateApp(path)
#     app.run()


@shell_app.command()
def migrate():
    """
    将模型迁移到数据库，更新数据库表结构

    命令示例：python main.py migrate

    :return:
    """

    log.info("开始更新数据库表")
    exec_shell_command("alembic revision --autogenerate", "生成迁移文件失败")
    exec_shell_command("alembic upgrade head", "迁移至数据库失败")
    log.info("数据库表迁移完成")


if __name__ == '__main__':
    shell_app()
