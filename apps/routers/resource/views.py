"""
@Project : sakura_k
@File    : views.py
@IDE     : PyCharm
@Author  : RanY
@Date    : 2023/8/25 17:36
@Desc    : 资源管理路由，视图文件
"""
from fastapi import APIRouter, Depends, UploadFile
from sqlalchemy.orm import joinedload
from application.settings import settings
from apps.cruds import images_crud
from apps.depends.Paging import IdList
from apps.depends.current import FullAdminAuth
from apps.depends.validation.auth import Auth
from apps.routers.resource import params
from apps.schemas import images_schema
from utils.file.aliyun_oss import AliyunOSS, BucketConf
from utils.response import RestfulResponse

router = APIRouter(prefix="/vadmin/resource", tags=["资源管理"])


###########################################################
#                    图片资源管理                           #
###########################################################
# @router.get("/images", summary="获取图片列表")
# async def get_images_list(p: params.ImagesParams = Depends(), auth: Auth = Depends(FullAdminAuth())):
#     model = images_model.ImagesModel
#     v_options = [joinedload(model.create_user)]
#     v_schema = images_schema.ImagesOut
#     datas, count = await images_crud.ImagesDal(auth.db).get_datas(
#         **p.dict(),
#         v_options=v_options,
#         v_schema=v_schema,
#         v_return_count=True
#     )
#     return RestfulResponse.success(datas, count=count)


@router.post("/images", summary="创建图片")
async def create_images(file: UploadFile, auth: Auth = Depends(FullAdminAuth())):
    filepath = f"/resource/images/"
    result = await AliyunOSS(BucketConf(**settings.settings.oss.ALIYUN_OSS)).upload_image(filepath, file)
    data = images_schema.Images(
        filename=file.filename,
        image_url=result,
        create_user_id=auth.user.id
    )
    return RestfulResponse.success(await images_crud.ImagesDal(auth.db).create_data(data=data))


@router.delete("/images", summary="删除图片", description="硬删除")
async def delete_images(ids: IdList = Depends(), auth: Auth = Depends(FullAdminAuth())):
    await images_crud.ImagesDal(auth.db).delete_datas(ids.ids)
    return RestfulResponse.success("删除成功")


@router.get("/images/{data_id}", summary="获取图片信息")
async def get_images(data_id: int, auth: Auth = Depends(FullAdminAuth())):
    return RestfulResponse.success(
        await images_crud.ImagesDal(auth.db).get_data(data_id, v_schema=images_schema.ImagesSimpleOut)
    )
