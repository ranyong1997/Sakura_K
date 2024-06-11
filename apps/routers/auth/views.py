#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023-04-14 16:33:42
# @Author  :
# @Site    :
# @File    : views.py
# @Software: PyCharm
# @desc    : 用户认证、管理
import jwt
from datetime import timedelta
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.ext.asyncio import AsyncSession
from application import settings
from db.orm.asyncio import ORMDatabase
from core.exception import CustomException
from utils import status
from utils.response_code import Status
from utils.wx.oauth import WXOAuth
from apps.depends.login_manage import LoginManage
from apps.depends.validation.login import LoginForm, WXLoginForm
from apps.cruds.auth_crud import UserDal
from apps.models.login_model import LoginModel
from apps.models.user_model import UserModel
from fastapi import APIRouter, Depends, Body, UploadFile, Request
from redis.asyncio import Redis
from sqlalchemy.orm import joinedload
from db.redis.asyncio import RedisDatabase
from utils.response import RestfulResponse
from .params import UserParams, RoleParams, DeptParams
from apps.cruds import auth_crud
from apps.depends.current import OpenAuth, FullAdminAuth, AllUserAuth
from apps.depends.Paging import IdList
from apps.depends.validation.auth import Auth
from apps.models import user_model, role_model
from apps.schemas import user_schema, role_schema, menu_schema, dept_schema

router = APIRouter(prefix="/auth", tags=["系统认证"])


###########################################################
#                     接口测试                             #
###########################################################
@router.get("/test", summary="接口测试")
async def test(auth: Auth = Depends(OpenAuth())):
    return RestfulResponse.success(await auth_crud.TestDal(auth.db).relationship_where_operations_has())


###########################################################
#                     系统认证                             #
###########################################################
@router.post("/api/login", summary="API 手机号密码登录", description="Swagger API 文档登录认证")
async def api_login_for_access_token(
        request: Request,
        data: OAuth2PasswordRequestForm = Depends(),
        db: AsyncSession = Depends(ORMDatabase.db_getter)
):
    user = await UserDal(db).get_data(telephone=data.username, v_return_none=True)
    if not user:
        raise CustomException(status_code=Status.HTTP_401, code=Status.HTTP_401, message="该手机号不存在")
    result = UserModel.verify_password(data.password, user.password)
    if not result:
        raise CustomException(status_code=Status.HTTP_401, code=Status.HTTP_401, message="手机号或密码错误")
    if not user.is_active:
        raise CustomException(status_code=Status.HTTP_401, code=Status.HTTP_401, message="此手机号已被冻结")
    elif not user.is_staff:
        raise CustomException(status_code=Status.HTTP_401, code=Status.HTTP_401, message="此手机号无权限")
    access_token = LoginManage.create_token({"sub": user.telephone, "password": user.password})
    record = LoginForm(platform='2', method='0', telephone=data.username, password=data.password)
    resp = {"access_token": access_token, "token_type": "Bearer"}
    await LoginModel.create_login_record(db, record, True, request, resp)
    return resp


@router.post("/login", summary="手机号密码登录", description="员工登录通道，限制最多输错次数，达到最大值后将is_active=False")
async def login_for_access_token(
        request: Request,
        data: LoginForm,
        manage: LoginManage = Depends(),
        db: AsyncSession = Depends(ORMDatabase.db_getter)
):
    try:
        if data.method == "0":
            result = await manage.password_login(data, db, request)
        elif data.method == "1":
            result = await manage.sms_login(data, db, request)
        else:
            raise ValueError("无效参数")

        if not result.status:
            raise ValueError(result.msg)

        access_token = LoginManage.create_token(
            {"sub": result.user.telephone, "is_refresh": False, "password": result.user.password}
        )
        expires = timedelta(minutes=settings.settings.auth.REFRESH_TOKEN_EXPIRE_MINUTES)
        refresh_token = LoginManage.create_token({"sub": result.user.telephone, "is_refresh": True}, expires=expires)
        resp = {
            "access_token": access_token,
            "refresh_token": refresh_token,
            "token_type": "Bearer",
            "is_reset_password": result.user.is_reset_password,
            "is_wx_server_openid": result.user.is_wx_server_openid
        }
        await LoginModel.create_login_record(db, data, True, request, resp)
        return RestfulResponse.success(data=resp)
    except ValueError as e:
        await LoginModel.create_login_record(db, data, False, request, {"message": str(e)})
        return RestfulResponse.error(message=str(e))


