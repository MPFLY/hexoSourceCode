---
title: JS刷新页面方法
tags: 总结
categories: JS
date: 2017-06-10
copyright: true
---
###  1. reload 方法
该方法强迫浏览器刷新当前页面。
- 语法：`location.reload([bForceGet])`
- 参数：`bForceGet`
  可选参数， 默认为 false，从客户端缓存里取当前页。true, 则以 GET 方式，从服务端取最新的页面, 相当于客户端点击 F5("刷新")

###  2. replace 方法
该方法通过指定URL替换当前缓存在历史里（客户端）的项目，因此当使用replace方法之后，你不能通过“前进”和“后退”来访问已经被替换的URL。

语法： `location.replace(URL) `  
通常使用： `location.reload() `或者是 `history.go(0)` 来做。
此方法类似客户端点F5刷新页面，所以页面`method="post"`时，会出现"网页过期"的提示。
因为Session的安全保护机制。
当调用 `location.reload() `方法时， aspx页面此时在服务端内存里已经存在， 因此必定是 IsPostback 的。
如果有这种应用： 需要重新加载该页面，也就是说期望页面能够在服务端重新被创建，期望是 Not IsPostback 的。
这里，location.replace() 就可以完成此任务。被replace的页面每次都在服务端重新生成。
代码：` location.replace(location.href)`

###  3. 返回并刷新 
 - 语法：`location.replace(url)`
 - 参数`url`指的是前一个页面的URL
 - 不要用 `history.go(-1)`，或 `history.back();`来返回并刷新页面，这两种方法不会刷新页面。

###  4. 页面自动每隔20秒刷新一次页面
`<meta http-equiv="refresh" content="20">`

###  5. 页面在20秒后跳转到指定网址 
`<meta http-equiv="refresh" content="20;url=someUrl">`


### 6. 列举几种页面刷新常用的几种方法
```js
history.go(0) 
location.reload() 
location=location 
location.assign(location) 
document.execCommand('Refresh') 
window.navigate(location) 
location.replace(location) 
document.URL=location.href
```




