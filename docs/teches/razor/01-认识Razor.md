# 认识Razor

## 一、Razor简介
Razor 是一种标记语法，用于将基于 .NET 的代码嵌入网页中。 Razor 语法由 Razor 标记、C# 和 HTML 组成。 包含 Razor 的文件通常具有 `.cshtml` 文件扩展名。 Razor 也可在 [Razor 组件](https://learn.microsoft.com/zh-cn/aspnet/core/blazor/components/?view=aspnetcore-6.0) 文件 (`.razor`) 中找到。 Razor 语法类似于各种 JavaScript 单页应用程序 (SPA) 框架（如 Angular、React、VueJs 和 Svelte）的模板化引擎。

## 二、Razor语法

默认的 Razor 语言为 HTML。 从 Razor 标记呈现 HTML 与从 HTML 文件呈现 HTML 没有什么不同。 服务器会按原样呈现 `.cshtml` Razor 文件中的 HTML 标记。

Razor 支持 C#，并使用 `@` 符号从 HTML 转换为 C#。 Razor 计算 C# 表达式，并将它们呈现在 HTML 输出中。

关于Razor语法的内容主要包含下列内容：

- Razor 保留关键字
- Razor 表达式
- Razor 代码块
- 控制结构
- 指令与指令属性
- 注释

## 三、Razor类库
Razor 视图、页面、控制器、页面模型、[Razor组件](https://learn.microsoft.com/zh-cn/aspnet/core/blazor/components/class-libraries?view=aspnetcore-6.0)、[视图组件](https://learn.microsoft.com/zh-cn/aspnet/core/mvc/views/view-components?view=aspnetcore-6.0)和数据模型可以构建到 Razor 类库 (RCL) 中。 RCL 可以打包并重复使用。 应用程序可以包括 RCL，并重写其中包含的视图和页面。 如果在 Web 应用和 RCL 中都能找到视图、分部视图或 Razor 页面，则 Web 应用中的 Razor 标记（`.cshtml` 文件）优先。

## 四、使用Razor进行Web编程

使用 Razor 语法可以通过 ASP.NET 进行网页编程，在此之前你需要具有一下能力：

1. 使用 @ 字符向页面添加代码
2. 将代码块括在大括号中
3. 在块内，使用分号结束每个代码语句
4. 使用变量来存储值
5. 用双引号将文本字符串值括起来
6. 代码区分大小写
7. 大部分编码都涉及对象
8. 可以编写用于做出决策的代码


