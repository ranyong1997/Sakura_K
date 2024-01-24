> 如果执行数据库迁移命令,需要去env.py中找到【# 导入项目中的基本映射类，与 需要迁移的 ORM 模型，不添加会初始化失败】并解开注释
```text
# 执行命令（生产环境）：
python main.py migrate

# 执行命令（开发环境）：
python main.py migrate --env dev

# 开发环境的原命令【非执行】
alembic --name dev revision --autogenerate -m 2.0
alembic --name dev upgrade head
```