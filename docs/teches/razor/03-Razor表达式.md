# Razor表达式

## 一、语法规则
Razor语法由Razor标记、C# 和 HTML 组成，文件后缀名为 `.cshtml` 。文件中的Razor标记可以转换为HTML呈现。

1. Razor 代码块包含在 `@{...}` 中；
2. Razor 可以在HTML中解析内联表达式，表达式需以 `@` 符号开头（转义字符）；
3. Razor 代码语句用分号结束；
4. Razor 变量声明关键字为 `var`；

```csharp
<!-- 内联表达式 -->  
<p>The value of myMessage is: @myMessage</p>  
  
<!-- 代码块 -->  
@{  
	var greeting = "Welcome to our site!";  
	var weekDay = DateTime.Now.DayOfWeek;  
	var greetingMessage = greeting + " Here in Huston it is: " + weekDay;  
} 
<p>The greeting is: @greetingMessage</p>
```

## 二、