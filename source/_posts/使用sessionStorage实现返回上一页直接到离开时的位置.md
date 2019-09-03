---
title: 使用sessionStorage实现返回上一页直接到离开时的位置
tags: sessionStorage
categories: JS
date: 2017-10-13
copyright: true
---

使用sessionStorage实现，在返回到之前浏览的页面时，直接将页面展示到用户刚刚浏览的位置，而不是重新刷新页面到了页面顶部。

### 代码

```html
//page01.html
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
		$(".btn").click(function() {
			if($(document).scrollTop() != 0) {
				sessionStorage.setItem("a", $(window).scrollTop());
				}
			});

		window.onload = function() {　　
			var _offset = sessionStorage.getItem("a");　　
			$(document).scrollTop(_offset);
		};
</script>
<body>
	<p>这是一行的信息</p>
	<p>这是一行的信息</p>
	...
	<p>这是一行的信息</p>
	<p>这是一行的信息</p>

	<a href="page02.html" class="btn">跳转页面</a>
</body>
```

```html
//page02.html
<body>
	<h1>这是页面2</h1>
	<a href="index.html">回到页面1</a>
</body>
```


### 代码解释

用户点击”跳转页面按钮“，拿到滚动位置，存入sessionStorage中。
在页面`onload()`时，拿到存在sessionStorage中的滚动位置数据，滚动到相应的位置。



### 其他

[具体的sessionStorage和localStorage的解释和使用方法](http://blog.csdn.net/william_wei007/article/details/68062752)
