---
title: 前端面试JS篇
tags: 
    - 前端面试
    - js
categories: 面试
weather: 晴
date: 2019-09-18 21:51:32
copyright: true
---



### 数据类型

原始数据类型：Boolean、String、Number、undefined、Null

引用数据类型：对象、数组、函数



### This

this总是指向函数的直接调用者。而非间接调用者。

如果有new关键字，this指向new出来的这个对象。



### 什么是window对象? 什么是document对象?

window是指浏览器打开的窗口

document是指html文档对象，是window的一个属性。



### null，undefined 的区别？

- null

  一个空对象

  表示一个没有值的值，也就是值为空

  它的`typeof()`是object

- undefined

  表示一个变量声明了，但是没有赋值

  它的`typeof()`是undefined



### 闭包

概念：是指在一个函数中创建第二个函数，通过第二个函数来访问第一个函数中的变量和参数。

特性：

- 函数内嵌套函数
- 内部函数可以使用外部函数的参数和变量
- 参数和变量不会被垃圾回收机制回收



### use strict

作用：严格模式。是ES5发布的一个一个新命令。使得js在更严格的条件下运行，消除js语法的一些不合理、不严谨的语法。



### instanceof

判断某个对象是否属于某个类



### new操作符干了什么?

1. 创建一个空对象，并且this引用这个空对象
2. 继承该函数的原型
3. 属性和方法被添加到this引用的对象中



### hasOwnProperty

1. 查找一个对象中是否包含某个属性
2. 不会查找该对象原型链中是否有这个属性，该属性必须是这个对象本身的成员



### JSON

1. 一种轻量级的文本数据交换格式，格式简单，易于读写，占用宽带小。

2. JSON字符串 --> JSON对象

   `eval('('+str+')')`

   `JSON.parse(str)`

3.  JSON对象 --> JSON字符串

   `JSON.stringify(obj)`



### documen.write和 innerHTML的区别

document.write()会重新绘制整个页面；innerHTML只会重新绘制一部分。



### DOM操作——怎样添加、移除、移动、复制、创建和查找节点?

创建：`createElement('div')`

查找：`getElementById(‘id’)` / `querySelector('#id')`

添加/移动：`appendChild(node)` /  `insertBefore(node, node)`

移除：`removeChild(noed)`

复制：`node.cloneNode(deep)`  deep为true时，复制该节点下所有节点。否则只复制当前节点



### 检测浏览器内核、版本

`navigator.userAgent`



### 千位分割符

```js
function commafy(num) {
    return num && num
        .toString()
        .replace(/(\d)(?=(\d{3})+\.)/g, function($0, $1) {
            return $1 + ",";
        });
}
```





### 拆解url的各部分

url举例：https://blog.csdn.net/hannah1116/article/details/80078547

- `location.href`： 完整链接 
- `location.protocol`：协议 –>https:
- `location.host`：域名 –> blog.csdn.net
- `location.pathname`：路径名称 --> /hannah1116/article/details/80078547
- `location.port`：端口号
- `location.search`：从问号 (?) 开始的 URL（查询部分）
- `location.hash`：从井号 (#) 开始的 URL（锚）



### ajax

```js
var xhr = new XMLHttpRequest()
xhr.open('post', '/api', true)
xhr.onreadystatechange = function () {
  if(xhr.readyState === 4){
  	if(xhr.status === 200){
			console.log(xhr.responseText)
		}
	}
}
xhr.send(null);
```



### call()和apply()的区别

js中所有函数都有这两个方法

这两个方法都能继承另一个对象的方法和属性，区别在于参数不一样

`Function.call(obj, arg1, arg2,...)`和`Function.apply(obj, args)` 

第一个参数都是要调用的函数的对象。call()的剩余参数是传递给要调用的函数的值，而apply()只有两个参数，第一个是对象，第二个是数组，这个数组就是该函数的参数。



### 继承

```js
function Animal() {
	this.species = '动物'
}

function Cat(name, color) {
	this.name = name;
	this.color = color
}
```

​	第一种：

```js
function Cat(name, color) {
    Animal.apply(this)
	this.name = name;
	this.color = color
}
```

​	第二种： 

```js
Cat.prototype = new Animal()
Cat.prototype.constructor = Cat
```

