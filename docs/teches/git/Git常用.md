# Git 常用命令

## 1 配置信息

查看配置列表
```bash
# 全部信息
git config --list
# 指定信息
git config --global user.name
git config --global user.email
```

设置用户名和邮箱
```bash
git config --global user.name "your name"
git config --global user.email "your email"
```

修改配置
```bash
git config --replace-all user.name "your name"
```

删除配置
```bash
git config --global --unset user.name
```

## 2 基本操作

初始化工作区
```bash
git init
```

连接远程库
```bash
# 查看
git remote -v
# 添加
git remote add <alias> <address>
git remote add origin http://...
```

添加到暂存区
```bash
# 全部添加
git add .
# 指定文件或目录
git add <file>
```

提交的本地库
```bash
git commit -m "message"
```

推送到远程
```bash
git push -u <remote_name> <branch_name>
git push -u origin master
```

日志
```bash
# 查看工作区、暂存区状态
git status
# 查看仓库提交日志
git log
```

## 3 分支

## 4 标签

## 5 撤销