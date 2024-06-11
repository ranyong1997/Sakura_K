"""
@Project : sakura_k
@File    : params.py
@IDE     : PyCharm
@Author  : RanY
@Date    : 2023/8/28 16:23
@Desc    : 
"""
from pydantic import ConfigDict
from apps.schemas.user_schema import UserSimpleOut
from core.types import DatetimeStr
from apps.schemas.base.base import BaseSchema


class Images(BaseSchema):
    filename: str
    image_url: str

    create_user_id: int


class ImagesSimpleOut(Images):
    model_config = ConfigDict(from_attributes=True)

    id: int
    create_datetime: DatetimeStr
    update_datetime: DatetimeStr


class ImagesOut(ImagesSimpleOut):
    model_config = ConfigDict(from_attributes=True)

    create_user: UserSimpleOut
