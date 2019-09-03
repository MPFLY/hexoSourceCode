---
title: JS数组高级操作（上）
categories: 转载
date: 2019-04-08
copyright: true
---



转载自 [JS面试之数组的几个不low操作(3)](https://segmentfault.com/a/1190000018549643) ，点击查看原文

### 1. 数组扁平化

- 高级操作

  ```js
  var arr1 = [1,2,3,[4,5,[6,7,8]]]
  var arr_1 = arr1.flat(Infinity)
  ```

- 常规操作：利用递归和数组合并方法 `concat`实现扁平。

  ```js
  function flatten(arr) {
    while(arr.some(item=>Array.isArray(item))) {
      arr = [].concat(...arr);
    }
    return arr;
  }
  ```

### 2. 去重

- 高级操作（两种方法）

  ```js
  var arr1 = [1,2,3,3]
  arr_1 = [...new Set(arr1)]
  ```

  ```js
  var arr1 = [1,2,3,3]
  arr_1 = Array.from(
    new Set(arr1)
  )
  ```

  [Array.from()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from) 可以将类数组转换为数组，类数组包括但又不限于 `Set`/ `Map`，还有包括可遍历的对象。

  `Set` 是ES6提供的新的数据结构，**Set**对象不是数组， 可以用来保存对象或者基本类型， 所有保存的值都是**唯一**的。这也就是我们要使用这一特性，实现去重。

- 常规操作

  ```js
  function distinct(arr) {
    let resule = [], i, j;
    for (i = 0; i < arr.length; i++) {
      for (j = i+1; j < arr.length; j++) {
        if(arr[i] === arr[j]){
          j = ++i
        }
      }
      resule.push(arr[i])
    }
  
    return resule
  }
  ```

### 3. 排序

- 高级操作

  ```js
  var arr1 = [1,2,4,3,8,5]
  arr1.sort()  //升序
  ```

  ```js
  var arr1 = [1,2,4,3,8,5]
  arr1.sort((a, b) => b - a) //降序
  ```

- 常规操作

  选择排序：

  ```js
  function sortFun(arr) { // 选择排序
    let i, j;
    for (i = 0; i < arr.length; i++) {
      for (j = i+1; j < arr.length; j++) {
        if(arr[i] < arr[j]){
          [arr[i], arr[j]] = [arr[j], arr[i]]
        }
      } 
    }
    return arr
  }
  ```

  冒泡排序：

  ```js
  function bubleSort(arr) { //冒泡排序
    let i, j;
    for (i = arr.length-1; i > 2; i--) {
      for (j = 0; j < i; j++) {
        if(arr[i] > arr[j]){
          [arr[i], arr[j]] = [arr[j], arr[i]]
        }
      }
    }
    return arr
  }
  ```

### 4. 最大值、最小值

- 高级操作

  ```js
  var arr1 = [1,2,4,3,8,5]
  Math.max(...arr1)
  Math.min(...arr1)
  ```

  [Math.max()](http://www.w3school.com.cn/jsref/jsref_max.asp) 方法可返回两个指定的数中带有较大的值的那个数

  ```js
  var arr1 = [1,2,4,3,8,5]
  arr1.reduce((prev, cur, curIndex, arr) => {
    return Math.max(prev,cur);
    //return Math.min(prev,cur);
  })
  ```

- 常规操作： 先排序，再取最大/最小值。

### 5. 求和

- 高级操作

  ```js
  arr1.reduce((prev, cur, curIndex, arr) => {
    return prev + cur
  })
  ```

- 常规操作

  ```js
  function sumFun(arr){
    let sum = 0, i;
    for (i = 0; i < arr.length; i++) {
      sum += arr[i]
    }
    return sum
  }
  ```

转载自 [JS面试之数组的几个不low操作(3)](https://segmentfault.com/a/1190000018549643) ，点击查看原文