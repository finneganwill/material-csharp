---
authors:
  - finnegan
date: 2023-11-04
categories:
  - Vue
tags:
  - element-ui
---

# 正确认识ElementUI中prop的作用

在 Vue 中，通过使用 v-model 指令与表单组件实现表单数据的双向绑定。但是在 Element UI 中的 el-form 和 el-form-item 组件中，我们还需要使用 prop 属性来指定表单域对应的数据字段名。

本篇文章从该问题入手，介绍 Element UI 中的 prop 属性。

<!-- more -->

!!! Question "起源"
	**为什么`el-input`绑定了数据，`el-form` 和 `el-form-item` 还需要绑定？**
	

	在 Vue 中，表单数据是通过 v-model 指令与组件进行绑定的。在示例中，el-input 组件通过 v-model="formData.name" 和 formData 对象中的 name 字段进行了双向绑定。
	
	但是，在 Element UI 的 el-form 和 el-form-item 组件中，需要显式地指定表单域对应的数据字段名（即 prop 属性），这是因为 el-form 和 el-form-item 组件主要用于表单验证和提交操作。
	
	通过指定 prop 属性，可以将表单域与数据模型之间建立起联系，方便进行表单验证、数据提交等操作。例如，在表单验证时，我们可以根据表单域的 prop 属性定义验证规则，从而确保用户输入的数据符合要求。
	
	此外，通过指定 prop 属性，还可以建立对应关系，方便进行表单数据的初始化、重置等操作。这使得我们能够更加方便地操作表单数据，提高了开发效率。
	
	综上所述，虽然 el-input 组件已经通过 v-model 与表单数据进行了绑定，但是为了方便表单验证、数据提交等操作，我们仍然需要在 el-form-item 中指定 prop 属性来建立表单域与数据模型之间的联系。



## prop 属性的作用

在 Element UI 的表单组件中，prop 属性用于建立表单域与数据模型之间的联系。它表示表单域对应的数据字段名，可以与 el-form 组件中的 model 属性配合使用，将表单数据与表单域进行绑定。

例如，在 el-form-item 中指定 prop 属性如下：

```html
<el-form :model="formData" ref="form">   
	<el-form-item label="姓名" prop="name">     
		<el-input v-model="formData.name"></el-input>   
	</el-form-item> 
</el-form>
```

在这个例子中，prop 属性的值为 "name"，表示该表单域对应的数据字段是 formData 对象中的 name 字段。当用户在输入框中输入姓名时，`formData.name` 的值也会相应地更新。同时，如果  `formData.name`  发生变化，输入框中的内容也会自动更新。

通过 prop 属性，我们可以为表单域建立与数据模型之间的联系，方便进行表单验证、数据提交等操作。

## prop 属性的应用

在 Element UI 中，prop 属性主要应用于以下几个方面：

### 1. 表单验证

通过指定 prop 属性，我们可以为表单域定义验证规则，确保用户输入的数据符合要求。例如，以下是一个包含两个表单域的 el-form 组件：

```html
<el-form :model="formData" :rules="formRules" ref="form">   
	<el-form-item label="用户名" prop="username">     
		<el-input v-model="formData.username"></el-input>   
	</el-form-item>   
	<el-form-item label="密码" prop="password">    
		<el-input type="password" v-model="formData.password"></el-input>   
	</el-form-item> 
</el-form>
```

在这个例子中，我们通过在 el-form 上指定 rules 属性来设置整个表单的验证规则。同时，在每个 el-form-item 中也通过 prop 属性分别指定了 username 和 password 这两个表单域的验证规则。

### 2. 表单初始化

通过指定 prop 属性，我们可以建立表单域与数据模型之间的联系，方便进行表单数据的初始化。例如，以下是一个包含两个表单域的 el-form 组件：

```html
<el-form :model="formData" ref="form">   
	<el-form-item label="姓名" prop="name">     
		<el-input v-model="formData.name"></el-input>   
	</el-form-item>   
	<el-form-item label="年龄" prop="age">     
		<el-input type="number" v-model="formData.age"></el-input>   
	</el-form-item> 
</el-form>
```


在这个例子中，我们通过在 el-form 组件上指定 model 属性，将表单数据与 formData 对象进行了双向绑定。同时，在每个 el-form-item 中也通过 prop 属性分别指定了 name 和 age 这两个表单域对应的数据字段。

在组件初始化时，可以通过设置 formData 的初始值，来自动为每个表单域初始化默认值。例如，以下是设置 formData 初始值的代码：

```javascript
data() {   
	return {     
		formData: {       
			name: '张三',       
			age: 18     
		}   
	} 
},
```

### 3. 表单提交

通过指定 prop 属性，我们可以建立表单域与数据模型之间的联系，方便进行表单数据的提交。例如，以下是一个包含两个表单域的 el-form 组件：

```html
<el-form :model="formData" ref="form" @submit="onSubmit">   
	<el-form-item label="姓名" prop="name">     
		<el-input v-model="formData.name"></el-input>   
	</el-form-item>   
	<el-form-item label="年龄" prop="age">     
		<el-input type="number" v-model="formData.age"></el-input>   
	</el-form-item>   
	<el-form-item>     
		<el-button type="primary" native-type="submit">提交</el-button>   
	</el-form-item> 
</el-form>
```

在这个例子中，我们通过在 el-form 组件上指定 model 属性，将表单数据与 formData 对象进行了双向绑定。同时，在每个 el-form-item 中也通过 prop 属性分别指定了 name 和 age 这两个表单域对应的数据字段。

当用户提交表单时，可以在 `onSubmit` 方法中获取 formData 中的数据，进行相关的数据处理和提交操作。例如，以下是 `onSubmit` 方法的代码：

```javascript
methods: {   
	onSubmit() {     
		console.log(this.formData) // 输出表单数据   
	} 
}
```

通过以上三个方面的应用，我们可以更加方便地操作表单数据，提高开发效率。同时，通过学习和掌握 prop 属性的使用，可以更好地理解和运用 Vue 和 Element UI 的相关知识点。