---
title: vue通过$router.push传参数
tags: vue
categories: vue
date: 2018-11-28
copyright: true
---



### 1. 举例

下面通过A页面向B页面传值来举个例子:

```js
//A页面: 
this.$router.push({
    name: '页面B',
    params: { data: '我是要传递的参数' }
})


//B页面拿到传来的值: 
this.data = this.$route.params.data // 拿到上个页面传来的数据
```



### 2. 要注意的地方

代码很简单, 以下是需要注意的几点：

1. `this.$router.push()`方法里的`params` 可以传多个参数, 如:

   ```js
   //A页面
   this.$router.push({
       name: '页面B',
       params: { data1: '参数1', data2: '参数2'}
   })
   
   //B页面, 拿到传来的参数
   this.data1 = this.$route.params.data1
   this.data2 = this.$route.params.data2
   ```

2. `this.$router.push()`方法除了可以传递一般参数以外, 还能传递查询参数,代码如下:

   ```js
   this.$router.push({path: '/pagePath', query: {queryData: "2"}});
   ```

   最终的效果是: `/pagePath?queryData=2`




### 3. 结语

以上只是一个简单的总结，之后还会继续书写与总结。