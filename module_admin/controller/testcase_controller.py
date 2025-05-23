#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/11/27 18:07
# @Author  : 冉勇
# @Site    : 
# @File    : testcase_controller.py
# @Software: PyCharm
# @desc    : 测试用例配置相关接口
import asyncio
import json
import time

from fastapi import Depends, APIRouter, Request, Query
from pydantic_validation_decorator import ValidateFields
from sqlalchemy.ext.asyncio import AsyncSession
from config.enums import BusinessType
from config.get_db import get_db
from module_admin.annotation.log_annotation import Log
from module_admin.aspect.interface_auth import CheckUserInterfaceAuth
from module_admin.entity.vo.api_vo import BatchApiStats, BatchApi
from module_admin.entity.vo.testcase_vo import *
from module_admin.entity.vo.user_vo import CurrentUserModel
from module_admin.service.api_service import ApiService
from module_admin.service.testcase_service import TestCaseService
from module_admin.service.login_service import LoginService
from utils.log_util import logger
from utils.page_util import PageResponseModel
from utils.response_util import ResponseUtil

testcaseController = APIRouter(prefix='/testcase/testcaseInfo', dependencies=[Depends(LoginService.get_current_user)])


@testcaseController.get(
    '/list',
    response_model=PageResponseModel,
    dependencies=[Depends(CheckUserInterfaceAuth('testcase:testcaseInfo:list'))]
)
async def get_testcase_list(
        request: Request,
        api_page_query: TestCasePageQueryModel = Depends(TestCasePageQueryModel.as_query),
        query_db: AsyncSession = Depends(get_db)
):
    """
    获取测试用例列表
    """
    # 获取分页数据
    test_page_query_result = await TestCaseService.get_testcase_list_services(
        query_db,
        api_page_query,
        is_page=True
    )
    logger.info('测试用例获取成功')

    return ResponseUtil.success(model_content=test_page_query_result)


@testcaseController.post('', dependencies=[Depends(CheckUserInterfaceAuth('testcase:testcaseInfo:add'))])
@ValidateFields(validate_model='add_testcase')
@Log(title='测试用例', business_type=BusinessType.INSERT)
async def add_testcase(
        request: Request,
        add_testcase: TestCaseModel,
        query_db: AsyncSession = Depends(get_db),
        current_user: CurrentUserModel = Depends(LoginService.get_current_user)
):
    """
    新增测试用例
    """
    add_testcase.create_by = current_user.user.user_name
    add_testcase.create_time = datetime.now()
    add_testcase.update_by = current_user.user.user_name
    add_testcase.update_time = datetime.now()
    add_testcase_result = await TestCaseService.add_testcase_services(query_db, add_testcase)
    logger.info(add_testcase_result.message)

    return ResponseUtil.success(msg=add_testcase_result.message)


@testcaseController.put('', dependencies=[Depends(CheckUserInterfaceAuth('testcase:testcaseInfo:edit'))])
@ValidateFields(validate_model='edit_testcase')
@Log(title='测试用例', business_type=BusinessType.UPDATE)
async def edit_testcase(
        request: Request,
        edit_testcase: TestCaseModel,
        query_db: AsyncSession = Depends(get_db),
        current_user: CurrentUserModel = Depends(LoginService.get_current_user)
):
    """
    编辑测试用例
    """
    edit_testcase.update_by = current_user.user.user_name
    edit_testcase.update_time = datetime.now()
    edit_testcase_result = await TestCaseService.edit_testcase_services(query_db, edit_testcase)
    logger.info(edit_testcase_result.message)

    return ResponseUtil.success(msg=edit_testcase_result.message)


@testcaseController.delete(
    '/{testcase_ids}',
    dependencies=[Depends(CheckUserInterfaceAuth('testcase:testcaseInfo:remove'))]
)
@Log(title='测试用例', business_type=BusinessType.DELETE)
async def delete_testcase(request: Request, testcase_ids: str, query_db: AsyncSession = Depends(get_db)):
    """
    删除测试用例
    """
    delete_testcase = DeleteTestCaseModel(testcaseIds=testcase_ids)
    delete_testcase_result = await TestCaseService.delete_testcase_services(query_db, delete_testcase)
    logger.info(delete_testcase_result.message)

    return ResponseUtil.success(msg=delete_testcase_result.message)


@testcaseController.get(
    '/{testcase_id}',
    response_model=TestCaseModel,
    dependencies=[Depends(CheckUserInterfaceAuth('testcase:testcaseInfo:query'))]
)
async def query_detail_testcase(request: Request, testcase_id: int, query_db: AsyncSession = Depends(get_db)):
    """
    根据ID获取测试用例信息
    """
    testcase_detail_result = await TestCaseService.testcase_detail_services(query_db, testcase_id)
    logger.info(f'获取testcase_id为{testcase_id}的信息成功')

    return ResponseUtil.success(data=testcase_detail_result)


@testcaseController.post(
    '/testcase_batch',
    response_model=BatchApiStats,
    dependencies=[Depends(CheckUserInterfaceAuth('testcase:testcaseInfo:batch'))]
)
async def testcase_batch_run(
        request: Request,
        testcase_id: int = Query(..., description='测试用例ID'),
        env_id: int = Query(..., description='环境ID'),
        query_db: AsyncSession = Depends(get_db)

):
    """
    运行测试用例批量执行
    """
    start_time = time.time()
    try:
        # 获取测试用例和环境信息
        result = await TestCaseService.testcase_batch_services(query_db, testcase_id, env_id)
        test_cases, env_info = result
        # 提取API IDs
        api_ids = [api.apiId for api in test_cases]
        # 批量运行API
        api_results = await ApiService.api_batch_services(query_db, api_ids, env_id)
        # 统计API调试结果
        total_apis = len(api_results)
        success_count = sum(
            1 for result in api_results
            if (isinstance(result.get('response', {}).get('status'), str)
                and result.get('response', {}).get('status', '').lower() == 'true')
            or bool(result.get('response', {}).get('status', False))
        )
        failed_count = total_apis - success_count
        # 计算成功率
        success_rate = (success_count / total_apis * 100) if total_apis > 0 else 0
        # 计算耗时（毫秒）
        total_time = round((time.time() - start_time), 3)
        # 构建统计信息
        stats_info = {
            'total_apis': total_apis,
            'success_count': success_count,
            'failed_count': failed_count,
            'success_rate': f'{success_rate:.2f}%',
            'total_time_ms': f'{total_time}s',
            'api_results': api_results
        }
        # 记录执行统计日志
        logger.info(
            f"批量执行API完成: "
            f"总计={total_apis}个, "
            f"成功={success_count}个, "
            f"失败={failed_count}个, "
            f"成功率={success_rate:.2f}%, "
            f"耗时={total_time}秒"
        )
        return ResponseUtil.success(
            data={
                'stats_info': stats_info,
                'test_case_info': test_cases,
                'env_info': env_info
            }
        )
    except Exception as e:
        # 统一异常处理
        logger.error(f"测试用例批量执行失败: {str(e)}", exc_info=True)
        return ResponseUtil.error(
            msg=f"测试用例批量执行失败: {str(e)}"
        )
