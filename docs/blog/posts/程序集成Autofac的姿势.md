---
date: 2023-11-28
authors:
  - finn
categories:
  - Autofac
---
# 程序集成Autofac的姿势

在 .NET 6 中，官方对 [ASP.NET](http://asp.net/) Core 应用程序的项目结构进行了调整和简化，生成的项目默认删除了传统的 `Startup.cs` 文件。对于某些项目（如 ASP.NET Core 3.x，Blazor Server等）较曾经集成第三方服务的方式发生了一些变化。

本文就 .NET 6 及更高版本的项目（没有Startup.cs文件）提供集成 Autofac 库的示例程序。本文包含示例代码。

<!-- more -->

[ASP.NET](http://asp.net/) Core 项目的早期版本中，`Startup.cs` 文件用于配置应用程序的启动过程、服务和中间件。然而，随着时间的推移，这个文件变得越来越臃肿，配置代码变得复杂且不易维护。

为了改进这个问题，.NET 6 引入了一个更现代化的方式来组织和配置应用程序。现在，主要的配置代码被移到了 `Program.cs` 文件中，这样可以更清晰地定义应用程序的启动逻辑。

通过将配置代码集中到 `Program.cs` 文件中，可以使应用程序的启动逻辑更加简洁和易于理解。此外，使用 .NET 6 的新特性，如 `WebApplication.CreateBuilder` 方法和 `app.MapControllers` 方法，可以更便捷地进行应用程序的配置和路由。虽然 `.NET 6` 删除了传统的 `Startup.cs` 文件，但你仍然可以在 `Program.cs` 文件中进行应用程序的配置和服务的注册，以满足你的需求。

>另外，你仍然可以在新项目中手动更改使用Startup.cs



