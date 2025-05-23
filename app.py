#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/7/5 10:28
# @Author  : 冉勇
# @Site    : 
# @File    : app.py
# @Software: PyCharm
# @desc    : 启动文件
import uvicorn
from server import app, AppConfig  # noqa: F401

if __name__ == '__main__':
    uvicorn.run(
        app='app:app',
        host=AppConfig.app_host,
        port=AppConfig.app_port,
        root_path=AppConfig.app_root_path,
        reload=AppConfig.app_reload,
        access_log=False  # 忽略fastapi本身日志,保留自定义日志
    )