@router.post("/wx/login", summary="微信服务端一键登录", description="员工登录通道")
async def wx_login_for_access_token(
        request: Request,
        data: WXLoginForm,
        db: AsyncSession = Depends(ORMDatabase.db_getter),
        rd: Redis = Depends(RedisDatabase.db_getter)
):
    try:
        if data.platform != "1" or data.method != "2":
            raise ValueError("无效参数")
        wx = WXOAuth(rd)
        telephone = await wx.parsing_phone_number(data.code)
        if not telephone:
            raise ValueError("无效Code")
        data.telephone = telephone
        user = await UserDal(db).get_data(telephone=telephone, v_return_none=True)
        if not user:
            raise ValueError("手机号不存在")
        elif not user.is_active:
            raise ValueError("手机号已被冻结")
    except ValueError as e:
        await LoginModel.create_login_record(db, data, False, request, {"message": str(e)})
        return RestfulResponse.error(message=str(e))

    # 更新登录时间
    await UserDal(db).update_login_info(user, request.client.host)

    # 登录成功创建 token
    access_token = LoginManage.create_token({"sub": user.telephone, "is_refresh": False, "password": user.password})
    expires = timedelta(minutes=settings.settings.auth.REFRESH_TOKEN_EXPIRE_MINUTES)
    refresh_token = LoginManage.create_token(
        payload={"sub": user.telephone, "is_refresh": True, "password": user.password},
        expires=expires
    )
    resp = {
        "access_token": access_token,
        "refresh_token": refresh_token,
        "token_type": "Bearer",
        "is_reset_password": user.is_reset_password,
        "is_wx_server_openid": user.is_wx_server_openid
    }
    await LoginModel.create_login_record(db, data, True, request, resp)
    return RestfulResponse.success(data=resp)


@router.get("/getMenuList", summary="获取当前用户菜单树")
async def get_menu_list(auth: Auth = Depends(FullAdminAuth())):
    return RestfulResponse.success(data=await auth_crud.MenuDal(auth.db).get_routers(auth.user))


@router.post("/token/refresh", summary="刷新Token")
async def token_refresh(refresh: str = Body(..., title="刷新Token")):
    Status.HTTP_401 = status.HTTP_401_UNAUTHORIZED
    try:
        payload = jwt.decode(refresh, settings.settings.auth.SECRET_KEY, algorithms=[settings.settings.auth.ALGORITHM])
        telephone: str = payload.get("sub")
        is_refresh: bool = payload.get("is_refresh")
        password: str = payload.get("password")
        if not telephone or not is_refresh or not password:
            return RestfulResponse.error(message="未认证，请您重新登录", code=Status.HTTP_401, status_code=Status.HTTP_401)
    except jwt.exceptions.InvalidSignatureError:
        return RestfulResponse.error(message="无效认证，请您重新登录", code=Status.HTTP_401, status_code=Status.HTTP_401)
    except jwt.exceptions.ExpiredSignatureError:
        return RestfulResponse.error("登录已超时，请您重新登录", code=Status.HTTP_401, status_code=Status.HTTP_401)

    access_token = LoginManage.create_token({"sub": telephone, "is_refresh": False, "password": password})
    expires = timedelta(minutes=settings.settings.auth.REFRESH_TOKEN_EXPIRE_MINUTES)
    refresh_token = LoginManage.create_token(
        payload={"sub": telephone, "is_refresh": True, "password": password},
        expires=expires
    )
    resp = {
        "access_token": access_token,
        "refresh_token": refresh_token,
        "token_type": "Bearer"
    }
    return RestfulResponse.success(data=resp)


