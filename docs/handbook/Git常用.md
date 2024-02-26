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
git remote add <remote_name> <url>
git remote add origin http://... # 示例

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
git commit -m ""
git commit -m "init" # 示例
```

推送到远程
```bash
git push -u <remote_name> <branch_name>
git push -u origin master # 示例
```

拉取代码
```Shell
git pull <remote_name> <branch_name>
git pull origin master # 示例
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
git branch main # 示例
```

切换分支
```bash
git checkout <branch_name>
git checkout main# 示例
```

删除分支
```bash
git branch -d <branch_name>
git branch -d main # 示例
```

合并分支
```bash
# 将分支合并到当前所在分支
git merge <branch_name> 

git checkout master
git merge dev # 示例：将dev合并到master
```

分支重命名
```bash
git branch -m <old_name> <new_name>
git branch -m master main # 示例：将 master 改为 main
```

## 4 标签

显示标签列表
```bash
git tag
```

创建标签
```bash
git tag -a <tag_name> -m '<message>'
git tag -a v1.0 -m 'my first version' # 示例
```

查看标签信息
```bash
git show <tag_name>
git show v1.0 # 示例
```

删除标签
```bash
git tag -d <tag_name>
git tag -d v2.0 # 示例
```

推送标签
```bash
git push <remote_name> --tags
git push origin --tags # 示例
```

## 5 撤销

## 附录A：Format Commit

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

## 附录B：Git Emoji

使用 Emoji 提交 Message，相关的项目：[gitmoji | An emoji guide for your commit messages](https://gitmoji.dev/) 

格式：
```txt
<Emoji> : <Main Message>

- <detail>
- <detail>
- ...

[Footer]
```

常用的 Emoji 说明：

| Emoji | Code               | Remark                   |
|:----- |:------------------ |:------------------------ |
| 🎉    | `:tada:`           | 初始提交/新的项目        |
| ✨    | `:sparkles:`         | 增加新功能               |
| 🐛    | `:bug:`              | 修改Bug                  |
| ⚡️   | `:zap:`              | 提升性能                 |
| 💄    | `:lipstick:`         | 增加或更新UI或样式文件   |
| 📝    | `:memo:`             | 添加或更新文档           |
| ✅    | `:white_check_mark:` | 添加，更新或通过某项测试 |
| 🎨    | `:art:`              | 改进代码结构             |
| 🔥    | `:fire:`             | 移除代码或文件           |
| 🔖    | `:bookmark:`         | 发布/新版本              |
| ♻️    | `:recycle:`          | 代码重构                 |
| ➕    | `:heavy_plus_sign:`  | 添加依赖                 |
| ➖    | `:heavy_minus_sign:` | 移除依赖                         |


可以通过复制Emoji图片来提交，也可以使用 emoji 代码提交，但是使用代码需要安装依赖包:

```bash
npm install -g gitmoji-cli
```

## 附录C：.gitignore

[Git入门之.gitignore - 掘金 (juejin.cn)](https://juejin.cn/post/6998911250323390501)