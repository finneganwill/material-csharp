1. # Vue 项目结构
    

1. ## 项目结构
    

1. ### 创建项目
    

```PowerShell
// 安装脚手架
npm install -g @vue/cli

// 创建项目
create vue helloworld
```

2. ### 项目结构
    

- `node_modules` Vue项目运行依赖文件
    
- `public` 资源文件夹
    
    - `index.html` 入口HTML
        
- `src` 源码
    
    - `assets` 静态资源文件
        
    - `components` Vue组件
        
    - `App.vue` 一个Vue组件
        
- `.gitignore` Git 忽略文件
    
- `package.json` 信息描述文件
    

![](https://jkscoa9do6.feishu.cn/space/api/box/stream/download/asynccode/?code=ZGRmMmI5YWQ4NTBiNTRhYmNjOGRjMjVkY2NkYWM1OGVfV2N6eW5xMU9idThobk42YnpmQzlxRzRmeGNqYlNKUG5fVG9rZW46TEFSdGJ6dlgxb3owWTd4ZjdDRmNuRVBsbkVnXzE2OTQxMzc4NTA6MTY5NDE0MTQ1MF9WNA)

2. ## .vue文件结构
    

1. ### .vue
    

```HTML
<template>
    <!-- HTML 页面 -->
</template>

<script>
    // js 代码
</script>

<style scoped>
   <!--  css 样式 -->
</style>
```

  

2. ### script
    

`<script></script>` 标签用于存放 js 代码，在Vue中，可以包含以下内容：

- 导入（import）
    
- 组件（components）
    
- 依赖注入（provide，inject）
    
- 数据传递（props）
    
- 数据（data）
    
- 计算属性（computed）
    
- 监听器（watch）
    
- 方法（methods）
    
- 生命周期钩子（created、mounted、updated、destroyed、...）
    

```HTML
<script>
// 导入组件
import MyComponent from "./my-component.vue";

export default {
    // 组件
    components: {
        MyComponent,
    }
    
    // 依赖注入（祖先 -> 后代）
    provide: {
        key: value,
        Afunction(){},
    }
    inject: [
        'key',
        'funtionName',
    ],
    
    // 数据传递（父 -> 子）
    // 在子组件中声明props，然后使用；父组件只需要确保存在 pAttr 数据
    props: [
        "pAttr",
    ],
    
    // 数据
    data() {
        return {
            key: value,
        }
    },
    
    // 计算属性
    computed: {
        AFunction() {}，
    },
    
    // 监听器
    watch: {
        attrKey : function () {}，// attrKey 是被监听的属性
    }
    
    // 方法
    methods: {
        AFunction() {}，
    },
    
    // 生命周期钩子函数
    beforeCreate() {},
    created() {},
    beforeMount() {},
    mounted() {},
    beforeUpdate() {},
    updated() {}, // 不要在 updated 钩子中更改组件的状态，这可能会导致无限的更新循环！
    beforeDestroy() {},
    destroyed() {}
}
</script>
```

  

2. # Vue 语法
    

> Vue 遵循MVVM模式，框架充当了 MVVM 开发模式中的 ViewModel 层，负责 View 和 Model 之间通信的桥梁。在使用 Vue 框开发的时候，只需要关心 View 层的 HTML 代码和 Model 层的 JavaScript 逻辑就可以了。

1. ## 数据
    

1. ### data 选项
    

`data(){}` 用于定义数据属性，这些数据可以在组件的模板中使用，并且会被 Vue 实例进行**双向绑定**处理。

```HTML
<script>
export default {
  data() {
    return {
      message: 'Hello, Vue!'
    }
  },
}
</script>
```

  

包装：对于不同模块的数据可以包装给不同的变量，然后再返回。

```HTML
<script>
export default {
    data() {
        const name = {
          firstName: '小明',
          lastName: '张'
        }
        
        const age = 18，
    
        return {
            ...name,
            ...age,
        }
    },
}
</script>
```

  

2. ### this 访问
    

在vue中，export default 中的内容会被注册到 this 中，在数据选项中定义的内容，在组件实例上下文中可以通过 `this.` 进行访问。

```HTML
<template>
  <div>
    <p>{{ message }}</p>
    <button @click="showMessage">Show Message</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: 'Hello, Vue!'
    }
  },
  methods: {
    showMessage() {
      console.log(this.message); // 通过this访问message
    }
  }
}
</script>
```

  

2. ## 插值
    

1. ### 文本差值
    

**语法**：使用 `{{ }}` 可以将文本变量显示。

```HTML
<p>Message：{{ msg }} </p>
```

  

2. ### HTML插值
    

默认情况下，使用大括号插值会按字符串处理，如果在插入HTML代码，会原样显示不会进行解析。想要实现将HTML代码解析成DOM，则需要使用 `v-html` 指令。

**语法：**

```HTML
<span v-html="rawHtml"></span>
```

**示例：**

![](https://jkscoa9do6.feishu.cn/space/api/box/stream/download/asynccode/?code=YzFkZjkyZDk5N2Q0NTkzNTU0NTA4MzAwNzU4ZjM4ZjZfVndjMEhWSEhiOUhjMWVRQzJ6M0tCY2xXOEU5ajhTNW5fVG9rZW46V01OY2JObTl1b0s1Z2V4enBlZWM1dmtIbk9kXzE2OTQxMzc4NTA6MTY5NDE0MTQ1MF9WNA)

```HTML
<template>
  <p>Using text interpolation: {{ rawHtml }}</p>
  <p>Using v-html directive: <span v-html="rawHtml"></span></p>
</template>

<script>
export default{
  data(){
    return{
      rawHtml: '<span style="color: red">This should be red.</span>',
    }
  }
}
</script>
```

3. ### 属性绑定
    

如果想将一个元素的属性与数据绑定，可以使用 `v-bind` 指令。元素的属性会随数据的改变而改变，反之亦然。

**语法**：

```HTML
<div v-bind:id="dynamicId"></div>

<!--Vue 提供简写语法，省略 v-bind ,直接使用冒号 -->
<div :id="dynamicId"></div>
```

> 属性绑定允许使用多个值
> 
> ```HTML
> const objectOfAttrs = {
>   id: 'container',
>   class: 'wrapper'
> }
> 
> <div v-bind="objectOfAttrs"></div>
> ```

  

4. ### 绑定JS表达式
    

Vue允许将JS表达式应用到模板绑定中，例如

`{{number+ 1}}` `{{ok ? 'Yes': 'No'}}` `{{ message.split('').reverse().join('') }}`

等，JS表达式的结果会被计算并绑定。

> **仅支持表达式，不支持逻辑结构。**

  

3. ## 指令
    

**指令**是指带有 `v-` 前缀的特殊 _属性 ，_一个指令的任务是在其表达式的值变化时响应式地更新 DOM。

Vue提供一些内置指令：https://cn.vuejs.org/api/built-in-directives.html，下面是一些常用指令。

1. ### v-model
    

2. ### v-bind
    

3. ### v-on
    

4. ### v-once
    

  

4. ## 渲染
    

1. ### 条件渲染 `v-if`
    

通过条件渲染指令可以实现有条件的DOM渲染。

**条件指令：**

- **`v-if`** 满足条件时渲染HTML
    
- **`v-else`** 不满足 `v-if` 时渲染HTML
    
- **`v-else-if`** 不满足 `v-if` ，且满足该条件时渲染
    
- **`v-show`** 满足条件时显示元素（DOM仍会渲染该元素，实际上是操作的`display` 属性），不支持在 `<template>` 上使用。
    

  

> `v-if` 是“真实的”按条件渲染，因为它确保了在切换时，条件区块内的事件监听器和子组件都会被销毁与重建。
> 
> `v-if` 也是惰性的：如果在初次渲染时条件值为 false，则不会做任何事。条件区块只有当条件首次变为 true 时才被渲染。相比之下，`v-show` 简单许多，元素无论初始条件如何，始终会被渲染，只有 CSS `display` 属性会被切换。
> 
> 总的来说，`v-if` 有更高的切换开销，而 `v-show` 有更高的初始渲染开销。因此，如果需要频繁切换，则使用 `v-show` 较好；如果在运行时绑定条件很少改变，则 `v-if` 会更合适。

  

示例：

```HTML
<!-- if-else -->
<div v-if="type === 'A'">
  A
</div>
<div v-else-if="type === 'B'">
  B
</div>
<div v-else-if="type === 'C'">
  C
</div>
<div v-else>
  Not A/B/C
</div>

<!-- v-show -->
<h1 v-show="ok">Hello!</h1>
```

2. ### 列表渲染 `v-for`
    

使用列表渲染指令可以实现按列表渲染DOM。

#### (1) 列表渲染指令

- **`v-for="item in items"`**
    
      基于一个数组来渲染一个列表。指令的值需要使用 `item in items` 形式的特殊语法，其中 `items` 是源数据的数组，而 `item` 是迭代项的别名。
    
- **`v-for="(item, index) in items"`**
    
      支持使用可选的 _第二个参数_ 表示当前项的位置索引。
    
- **`v-for="value in object"`**
    
      可以用来遍历一个对象的所有属性，遍历的顺序会基于对该对象调用 `Object.keys()` 的返回值来决定。
    
- **`v-for="(value, key) in object"`**
    
      支持使用可选参数 key，用于获取属性名。
    

示例：

```HTML
<!-- 遍历数组 -->
<li v-for="item in items">
  {{ item.message }}
</li>

<li v-for="(item, index) in items">
  {{ index }} - {{ item.message }}
</li>

// 数据
const items = [{ message: 'Foo' }, { message: 'Bar' }]

<!-- 遍历对象 -->
<ul>
  <li v-for="value in myObject">
    {{ value }}
  </li>
</ul>

<li v-for="(value, key) in myObject">
  {{ key }}: {{ value }}
</li>

const myObject = reactive({
  title: 'How to do lists in Vue',
  author: 'Jane Doe',
  publishedAt: '2016-04-10'
})
```

  

#### (2) 通过Key管理列表状态

**https://cn.vuejs.org/guide/essentials/list.html#maintaining-state-with-key**

[推荐](https://cn.vuejs.org/style-guide/rules-essential.html#use-keyed-v-for)在任何可行的时候为 `v-for` 提供一个 `key` attribute，除非所迭代的 DOM 内容非常简单 (例如：不包含组件或有状态的 DOM 元素)，或者你想有意采用默认行为来提高性能。

```HTML
<template v-for="todo in todos" :key="todo.name">
  <li>{{ todo.name }}</li>
</template>
```

`key` 绑定的值期望是一个基础类型的值，例如字符串或 number 类型。不要用对象作为 `v-for` 的 key。

  

#### (3) 数组变化侦测

Vue 能够侦听响应式数组的变更方法，并在它们被调用时触发相关的更新。这些变更方法包括：

- `push()` 将指定的元素添加到数组的末尾，并返回新的数组长度。
    
- `pop()` 从数组中删除最后一个元素，并返回该元素的值。此方法会更改数组的长度。
    
- `shift()` 从数组中删除第一个元素，并返回该元素的值。此方法更改数组的长度。
    
- `unshift()` 将指定元素添加到数组的开头，并返回数组的新长度。
    
- `splice()` 通过移除或者替换已存在的元素和/或添加新元素[就地](https://zh.wikipedia.org/wiki/%E5%8E%9F%E5%9C%B0%E7%AE%97%E6%B3%95)改变一个数组的内容。
    
- `sort()` 对数组的元素进行排序
    
- `reverse()` 反转数组元素
    

这些方法会在原有数组上进行改动，因此会触发更新，对于一些方法例如 `filter()`，`concat()` 和 `slice()`，这些都不会更改原数组，而总是返回一个新数组，则不会触发元素更新，需要用结果数组替换原数组才会触发更新。

  

3. ### 不推荐同时使用 `v-if` 和 `v-for`
    

同时使用 `v-if` 和 `v-for` 是不推荐的，因为这样二者的优先级不明显。请转阅[风格指南](https://cn.vuejs.org/style-guide/rules-essential.html#avoid-v-if-with-v-for)查看更多细节。

  

5. ## 计算属性
    

6. ## 监听器
    

7. ## 事件
    

8. ## 组件
    

9. ## 插槽
    

10. ## 数据传递
    

1. ### props 父组件向子组件传递数据
    

通过 props 可以**设置组件的属性**，当在父组件中使用该组件时，可以为组件属性进行赋值，这样子组件就可以获取到父组件的数据了。

**示例：**

```HTML
// 子组件
<template>
  <div>
    <h2>{{ greeting }}</h2>
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  // 定义子组件属性，在template中可以使用它们
  props: {
    greeting: {
      type: String,
      required: true // 指定必需
    },
    message: {
      type: String,
      default: 'Hello, World!' // 指定默认
    }
  }
};
</script>


// 父组件
<template>
  <div>
  <!--应用子组件：指定属性，通过属性为子组件传递数据 -->
    <my-component greeting="Hello" :message="customMessage"></my-component>
  </div>
</template>

<script>
import MyComponent from './MyComponent.vue';

export default {
  components: {
    MyComponent
  },
  data() {
    return {
      customMessage: 'Welcome to Vue.js'
    };
  }
};
</script>
```

2. ### provide/inject 祖先向子孙传递数据
    

3. ### ref 通过名称引用传递数据
    

4. ### this.$emit 通过自定义事件传递数据
    

  

11. ## 生命周期