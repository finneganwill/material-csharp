# LINQ 简介

## 一、LINQ 是什么
语言集成查询（Language integrated query，LINQ）是 .Net 3.5 和 Visual Studio 2008 引入的功能强大的查询语言。LINQ 可与 C＃ 或 Visual Basic 一起使用，以查询不同的数据源。它集成在C＃或VB中，从而消除了编程语言和数据库之间的不匹配，并为不同类型的数据源提供了单个查询接口。

例如，SQL是一种结构化查询语言，用于保存和检索数据库中的数据。同样，LINQ 是 C＃和 VB.NET中内置的结构化查询语法，用于从不同类型的数据源（例如集合，ADO.Net DataSet，XML Docs，Web Server，MS SQL Server 和 其他数据库）中检索数据。

LINQ 查询将结果作为对象返回。它使您可以在结果集上使用面向对象的方法，而不必担心将不同格式的结果转换为对象。下面为 LINQ 的简单示例，您可以从中体会它的用法和作用：

示例：
```csharp
// 数据源
string[] names = {"Bill", "Steve", "James", "Mohan" };

// LINQ查询 
var myLinqQuery = from name in names
                where name.Contains('a')
                select name;
    
// 查询执行
foreach(var name in myLinqQuery)
    Console.Write(name + " ");
```


LINQ的优势（[参考](https://www.cainiaojc.com/linq/why-linq.html)）：

-   **Familiar language（熟悉的语言）:** 开发人员不必为每种类型的数据源或数据格式学习新的查询语言。
-   **Less coding（更少的代码）:** 与更传统的方法相比，它减少了要编写的代码量。
-   **Readable code（代码可读性）:** LINQ使代码更具可读性，因此其他开发人员可以轻松地理解和维护它。
-   **Standardized way of querying multiple data sources（查询多个数据源的标准化方法）:** 相同的LINQ语法可用于查询多个数据源。
-   **Compile time safety of queries（查询的编译时安全性）:** 它在编译时提供对象的类型检查。
-   **IntelliSense support（智能感知支持）:** LINQ为通用集合提供了IntelliSense。
-   **Shaping data（数据形状）:** 您可以以不同形状检索数据。

## 二、.NET Linq API
对于实现了 `IEnumerable <T>` 或 `IQueryable <T>` 接口的类可以编写LINQ查询，`System.Linq` 命名空间包括下列类和接口要求对LINQ查询。