---
title: 几个超实用的JS特性
tags: JS特性
categories: JS 
weather: 雨
date: 2019-10-15 10:44
copyright: true

---

用了这么多年的`javaScript`， 有几个常用的JS特性时常会用到，这些特性不仅会给工作带来效率得提升，而且可以大大地简化代码。不论是自己以后修改代码，还是他人日后进行维护，都是大大的好事。

下面我们详细地展开来讲每一个特性的使用方法和要注意的地方。

### 1. 展开操作符

用于**对象**或**数组**中的展开操作符（...），将一个结构展开为列表。 演示一下：

合并数组：

```js
let arr = [1,2,3];
let arr_ = [4,5, ...arr];
console.log(arr_);  // [4, 5, 1, 2, 3]
```

合并对象：

```js
let obj = {
  id: '1',
  name: 'aaa',
  sex: 'woman'
};
let obj_ = {
  sex: 'man',
  ...obj,
};
 console.log(obj_); // id: "1", name: "aaa", sex: "woman"
```

在合并对象时要注意，如果是相同的对象，写在后面的会覆盖前面的。切记！

### 2. 剩余参数

先来看一个例子：

```js
function add(p1, p2){
  let total =  p1 + p2;
  console.log(total);
};
add(1, 2, 3); // 3
```

上面的`add()`方法，只处理了`p1/p2`两个参数，而如果我想临时多加几个参数，完成累加才做，该方法就无法处理。下面将对该方法做出优化，可以完成不定个数的参数累加：

```js
function add(p1, p2, ...p3){
  let total =  p1 + p2 + p3.reduce((prev, curr) => prev + curr);
  console.log(total);
}
add(1, 2, 3, 4, 5); // 15
```

在方法定义时，增加一个`...p3`参数，在方法体中打印该参数可以看到，`p3`参数是除了`p1/p2`参数外的**剩余参数**所组成的一个**数组**。借助数组中的`reduce()`方法，可对剩余参进行操作（此处我进行了累加操作）。这样就可以很简单的完成一个参数个数可变的方法。

### 3. 字符串模板和插值

在不使用`vue/react`等具有**数据双向绑定**特性框架的前提下，我们渲染页面中的数据时常会用到字符串模板，在从前，我们一般这样使用：

```js
var template = "<div>" +
                "<span>我就是我，颜色不一样的烟火。</span>"+
               "</div>";
```

我们不得不逐行逐句地重复添加**引号**和**加号**，以得到更好代码的阅读性。现在我们可以在拥有完美阅读性的前提下更简单地实现字符串模板，请看演示：

```js
 var template = `<div>
                  <span>我就是我，颜色不一样的烟火。</span>
                 </div>`;
```

我们只需要借助一对 ` 将相应的字符串包起来，多方便！还可以使用${}在其中动态插入值。如下：

```js
let blogName = '老米的世界';
var template = `<div>
                  <p>${blogName}</p>
                  <span>我就是我，颜色不一样的烟火。</span>
								</div>`;
```

### 4. 方法属性

对比一下ES5和ES6即可发现他的好处：

```js
const calculate = {
  add: function(a, b) {return a + b},
  sub: function(a, b) {return a - b}
}
```

```js
const calculate_ = {
  add(a, b) {return a + b},
  sub(a, b) {return a - b}
}
```

是不是好写多了！

### 5. 解构赋值

#### 解构对象

```js
function test(params, type){
	let name = params.name;
	let url = params.url;
	console.log(name, url, type);
 }

let obj = {
  name: '老米的世界',
  url: 'https://mpfly.github.io/'
}
test(obj, '个人博客');
```

在`test()`方法中，我们需要两行代码来拿到`parmas`参数中的`name`和`url`字段。在使用解构赋值时，则只需一行代码即可。请看以下演示：

```js
function test(params, type){
	let {name, url} = params;
	console.log(name, url, type);
}
```

#### 解构数组

在这里我们可以使用上面说到的**剩余参数**来获取剩余的数组成员，也可以使用`,,`来**跳过**某一个数组成员。

```js
let arr = [1,2,3,4,5];
let [a, ,b, ...c] = arr;
console.log(a, b, c); // 1 3 [4, 5]
```

### 6. 数组方法

相关的数组操作可以点击查看我之前总结的2篇文章

[JS中14个数组的高级操作](https://mp.weixin.qq.com/s/sEDLhpDys2ASMuMDTa5V2Q)

### 7. 字符串方法

[ES6中新增的处理字符串的方法](https://mp.weixin.qq.com/s/_QICWQKfMo-JRlMIEZsAPA)

 

**End**

感谢您阅读到此。

感谢~

**欢迎浏览我之前的文章：**

[我被第一次喊【双手抱头！！！】](https://mp.weixin.qq.com/s/fvtDV0zgiyibx7xaRotA3Q)

[理财知识](https://mp.weixin.qq.com/s/L0MQE4nGWhxE3Li44p4Tyw)

[我的兴奋点](https://mp.weixin.qq.com/s/0Q2oRlhsAH7EpVA2osYliQ)

![uoYgpD.png](https://s2.ax1x.com/2019/10/10/uoYgpD.png)