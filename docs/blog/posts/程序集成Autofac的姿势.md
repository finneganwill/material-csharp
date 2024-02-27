---
date: 2023-11-28
authors:
  - finn
categories:
  - DotNet
tags:
  - autofac
  - aspdotnet
---
# 程序集成Autofac的姿势

在 .NET 6 中，官方对 [ASP.NET](http://asp.net/) Core 应用程序的项目结构进行了调整和简化，生成的项目默认删除了传统的 `Startup.cs` 文件。对于某些项目（如 ASP.NET Core 3.x，Blazor Server等）较曾经集成第三方服务的方式发生了一些变化。

本文就 .NET 6 及更高版本的项目（没有Startup.cs文件）提供集成 Autofac 库的示例程序。本文包含示例代码。

<!-- more -->

[ASP.NET](http://asp.net/) Core 项目的早期版本中，`Startup.cs` 文件用于配置应用程序的启动过程、服务和中间件。然而，随着时间的推移，这个文件变得越来越臃肿，配置代码变得复杂且不易维护。

为了改进这个问题，.NET 6 引入了一个更现代化的方式来组织和配置应用程序。现在，主要的配置代码被移到了 `Program.cs` 文件中，这样可以更清晰地定义应用程序的启动逻辑。

通过将配置代码集中到 `Program.cs` 文件中，可以使应用程序的启动逻辑更加简洁和易于理解。此外，使用 .NET 6 的新特性，如 `WebApplication.CreateBuilder` 方法和 `app.MapControllers` 方法，可以更便捷地进行应用程序的配置和路由。虽然 `.NET 6` 删除了传统的 `Startup.cs` 文件，但你仍然可以在 `Program.cs` 文件中进行应用程序的配置和服务的注册，以满足你的需求。

>另外，你仍然可以在新项目中手动更改使用Startup.cs


## 为什么使用Autofac?

.NET 5 之后，Microsoft提供了内置的依赖注入容器，尽管官方声称推荐使用内置容器，但面对一些场景它仍然不能满足要求。下面一段内容来源与 Microsoft [依赖关系注入指南 - .NET | Microsoft Learn](https://learn.microsoft.com/zh-cn/dotnet/core/extensions/dependency-injection-guidelines#default-service-container-replacement)  ：

> 内置的服务容器旨在满足框架和大多数消费者应用的需求。 我们建议使用内置容器，除非你需要的特定功能不受它支持，例如：
> 
>  - *属性注入*
>  - *基于名称的注入*
>  - *子容器*
>  - *自定义生存期管理*
>  - *对迟缓初始化的 `Func<T>` 支持*
>  - *基于约定的注册*
> 
>  以下第三方容器可用于 ASP.NET Core 应用：
>  
>  - [Autofac](https://autofac.readthedocs.io/en/latest/integration/aspnetcore.html) 
>  - [DryIoc](https://www.nuget.org/packages/DryIoc.Microsoft.DependencyInjection) 
>  - [Grace](https://www.nuget.org/packages/Grace.DependencyInjection.Extensions) 
>  - [LightInject](https://github.com/seesharper/LightInject.Microsoft.DependencyInjection) 
>  - [Lamar](https://jasperfx.github.io/lamar/) 
>  - [Stashbox](https://github.com/z4kn4fein/stashbox-extensions-dependencyinjection) 
>  - [Simple Injector](https://docs.simpleinjector.org/en/latest/aspnetintegration.html) 

而Autofac是一个开源的轻量级的依赖注入容器，也是.net下比较流行的实现依赖注入的工具之一。

关于Autofac的一些链接：

- 官网：[Autofac: Home](https://autofac.org/)
- 英文文档：[Getting Started — Autofac 7.0.0 documentation](https://autofac.readthedocs.io/en/latest/getting-started/index.html) 
- 中文文档：[欢迎来到 Autofac 中文文档! — Autofac 4.0 documentation (autofac-.readthedocs.io)](https://autofac-.readthedocs.io/en/latest/) 


## 集成

在官方文档中已经提供了一些程序集的集成指南，你可以在这里浏览它们 [Application Integration — Autofac 7.0.0 documentation](https://autofac.readthedocs.io/en/latest/integration/index.html) .

### 1. 下载 Nuget 包

如果你使用的 Visual Studio，你可以使用Nuget包管理器进行下载，这是最简单的方式。请下载安装以下两个包

<figure markdown> 
    ![Autofac Packages](img/AutofacPackages.png){ width="750" }
    <figcaption>Autofac Packages</figcaption>
</figure>


### 2. 在Program.cs中更换默认容器

```csharp
public class Program
{
	 public static void Main(string[] args)
	 {
		//  var builder = WebApplication.CreateBuilder(args);
		
		/* Configure Autofac and register services. */
		// 更换容器为autofac
		builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory());
		
		// 注册服务
		builder.Host.ConfigureContainer<ContainerBuilder>(containerBuilder =>
		{
			// 注册一个泛型类
			containerBuilder.RegisterGeneric(typeof(Repository<>))
							.AsSelf()
							.InstancePerLifetimeScope();
							
			// 程序集扫描注册：对于程序集中以Service结尾的服务类都会被注册进容器
			containerBuilder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly())
							.Where(t => t.Name.EndsWith("Service"))
							.AsImplementedInterfaces()
							.InstancePerLifetimeScope();
		});
	 }
}

```

`builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory())` 是使用 Autofac 作为依赖注入容器的一种配置方式。它是在 .NET Generic Host 中使用 Autofac 的方法之一。在这个配置中，`builder` 是 `WebApplicationBuilder` 类型的实例，而 `Host` 属性是用于访问底层的 `IHostBuilder` 对象的。

`UseServiceProviderFactory()` 方法用于指定使用特定的依赖注入容器工厂。在这里，`new AutofacServiceProviderFactory()` 创建了一个 Autofac 的服务提供程序工厂。这将告诉主机使用 Autofac 作为依赖注入容器。

上述仅提供了两个注册服务组件的示例，更多的使用方式请参考官方文档。

