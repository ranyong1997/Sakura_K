#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2023/4/10 19:33
# @Author  : 冉勇
# @Site    : 
# @File    : settings.py
# @Software: PyCharm
# @desc    : 主配置文件
import os

from fastapi.security import OAuth2PasswordBearer  # OAuth2PasswordBearer 类是用于在 OAuth2 鉴权方式下获取访问令牌的类。
from pydantic_settings import BaseSettings, PydanticBaseSettingsSource, SettingsConfigDict

"""
系统版本
"""
VERSION = "3.10.1"

"""
Banner
"""
BANNER = """
███████  █████  ██   ██ ██    ██ ██████   █████          ██   ██ 
██      ██   ██ ██  ██  ██    ██ ██   ██ ██   ██         ██  ██  
███████ ███████ █████   ██    ██ ██████  ███████         █████   
     ██ ██   ██ ██  ██  ██    ██ ██   ██ ██   ██         ██  ██  
███████ ██   ██ ██   ██  ██████  ██   ██ ██   ██ ███████ ██   ██ 
                                                                 
"""

"""
⚠️安全警告:请不要在正式环境中打开调试运行!!!
"""
DEBUG = True

"""
是否开启演示功能，开启则取消所有的POST、DELETE、PUT操作权限
"""
DEMO = False

"""
演示功能白名单
"""
DEMO_WHITE_LIST_PATH = [
    "/auth/login",
    "/auth/token/refresh",
    "/auth/wx/login",
    "/vadmin/system/dict/types/details",
    "/vadmin/system/settings/tabs",
    "/vadmin/auth/user/export/query/list/to/excel"
]

"""
演示功能黑名单（触发异常 status_code=403），黑名单优先级更高
"""
DEMO_BLACK_LIST_PATH = [
    "/auth/api/login"
]

"""
引入数据库配置
"""
if DEBUG:
    from application.config.development import *
else:
    from application.config.production import *

"""
项目根目录
"""
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

"""
是否开启登录认证
只使用与简单的接口
如果是与认证关联性比较强的接口，则无法调用
"""
OAUTH_ENABLE = True

"""
配置 OAuth2 密码流认证方式
官方文档：https://fastapi.tiangolo.com/zh/tutorial/security/first-steps/#fastapi-oauth2passwordbearer
auto_error:(bool) 可选参数，默认为 True。当验证失败时，如果设置为 True，FastAPI 将自动返回一个 401 未授权的响应，如果设置为 False，你需要自己处理身份验证失败的情况。
这里的 auto_error 设置为 False 是因为存在 OpenAuth：开放认证，无认证也可以访问，
如果设置为 True，那么 FastAPI 会自动报错，即无认证时 OpenAuth 会失效，所以不能使用 True。
"""
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/auth/api/login", auto_error=False) if OAUTH_ENABLE else lambda: ""

"""
安全的随机秘钥，该秘钥将用于对JWT令牌进行签名
"""
SECRET_KEY = 'vgb0tnl9d58+6n-6h-ea&u^1#s0ccp!794=kbvqacjq75vzps$'

"""
用于设定JWT令牌签名算法
"""
ALGORITHM = "HS256"

"""
access_token 过期时间: 1 Day
"""
ACCESS_TOKEN_EXPIRE_MINUTES = 1440

"""
refresh_token 过期时间，用于刷新token使用：2 Day
"""
REFRESH_TOKEN_EXPIRE_MINUTES = 1440 * 2

"""
access——token 缓存时间，用于刷新token使用：30 Minute
"""
ACCESS_TOKEN_CACHE_MINUTES = 30

"""
挂载临时文件，并添加路由访问，此路由不会再接口文档中显示
TEMP_DIR：临时文件目录绝对地址
官方文档：https://fastapi.tiangolo.com/tutorial/static-files/
"""
TEMP_DIR = os.path.join(BASE_DIR, "temp")

"""
挂载静态目录，并添加路由访问，此路由不会再接口文档中显示
STATIC_ENABLE：是否启用静态目录访问
STATIC_URL：路由访问
STATIC_ROOT：静态文件绝对路径
官方文档：https://fastapi.tiangolo.com/tutorial/static-files/
"""
STATIC_ENABLE = True
STATIC_URL = "/media"
STATIC_DIR = "static"
STATIC_ROOT = os.path.join(BASE_DIR, STATIC_DIR)

"""
跨域
官方文档：https://fastapi.tiangolo.com/tutorial/cors/
"""
# 是否启用跨域
CORS_ORIGIN_ENABLE = True
# 只允许访问的域名列表，* 代表所有
ALLOW_ORIGINS = ["*"]
# 是否支持携带 cookie
ALLOW_CREDENTIALS = True
# 设置允许跨域的http方法，比如 get、post、delete、put等
ALLOW_METHODS = ["*"]
# 允许携带headers，可以用来鉴别来源等
ALLOW_HEADERS = ["*"]

