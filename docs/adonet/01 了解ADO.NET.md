# 了解ADO.NET

## 一、ADO.NET 是什么？
### 01 ADO.NET 简介

**ADO.NET** 是一组向 .NET Framework 程序员公开数据访问服务的类。

ADO.NET 为创建分布式数据共享应用程序提供了一组丰富的组件。 它提供了对关系数据、XML 和应用程序数据的访问，是 .NET Framework 中不可缺少的一部分。 ADO.NET 支持多种开发需求，包括创建由应用程序、工具、语言或 Internet 浏览器使用的前端数据库客户端和中间层业务对象。

ADO.NET 提供对诸如 SQL Server 和 XML 这样的数据源以及通过 OLE DB 和 ODBC 公开的数据源的一致访问。 共享数据的使用方应用程序可以使用 ADO.NET 连接到这些数据源，并可以检索、处理和更新其中包含的数据。这些结果或者被直接处理，放在 ADO.NET `DataSet` 对象中以便以特别的方式向用户公开，并与来自多个源的数据组合；或者在层之间传递。 `DataSet` 对象也可以独立于 .NET Framework 数据提供程序，用于管理应用程序本地的数据或源自 XML 的数据。

!!! Tip
	ADO.NET 向编写托管代码的开发人员提供类似于 ActiveX 数据对象 (ADO) 向本机组件对象模型 (COM) 开发人员提供的功能。 ADO.NET 在 .NET Framework 中提供最直接的数据访问方法。建议您在 .NET 应用程序中使用 ADO.NET 而不使用 ADO 来访问数据。

### 02 ADO.NET体系结构

ADO.NET 用于访问和操作数据的两个主要组件是 **.NET Framework 数据提供程序（Data Provider）** 和 **DataSet**。

#### Data Provider
.NET Framework 数据提供程序是专门为数据操作以及快速、只进、只读访问数据而设计的组件。 `Connection` 对象提供到数据源的连接。 使用 `Command` 对象可以访问用于返回数据、修改数据、运行存储过程以及发送或检索参数信息的数据库命令。 `DataReader` 可从数据源提供高性能的数据流。 最后，`DataAdapter` 在 `DataSet` 对象和数据源之间起到桥梁作用。 `DataAdapter` 使用 `Command` 对象在数据源中执行 SQL 命令以向 `DataSet` 中加载数据，并将对 `DataSet` 中数据的更改协调回数据源。

#### DataSet
ADO.NET `DataSet` 是专门为独立于任何数据源的数据访问而设计的。 因此，它可以用于多种不同的数据源，用于 XML 数据，或用于管理应用程序本地的数据。 `DataSet` 包含一个或多个 [DataTable](https://learn.microsoft.com/zh-cn/dotnet/api/system.data.datatable) 对象的集合，这些对象由数据行和数据列以及有关 `DataTable` 对象中数据的主键、外键、约束和关系信息组成。

#### ADO.NET 体系结构
![[ADO.NET体系结构.png]]

## 二、LINQ和ADO.NET

### 01 ADO.NET LINQ 技术
有三种独立的 ADO.NET 语言集成查询 (LINQ) 技术：LINQ to DataSet、LINQ to SQL 和 LINQ to Entities。 

- LINQ to DataSet 提供丰富的且针对 [DataSet](https://learn.microsoft.com/zh-cn/dotnet/api/system.data.dataset) 优化的查询；
- LINQ to SQL 可用于直接查询 SQL Server 数据库架构； 
- LINQ to Entities 可用于查询实体数据模型。

![[ADO.NET LINQ 技术.png]]

### 02 LINQ to DataSet
DataSet 是用作 ADO.NET 构建基础的离线编程模型的关键要素，其使用非常广泛。 LINQ to DataSet 使开发人员能够使用许多其他数据源可用的相同查询构建机制，在 DataSet 中内置更丰富的查询功能。

### 03 LINQ to SQL
LINQ to SQL 是适合不需要映射到概念模型的开发人员使用的有用工具。 使用 LINQ to SQL 可以直接在现有数据库架构上使用 LINQ 编程模型。 开发人员可以使用 LINQ to SQL 生成用于表示数据的 .NET Framework 类。 这些生成的类直接映射到数据库表、视图、存储过程和用户定义的函数，而不映射到概念数据模型。

借助 LINQ to SQL，除了其他数据源（例如 XML）外，开发人员还可以使用与内存中集合和 DataSet 相同的 LINQ 编程模式直接针对存储架构编写代码。

### 04 LINQ to Entities
大多数应用程序目前是在关系数据库之上编写的。 有时这些应用程序将需要与以关系形式表示的数据进行交互。 数据库架构并不总是构建应用程序的理想选择，并且应用程序的概念模型与数据库的逻辑模型不同。 实体数据模型是可用于对特定域的数据进行建模的概念数据模型，以便应用程序可作为对象与数据交互。 

通过实体数据模型，在 .NET 环境中将关系数据作为对象公开。 这使得对象层成为实现 LINQ 支持的理想目标，开发人员可以采用生成业务逻辑所用的语言来构建数据库查询。 此功能称为 LINQ to Entities。