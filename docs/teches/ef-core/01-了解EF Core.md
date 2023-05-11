# 了解EF Core

## 一、EF Core 是什么
Entity Framework (EF) Core 是轻量化、可扩展、开源和跨平台版的常用 Entity Framework 数据访问技术，是一个 ORM 框架。

EF Core 可用作对象关系映射程序 (O/RM)，这可以实现以下两点：

-   使 .NET 开发人员能够使用 .NET 对象处理数据库。
-   无需再像通常那样编写大部分数据访问代码。

EF Core 支持多种数据库引擎。

!!! Note "ADO.NET、EF、EF Core" 
	🧲 ADO.NET 是微软开发的一个<mark style="background: #CACFD9A6;">对象数据库连接（Object Data Access）组件</mark>，它可以用于与各种关系型数据库进行交互，如 SQL Server、Access、Oracle、MySQL 等。ADO.NET 提供了一组接口，可以用于连接数据库、执行 SQL 查询、提取数据等操作。在 .NET Framework 中，ADO.NET 是最流行的数据访问组件之一，被广泛应用于桌面应用程序、Web 服务、游戏等领域。<br>
	🧲 EF 是一个<mark style="background: #CACFD9A6;">对象关系映射（Object-Relational Mapping，ORM）框架</mark>，<mark style="background: #CACFD9A6;">基于 ADO.NET 实现</mark>，在 EF 中，数据被映射为对象，每个对象都有一组属性和一个对应的数据类型。通过使用这些对象和属性，开发者可以更方便地操作和管理数据。EF 的核心是对象-关系映射（ORM）机制，通过使用 C# 的语法，可以更方便地操作数据库，实现数据库与应用程序之间的无缝连接。它可以帮助开发者减少大量的数据操作代码，提高开发效率和代码质量。EF 6 是专为 .NET Framework 设计的对象关系映射器。<br>
	🧲 EF Core 是 EF 的一个分支，是 EF6 的完全重写，并附带于 NuGet 包中。与 EF6 相比，EF Core 提供了更好的跨平台支持，<mark style="background: #CACFD9A6;">可以在 .NET Core 和 .NET Framework 上运行</mark>。EF Core 继承了 EF6 的优点，并对其进行了改进和扩展，提供了更好的性能和更灵活的数据访问方式。它通过<mark style="background: #CACFD9A6;">使用空数据访问模型和简化的 EF 实现</mark>，可以更方便地与非 SQL 数据源进行交互，如文件、XML 文件等。

## 二、概念介绍
#### 模型
对于 EF Core，使用模型执行数据访问。模型由实体类和表示数据库会话的上下文对象（DbContext）构成。 上下文对象允许查询并保存数据。

创建模型的方法有：

1. 从现有数据库生成模型； 
2. 对模型手动编码，使其符合数据库；
3. 创建模型后，使用 [EF 迁移](https://learn.microsoft.com/zh-cn/ef/core/managing-schemas/migrations/)从模型创建数据库。 模型发生变化时，迁移可让数据库不断演进。

#### 查询

#### 保存

#### 注意事项

## 三、获取 EF Core
EF Core 以 NuGet 包的形式提供。 要将 EF Core 添加到应用程序，请安装适用于要使用的数据库提供程序的 NuGet 包。 要安装或更新 NuGet 包，可以使用 .NET Core 命令行界面 (CLI)、Visual Studio 包管理器对话框或 Visual Studio 包管理器控制台。

=== ".NET Core CLI"
	!!! Abstract ".NET Core CLI"
		1. 在操作系统的命令行中使用以下 .NET Core CLI 命令来安装或更新 EF Core SQL Server 提供程序：
			```powershell
			dotnet add package Microsoft.EntityFrameworkCore.SqlServer
			```
		2. 可以使用 `-v` 修饰符在 `dotnet add package` 命令中指明特定的版本。 例如，若要安装 EF Core 6.0.14 包，请将 `-v 6.0.14` 追加到命令中。

=== "VS NuGet Dialog"
	!!! Abstract "VS NuGet Dialog"
		1. 在VS菜单中选择“项目 -> 管理NuGet包”；
		2. 单击“浏览”或“更新”选项卡；
		3. 若要安装或更新 SQL Server 提供程序，请选择 `Microsoft.EntityFrameworkCore.SqlServer` 包并确认。

=== "VS NuGet Console"
	!!! Abstract "VS NuGet Console"
		1. 从 Visual Studio 菜单中选择“工具”>“NuGet 包管理器”>“包管理器控制台”；
		2. 若要安装 SQL Server 提供程序，请在包管理器控制台中运行以下命令：
			```powershell
			Install-Package Microsoft.EntityFrameworkCore.SqlServer
			```
		3. 若要更新提供程序，使用 `Update-Package` 命令；
		4. 若要指定特定版本，可以使用 `-Version` 修饰符。 例如，若要安装 EF Core 6.0.14 包，请将 `-Version 6.0.14` 追加到命令中。