###########################################################
#                     用户管理                             #
###########################################################
@router.get("/users", summary="获取用户列表")
async def get_users(
        params: UserParams = Depends(),
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.list"]))
):
    model = user_model.UserModel
    options = [joinedload(model.roles), joinedload(model.depts)]
    schema = user_schema.UserOut
    datas, count = await auth_crud.UserDal(auth.db).get_datas(
        **params.dict(),
        v_options=options,
        v_schema=schema,
        v_return_count=True
    )
    return RestfulResponse.success(data=datas, count=count)


@router.post("/users", summary="创建用户")
async def create_user(data: user_schema.UserIn, auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.create"]))):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).create_data(data=data))


@router.delete("/users", summary="批量删除用户", description="软删除，删除后清空所关联的角色")
async def delete_users(ids: IdList = Depends(), auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.delete"]))):
    if auth.user.id in ids.ids:
        return RestfulResponse.error(message="不能删除当前登录用户")
    elif 1 in ids.ids:
        return RestfulResponse.error("不能删除超级管理员用户")
    await auth_crud.UserDal(auth.db).delete_datas(ids=ids.ids, v_soft=True, is_active=False)
    return RestfulResponse.success(message="删除成功")


@router.put("/users/{data_id}", summary="更新用户信息")
async def put_user(
        data_id: int,
        data: user_schema.UserUpdate,
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.update"]))
):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).put_data(data_id, data))


@router.get("/users/{data_id}", summary="获取用户信息")
async def get_user(
        data_id: int,
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.view", "auth.user.update"]))
):
    model = user_model.UserModel
    options = [joinedload(model.roles), joinedload(model.depts)]
    schema = user_schema.UserOut
    return RestfulResponse.success(
        await auth_crud.UserDal(auth.db).get_data(data_id, v_options=options, v_schema=schema)
    )


@router.post("/user/current/reset/password", summary="重置当前用户密码")
async def user_current_reset_password(data: user_schema.ResetPwd, auth: Auth = Depends(AllUserAuth())):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).reset_current_password(auth.user, data))


@router.post("/user/current/update/info", summary="更新当前用户基本信息")
async def post_user_current_update_info(data: user_schema.UserUpdateBaseInfo, auth: Auth = Depends(AllUserAuth())):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).update_current_info(auth.user, data))


@router.post("/user/current/update/avatar", summary="更新当前用户头像")
async def post_user_current_update_avatar(file: UploadFile, auth: Auth = Depends(AllUserAuth())):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).update_current_avatar(auth.user, file))


@router.get("/user/admin/current/info", summary="获取当前管理员信息")
async def get_user_admin_current_info(auth: Auth = Depends(FullAdminAuth())):
    result = user_schema.UserOut.model_validate(auth.user).model_dump()
    result["permissions"] = list(FullAdminAuth.get_user_permissions(auth.user))
    return RestfulResponse.success(result)


@router.post("/user/export/query/list/to/excel", summary="导出用户查询列表为excel")
async def post_user_export_query_list(
        header: list = Body(..., title="表头与对应字段"),
        params: UserParams = Depends(),
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.export"]))
):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).export_query_list(header, params))


@router.get("/user/download/import/template", summary="下载最新批量导入用户模板")
async def get_user_download_new_import_template(auth: Auth = Depends(AllUserAuth())):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).download_import_template())


@router.post("/import/users", summary="批量导入用户")
async def post_import_users(file: UploadFile, auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.import"]))):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).import_users(file))


@router.post("/users/init/password/send/sms", summary="初始化所选用户密码并发送通知短信")
async def post_users_init_password(
        request: Request,
        ids: IdList = Depends(),
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.reset"])),
        rd: Redis = Depends(RedisDatabase.db_getter)
):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).init_password_send_sms(ids.ids, rd))


