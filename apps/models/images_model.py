"""
@Project : sakura_k
@File    : params.py.py
@IDE     : PyCharm
@Author  : RanY
@Date    : 2023/8/25 17:40
@Desc    : 图片素材表
"""
from sqlalchemy import String, ForeignKey, Integer
from sqlalchemy.orm import relationship, Mapped, mapped_column
from apps.models.base.orm import AbstractORMModel
from apps.models.user_model import UserModel


class ImagesModel(AbstractORMModel):
    __tablename__ = "images"
    __table_args__ = ({'comment': '图片素材表'})

    filename: Mapped[str] = mapped_column(String(255), nullable=False, comment="原图片名称")
    image_url: Mapped[str] = mapped_column(String(500), nullable=False, comment="图片链接")

    create_user_id: Mapped[int] = mapped_column(
        Integer,
        ForeignKey("auth_user.id", ondelete='RESTRICT'),
        comment="创建人"
    )
    create_user: Mapped[UserModel] = relationship(foreign_keys=create_user_id)
