---
title: 使用clipboard.js插件实现复制功能
tags: clipboard.js
categories: js插件
date: 2018-10-12
copyright: true
---



之前做前端项目时，用到了复制功能，在网上寻找一圈后，找到了**Clipboard.js**这个插件。在使用之后，顿时感觉十分的方便，**支持ie9及以上**。

------

#### 主要有3个主要的属性：

- `data-clipboard-text="copytext"` 自定义复制内容。
- `data-clipboard-action="copy"` 还可选 `cut`。
- `data-clipboard-target="dom"`指向要复制的 `dom`，可以是 `<input>` / `<textarea>`，也可以是 `<div>` 等其他元素。

#### 示例代码：

##### 1. 复制`input`/`textarea`框中的内容：

**html**:

```html
<input id="foo" type="text" value="hello">
<button class="btn" data-clipboard-action="copy" data-clipboard-target="#foo">Copy</button>
```



**js**:

```js
var clipboard = new ClipboardJS('.btn');

    clipboard.on('success', function(e) {
        console.log(e);
    });

    clipboard.on('error', function(e) {
        console.log(e);
});
```



------

##### 2. 复制自定义内容_1（在方法内定义）：

```html
<button class="btn">Copy</button>
<script>
  var clipboard = new ClipboardJS('.btn', {
    text: function() {
      return 'to be or not to be';
    }
  });

  clipboard.on('success', function(e) {
    console.log(e);
  });

  clipboard.on('error', function(e) {
    console.log(e);
  });
</script>
```

##### 3. 自定义复制内容_2（在行内定义）

```html
<button class="btn" data-clipboard-text="1">Copy</button>
<script>
  var clipboard = new ClipboardJS('.btn');
  clipboard.on('success', function(e) {
    console.log(e);
  });
  clipboard.on('error', function(e) {
    console.log(e);
  });
</script>
```

