---
title: if 弱判断总结
tags: if方法
categories: javaScript
date: 2019-08-15
copyright: true
---



##  1. `if` 语句会自带一个弱类型的判断，下面我们来看看他的判断规则。



### 空字符串

```js
let a = ''
if(a){
	console.log('true')
}else{
	console.log('false')
}
// false
```



### null

```js
let a = null
if(a){
	console.log('true')
}else{
	console.log('false')
}
// false
```



### undefined

```js
let a = undefined
if(a){
	console.log('true')
}else{
	console.log('false')
}
// false
```



### NaN

```js
let a = NaN
if(a){
	console.log('true')
}else{
	console.log('false')
}
// false
```



### 空对象`{}`

```js
let a = {}
if(a){
	console.log('true')
}else{
	console.log('false')
}
// true
```



### 空对象`[]`

```js
let a = []
if(a){
	console.log('true')
}else{
	console.log('false')
}
// true
```





## 2. 如何判断空数组和空对象

- 判断空数组

  ```js
  let a = []
  if(a.length === 0){
  	console.log('true')
  }else{
  	console.log('false')
  }
  // true
  ```

- 判断空对象

  - 使用`Object.keys()`方法

    ```js
    let a = {}
    let arr = Object.keys(a)
    if(arr.length === 0){
    	console.log('true')
    }else{
    	console.log('false')
    }
    // true
    ```

    

  - 使用`Object.getOwnPropertyNames()`方法

    ```js
    let a = {}
    let arr = Object.getOwnPropertyNames(a)
    if(arr.length === 0){
    	console.log('true')
    }else{
    	console.log('false')
    }
    // true
    ```