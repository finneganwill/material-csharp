# vhip-easybuild-api

!!! Abstract "简介"

	vhip-easybuild-api 是对打印套件 [vue-plugin-hiprint](https://gitee.com/CcSimple/vue-plugin-hiprint#%E5%85%B3%E4%BA%8E%E6%AD%A4%E6%8F%92%E4%BB%B6) 构建过程进行二次封装的函数库，你可以使用该包来简化代码，避免项目代码的冗长。

## 安装 Install

使用 npm 进行安装，执行以下命令：

```bash
npm install vhip-easybuild-api
```


## 导入 Import

### 全局引用

全局引用可以使你在任何组件中使用这些函数，你可以一次性导入全部或这按需导入部分（在 Vue 项目的 main.js 中）：


```javascript title="main.js"
// 1. 全部导入：一次性导入所有函数
import { EasyVhip } from 'vhip-easybuild-api';
Vue.use(EasyVhip, { autoConnect: false }); // autoConnect 是否自动连接打印客户端，默认true

// 2. 按需导入：有选择地导入需要使用地模块
// 可用模块名：VhipBuilder, VhipPrinter, VhipAsst, VhipUtil
import { VhipBuilder,VhipPrinter } from 'vhip-easybuild-api';
Vue.use(VhipBuilder);
Vue.use(VhipPrinter);

// 另外，我们提供了另一种方式，你可以通过参数配置的方式部分引入
import { EasyVhip } from 'vhip-easybuild-api';
Vue.use(EasyVhip, {
    modules: ['build','print','assist','util'], // 需要导入的模块，可选，默认全部导入
    autoConnect: false // autoConnect 是否自动连接打印客户端，默认true
});

```

### 局部引用
局部导入可以避免全局函数名污染，只在当前组件下使用导入的函数（在组件 `<script>` 中）：

  

```javascript title="component.vue"
<script>
import { VhipBuilder, VhipPrinter, VhipAsst, VhipUtil } from 'vhip-easybuild-api';

export default {
	mounted(){
		// use apis ...
	},
}
</script>
```

> 局部导入无法一次性导入所有函数，下面的局部导入是无效的：
> `import { EasyVhip } from 'vhip-easybuild-api';` 


## 使用 Use

!!! warning

	请确保你的项目已经配置好 [vue-plugin-hiprint](https://gitee.com/CcSimple/vue-plugin-hiprint#%E5%85%B3%E4%BA%8E%E6%AD%A4%E6%8F%92%E4%BB%B6) 插件，保证它的正常工作。

导入后就可以使用这些函数了，需要注意的是：

1. 对于 Build 函数通常需要在 **mounted** 中使用
2. 对于 ==全局== 引入方式，其引用方式为 **`this.$functionName()`**, 即需要添加 $ 前缀
3. 对于 ==局部== 引入方式，其引用方式为 **`ModuleName.functionName()`**, 即通过模块名调用

你可以通过 Api 或 Tutorial 了解更多.