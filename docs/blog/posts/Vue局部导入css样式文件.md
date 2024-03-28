---
draft: false
authors:
  - finnegan
date: 2024-02-18
categories:
  - Vue
tags:
  - vue2
  - style
---
# Vue局部导入样式文件

在一般情况下，使用 import 导入的 css 文件默认会在vue组件中全局有效，对于某些情景可能需要局部导入。本文将介绍局部导入 css/scss 样式文件的方法。

<!-- more -->

**css**
```html
<template>
  <div class="component">
    <!-- your HTML here -->
  </div>
</template>

<!-- 全局 import -->
<style>
import './path/css/style.css'
</style>

<!-- 全局 style -->
<style src="./path/css/style.css">
</style>

<!-- 局部 scoped -->
<style src="./path/css/style.css" scoped></style>
```

**scss**
```html
<template>
  <div class="component">
    <!-- your HTML here -->
  </div>
</template>

<!-- not scoped --> 
<style lang="scss"> 
@import './path/css/style.scss'; 
</style> 

<!-- scoped --> 
<style lang="scss" scoped> 
@import './path/css/style.scss';
</style>
```
