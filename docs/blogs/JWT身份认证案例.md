# Webapi配置JWT身份认证案例

## 1. 项目说明

- 目标：演示在项目中进行JWT身份认证配置操作
- Webapi 项目：案例中的项目是VS通过webapi模板创建的最小webapi项目
- .Net 版本：.Net 6.0
- Nuget包：配置JWT用到的包为 `Microsoft.AspNetCore.Authentication.JwtBearer`
- 测试：使用Postman，可以在请求头中添加Token验证请求是否成功

## 2. Demo

>基本流程
>
>1. 准备项目，添加Nuget包
>2. 创建API接口
>3. 配置身份验证
>4. 定义Token生成方法
>5. 配置认证接口
>6. 请求测试

### 2.1 准备项目
在VS中创建最小Webapi，然后添加 Nuget 包：`Microsoft.AspNetCore.Authentication.JwtBearer`

### 2.2 创建API接口

在Controller中定义项目需要的接口，比如下面定义了两个接口：

```csharp
// 数据访问接口
[HttpGet(Name = "GetWeatherForecast")]
public IEnumerable<WeatherForecast> Get()
{
	return Enumerable.Range(1, 5).Select(index => new WeatherForecast
	{
		Date = DateTime.Now.AddDays(index),
		TemperatureC = Random.Shared.Next(-20, 55),
		Summary = Summaries[Random.Shared.Next(Summaries.Length)]
	})
	.ToArray();
}

// 登录接口
[HttpPost("login")]
public IActionResult Login(string account)
{
	return Ok(token);
}
```

在没有启用身份验证之前，所有的接口都能被调用被返回结果。
### 2.3 配置身份验证
在项目的 `Program.cs` 文件中配置身份验证并启用：

```csharp title="nihao"
public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            
            // 配置身份验证
            builder.Services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = 
	                JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = 
	                JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                // 设置 JWT Bearer 选项
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    
                    // 验证签名秘钥，使用签名秘钥加密时应设为true
                    ValidateIssuerSigningKey = true,
                    // 获取签名秘钥
                    // 如果将普通字符串转换为字节数组，则应使用 Encoding.ASCII.GetBytes("secretKey")
                    // 如果将Base64编码字符串转换为字节数组，则应使用 Convert.FromBase64String(secretKey)
                    IssuerSigningKey = new SymmetricSecurityKey(
	                    Convert.FromBase64String("your_secret_key")
                    ),
                    // 验证存活时间，设置token存活时间时应设为true
                    ValidateLifetime = true,
                    // 验证发行者，payload中不设置issuer时应设为false
                    ValidateIssuer = false,
                    // 验证受众，payload中不设置audience时应设为false
                    ValidateAudience = false,
                    // 时钟偏移，用于纠正不同时区之间传输产生的时间偏移
                    ClockSkew = TimeSpan.Zero
                };
            });
            
		    // 启用身份验证
            app.UseAuthentication();
            
	        // 省略其他代码...
        }
    }
```

!!! Note
	代码中的 `your_secret_key` 为签名加密秘钥，可以分为对称密钥和非对称密钥两种类型。密钥的安全性非常重要，请确保密钥的机密性，以防止未授权的访问和篡改。<br><br>
	**一般建议将签名加密秘钥存储在安全的地方**，例如 *配置文件*，*环境变量* 或 *密钥管理系统* 中。<br><br> 
	**不建议直接在代码中硬编码密钥**，以防止意外泄露。请根据具体安全需求和最佳实践来选择和管理签名加密秘钥。
### 2.4 定义生成Token方法
包中不提供生成Token的方法，需要自己定义，以实现自定义传输数据。下面给出一个

## 3. 总结

[TokenValidationParameters](https://learn.microsoft.com/en-us/dotnet/api/microsoft.identitymodel.tokens.tokenvalidationparameters?view=msal-web-dotnet-latest)
