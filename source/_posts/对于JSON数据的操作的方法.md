---
title: 对于JSON数据的操作的方法
tags: 总结
categories: JS
date: 2017-09-29
copyright: true
---

### JSON.parse()

此方法是将普通的符合json数据格式的字符串转化为json数据。
例如：

```js
//此处有一个符合json格式的字符串。
var jsonStr = '{"name":"mi","age":"23","phone":"154"}';
//使用该方法将字符串转化为json数据
var obj1 = JSON.parse(jsonStr);
//下面我们分别打印字符串和json数据，看两者有什么区别
console.log(obj1);
console.log(jsonStr);
```
以下是两者的打印结果，可以看到，json数据的没有引号，而字符串是有引号的。可以以这个来区分。

![这里写图片描述](http://img.blog.csdn.net/20170928115341873?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)


### JSON.stringify()
这个方法是将json对象转化为字符串

下面是测试：

```js
//这是json对象
var test = {
    "name":"mi",
    "age":"23",
    "phone":"154"
}

var str = JSON.stringify(test);

console.log(test);
console.log(str);
```
这是结果
`{"name":"mi","age":"23","phone":"154"}`