@router.post("/users/init/password/send/email", summary="初始化所选用户密码并发送通知邮件")
async def post_users_init_password_send_email(
        request: Request,
        ids: IdList = Depends(),
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.reset"])),
        rd: Redis = Depends(RedisDatabase.db_getter)
):
    return RestfulResponse.success(await auth_crud.UserDal(auth.db).init_password_send_email(ids.ids, rd))


@router.put("/users/wx/server/openid", summary="更新当前用户服务端微信平台openid")
async def put_user_wx_server_openid(
        code: str,
        auth: Auth = Depends(AllUserAuth()),
        rd: Redis = Depends(RedisDatabase.db_getter)
):
    result = await auth_crud.UserDal(auth.db).update_wx_server_openid(code, auth.user, rd)
    return RestfulResponse.success(data=result)


###########################################################
#                     角色管理                             #
###########################################################
@router.get("/roles", summary="获取角色列表")
async def get_roles(
        params: RoleParams = Depends(),
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.role.list"]))
):
    datas, count = await auth_crud.RoleDal(auth.db).get_datas(**params.dict(), v_return_count=True)
    return RestfulResponse.success(data=datas, count=count)


@router.post("/roles", summary="创建角色信息")
async def create_role(role: role_schema.RoleIn, auth: Auth = Depends(FullAdminAuth(permissions=["auth.role.create"]))):
    return RestfulResponse.success(await auth_crud.RoleDal(auth.db).create_data(data=role))


@router.delete("/roles", summary="批量删除角色", description="硬删除, 如果存在用户关联则无法删除")
async def delete_roles(ids: IdList = Depends(), auth: Auth = Depends(FullAdminAuth(permissions=["auth.role.delete"]))):
    if 1 in ids.ids:
        return RestfulResponse.error("不能删除管理员角色")
    await auth_crud.RoleDal(auth.db).delete_datas(ids.ids)
    return RestfulResponse.success("删除成功")


@router.put("/roles/{data_id}", summary="更新角色信息")
async def put_role(
        data_id: int,
        data: role_schema.RoleIn,
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.role.update"]))
):
    if 1 == data_id:
        return RestfulResponse.error("不能修改管理员角色")
    return RestfulResponse.success(await auth_crud.RoleDal(auth.db).put_data(data_id, data))


@router.get("/roles/options", summary="获取角色选择项")
async def get_role_options(auth: Auth = Depends(FullAdminAuth(permissions=["auth.user.create", "auth.user.update"]))):
    return RestfulResponse.success(await auth_crud.RoleDal(auth.db).get_select_datas())


@router.get("/roles/{data_id}", summary="获取角色信息")
async def get_role(
        data_id: int,
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.role.view", "auth.role.update"]))
):
    model = role_model.RoleModel
    options = [joinedload(model.menus), joinedload(model.depts)]
    schema = role_schema.RoleOut
    return RestfulResponse.success(
        await auth_crud.RoleDal(auth.db).get_data(data_id, v_options=options, v_schema=schema)
    )


###########################################################
#                     菜单管理                             #
###########################################################
@router.get("/menus", summary="获取菜单列表")
async def get_menus(auth: Auth = Depends(FullAdminAuth(permissions=["auth.menu.list"]))):
    datas = await auth_crud.MenuDal(auth.db).get_tree_list(mode=1)
    return RestfulResponse.success(data=datas)


@router.get("/menus/tree/options", summary="获取菜单树选择项，添加/修改菜单时使用")
async def get_menus_options(auth: Auth = Depends(FullAdminAuth(permissions=["auth.menu.create", "auth.menu.update"]))):
    datas = await auth_crud.MenuDal(auth.db).get_tree_list(mode=2)
    return RestfulResponse.success(data=datas)


@router.get("/menus/role/tree/options", summary="获取菜单列表树信息，角色权限使用")
async def get_menus_treeselect(
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.role.create", "auth.role.update"]))
):
    return RestfulResponse.success(await auth_crud.MenuDal(auth.db).get_tree_list(mode=3))


