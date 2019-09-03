---
title: ES6中箭头函数的使用
tags: 总结
categories: JS
date: 2017-10-27
copyright: true
---



作者：Allan要做活神仙
链接：http://www.jianshu.com/p/4b101a763e85
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。



ES6标准新增了一种新的函数：Arrow Function（箭头函数）。
箭头函数与传统的JavaScript函数主要区别在于以下几点：、

> 1、对 this 的关联。函数内置 this 的值，取决于箭头函数在哪儿定义，而非箭头函数执行的上下文环境。
2 、new 不可用。箭头函数不能使用 new 关键字来实例化对象，不然会报错。
3、this 不可变。函数内置 this 不可变，在函数体内整个执行环境中为常量。
4、没有arguments对象。更不能通过arguments对象访问传入参数。只能使用显式命名或其他ES6新特性来完成。

这些差异的存在是有理可循的。首先，对this的绑定是JavaScript错误的常见来源之一。容易丢失函数内置数值，或得出意外结果。其次，将箭头函数限制为使用固定this引用，有利于JavaScript引擎优化处理。



## 语法

 - 不引入参数
```js
var sum = () => 1 + 2;
// 等同于：
var sum = function() {    
    return 1 + 2; 
};
```
 -  引入单个参数
```js
var reflect = value => value;
// 等同于：
var reflect = function(value) {    
    return value;
};
```
 - 引入多个参数
```js
//要加上小括号
var sum = (num1, num2) => num1 + num2;
// 等同于：
var sum = function(num1, num2) {    
    return num1 + num2;
 };
```
- 若你想使用标准的函数体，或者函数体内可能有更多的语句要执行，则要用大括号将函数体括起来，并明确定义返回值。

```js
//大括号内的部分基本等同于传统函数
var sum = (num1, num2) => { return num1 + num2; }
//等同于：
var sum = function(num1, num2) {    
  return num1 + num2; 
};
```
- 箭头函数若要返回自定义对象的话，就必须用小括号把该对象括起来

```js
//用小括号包含大括号则是对象的定义，而非函数主体
var getTempItem = id = > ({
   id: id,
  name: "Temp"
});
// 等同于:
var getTempItem = function(id) {
  return {
    id: id, 
    name: "Temp"
     };
};
```




本文转载自：
作者：Allan要做活神仙
链接：http://www.jianshu.com/p/4b101a763e85
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。