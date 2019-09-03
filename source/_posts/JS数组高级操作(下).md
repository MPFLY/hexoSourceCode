---
title: JS数组高级操作（下）
categories: 转载
date: 2019-04-08
copyright: true
---



转载自 [JS面试之数组的几个不low操作(3)](https://segmentfault.com/a/1190000018549643) ，点击查看原文

### 1. 合并

- 高级操作

  ```javascript
  var arr1 = [1,2,3,4]
  var arr2 = [5,6,7,8]
  arr1.concat(arr2)
  ```

  ```javascript
  [...arr1,...arr2]
  ```

- 常规操作

  ```javascript
  var arr1 = [1,2,3,4]
  var arr2 = [5,6,7,8]
  arr2.forEach(item => {
    arr1.push(item)
  })
  ```

### 2. 判断是否包含值

- 高级操作

  ```javascript
  var arr1 = [1,2,3,4]
  arr1.includes(1) // true 或 false
  ```

  ```javascript
  var arr1 = [1,2,3,4]
  arr1.indexOf(0) // 该元素在数组内的位置 或者 -1
  ```

  ```javascript
  var arr1 = [1,2,3,4]
  arr1.find((item) => item === 1) //返回该元素 或者 undefined
  ```

  ```javascript
  var arr1 = [1,2,3,4]
  arr1.findIndex((item) => item === 1) //返回该元素所在位置 或者 -1
  ```

- 常规操作

  ```javascript
  arr1.some(item => {
    return item === 0
  })
  //返回true 或者 false
  ```

### 3. 类数组转换

- 高级操作

  ```javascript
  Array.prototype.slice.call(arguments) //arguments是类数组(伪数组)
  Array.prototype.slice.apply(arguments)
  Array.from(arguments)
  [...arguments]
  ```

  类数组：表示有`length`属性,但是不具备数组的方法
  `call`,`apply`：是改变`slice`里面的`this`指向`arguments`,所以`arguments`也可调用数组的方法
  `Array.from`是将类似数组或可迭代对象创建为数组
  `...`是将类数组扩展为字符串,再定义为数组

- 常规操作

  ```javascript
  Array.prototype.slice = function(start,end){  
        var result = new Array();  
        start = start || 0;  
        end = end || this.length; //this指向调用的对象，当用了call后，能够改变this的指向，也就是指向传进来的对象，这是关键  
        for(var i = start; i < end; i++){  
             result.push(this[i]);  
        }  
        return result;  
   }
  ```

### 4. 每一项设置值

- 高级操作

  ```javascript
  var arr1 = [1,2,3,4]
  arr1.fill('1') //["1", "1", "1", "1"]
  ```

  [fill()](http://www.runoob.com/jsref/jsref-fill.html) 方法用于将一个固定值替换数组的元素，是`ES6`新增的方法

  `array.fill(value, start, end)`

| 参数  |                    说明                    |
| :---: | :----------------------------------------: |
| value |              必需。要填充的值              |
| start |            可选。开始填充位置。            |
|  end  | 可选。停止填充位置 (默认为 *array*.length) |

- 常规操作

  ```javascript
  var arr1 = [1,2,3,4]
  arr1.map(() => '1') //["1", "1", "1", "1"]
  ```

### 5. 每一项是否满足

```javascript
var arr1 = [1,2,3,4]
arr1.every(item => {
  return item > 0
} //true
```

### 6. 有一项满足

```javascript
var arr1 = [1,2,3,4]
arr1.some(item => {
  return item > 4
} //false
```

### 7. 过滤数组

```javascript
var arr1 = [1,2,3,4]
arr1.filter(item => {
  return item > 2
} //[3, 4]
```

[filter()](http://www.runoob.com/jsref/jsref-filter.html) 是ES5的api，返回满足添加的项的数组。

### 8. 对象和数组的转换

```javascript
var obj = {
  name: '张三',
  age: '12'
}
```

- [Object.keys()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys)

  ```javascript
  Object.keys(obj) // ["name", "age"]
  ```

- Object.values()

  ```javascript
  Object.values(obj) // ["张三", "12"]
  ```

- Object.entries()

  ```javascript
  Object.entries(obj) //[[name,'张三'],[age,12]]
  ```

### 9. 对象转换为数组

```javascript
var obj = {
  name: '张三',
  age: '12'
}

for (const key in obj) {
  if (obj.hasOwnProperty(key)) {
    let obj_ = {}
    obj_[key] = obj[key]
    arr.push(obj_)
  }
}

console.log(arr); // [{name: '张三'}, {age: '12}]
```

转载自 [JS面试之数组的几个不low操作(3)](https://segmentfault.com/a/1190000018549643) ，点击查看原文

