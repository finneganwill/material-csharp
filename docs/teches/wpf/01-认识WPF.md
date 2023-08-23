# 认识WPF

## 1. WPF是什么
 Windows Presentation Foundation (WPF) 桌面是一个与分辨率无关的 UI 框架，使用基于矢量的呈现引擎，构建用于利用现代图形硬件。 WPF 提供一套完善的应用程序开发功能，这些功能包括 Extensible Application Markup Language (XAML)、控件、数据绑定、布局、二维和三维图形、动画、样式、模板、文档、媒体、文本和版式。 WPF 属于 .NET，因此可以生成整合 .NET API 其他元素的应用程序。
 
WPF 有两种实现：

1. .Net 版本：
    [GitHub](https://github.com/dotnet/wpf) 上托管的 WPF 的开源实现，在 .NET 上运行。 适用于 XAML 设计器最低要求 [Visual Studio 2019 版本 16.8](https://visualstudio.microsoft.com/downloads/?utm_medium=microsoft&utm_source=learn.microsoft.com&utm_campaign=inline+link&utm_content=download+vs2019+desktopguide+wpf)。 但根据 .NET 的版本，可能需要使用较新版本的 Visual Studio。
    尽管 .NET 是一种跨平台技术，但 **WPF 仅在 Windows 上运行**。
    
2. .NET Framework 4 版本：
    受 Visual Studio 2019 和 Visual Studio 2017 支持的 WPF 的 .NET Framework 实现。
    .NET Framework 4 是仅限 Windows 的 .NET 版本，被视为一个 Windows 操作系统组件。 此版本的 WPF 随 .NET Framework 一起分发。 有关 WPF 的 .NET Framework 版本的详细信息，请参阅[适用于 .NET Framework 的 WPF 简介](https://learn.microsoft.com/zh-cn/dotnet/desktop/wpf/introduction-to-wpf?view=netframeworkdesktop-4.8&preserve-view=true)。

## 2. 第一个WPF应用程序
下面是使用Visual Studio 2022 创建 WPF HelloWorld 的步骤：

创建成功后的应用基本结构如图所示：

## 3. 概述
开发WPF程序前，你需要了解：
1. 标记与代码隐藏
2. 控件
3. 布局
4. 数据绑定
5. 事件
6. 图形与动画
7. 文本与版式
8. 自定义WPF应用
9. MVVM架构

> 命名空间
> 布局与控件
> 	窗口
> 	面板
> 	装饰
> 	控件
> 属性与样式
> 	属性
> 	Style
> 	依赖属性
> 	附加属性
> 绑定
> 	路径
> 	绑定源
> 	转换器
> 	校验器
> 	绑定模式
> 	模板绑定
> 	多路绑定
> 事件
> 	直接事件
> 	路由事件
> 	条件事件
> 	自定义事件
> 命令
> 	命令绑定
> 	自定义命令
> 资源
> 	静态资源
> 	动态资源
> 	资源定义与查找
> 模板
> 	数据模板
> 	空间模板
> 	模板与Style：设置器与触发器
> 自定义控件与用户控件
> 	模板
> 	资源字典
> 	依赖属性
> 	转换器
> 	模板绑定
> 绘图与动画
> 画刷