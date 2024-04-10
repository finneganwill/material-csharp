## browserPrint

:pencil: **功能描述** 

调用浏览器打印窗口

:seedling: **参数** 


- `hpt`: 打印核心对象
- `printData`: object, 打印数据
- `batchNum`: number, 批量数量，默认为 1

:fries: **返回值** 

None

:exploding_head: **示例** 

=== "Global"
	
	```javascript
	// 浏览器打印
	this.$browserPrint(this.hpt, {});
	
	// 浏览器批量打印
	this.$browserPrint(this.hpt, {}, 5);
	```

=== "Scope"

	```html
	<script>
	import { VhipPrint } from 'vhip-easybuild-api'
	epxort default(){
		mounted(){
			VhipPrint.browserPrint(this.hpt, {}, 5);
		}
	}
	</script>
	```

---
