# Razor

## 语法与表达式

Razor 的默认语言为HTML，但同时支持 C#，并使用 `@` 符号从 HTML 转换为 C#.

计算表达式：@后跟C#表达式，程序会计算表达式结果，并将结果渲染到HTML上。<mark style="background: #FFF3A3A6;">Razor保留关键字</mark> 除外。

保留关键字：Razor保留使用的关键字，如果@后的表达式为关键字那么它们不会被计算。

转义字符：@符号是一种转义字符，如果想要原样输出它，请使用两个@，即 `@@` 

隐式表达式：@后直接加C#代码的形式是隐式表达式，隐式表达式不能包含空格（await 除外）和尖括号。
>尖括号会被识别为HTML标记，导致编译错误。

显式表达式：@后加圆括号，圆括号内写C#代码的形式为显式表达式，即 `@()` ，显示表达式会计算圆括号里的所有内容。

## 代码块与控制结构

代码块：@后加大括号 `{}` 构成代码块结构，即 `@{}` ，代码块内的语言默认为C#，但标签会被转换为HTML。代码块中可以编写更多C#代码以及HTML，并且可以在HTML中使用@表达式。
>代码块内可以混合编写C#代码和HTML，HTML会被呈现页面，@表达式会被计算结果，纯C#代码不会被呈现。

示例：
```razor
@{
    void RenderName(string name)
    {
        <p>Name: <strong>@name</strong></p>
    }
    RenderName("Mahatma Gandhi");
    RenderName("Martin Luther King, Jr.");
}
```


控制结构：控制结构是对代码块的扩展，对于控制结构可以在代码块中使用C#常规语法，也可以直接使用控制结构语法。
- 条件语句：@if、@if-else if、@if-else if-else、@switch
```razor
@if (condition)
{

}
else if
{

}
else
{

}

@switch (value)
{
	case v1:
		break;
	case v2:
		break;
	default:
		break;
}
```
- 循环语句：@for、@foreach、@while、@dowhile
```razor
@for()
{

}

@foreach()
{

}

@while()
{

}

@do
{

}while();
```
- 复合语句：@using
```razor
@using()
{

}
```
- 异常处理：@try-catch-finally
```razor
@try
{

}
catch(Exception)
{

}
finally
{

}
```
- 锁：@lock
```razor
@lock()
{

}
```
- 注释：`@**@` 
```razor
@*
	注释
*@
```

## 指令

指令：在隐式表达式用不能使用保留关键字，因为 `@保留关键字` 构成了指令。指令通常用于更改视图分析方式或启用不同的功能。


| 指令                                                                                                      | 说明                                                                                                             | 示例                                                          | 备注                                                                  |     |     |     |
|:--------------------------------------------------------------------------------------------------------- |:---------------------------------------------------------------------------------------------------------------- |:------------------------------------------------------------- |:--------------------------------------------------------------------- | --- | --- | --- |
| @attribute                                                                                                | 将给定的属性添加到生成的页或视图的类中                                                                           | `@attribute [Authorize]`                                      |                                                                       |     |     |     |
| @code                                                                                                     | 允许 [Razor 组件](https://www.bookstack.cn/read/asp/88d032da6dc59ee9.md)将 C# 成员（字段、属性和方法）添加到组件 | `@code {// C# members (fields, properties, and methods)`      | 此方案仅适用于 Razor 组件 (.razor)                                    |     |     |     |
| @functions                                                                                                | 指令允许将 C# 成员（字段、属性和方法）添加到生成的类中                                                           | `@functions {// C# members (fields, properties, and methods)` | @code是@functions的别名，@code优先级更高，请使用@code而不是@functions |     |     |     |
| @implements                                                                                               | 为生成的类实现接口                                                                                               | `@implements IDisposable`                                     |                                                                       |     |     |     |
| @inherits                                                                                                 | 对视图继承的类提供完全控制                                                                                       | `@inherits TypeNameOfClassToInheritFrom`                      |                                                                       |     |     |     |
| @inject                                                                                                   | 允许 Razor 页面将服务从[服务容器](https://www.bookstack.cn/read/asp/cc76df56cd0b1de2.md)注入到视图               | `@inject IConfiguration Configuration`                        |                                                                       |     |     |     |
| @layout                                                                                                   | 指定 Razor 组件的布局。布局组件用于避免代码重复和不一致                                                          | `@layout MasterLayout`                                        | 此方案仅适用于 Razor 组件 (.razor)                                    |     |     |     |
| @model                                                                                                    | 指定传递到视图或页面的模型类型                                                                                   | `@model TypeNameOfModel`                                      | 此方案仅适用于 MVC 视图和 Razor Pages (.cshtml)                       |     |     |     |
| @namespace                                                                                                | 设置生成的 Razor 页面、MVC 视图或 Razor 组件的类的命名空间                                                       | `@namespace Your.Namespace.Here`                              |                                                                       |     |     |     |
| @page                                                                                                     | 在 .cshtml 文件中表示该文件是 Razor Page; 指定 Razor 组件应直接处理请求（路由）                                  | `@page "/BlazorRoute"`                                        |                                                                       |     |     |     |
| @section                                                                                                  | 允许视图或页面将内容呈现在 HTML 页面的不同部分                                                                   |                                                               | 此方案仅适用于 MVC 视图和 Razor Pages (.cshtml)                       |     |     |     |
| @using                                                                                                    | 用于向生成的视图添加 C# `using` 指令                                                                             | `@using System.IO`                                            |                                                                       |     |     |     |
| @addTagHelper                                                                                             | 向视图提供标记帮助程序。                                                                                         |                                                               |                                                                       |     |     |     |
| @removeTagHelper                                                                                          | 从视图中删除以前添加的标记帮助程序。                                                                             |                                                               |                                                                       |     |     |     |
|@tagHelperPrefix | 指定标记前缀，以启用标记帮助程序支持并阐明标记帮助程序的用法。                                                   |                                                               |                                                                       |     |     |     |

指令属性：指令格式的HTML元素属性。以下指令尽在Razor组件（.razor）中使用。

| 指令                       | 说明                                                                     | 示例 | 备注 |
|:-------------------------- |:------------------------------------------------------------------------ |:---- |:---- |
| @attributes                | 允许组件呈现未声明的属性                                                 |      |      |
| @bind                      | 组件中的数据绑定通过 `@bind` 属性实现                                    |      |      |
| @on{EVENT}                 | Razor 为组件提供事件处理功能                                             |      |      |
| @on{EVENT}:preventDefault  | 禁止事件的默认操作                                                       |      |      |
| @on{EVENT}:stopPropagation | 停止事件的事件传播                                                       |      |      |
| @key                       | 使组件比较算法保证基于键的值保留元素或组件                               |      |      |
| @ref                       | 组件引用 (`@ref`) 提供了一种引用组件实例的方法，以便可以向该实例发出命令 |      |      |
| @typeparam             | 声明生成的组件类的泛型类型参数                                                                         |      |      |


