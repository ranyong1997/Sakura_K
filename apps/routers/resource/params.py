"""
@Project : sakura_k
@File    : params.py
@IDE     : PyCharm
@Author  : RanY
@Date    : 2023/8/28 16:20
@Desc    : 查询参数-类依赖项
"""
from fastapi import Depends
from apps.depends.Paging import QueryParams, Paging


class ImagesParams(QueryParams):
    """
    列表分页
    """

    def __init__(
            self,
            filename: str = None,
            params: Paging = Depends()
    ):
        super().__init__(params)
        self.filename = ('like', filename)
        self.v_order = "desc"
        self.v_order_field = "create_datetime"
