# Razor保留关键字

## 一、Razor关键字
-   `page` 
-   `namespace`
-   `functions`
-   `inherits`
-   `model`
-   `section`
-   `helper`（ASP.NET Core 当前不支持）

Razor 关键字使用 `@(Razor Keyword)` 进行转义（例如，`@(functions)`）。

## 二、C# Razor 关键字
-   `case`
-   `do`
-   `default`
-   `for`
-   `foreach`
-   `if`
-   `else`
-   `lock`
-   `switch`
-   `try`
-   `catch`
-   `finally`
-   `using`
-   `while`

C# Razor 关键字必须使用 `@(@C# Razor Keyword)` 进行双转义（例如，`@(@case)`）。 第一个 `@` 对 Razor 分析程序转义。 第二个 `@` 对 C# 分析器转义。

## 三、Razor 未使用的保留关键字

-   `class`