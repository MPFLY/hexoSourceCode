---
title: JS中常用的正则表达式
tags: 正则表达式
categories: JS
date: 2018-08-14
copyright: true
---



### 16进制的HEX色值

```js
/^#[\da-f]{3}([\da-f]{3})?$/
```

### 0~1之间的小数，不含0和1

```js
/0(\.[0-9]{0,2})/
```

### 姓名

```js
/^[\u4e00-\u9fa5]{1,5}$/
```

### 手机

```js
/^[1][3,4,5,7,8][0-9]{9}$/;
```

### 密码

```js
/^[\w_-~!@#$%^&*`./]{6,20}$/
```

### 身份证号

```js
/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/
```

### 邮箱

```js
/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/
```

### 字符串内不包含空格

```js
/^\S*$/
```