@router.post("/menus", summary="创建菜单信息")
async def create_menu(menu: menu_schema.Menu, auth: Auth = Depends(FullAdminAuth(permissions=["auth.menu.create"]))):
    if menu.parent_id:
        menu.alwaysShow = False
    return RestfulResponse.success(await auth_crud.MenuDal(auth.db).create_data(data=menu))


@router.delete("/menus", summary="批量删除菜单", description="硬删除, 如果存在角色关联则无法删除")
async def delete_menus(ids: IdList = Depends(), auth: Auth = Depends(FullAdminAuth(permissions=["auth.menu.delete"]))):
    await auth_crud.MenuDal(auth.db).delete_datas(ids.ids)
    return RestfulResponse.success("删除成功")


@router.put("/menus/{data_id}", summary="更新菜单信息")
async def get_menus(
        data_id: int,
        data: menu_schema.Menu, auth: Auth = Depends(FullAdminAuth(permissions=["auth.menu.update"]))
):
    return RestfulResponse.success(await auth_crud.MenuDal(auth.db).put_data(data_id, data))


@router.get("/menus/{data_id}", summary="获取菜单信息")
async def put_menus(
        data_id: int,
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.menu.view", "auth.menu.update"]))
):
    schema = menu_schema.MenuSimpleOut
    return RestfulResponse.success(await auth_crud.MenuDal(auth.db).get_data(data_id, v_schema=schema))


@router.get("/role/menus/tree/{role_id}", summary="获取菜单列表树信息以及角色菜单权限ID，角色权限使用")
async def get_role_menu_tree(
        role_id: int,
        auth: Auth = Depends(FullAdminAuth(permissions=["auth.role.create", "auth.role.update"]))
):
    tree_data = await auth_crud.MenuDal(auth.db).get_tree_list(mode=3)
    role_menu_tree = await auth_crud.RoleDal(auth.db).get_role_menu_tree(role_id)
    return RestfulResponse.success({"role_menu_tree": role_menu_tree, "menus": tree_data})


###########################################################
#                     部门管理                             #
###########################################################
@router.get("/depts", summary="获取部门列表")
async def get_depts(
        params: DeptParams = Depends(),
        auth: Auth = Depends(FullAdminAuth())
):
    datas = await auth_crud.DeptDal(auth.db).get_tree_list(1)
    return RestfulResponse.success(data=datas)


@router.get("/dept/tree/options", summary="获取部门树选择项，添加/修改部门时使用")
async def get_dept_options(auth: Auth = Depends(FullAdminAuth())):
    datas = await auth_crud.DeptDal(auth.db).get_tree_list(mode=2)
    return RestfulResponse.success(data=datas)


@router.get("/dept/user/tree/options", summary="获取部门树选择项，添加/修改用户时使用")
async def get_dept_treeselect(auth: Auth = Depends(FullAdminAuth())):
    return RestfulResponse.success(await auth_crud.DeptDal(auth.db).get_tree_list(mode=3))


@router.post("/depts", summary="创建部门信息")
async def create_dept(data: dept_schema.Dept, auth: Auth = Depends(FullAdminAuth())):
    return RestfulResponse.success(await auth_crud.DeptDal(auth.db).create_data(data=data))


@router.delete("/depts", summary="批量删除部门", description="硬删除, 如果存在用户关联则无法删除")
async def delete_depts(ids: IdList = Depends(), auth: Auth = Depends(FullAdminAuth())):
    await auth_crud.DeptDal(auth.db).delete_datas(ids.ids)
    return RestfulResponse.success("删除成功")


@router.put("/depts/{data_id}", summary="更新部门信息")
async def put_dept(
        data_id: int,
        data: dept_schema.Dept,
        auth: Auth = Depends(FullAdminAuth())
):
    return RestfulResponse.success(await auth_crud.DeptDal(auth.db).put_data(data_id, data))