"""
全局事件配置
"""
EVENTS = [
    "core.event.connect_mongo" if MONGO_DB_ENABLE else None,
    "core.event.connect_redis" if REDIS_DB_ENABLE else None,
]

"""
其他项目配置
"""
# 默认密码，"0" 默认为手机号后六位
DEFAULT_PASSWORD = "0"
# 默认头像
DEFAULT_AVATAR = "https://ran-oss-yong.oss-cn-shenzhen.aliyuncs.com/avatar.gif"
# 默认登陆时最大输入密码或验证码错误次数
DEFAULT_AUTH_ERROR_MAX_NUMBER = 5
# 是否开启保存登录日志
LOGIN_LOG_RECORD = not DEBUG
# 是否开启保存每次请求日志到本地
REQUEST_LOG_RECORD = True
# 是否开启每次操作日志记录到MongoDB数据库
OPERATION_LOG_RECORD = True
# 只记录包括的请求方式操作到MongoDB数据库
OPERATION_RECORD_METHOD = ["POST", "PUT", "DELETE"]
# 忽略的操作接口函数名称，列表中的函数名称不会被记录到操作日志中
IGNORE_OPERATION_FUNCTION = ["post_dicts_details"]

"""
中间件配置
"""
MIDDLEWARES = [
    "core.middleware.register_request_log_middleware" if REQUEST_LOG_RECORD else None,
    "core.middleware.register_operation_record_middleware" if OPERATION_LOG_RECORD and MONGO_DB_ENABLE else None,
    "core.middleware.register_demo_env_middleware" if DEMO else None,
    "core.middleware.register_jwt_refresh_middleware"
]

"""
发布/订阅通道

与接口相互关联，请勿随意更改
"""
SUBSCRIBE = 'sakura_queue'

"""
MongoDB 集合

与接口相互关联，相互查询，请勿随意更改
"""
# 用于存放任务调用日志
SCHEDULER_TASK_RECORD = "scheduler_task_record"
# 用于存放运行中的任务
SCHEDULER_TASK_JOBS = "scheduler_task_jobs"
# 用于存放任务信息
SCHEDULER_TASK = "vadmin_system_task"

"""
定时任务脚本目录
"""
TASKS_ROOT = "tasks"

"""
项目描述
"""
PROJECT_DESCRIPTION: str = """
🎉 sakura_k 管理员接口汇总 🎉
本项目基于Fastapi与Vue3+Typescript+Vite4+element-plus的基础项目 前端基于vue-element-plus-admin框架开发
#### Description/说明
<details>
<summary>点击展开/Click to expand</summary>
> [中文/Chinese]
- Sakura_K测试平台，更多功能正在开发中。
- 本项目开源在[GitHub：sakura_k](https://github.com/ranyong1997/Sakura_K)。
- 本项目仅供学习交流使用，严禁用于违法用途，如有侵权请联系作者。
</details>
#### Contact author/联系作者
<details>
<summary>点击展开/Click to expand</summary>
- WeChat: RanY_Luck
- Email: [ranyong1209@gmail.com](mailto:ranyong1209@gmail.com)
- Github: [✶  🎀  GitHub地址  🎀  ✶](https://github.com/ranyong1997)
- 联系我: ![微信二维码](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F4bb5e771-42f5-47ce-952b-c122c611905a%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1701941750&t=3271891773bfa092923625a10c2cc7d5)
</details>
"""

"""
项目名称
"""
PROJECT_NAME: str = "Sakura_K"


class Settings(BaseSettings):
    """
    官方文档：https://docs.pydantic.dev/latest/concepts/pydantic_settings/#installation

    字段值优先级
    在多种方式指定同一个设置字段的值的情况下，选定值的确定顺序如下（按优先级降序排列）：

    1. init_settings：传递给 BaseSettings 类构造函数的参数
    2. env_settings：环境变量，例如上述的 my_prefix_special_function。
    3. dotenv_settings：从 dotenv（.env）文件加载的变量。
    4. settings_cls：BaseSettings 模型的默认字段值。
    """

    model_config = SettingsConfigDict(env_file=".env", env_file_encoding="utf-8", extra="ignore")

    @classmethod
    def settings_customise_sources(
            cls,
            settings_cls: type[BaseSettings],
            init_settings: PydanticBaseSettingsSource,
            env_settings: PydanticBaseSettingsSource,
            dotenv_settings: PydanticBaseSettingsSource,
            file_secret_settings: PydanticBaseSettingsSource,
    ) -> tuple[PydanticBaseSettingsSource, ...]:
        return init_settings, env_settings, dotenv_settings
