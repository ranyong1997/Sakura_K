#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2024/6/7 11:36
# @Author  : 冉勇
# @Site    : 
# @File    : views.py.py
# @Software: PyCharm
# @desc    : 帮助中心路由，视图文件
from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.orm import joinedload
from apps.cruds import help_crud
from apps.depends.Paging import IdList
from apps.depends.current import AllUserAuth
from apps.depends.validation.auth import Auth
from apps.models import issue_model, help_issue
from apps.routers.help import issue
from apps.schemas import issue_category_schema, issue_m2m_schema, issue_schema
from db.orm.asyncio import ORMDatabase
from utils.response import RestfulResponse

router = APIRouter(prefix="/vadmin/help", tags=["帮助中心管理"])


###########################################################
#                     类别管理                             #
###########################################################
@router.get("/issue/categorys", summary="获取类别列表")
async def get_issue_categorys(p: issue.IssueCategoryParams = Depends(), auth: Auth = Depends(AllUserAuth())):
    model = issue_model.IssueModel
    options = [joinedload(model.create_user)]
    schema = issue_category_schema.IssueCategoryListOut
    datas, count = await help_crud.IssueCategoryDal(auth.db).get_datas(
        **p.dict(),
        v_options=options,
        v_schema=schema,
        v_return_count=True
    )
    return RestfulResponse.success(data=datas, count=count)


@router.get("/issue/categorys/options", summary="获取类别选择项")
async def get_issue_categorys_options(auth: Auth = Depends(AllUserAuth())):
    schema = issue_category_schema.IssueCategoryOptionsOut
    return RestfulResponse.success(
        await help_crud.IssueCategoryDal(auth.db).get_datas(limit=0, is_active=True, v_schema=schema)
    )


@router.post("/issue/categorys", summary="创建类别")
async def create_issue_category(data: issue_category_schema.IssueCategory, auth: Auth = Depends(AllUserAuth())):
    data.create_user_id = auth.user.id
    return RestfulResponse.success(await help_crud.IssueCategoryDal(auth.db).create_data(data=data))


@router.delete("/issue/categorys", summary="批量删除类别", description="硬删除")
async def delete_issue_categorys(ids: IdList = Depends(), auth: Auth = Depends(AllUserAuth())):
    await help_crud.IssueCategoryDal(auth.db).delete_datas(ids=ids.ids)
    return RestfulResponse.success("删除成功")


@router.put("/issue/categorys/{data_id}", summary="更新类别信息")
async def put_issue_category(
        data_id: int,
        data: issue_category_schema.IssueCategory,
        auth: Auth = Depends(AllUserAuth())
):
    return RestfulResponse.success(await help_crud.IssueCategoryDal(auth.db).put_data(data_id, data))


@router.get("/issue/categorys/{data_id}", summary="获取类别信息")
async def get_issue_category(data_id: int, auth: Auth = Depends(AllUserAuth())):
    schema = issue_category_schema.IssueCategorySimpleOut
    return RestfulResponse.success(await help_crud.IssueCategoryDal(auth.db).get_data(data_id, v_schema=schema))


@router.get("/issue/categorys/platform/{platform}", summary="获取平台中的常见问题类别列表")
async def get_issue_category_platform(platform: str, db: AsyncSession = Depends(ORMDatabase.db_getter)):
    model = issue_model.IssueModel
    options = [joinedload(model.issues)]
    schema = issue_m2m_schema.IssueCategoryPlatformOut
    result = await help_crud.IssueCategoryDal(db).get_datas(
        limit=0,
        platform=platform,
        is_active=True,
        v_schema=schema,
        v_options=options
    )
    return RestfulResponse.success(data=result)


###########################################################
#                     问题管理                             #
###########################################################
@router.get("/issues", summary="获取问题列表")
async def get_issues(p: issue.IssueParams = Depends(), auth: Auth = Depends(AllUserAuth())):
    model = help_issue.HelpIssue
    options = [joinedload(model.create_user), joinedload(model.category)]
    schema = issue_schema.IssueListOut
    datas, count = await help_crud.IssueDal(auth.db).get_datas(
        **p.dict(),
        v_options=options,
        v_schema=schema,
        v_return_count=True
    )
    return RestfulResponse.success(datas, count=count)


@router.post("/issues", summary="创建问题")
async def create_issue(data: issue_schema.Issue, auth: Auth = Depends(AllUserAuth())):
    data.create_user_id = auth.user.id
    return RestfulResponse.success(await help_crud.IssueDal(auth.db).create_data(data=data))


@router.delete("/issues", summary="批量删除问题", description="硬删除")
async def delete_issues(ids: IdList = Depends(), auth: Auth = Depends(AllUserAuth())):
    await help_crud.IssueDal(auth.db).delete_datas(ids=ids.ids)
    return RestfulResponse.success("删除成功")


@router.put("/issues/{data_id}", summary="更新问题信息")
async def put_issue(data_id: int, data: issue_schema.Issue, auth: Auth = Depends(AllUserAuth())):
    return RestfulResponse.success(await help_crud.IssueDal(auth.db).put_data(data_id, data))


@router.get("/issues/{data_id}", summary="获取问题信息")
async def get_issue(data_id: int, db: AsyncSession = Depends(ORMDatabase.db_getter)):
    schema = issue_schema.IssueSimpleOut
    return RestfulResponse.success(await help_crud.IssueDal(db).get_data(data_id, v_schema=schema))


@router.get("/issues/add/view/number/{data_id}", summary="更新常见问题查看次数+1")
async def issue_add_view_number(data_id: int, db: AsyncSession = Depends(ORMDatabase.db_getter)):
    return RestfulResponse.success(await help_crud.IssueDal(db).add_view_number(data_id))
