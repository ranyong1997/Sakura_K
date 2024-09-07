#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/8/29 10:51
# @Author  : 冉勇
# @Site    : 
# @File    : service_generate.py
# @Software: PyCharm
# @desc    : 生成 xx_service.py
import inspect
import sys
from pathlib import Path
from typing import Type
from config.database import Base
from .generate_base import GenerateBase


class ServiceGenerate(GenerateBase):

    def __init__(
            self,
            model: Type[Base],
            zh_name: str,
            en_name: str,
            service_dir_path: Path,
            service_file_path: Path,
            service_base_class_name: str,
            dao_base_class_name: str,
            vo_page_query_class_name: str
    ):
        """
        初始化工作
        :param model: 提前定义好的 ORM 模型
        :param zh_name: 功能中文名称，主要用于描述、注释
        :param en_name: 功能英文名称，主要用于 schema、param 文件命名，以及它们的 class 命名，service、url 命名，默认使用 model class
        en_name 例子：
            如果 en_name 由多个单词组成那么请使用 _ 下划线拼接
            在命名文件名称时，会执行使用 _ 下划线名称
            在命名 class 名称时，会将下划线名称转换为大驼峰命名（CamelCase）
            在命名 url 时，会将下划线转换为 /
        :param service_base_class_name:
        :param dao_base_class_name:
        :param vo_page_query_class_name:
        """
        self.model = model
        self.zh_name = zh_name
        self.en_name = en_name
        self.service_dir_path = service_dir_path
        self.service_file_path = service_file_path
        self.service_base_class_name = service_base_class_name
        self.dao_base_class_name = dao_base_class_name
        self.vo_page_query_class_name = vo_page_query_class_name

    def write_generate_code(self):
        """
        生成 crud 文件，以及代码内容
        :return:
        """
        if self.service_file_path.exists():
            codes = self.file_code_split_module(self.service_file_path)
            if codes:
                print(f"==========service 文件已存在并已有代码内容，正在追加新代码============")
                if not codes[0]:
                    # 无文件注释则添加文件注释
                    codes[0] = self.generate_file_desc(self.service_file_path.name, desc="xx管理模块服务层")
                codes[1] = self.merge_dictionaries(codes[1], self.get_base_module_config())
                codes[2] += self.get_base_code_content()
                code = ''
                code += codes[0]
                # 导入模块
                code += self.generate_modules_code(codes[1])
                code += codes[2]
                self.service_file_path.write_text(code, "utf-8")
                print(f"=================service 代码已创建完成=======================")
                return
        self.service_file_path.touch()
        code = self.generate_code()
        self.service_file_path.write_text(code, "utf-8")
        print(f"===========================service 代码创建完成=================================")

    def generate_code(self):
        """
        代码生成
        :return:
        """
        code = self.generate_file_desc(self.service_file_path.name, "xx管理模块服务层")
        code += self.generate_modules_code(self.get_base_module_config())
        code += self.get_base_code_content()
        return code

    @staticmethod
    def get_base_module_config():
        """
        获取基础模块导入配置
        :return:
        """
        modules = {
            "fastapi": ["Request"],
            "sqlalchemy.ext.asyncio": ["AsyncSession"],
            "typing": ["List"],
            "config.constant": ["CommonConstant"],
            "config.enums": ["RedisInitKeyConfig"],
            "exceptions.exception": ["ServiceException"],
            f"utils.common_util": ["CamelCaseUtil", "export_list2excel"]
        }
        return modules

    def get_base_code_content(self):
        """
        获取基础代码内容
        :return:
        """
        base_code = f'''
"""
需要自己写 service 逻辑代码
"""
        '''
        base_code += f"\n\nclass {self.service_base_class_name}:"
        base_code += f'''
    """
    {self.zh_name}管理模块服务层
    """
        '''
        return base_code.replace("\t", "    ")