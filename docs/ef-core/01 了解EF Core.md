# 了解EF Core

## 一、EF Core 是什么
Entity Framework (EF) Core 是轻量化、可扩展、开源和跨平台版的常用 Entity Framework 数据访问技术，是一个 ORM 框架。

EF Core 可用作对象关系映射程序 (O/RM)，这可以实现以下两点：

-   使 .NET 开发人员能够使用 .NET 对象处理数据库。
-   无需再像通常那样编写大部分数据访问代码。

EF Core 支持多个数据库引擎。

!!! Note "ADO.NET、EF、EF Core" 
	🧲 ADO.NET 是微软开发的一个<mark style="background: #CACFD9A6;">对象数据库连接（Object Data Access）组件</mark>，它可以用于与各种关系型数据库进行交互，如 SQL Server、Access、Oracle、MySQL 等。ADO.NET 提供了一组接口，可以用于连接数据库、执行 SQL 查询、提取数据等操作。在 .NET Framework 中，ADO.NET 是最流行的数据访问组件之一，被广泛应用于桌面应用程序、Web 服务、游戏等领域。<br>
	🧲 EF 是一个<mark style="background: #CACFD9A6;">对象关系映射（Object-Relational Mapping，ORM）框架</mark>，<mark style="background: #CACFD9A6;">基于 ADO.NET 实现</mark>，在 EF 中，数据被映射为对象，每个对象都有一组属性和一个对应的数据类型。通过使用这些对象和属性，开发者可以更方便地操作和管理数据。EF 的核心是对象-关系映射（ORM）机制，通过使用 C# 的语法，可以更方便地操作数据库，实现数据库与应用程序之间的无缝连接。它可以帮助开发者减少大量的数据操作代码，提高开发效率和代码质量。EF 6 是专为 .NET Framework 设计的对象关系映射器<br>
	🧲 EF Core 是 EF 的一个分支，是 EF6 的完全重写，并附带于 NuGet 包中。与 EF6 相比，EF Core 提供了更好的跨平台支持，可以在 .NET Core 和 .NET Framework 上运行。EF Core 继承了 EF6 的优点，并对其进行了改进和扩展，提供了更好的性能和更灵活的数据访问方式。它通过<mark style="background: #CACFD9A6;">使用空数据访问模型和简化的 EF 实现</mark>，可以更方便地与非 SQL 数据源进行交互，如文件、XML 文件等。






## 二、安装 EF Core

## 三、第一个EF Core应用

## 四、ASP.NET Core 与 EF Core
