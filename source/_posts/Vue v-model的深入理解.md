---
title: Vue v-model的深入理解
tags: vue
categories: vue
date: 2018-08-04
copyright: true
---

### 1. 概念

v-model：主要是针对表单来使用的

------

### 2. 基础用法

你可以用`v-model` 指令在表单 `<input>`、`<textarea>` 及 `<select>` 元素上创建双向数据绑定。它会根据控件类型自动选取正确的方法来更新元素。尽管有些神奇，但 `v-model` 本质上不过是语法糖。它负责监听用户的输入事件以更新数据，并对一些极端场景进行一些特殊处理。

`v-model`会忽略所有表单元素的 `value、checked、selected` 特性的初始值而总是将 Vue 实例的数据作为数据来源。你应该通过 JavaScript 在组件的 data 选项中声明初始值。

对于需要使用输入法 (如中文、日文、韩文等) 的语言，你会发现 v-model 不会在输入法组合文字过程中得到更新。如果你也想处理这个过程，请使用 input 事件。

------

### 3. 内涵用法

```html
<input v-model="demo" />
<input v-bind:value="demo" v-on:input="demo= $event.target.value" />
```

以上的代码中，第一行的代码只是第二行的代码的语法糖。
第二行代码中将value值绑定到demo上，并监听输入动作，输入改变时，将新的value值传输给demo。
第二行中的代码还可以简写成如下：

```html
<input :value="demo"  @input="demo = $event.target.value" />
```

### 4. 结语

以上是在学习Vue过程中所学到的基础性的东西，简单记录下来。