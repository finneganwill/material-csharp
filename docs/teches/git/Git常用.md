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

配置远程库
```bash
# 查看
git remote -v
# 添加
git remote add <alias> <address>
git remote add origin http://...
# 删除
git remote rm origin
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

拉取代码
```Shell
git pull <remote> <branch>
git pull origin master
```

日志
```bash
# 查看工作区、暂存区状态
git status
# 查看仓库提交日志
git log
```

## 3 分支
查看分支
```bash
git branch -v
```

创建分支
```bash
git branch <branch_name>
```

切换分支
```bash
git checkout <branch_name>
```

删除分支
```bash
git branch -d <branch_name>
```

合并分支
```bash
git checkout master
git merge dec # 将dev合并到master
```

分支重命名
```bash
git branch -m <old_name> <new_name>
```

## 4 标签

## 5 撤销

## 附录：Commit 消息格式

格式：
```txt
<关键字>：<标题>

- <正文>
- <正文>
- ...

[页脚]
```

关键字说明：
- `Feature`：提交新功能
- `Fix`：修复了bug
- `Docs`：只修改了文档
- `Style`：调整代码格式，未修改代码逻辑（比如修改空格、格式化、缺少分号等）
- `Refactor`：代码重构，既没修复bug也没有添加新功能
- `Perf`：性能优化，提高性能的代码更改
- `Test`：添加或修改代码测试
- `Chore`：对构建流程或辅助工具和依赖库（如文档生成等）的更改