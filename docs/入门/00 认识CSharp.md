## 1. C# 
C#是其是一种安全、稳定、简单、优雅，在C及C++编程语言基础上衍生发展而来的面向对象的新的编程语言。程序员通过C#可以在Microsoft的NET平台上方便地建立各种应用程序，其与Java编程语言类似。

C# 特点
- **继承发展了C++功能** 
	C#不仅继承了C++类型安全检测及重载等强大功能，同时还提供了取代C++的ANSI和C预处理程序等功能的新功能，使类型安全性进一步提高。

-  **应用开发（PAD）迅速** 
	C#具备的支持快速开发（PAD）功能使其成为重要的开发语言。该功能能够极大地增加开发效率，让开发人员不必再进行无意义的重复性劳动，该功能可以从垃圾收集和指代等特性上表现出来。通过垃圾收集机制可以使开发人员在内存管理上变得相对容易，而通过指代功能则可以使开发人员直接调用函数。C#编程语言还解决了C++易产生程序错误的缺点，通过C#可以让开发人员使用较少代码编写出功能强大的应用程序，防止发生错误，有效缩短系统开发周期等。

- **语言使用自由** 
	C#编程可以充分享有使用自由，其能够与所有支持.NET的编程语言实现信息互换，并可随意继承与使用其他编程语言，节省了大量时间，提高了工作效率，无需改变语言各类即可实现.NET下相互交流

- **Web服务端组件强大** 
	采用C#进行Web编程时，Web服务端组件十分强大，其既有传统组件，同时还有可编程组件，能够实现自动连接服务功能，通过C#能够进行服务器端的组件编写，开展数据绑定等服务更加便捷简单。

- **实现跨平台操作**
	如今，各种互联网应用程序各类繁多，因此要求开发设计出来的应用程序要能够实现跨平台操作功能。通过C#编程即可实现此功能，其可以实现客户端在在PDA、手机等非PC装置客户端能够运行。

- **融合XML技术** 
	XML技术实现了与.NET的结合以后，C#编程也成为真正的网络编程，换而言之，C#与.NET可以说是专门为了XML进行设计的，C#程序员很容易通过C#内含的类应用XML技术。可以说C#使程序员编程更加自由，并使XML技术应用变得更加简单。


## 2. .Net
### 2.1 .Net
### 2.2 .Net Framework
### 2.3 .Net Core

## 3. IDE
### 3.1 Visual Studio
Microsoft Visual Studio（简称VS）是美国微软公司的开发工具包系列产品。VS是一个基本完整的开发工具集，它包括了整个软件生命周期中所需要的大部分工具，如UML工具、代码管控工具、集成开发环境(IDE)等等。所写的目标代码适用于微软支持的所有平台，包括Microsoft Windows、Windows Mobile、Windows CE、.NET Framework、.NET Compact Framework和Microsoft Silverlight 及Windows Phone。

!!!Note 
	初学者推荐使用VS.

## 3.2 Visual Studio Code
Microsoft Visual Studio Code（VSC）是 Microsoft 在2015年4月30日 Build 开发者大会上正式宣布一个运行于 Mac OS X、Windows 和 Linux 之上的，针对于编写现代 Web 和云应用的跨平台源代码编辑器，可在桌面上运行，并且可用于 Mac OS、Windows 和 Linux。它具有对 JavaScript，TypeScript 和 Node.js 的内置支持，并具有丰富的其他语言和运行时（例如 .NET 和 Unity ）扩展的生态系统。


# 4. HelloWorld
```C#
// 导入其他命名空间
using System

// 命名空间
namespace HelloWorld
{
	// 类名
    internal class Program
    {
	    // main函数
        static void Main(string[] args)
        {
	        // 打印语句
            Console.WriteLine("Hello, World!");
        }
    }
}
```

# 5. Document
[C# 文档 - 入门、教程、参考。 | Microsoft Learn](https://learn.microsoft.com/zh-cn/dotnet/csharp/) 

# 6. C#编程规范手册（Updating）