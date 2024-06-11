"""
@Project : sakura_k
@File    : crud.py
@IDE     : PyCharm
@Author  : RanY
@Date    : 2023/8/25 17:36
@Desc    : 
"""
from sqlalchemy.ext.asyncio import AsyncSession
from apps.models import images_model
from apps.schemas import images_schema
from core.crud import DalBase


class ImagesDal(DalBase):

    def __init__(self, db: AsyncSession):
        super(ImagesDal, self).__init__(db, images_model.VadminImages, images_schema.ImagesSimpleOut)
