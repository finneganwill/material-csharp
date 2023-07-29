# ASP.NET Core项目Program.cs

在本文中，我们将学习了解 program.cs在asp.net Core中所扮演的角色。 这是我们配置Web Host的应用程序的入口。 program类配置应用程序基础结构，如Web Host，日志记录，依赖注入容器，IIS集成等。它们是由program类中Main方法的createdefaultbuilder方法创建，配置和构建的。

## 1. 项目创建的Program.cs

Program类包含的Main方法是ASP.NET Core应用的入口点。Main方法类似于控制台应用程序 的Main方法。这是因为所有.NET Core应用程序基本上都是控制台应用程序。我们通过控制台应用程序构建其他类型的应用程序，例如MVC Web应用程序或Razor page 应用程序。

## **Program类的主要目的是配置应用程序基础结构。**

Program类在启动时创建Web Host。然后，它配置日志记录、依赖注入容器、Kestrel Web服务器、IIS集成等。它还将框架服务添加到DI容器中，以便我们可以使用它。 Program类的代码是vs自动生成的，并且对于大多数项目来说很可能已经足够了。

## **什么是web host？**

Web host负责启动应用程序并运行它。 在应用程序启动时创建。 Web host创建一个服务器，该服务器侦听HTTP请求。 它配置请求管道（或中间件管道）。 另外，它设置了DI容器，我们在其中添加了服务。 管理服务的生命周期也是Web host的任务。

