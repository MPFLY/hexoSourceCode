---
title: Jquery中html()/text()/val()的区别
tags: 区别
categories: Jquery
date: 2017-03-10
copyright: true
---

### 介绍

`html()`用为读取和修改元素的HTML标签    对应`js`中的`innerHTML()`
`html()`是用来读取元素的HTML内容（包括其Html标签）,`html()`方法使用在多个元素上时，只读取第一个元素

`text()`用来读取或修改元素的纯文本内容  对应`js`中的`innerText()`
`text()`用来读取元素的纯文本内容，包括其后代元素。`text()`方法不能使用在表单元素上

`val()`用来读取或修改表单元素的`value`值
`val()`是用来读取表单元素的`value`值，`val()`只能使用在表单元素上

 

###  区别

关于三者的区别

      1. `val()`方法和`html()`相同，如果其应用在多个元素上时，只能读取第一个表单元素的`value`值，但是`text()`和他们不一样，如果`text()`应用在多个元素上时，将会读取所有选中元素的文本内容。
      2. `html()`/`text()`/`val()`都可以使用回调函数的返回值来动态的改变多个元素的内容。



### 示例

```html
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

<script>
    $(function(){
        $('#btn').click(function(){
            alert('html():'+ $('p').html())
        })
        $('#btn2').click(function(){
            alert('text():'+ $('p').text())
        })
        $('#btn3').click(function(){
            alert('val():'+ $('input').val())
        })
    })
</script>

<div>
    <p>点击之后<b>消失</b></p>
    <input type="text" value="测试文字">
    <button id="btn">按钮html()</button>
    <button id="btn2">按钮text()</button>
    <button id="btn3">按钮val()</button>
</div>
```


**测试结果：**

![这里写图片描述](http://img.blog.csdn.net/20170920100228143?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
![这里写图片描述](http://img.blog.csdn.net/20170920100243738?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
![这里写图片描述](http://img.blog.csdn.net/20170920100255121?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

