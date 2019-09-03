---
title: 在input框之前添加图标
tags: input
categories: HTML
date: 2017-10-16
copyright: true
---

在input框之前添加图片，想到了三种方法。

 -  第一种，添加input背景图片，实现起来很简单，但是要求必须将图片放到输入框的右侧，否则会出现文字和图片重合的问题，现在自己暂时还不能解决此问题。下面是代码：

```html
<style>
  #password{
      width: 200px;
      height: 35px;
      outline: none;
      border: 1px solid blue;
      background: url(img/pass02.svg) no-repeat right ;
  }
</style>
<input type="password" name="password" id="password" value="" /><br />
```

 -  第二种，在input框外部添加图片，再通过样式调整位置。比较麻烦。而且位置设置不灵活。[详细设置点击](http://blog.csdn.net/zhaojw_420/article/details/52439363)


 - 第三种是我自己想的，代码如下：

```html
<style>
  #img{
    width: 73px;
    height: 26px;
    background: url(img/pass02.svg) no-repeat right;	  
    display: inline-block;
  }
</style>


<div id="">
	<span id="img">
			密码：
	</span>
	<input type="text" name="password" id="password" value="" />
</div>
```