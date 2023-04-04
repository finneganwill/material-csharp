# 了解 LINQ

## 一、LINQ 是什么
语言集成查询（Language integrated query，LINQ）是 .Net 3.5 和 Visual Studio 2008 引入的功能强大的查询语言，是一系列直接将查询功能集成到 C# 语言的技术统称。例如，SQL 是一种结构化查询语言，用于保存和检索数据库中的数据。同样，LINQ 是 C＃和 VB.NET 中内置的结构化查询语法，用于从不同类型的数据源中检索数据。

在 C# 中可为以下对象编写 LINQ 查询：SQL Server 数据库、XML 文档、ADO.NET 数据集以及支持`IEnumerable` 或泛型 `IEnumerable<T>` 接口的任何对象集合。 此外，第三方也为许多 Web 服务和其他数据库实现提供了 LINQ 支持。

LINQ 查询将结果作为对象返回。它使您可以在结果集上使用面向对象的方法，而不必担心将不同格式的结果转换为对象。下面为 LINQ 的简单示例，您可以从中体会它的用法和作用：

示例：
```csharp
// 设置数据源
int[] scores = { 97, 92, 81, 60 };

// 定义LINQ查询表达式
IEnumerable<int> scoreQuery =
    from score in scores
    where score > 80
    select score;

// 执行查询
foreach (int i in scoreQuery)
{
    Console.Write(i + " ");
}

// Output: 97 92 81
```

!!! Tip
	在语法上，Linq 与 SQL 很相似，如果你掌握了SQL语法你可以很轻松上手 Linq。

LINQ的优势（[参考](https://www.cainiaojc.com/linq/why-linq.html)）：

-   **Familiar language（熟悉的语言）:** 开发人员不必为每种类型的数据源或数据格式学习新的查询语言。
-   **Less coding（更少的代码）:** 与更传统的方法相比，它减少了要编写的代码量。
-   **Readable code（代码可读性）:** LINQ使代码更具可读性，因此其他开发人员可以轻松地理解和维护它。
-   **Standardized way of querying multiple data sources（查询多个数据源的标准化方法）:** 相同的LINQ语法可用于查询多个数据源。
-   **Compile time safety of queries（查询的编译时安全性）:** 它在编译时提供对象的类型检查。
-   **IntelliSense support（智能感知支持）:** LINQ为通用集合提供了IntelliSense。
-   **Shaping data（数据形状）:** 您可以以不同形状检索数据。

## 二、LINQ 查询

### 01 LINQ查询过程
所有 LINQ 查询操作都由以下三个不同的操作组成：

1.  获取数据源（Data source）。
2.  创建查询（Query creation）。
3.  执行查询（Query execution）。

在 LINQ 中，查询的执行不同于查询本身，仅通过创建查询变量不会检索到任何数据。下图演示完整的查询操作：
![[LINQ查询.png]]
### 02 数据源
LINQ 支持诸多类型的数据源，包括 **SQL Server**、**XML文件**、**ADO.NET DataSet**、支持 `IEnumerable` 或泛型 `IEnumerable<T>` 接口的任何对象**集合**以及 LINQ 提供程序可用的任何其他格式的数据等。

示例中的数据源为数组，它隐式地支持泛型 `IEnumerable<T>` 接口，因此可以作为数据源进行LINQ查询。可查询类型不需要进行修改或特殊处理就可以用作 LINQ 数据源，如果源数据还没有作为可查询类型出现在内存中，则 LINQ 提供程序必须以此方式表示源数据。 例如，LINQ to XML 将 XML 文档加载到可查询的 [XElement](https://learn.microsoft.com/zh-cn/dotnet/api/system.xml.linq.xelement) 类型中：
```csharp
// Create a data source from an XML document.
// using System.Xml.Linq;
XElement contacts = XElement.Load(@"c:\myContactList.xml");
```

### 03 查询体
查询指定要从数据源中检索的信息。 查询还可以指定在返回这些信息之前如何对其进行排序、分组和结构化。 查询存储在查询变量中，并用查询表达式进行初始化。

目前需要注意的是，在 LINQ 中，查询变量本身不执行任何操作并且不返回任何数据。 它只是存储在以后某个时刻执行查询时为生成结果而必需的信息。

### 04 查询执行
查询执行分为延迟执行与立即执行。

**延迟执行** 
上述示例中采用的是延迟执行，查询过程延迟到 `foreach` 中，当代码执行至 `foreach` 时，才会进行查询。
```csharp
foreach (int i in scoreQuery)
{
    Console.Write(i + " ");
}
```
由于查询变量本身从不保存查询结果，因此可以根据需要随意执行查询。 例如，可以通过一个单独的应用程序持续更新数据库。 在应用程序中，可以创建一个检索最新数据的查询，并可以按某一时间间隔反复执行该查询以便每次检索不同的结果。

**立即执行** 
对一系列源元素执行聚合函数的查询首先循环访问这些元素。 `Count`、`Max`、`Average` 和 `First` 就属于此类查询，这些查询在执行时不使用显式 `foreach` 语句。
```csharp
var evenNumQuery =
    from num in numbers
    where (num % 2) == 0
    select num;

int evenNumCount = evenNumQuery.Count();
```

要强制立即执行任何查询并缓存其结果，可调用 [ToList](https://learn.microsoft.com/zh-cn/dotnet/api/system.linq.enumerable.tolist) 或 [ToArray](https://learn.microsoft.com/zh-cn/dotnet/api/system.linq.enumerable.toarray) 方法。
```csharp
List<int> numQuery2 =
    (from num in numbers
     where (num % 2) == 0
     select num).ToList();

// or like this:
// numQuery3 is still an int[]

var numQuery3 =
    (from num in numbers
     where (num % 2) == 0
     select num).ToArray();
```
此外，还可以通过在紧跟查询表达式之后的位置放置一个 `foreach` 循环来强制执行查询。 但是，通过调用 `ToList` 或 `ToArray`，也可以将所有数据缓存在单个集合对象中。