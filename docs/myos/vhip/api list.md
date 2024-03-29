# Api

!!! Abstract "简介"

	vhip-easybuild-api 是对打印套件 [vue-plugin-hiprint](https://gitee.com/CcSimple/vue-plugin-hiprint#%E5%85%B3%E4%BA%8E%E6%AD%A4%E6%8F%92%E4%BB%B6) 构建过程进行二次封装的函数库，你可以使用该包来简化代码，避免项目代码的冗长。

## 简介

封装的函数按功能性质划分到四个模块中，分别为：构建（Builder）打印（Printer）开发辅助（Assistant）以及一些工具（Util）。关于它们你可以通过下表来了解：

| 功能性质 | 模块        | 全局导入标识 | 说明                                                |
|:-------- |:----------- |:------------ |:--------------------------------------------------- |
| 构建     | VhipBuilder | build        | 包含用来构建打印套件的api，是使用打印套件的核心函数 |
| 打印     | VhipPrinter | print             | 包含调用打印以及打印相关的api，通过这些函数完成打印、导出PDF、纸张选择等功能                                                    |
| 辅助     | VhipAsst            | assist             | 包含一些辅助程序开发的api，如获取模板json，获取HTML等，你可以在程序开发时使用到它们                                                    |
| 工具     | VhipUtil            | util             | 包含一些工具api，如选择图片、导出数据到文件等                                                    |
关于 api 具体的使用和介绍，请浏览相应的Section.

!!! warning

	导入后就可以使用这些函数了，需要注意的是：
	
	1. 对于 Build 函数通常需要在 **mounted** 中使用
	2. 对于 ==全局== 引入方式，其引用方式为 **`this.$functionName()`**, 即需要添加 $ 前缀
	3. 对于 ==局部== 引入方式，其引用方式为 **`ModuleName.functionName()`**, 即通过模块名调用


## Build

- [:octicons-link-16: buildElemsByHtml](./api/build.md/#buildelemsbyhtml)
- [:octicons-link-16: buildElemsByUlist](./api/build.md/#buildelemsbyulist)
- [:octicons-link-16: createCoreObj](./api/build.md/#createcoreobj)
- [:octicons-link-16: createElemsGroup](./api/build.md/#createelemsgroup)
- [:octicons-link-16: createProvider](./api/build.md/#createprovider)
- [:octicons-link-16: design](./api/build.md/#design)
- [:octicons-link-16: initProviders](./api/build.md/#initproviders)


## Print

## Assist

## Util