## buildElemsByHtml

:pencil: **功能描述** 

按自定义 HTML 的方式构建拖拽元素，自定义的 HTML 元素需要包含 `class="ep-draggable-item"` 属性以及 `tid` 属性.

:seedling: **参数** 

None

:fries: **返回值** 

None

:exploding_head: **示例** 

=== "Global"

	```javascript
	this.$buildElemsByHtml();
	```

=== "Scope"

	```html
	<script>
	import {VhipBuild} from 'vhip-easybuild-api'
	epxort default(){
		mounted(){
			VhipBuild.buildElemsByHtml();
		}
	}
	</script>
	```

## buildElemsByUlist

:pencil: **功能描述** 

按无序列表的方式构建拖拽元素

:seedling: **参数** 

- `providerName`: string, 已初始化的 Provider 的名称
- `containerKey`: string, 用来渲染无序列表的容器 [id]("需包含 #") 或 [class]("需包含 .") 


:fries: **返回值** 

None

:exploding_head: **示例** 

=== "Global"

	```js
	this.$buildElemsByUlist('defaultModule', '#default-elements-box'); //(1)
	```

	1. 默认元素的 privderName 为 **defaultModule**; 这里假设存在一个 id 为 **default-elements-box** 的 div;

=== "Scope"

	```html
	<script>
	import {VhipBuild} from 'vhip-easybuild-api'
	epxort default(){
		mounted(){
			VhipBuild.buildElemsByUlist('defaultModule', '#default-elements-box'); //(1)
		}
	}
	</script>
	```

	1. 默认元素的 privderName 为 **defaultModule**; 这里假设存在一个 id 为 **default-elements-box** 的 div;

## createCoreObj

:pencil: **功能描述** 

创建核心对象（PrintTemplate）。该函数是构建过程必须调用的，返回的核心对象会在实现打印等功能时使用。

:seedling: **参数** 

- `options`: object, 配置项参数
	- `options.settingContainer`: string, *设置面板* 的容器，你需要传入该参数，除非你 *不想* 使用设置面板
	- `options.onImageChooseClick`: function, 图片元素选择图片时的回调，默认已经实现，你不需要传入该参数，除非你想重写逻辑
	- `options.template`: object, 初始加载的打印模板，可以是js对象或json


:fries: **返回值** 

- `PrintTemplate` 实例对象

:exploding_head: **示例** 

=== "Global"

	```js
	const hpt = this.$createCoreObj({ settingContainer: "#setting-box" }); //(1)
	```
	
	1. 返回值将会在后续使用，可以赋值给 vue data 数据项；这里假设存在一个 id 为 setting-box 的 div 作为容器；

=== "Scope"

	```html
	<script>
	import { VhipBuild } from 'vhip-easybuild-api'
	epxort default(){
		mounted(){
			this.hpt = VhipBuild.createCoreObj({ settingContainer: "#setting-box" }); //(1)
		},
		data(){
			hpt:{}	
		}
	}
	</script>
	```
	
	1. 返回值将会在后续使用，可以赋值给 vue data 数据项；这里假设存在一个 id 为 setting-box 的 div 作为容器；


## createElemsGroup

:pencil: **功能描述** 

用于创建元素分组，通常一个 provider 可以包含多个 Group

:seedling: **参数** 

- `groupName`: string, 分组名称，使用无序列表方式渲染时将会显示该名称
- `elements`: Array, 元素数组

:fries: **返回值** 

- `PrintElementTypeGroup` 实例对象

:exploding_head: **示例** 

=== "Global"

	```js
	<script>
	import myElement from "myElement.js";
	export default(){
		mounted(){
			const myGroup = this.$createElemsGroup('我的分组',elements);
			// next steps
		}
	}
	</script>
	```


=== "Scope"

	```js
	<script>
	import myElement from "myElement.js";	
	import { VhipBuild } from 'vhip-easybuild-api'
	export default(){
		mounted(){
			const myGroup = VhipBuild.createElemsGroup('我的分组',elements);
			// next steps
		}
	}
	</script>
	```


=== "myElements.js"

	```js
	const myElements = [
		{
			"tid": 'myElements.text',
			"text": '我的文本',
			"title": '我的文本',
			"type": 'text',
		}
	]
	export default myElements;
	```


## createProvider

:pencil: **功能描述** 

用于自定义拖拽元素 Provider

:seedling: **参数** 

- `proivderName`: string, 你会在使用无序列表方式渲染元素时用到这个值，如默认元素的名称为 defaultModule
- `...groups`: object, 不定参数, createElemsGroup 返回的 Group 实例

:fries: **返回值** 

- Provider 对象

:exploding_head: **示例** 

=== "Global"

	```html
	<script>
	export default(){
		mounted(){
			const myGroup1 = this.$createElemsGroup('我的分组1',elements);
			const myGroup2 = this.$createElemsGroup('我的分组2',elements);
			const myProvider = this.$createProvider("myProvider", myGroup1,myGroup2);
			// next steps
		}
	}
	</script>
	```

=== "Scope"

	```js
	<script>
	import { VhipBuild } from 'vhip-easybuild-api'
	export default(){
		mounted(){
			const myGroup1 = this.$createElemsGroup('我的分组1',elements);
			const myGroup2 = this.$createElemsGroup('我的分组2',elements);
			const myProvider = VhipBuild.createProvider("myProvider", myGroup1,myGroup2);
			// next steps
		}
	}
	</script>
	```


## design

:pencil: **功能描述** 

设计画布，构建打印功能的最后一个步骤，在指定容器中设计打印画布

:seedling: **参数** 

- `hiprintTemplate`: object, createCoreObj 创建的核心对象
- `containerKey`: string, 画布容器的 [id]("需包含 #") 或 [class]("需包含 .") 
- `showGrid`: boolean, 是否显示网格，默认为 `true` 

:fries: **返回值** 

None

:exploding_head: **示例** 

=== "Global"
	
	```js
	this.$design(this.hpt, "#canvas-box"); //(1)

	// 不显示网格
	this.$design(this.hpt, "#canvas-box", false);
	```
	
	1. hpt 为核心对象；假设存在一个 id 为 canvas-box 的 div 元素


=== "Scope"

	```js
	<script>
	import { VhipBuild } from 'vhip-easybuild-api'
	export default(){
		mounted(){
			VhipBuild.design(this.hpt, "#canvas-box"); //(1)
			// next steps
		}
	}
	</script>
	```
	
	1. hpt 为核心对象；假设存在一个 id 为 canvas-box 的 div 元素

## initProviders

:pencil: **功能描述** 

初始化元素提供程序 Provider

:seedling: **参数** 

- `providers`: object | object[], 元素提供程序对象或其数组
- `initDefault`: boolean, 是否初始化默认元素提供程序，默认为 `true` 

:fries: **返回值** 

None

:exploding_head: **示例** 

=== "Global"

	```js
	// 仅初始化默认元素提供程序
	this.$initProviders();
	
	// 初始化 myProvider 和 默认元素提供程序
	this.$initProviders(myProvider); // (1)
	
	// 仅初始化 myProvider
	this.$initProviders(myProvider, false);
	```
	
	1. myProvider 由 createProvider 创建

=== "Scope"

	```js
	<script>
	import { VhipBuild } from 'vhip-easybuild-api'
	export default(){
		mounted(){
			VhipBuild.initProviders(myProvider); //(1)
			// next steps
		}
	}
	</script>
	```
	
	1. myProvider 由 createProvider 创建
