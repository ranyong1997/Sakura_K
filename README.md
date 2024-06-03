### 后端技术

- [Python3](https://www.python.org/downloads/windows/)：熟悉 python3 基础语法
- [FastAPI](https://fastapi.tiangolo.com/zh/) - 熟悉后台接口 Web 框架.
- [Typer](https://typer.tiangolo.com/) - 熟悉命令行工具的使用
- [MySQL](https://www.mysql.com/) 和 [MongoDB](https://www.mongodb.com/) 和 [Redis](https://redis.io/)  - 熟悉数据存储数据库
- [iP查询接口文档](https://user.ip138.com/ip/doc)：IP查询第三方服务，有1000次的免费次数

### PC端

- [node](https://gitee.com/link?target=http%3A%2F%2Fnodejs.org%2F)
  和 [git](https://gitee.com/link?target=https%3A%2F%2Fgit-scm.com%2F) - 项目开发环境
- [Vite](https://gitee.com/link?target=https%3A%2F%2Fvitejs.dev%2F) - 熟悉 vite 特性
- [Vue3](https://gitee.com/link?target=https%3A%2F%2Fv3.vuejs.org%2F) - 熟悉 Vue 基础语法
- [TypeScript](https://gitee.com/link?target=https%3A%2F%2Fwww.typescriptlang.org%2F) - 熟悉 `TypeScript` 基本语法
- [Es6+](https://gitee.com/link?target=http%3A%2F%2Fes6.ruanyifeng.com%2F) - 熟悉 es6 基本语法
- [Vue-Router-Next](https://gitee.com/link?target=https%3A%2F%2Fnext.router.vuejs.org%2F) - 熟悉 vue-router 基本使用
- [Element-Plus](https://gitee.com/link?target=https%3A%2F%2Felement-plus.org%2F) - element-plus 基本使用
- [Mock.js](https://gitee.com/link?target=https%3A%2F%2Fgithub.com%2Fnuysoft%2FMock) - mockjs 基本语法
- [vue3-json-viewer](https://gitee.com/isfive/vue3-json-viewer)：简单易用的json内容展示组件,适配vue3和vite。
- [SortableJS/vue.draggable.next](https://github.com/SortableJS/vue.draggable.next)：Vue 组件 （Vue.js 3.0）
  允许拖放和与视图模型数组同步。
- [高德地图API (amap.com)](https://lbs.amap.com/api/jsapi-v2/guide/webcli/map-vue1)：地图 JSAPI 2.0 是高德开放平台免费提供的第四代
  Web 地图渲染引擎。

### 定时任务

- [Python3](https://www.python.org/downloads/windows/) -熟悉 python3 基础语法
- [APScheduler](https://github.com/agronholm/apscheduler) - 熟悉定时任务框架
- [MongoDB](https://www.mongodb.com/) 和 [Redis](https://redis.io/)  - 熟悉数据存储数据库

### 准备工作

```text
Python == 3.10 (其他版本均未测试)
nodejs >= 14.0 (推荐使用最新稳定版)
Mysql >= 8.0
MongoDB (推荐使用最新稳定版)
Redis (推荐使用最新稳定版)
```

### 后端
#### 首次使用
1. 安装依赖
```python
# 安装依赖库
python3 venv venv
# 激活虚拟环境
>> mac 激活
# 待补充
>> win 激活
# 待补充
pip3 install poetry -i https://mirrors.aliyun.com/pypi/simple/
poetry install
```

1. ~~安装依赖(适合pyenv和virtual env)~~

```python
pip3 install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
```

2. 修改项目数据库配置信息
   在 `application/config` 目录中

- development_example.py：开发环境填写模板，需要单独复制出来删除**_example**

- production_example.py：生产环境填写模板，需要单独复制出来删除**_example**

```python
"""
Mysql 数据库配置项
连接引擎官方文档：https://www.osgeo.cn/sqlalchemy/core/engines.html
数据库链接配置说明：mysql+asyncmy://数据库用户名:数据库密码@数据库地址:数据库端口/数据库名称
"""
SQLALCHEMY_DATABASE_URL = "mysql+asyncmy://数据库用户名:数据库密码@数据库地址:数据库端口/数据库名称"
SQLALCHEMY_DATABASE_TYPE = "mysql"

"""
Redis 数据库配置
"""
REDIS_DB_ENABLE = True
REDIS_DB_URL = "redis://:密码@地址:端口/数据库"

"""
MongoDB 数据库配置
"""
MONGO_DB_ENABLE = True
MONGO_DB_NAME = "数据库名称"
MONGO_DB_URL = f"mongodb://用户名:密码@地址:端口/?authSource={MONGO_DB_NAME}"

"""
阿里云对象存储OSS配置
阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。
yourEndpoint填写Bucket所在地域对应的Endpoint。以华东1（杭州）为例，Endpoint填写为https://oss-cn-hangzhou.aliyuncs.com。
*  [accessKeyId] {String}：通过阿里云控制台创建的AccessKey。
*  [accessKeySecret] {String}：通过阿里云控制台创建的AccessSecret。
*  [bucket] {String}：通过控制台或PutBucket创建的bucket。
*  [endpoint] {String}：bucket所在的区域， 默认oss-cn-hangzhou。
"""
ALIYUN_OSS = {
    "accessKeyId": "accessKeyId",
    "accessKeySecret": "accessKeySecret",
    "endpoint": "endpoint",
    "bucket": "bucket",
    "baseUrl": "baseUrl"
}

"""
获取IP地址归属地
文档：https://user.ip138.com/ip/doc
"""
IP_PARSE_ENABLE = True
IP_PARSE_TOKEN = "IP_PARSE_TOKEN"
```
并在`alembic.ini`文件中配置数据库信息，用于数据库映射

### 开发环境[dev]
```text
mysql+pymysql://数据库用户名:数据库密码@数据库地址:数据库端口/数据库名称

version_locations = %(here)s/alembic/versions_dev
sqlalchemy.url = mysql+asyncmy://root:123456@127.0.0.1:3306/sakura_k
```

### 生产环境[pro]
```text
mysql+pymysql://数据库用户名:数据库密码@数据库地址:数据库端口/数据库名称

version_locations = %(here)s/alembic/versions_pro
sqlalchemy.url = mysql+asyncmy://root:123456@127.0.0.1:3306/sakura_k
```
3. 创建数据库

```text
mysql> create database sakura_k;  # 创建数据库
mysql> use sakura_k;           # 使用已创建的数据库 
mysql> set names utf8;         # 设置编码
```

4. 初始化数据库数据

```
# 项目根目录下执行，需提前创建好数据库
# 会自动将模型迁移到数据库，并生成初始化数据
# 执行前请确认执行的环境与settings.py文件中配置的DEBUG一致
# 比如要初始化开发环境，那么env参数应该为 dev，并且 application/settings.DEBUG 应该 = True
# 比如要初始化生产环境，那么env参数应该为 pro，并且 application/settings.DEBUG 应该 = False

（生产环境）
python3 main.py init

（开发环境）
python3 main.py init --env dev
```

5. 修改项目基本配置信息
- 修改数据库表 `vadmin_system_settings` 中的关键信息

```text
【可选配置】
# 阿里云短信配置
sms_access_key
sms_access_key_secret
sms_sign_name_1
sms_template_code_1
sms_sign_name_2
sms_template_code_2

# 微信小程序配置
wx_server_app_id
wx_server_app_secret

# 邮箱配置
email_access
email_password
email_server
email_port
```

6. 启动

```text
# 运行主程序
python3 main.py run

# 运行定时任务
python3 /utils/tasks/run.py run
```
## Docker Compose 生产环境部署

### 准备工作

1. 获取代码

   ```
   git clone 
   ```

2. 修改项目环境配置：

   1. 修改 API 端：

      文件路径为：`Sakura_K/application/settings.py`

      ```python
      # 安全警告: 不要在生产中打开调试运行!
      DEBUG = False # 生产环境应该改为 False
      ```

3. 如果已有 Mysql 或者 Redis 或者 MongoDB 数据库，请修改如下内容，如果没有则不需要修改：

   1. 修改 API 端配置文件：

      文件路径为：`Sakura_K/application/config/production.py`

      ```python
      # Mysql 数据库配置项
      # 连接引擎官方文档：https://www.osgeo.cn/sqlalchemy/core/engines.html
      # 数据库链接配置说明：mysql+asyncmy://数据库用户名:数据库密码@数据库地址:数据库端口/数据库名称
      SQLALCHEMY_DATABASE_URL = "mysql+asyncmy://root:123456@177.8.0.7:3306/kinit"
      
      # Redis 数据库配置
      # 格式："redis://:密码@地址:端口/数据库名称"
      REDIS_DB_ENABLE = True
      REDIS_DB_URL = "redis://:123456@177.8.0.5:6379/1"
      
      # MongoDB 数据库配置
      # 格式：mongodb://用户名:密码@地址:端口/?authSource=数据库名称
      MONGO_DB_ENABLE = True
      MONGO_DB_NAME = "sakura_k"
      MONGO_DB_URL = f"mongodb://root:123456@177.8.0.6:27017/?authSource={MONGO_DB_NAME}"
      ```
   
   2将已有的数据库在 `docker-compose.yml` 文件中注释
   
4. 配置阿里云 OSS 与 IP 解析接口地址（可选）

   文件路径：`Sakura_K/application/config/production.py`

   ```python
   # 阿里云对象存储OSS配置
   # 阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。
   # yourEndpoint填写Bucket所在地域对应的Endpoint。以华东1（杭州）为例，
   # Endpoint填写为https://oss-cn-hangzhou.aliyuncs.com。
   #  *  [accessKeyId] {String}：通过阿里云控制台创建的AccessKey。
   #  *  [accessKeySecret] {String}：通过阿里云控制台创建的AccessSecret。
   #  *  [bucket] {String}：通过控制台或PutBucket创建的bucket。
   #  *  [endpoint] {String}：bucket所在的区域， 默认oss-cn-hangzhou。
   ALIYUN_OSS = {
       "accessKeyId": "accessKeyId",
       "accessKeySecret": "accessKeySecret",
       "endpoint": "endpoint",
       "bucket": "bucket",
       "baseUrl": "baseUrl"
   }
   
   # 获取IP地址归属地
   # 文档：https://user.ip138.com/ip/doc
   IP_PARSE_ENABLE = False
   IP_PARSE_TOKEN = "IP_PARSE_TOKEN"
   ```
   
5. 前端项目打包：

   ```shell
   cd kinit-admin
   
   # 安装依赖包
   pnpm install
   
   # 打包
   pnpm run build:pro
   ```

### 启动并初始化项目

```shell
# 启动并创建所有容器
docker-compose up -d

# 初始化数据
docker-compose exec kinit-api python3 main.py init

# 重启所有容器
docker-compose restart


# 其他命令：

# 停止所有容器
docker-compose down

# 查看所有容器状态
docker-compose ps -a
```

### 访问项目

- 访问地址：http://localhost (默认为此地址，如有修改请按照配置文件)
- 账号：`` 密码：``
- 接口地址：http://localhost:9000/docs (默认为此地址，如有修改请按照配置文件)

## 其他操作

- 接口Swagger文档

```
#在线文档地址(在配置文件里面设置路径或者关闭)
http://127.0.0.1:9000/docs
```

- 提交代码模板

```
✨ Feat(): 新增
🐞 Fix(): 修复
📃 Docs(): 文档
🦄 Refactor(): 重构
🎈 Perf(): 优化

```

- Git提交代码

Git更新ignore文件直接修改gitignore是不会生效的，需要先去掉已经托管的文件，修改完成之后再重新添加并提交。

```text
第一步：
git rm -r --cached .
去掉已经托管的文件
第二步：
修改自己的igonre文件内容
第三步：
git add .
git commit -m "clear cached"
```

- 执行数据库迁移命令（终端执行）

```text
# 执行命令（生产环境）：
python main.py migrate

# 执行命令（开发环境）：
python main.py migrate --env dev

# 开发环境的原命令【非执行】
alembic --name dev revision --autogenerate -m 2.0
alembic --name dev upgrade head
```

## 查数据

自定义的一些查询过滤

```text
# 日期查询
# 值的类型：str
# 值得格式：%Y-%m-%d：2023-05-14
字段名称=("date", 值)

# 模糊查询
# 值的类型: str
字段名称=("like", 值)

# in 查询
# 值的类型：list
字段名称=("in", 值)

# 时间区间查询
# 值的类型：tuple 或者 list
字段名称=("between", 值)

# 月份查询
# 值的类型：str
# 值的格式：%Y-%m：2023-05
字段名称=("month", 值)

# 不等于查询
字段名称=("!=", 值)

# 大于查询
字段名称=(">", 值)

# 等于 None
字段名称=("None")

# 不等于 None
字段名称=("not None")
```

代码部分：

```python
def __dict_filter(self, **kwargs) -> list[BinaryExpression]:
    """
    字典过滤
    :param model:
    :param kwargs:
    """
    conditions = []
    for field, value in kwargs.items():
        if value is not None and value != "":
            attr = getattr(self.model, field)
            if isinstance(value, tuple):
                if len(value) == 1:
                    if value[0] == "None":
                        conditions.append(attr.is_(None))
                    elif value[0] == "not None":
                        conditions.append(attr.isnot(None))
                    else:
                        raise CustomException("SQL查询语法错误")
                elif len(value) == 2 and value[1] not in [None, [], ""]:
                    if value[0] == "date":
                        # 根据日期查询， 关键函数是：func.time_format和func.date_format
                        conditions.append(func.date_format(attr, "%Y-%m-%d") == value[1])
                    elif value[0] == "like":
                        conditions.append(attr.like(f"%{value[1]}%"))
                    elif value[0] == "in":
                        conditions.append(attr.in_(value[1]))
                    elif value[0] == "between" and len(value[1]) == 2:
                        conditions.append(attr.between(value[1][0], value[1][1]))
                    elif value[0] == "month":
                        conditions.append(func.date_format(attr, "%Y-%m") == value[1])
                    elif value[0] == "!=":
                        conditions.append(attr != value[1])
                    elif value[0] == ">":
                        conditions.append(attr > value[1])
                    elif value[0] == "<=":
                        conditions.append(attr <= value[1])
                    else:
                        raise CustomException("SQL查询语法错误")
            else:
                conditions.append(attr == value)
    return conditions
```

示例：

查询所有用户id为1或2或 4或6，并且email不为空，并且名称包括李：

```python
users = UserDal(db).get_datas(limit=0, id=("in", [1, 2, 4, 6]), email=("not None",), name=("like", "李"))

# limit=0：表示返回所有结果数据
# 这里的 get_datas 默认返回的是 pydantic 模型数据
# 如果需要返回用户对象列表，使用如下语句：
users = UserDal(db).get_datas(
    limit=0,
    id=("in", [1, 2, 4, 6]),
    email=("not None",),
    name=("like", "李"),
    v_return_objs=True
)
```

查询所有用户id为1或2或 4或6，并且email不为空，并且名称包括李：

查询第一页，每页两条数据，并返回总数，同样可以通过 get_datas 实现原始查询方式：

```python
v_where = [VadminUser.id.in_([1, 2, 4, 6]), VadminUser.email.isnot(None), VadminUser.name.like(f"%李%")]
users, count = UserDal(db).get_datas(limit=2, v_where=v_where, v_return_count=True)

# 这里的 get_datas 默认返回的是 pydantic 模型数据
# 如果需要返回用户对象列表，使用如下语句：
users, count = UserDal(db).get_datas(
    limit=2,
    v_where=v_where,
    v_return_count=True,
    v_return_objs=True,
)
```

外键查询示例

以常见问题表为主表，查询出创建用户名称为root的用户，创建了哪些常见问题，并加载出用户信息：

```python
v_options = [joinedload(VadminIssue.create_user)]
v_join = [["create_user"]]
v_where = [VadminUser.name == "root"]
datas = await crud.IssueCategoryDal(auth.db).get_datas(
    limit=0,
    v_options=options,
    v_join=v_join,
    v_where=v_where,
    v_return_objs=True
)
```

mac系统安装虚拟环境和激活虚拟环境

一、安装virtualenv
> sudo pip install virtualenv

二、创建虚拟环境
> virtualenv venv # venv为虚拟环境的名称，可以根据需要自定义

注意，如果你想使用Python3创建虚拟环境，需要添加--python选项：
> virtualenv --python=python3 venv

三、激活虚拟环境
> source venv/bin/activate

### 可能遇到的问题：
问题1:`redis.exceptions.RedisError: Redis 连接失败: MISCONF Redis is configured to save RDB snapshots, but it's currently unable to persist to disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error.
`

问题2:`ERROR:    [Errno 10048] error while attempting to bind on address ('0.0.0.0', 9000): 通常每个套接字地址(协议/网络地址/端口)只允许使用一次。
`

解决办法：

```shell
解决问题1:redis-cli -a 123456 -p 6379

config set stop-writes-on-bgsave-error no

解决问题2:
[Win]--> cmd:netstat -ano | findstr :9000
taskkill /f /pid 进程ID
[Mac]--> cmd: lsof -i:9000
kill -9 PID
````
## 添加任务

```python
from apscheduler.schedulers.blocking import BlockingScheduler

def job():
    print('Hello world!')

scheduler = BlockingScheduler()
scheduler.add_job(job, 'interval', minutes=1)
scheduler.start()
```

**立即执行**

```python
from apscheduler.schedulers.background import BackgroundScheduler

def job():
    print("Hello, world!")

scheduler = BackgroundScheduler()

# 立即执行任务
scheduler.add_job(job, next_run_time=datetime.now(), id='my_job')
scheduler.start()
```

**判断是否存在**

```python
from apscheduler.schedulers.background import BackgroundScheduler

def my_job():
    print('Hello, world!')

scheduler = BackgroundScheduler()
scheduler.add_job(my_job, 'interval', seconds=10, id='my_job')
scheduler.start()
```

**检查任务是否存在**

```python
if scheduler.get_job('my_job'):
    print('任务存在')
else:
    print('任务不存在')
```

**删除任务**

```python
from apscheduler.schedulers.background import BackgroundScheduler

def my_job():
    print('Hello, world!')

scheduler = BackgroundScheduler()
scheduler.add_job(my_job, 'interval', seconds=10, id='my_job')
scheduler.start()

# 删除任务
scheduler.remove_job('my_job')
```

**添加参数**

```python
from apscheduler.schedulers.background import BackgroundScheduler

def job(arg1, arg2):
    print('This is a job with arguments: {}, {}'.format(arg1, arg2))

scheduler = BackgroundScheduler()
scheduler.add_job(job, 'interval', seconds=5, args=('hello', 'world'))
scheduler.start()
```

**获取当前正在执行的任务列表**

```python
from apscheduler.schedulers.background import BackgroundScheduler

def job():
    print('This is a job.')

scheduler = BackgroundScheduler()
scheduler.add_job(job, 'interval', seconds=5)
scheduler.start()

# 获取当前正在执行的任务列表
jobs = scheduler.get_jobs()
for job in jobs:
    print(job)
```

## 添加定时任务 add_job 方法

APScheduler的add_job方法用于添加定时任务。除了使用Cron表达式来指定定时任务的调度规则之外，add_job方法还支持其他几种方法来设置定时任务的执行时间。以下是add_job方法常用的几种调度方式：

- date：指定一个具体的日期和时间来执行任务。

```python
scheduler.add_job(job_function, 'date', run_date='2023-06-30 12:00:00')
```

在上述示例中，任务将在指定的日期和时间（2023年6月30日12:00:00）执行。

- interval：指定一个时间间隔来执行任务。

```python
scheduler.add_job(job_function, 'interval', minutes=30)
```

在上述示例中，任务将每隔30分钟执行一次。

- cron：使用Cron表达式来指定任务的执行时间。

```python
scheduler.add_job(job_function, 'cron', hour=8, minute=0, day_of_week='0-4')
```

在上述示例中，任务将在每个工作日的早上8点执行。

- timedelta：指定一个时间间隔来执行任务，但相对于当前时间的偏移量。

```python
from datetime import timedelta

scheduler.add_job(job_function, 'interval', seconds=10, start_date=datetime.now() + timedelta(seconds=5))
```

在上述示例中，任务将在当前时间的5秒后开始执行，然后每隔10秒执行一次。
这些方法提供了不同的方式来安排定时任务的执行时间。你可以根据具体需求选择适合的调度方式，并结合相关参数来设置定时任务的执行规则。无论使用哪种方法，都可以通过add_job方法将任务添加到调度器中，以便按照预定的时间规则执行任务。

## cron触发器

**cron**触发器是**APScheduler**中常用的一种触发器类型，用于基于**cron**表达式来触发任务。它提供了灵活且精确的任务调度规则，可以在特定的日期和时间点上触发任务。

以下是关于cron触发器的详细解释：

**创建触发器：**
要创建一个cron触发器，可以使用CronTrigger类并指定cron表达式作为参数。cron表达式是一种字符串格式，用于指定任务触发的时间规则。它由多个字段组成，每个字段表示时间的不同部分，例如分钟、小时、日期等。示例代码如下：

```python
from apscheduler.triggers.cron import CronTrigger

# 创建每天上午10点触发的cron触发器
trigger = CronTrigger(hour=10)
```

在上述示例中，我们创建了一个每天上午10点触发的cron触发器。

**添加触发器到任务：** 创建触发器后，可以将它与任务相关联，以定义任务的调度规则。可以使用add_job()
方法的trigger参数将触发器添加到任务中。示例代码如下：

```python
from apscheduler.schedulers.blocking import BlockingScheduler

def job_function():
    # 任务逻辑

scheduler = BlockingScheduler()
scheduler.add_job(job_function, trigger=CronTrigger(hour=10))
```

在上述示例中，我们将cron触发器添加到了名为job_function的任务中，使得该任务在每天上午10点触发。

**cron表达式：** cron表达式由多个字段组成，用空格分隔。每个字段表示时间的不同部分，具体如下：

```text
分钟：范围是0-59。
小时：范围是0-23。
日期：范围是1-31。
月份：范围是1-12。
星期几：范围是0-6，其中0表示星期日，1表示星期一，以此类推。
```

通过在cron表达式中指定相应的字段值，可以创建各种复杂的调度规则。例如：0 12 * * *表示每天中午12点触发，0 8-18 * *
MON-FRI表示工作日每小时从早上8点到下午6点之间的整点触发。

```python
from apscheduler.triggers.cron import CronTrigger

# 创建每周一至周五上午10点触发的cron触发器
trigger = CronTrigger(hour=10, day_of_week='mon-fri')
```

在上述示例中，我们创建了一个每周一至周五上午10点触发的cron触发

## 接口CURD代码自动生成

1.目前只支持生成接口代码

2.目前只支持使用脚本方式运行，后续会更新到页面操作

3.代码是根据手动配置的 ORM 模型来生成的，支持参数同步，比如默认值，是否为空...

### 第一步: 需自己编写ORM

```python
# apps/vadmin/demo_generate/models/demo_generate.py

from sqlalchemy import String, Boolean
from sqlalchemy.orm import Mapped, mapped_column

from db.db_base import BaseModel


class VadminAutomatic(BaseModel):
    __tablename__ = "vadmin_demo_generate"
    __table_args__ = ({'comment': '自动生成测试表'})

    name: Mapped[str] = mapped_column(String(50), index=True, nullable=False, comment="名字")
    url: Mapped[str] = mapped_column(String(255), index=True, nullable=False, comment="链接")
    is_active: Mapped[bool] = mapped_column(Boolean, default=True, comment="是否可见")
```

### 第二步: 编写 crud 内容

```python
# scripts/crud_generate/run.py

# 导入 ORM 模型
from apps.vadmin.demo_generate.models import VadminAutomatic

# 创建实例
crud = CrudGenerate(VadminAutomatic, zh_name="自动代码生成测试", en_name="demo_generate")
# 开始运行
crud.main()
```

### 第三步: 运行 main.py文件

```text
直接在第二步编写完后运行生成

日志打印如下:
===========================schema 代码创建完成=================================
===========================dal 代码创建完成=================================
===========================param 代码创建完成=================================
===============view 代码创建完成==================
```

### 第四步: 编写路由地址

```python
# application/urls.py

from apps.vadmin.demo_generate.views import app as vadmin_demo_generate

{"ApiRouter": vadmin_demo_generate, "prefix": "/vadmin/demo_generate", "tags": ["测试自动生成crud"]},
```

### 第五步: 进行数据迁移追加

```python
# alembic/env.py

...
from apps.vadmin.demo_generate.models import *
```

## 状态

![Alt](https://repobeats.axiom.co/api/embed/546d79172006719d9475258d7353106ee6bef2a4.svg "Repobeats analytics image")