---
title: CSS3的媒体查询
tags: css3
categories: CSS
date: 2017/11/21
copyright: true
---

**准备工作1：设置Meta标签**
首先我们在使用Media的时候需要先设置下面这段代码，来兼容移动设备的展示效果：

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
```

这段代码的几个参数解释：

width = device-width：宽度等于当前设备的宽度

initial-scale：初始的缩放比例（默认设置为1.0）  

minimum-scale：允许用户缩放到的最小比例（默认设置为1.0）    

maximum-scale：允许用户缩放到的最大比例（默认设置为1.0）   

user-scalable：用户是否可以手动缩放（默认设置为no，因为我们不希望用户放大缩小页面）

**准备工作2：加载兼容文件JS**
因为IE8既不支持HTML5也不支持CSS3 Media，所以我们需要加载两个JS文件，来保证我们的代码实现兼容效果：

```html
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
```

**准备工作3：设置IE渲染方式默认为最高(这部分可以选择添加也可以不添加)**

```html
<meta http-equiv="X-UA-Compatible" content="IE=Edge，chrome=1">
```

怎么这段代码后面加了一个chrome=1，这个Google Chrome Frame（谷歌内嵌浏览器框架GCF），如果有的用户电脑里面装了这个chrome的插件，就可以让电脑里面的IE不管是哪个版本的都可以使用Webkit引擎及V8引擎进行排版及运算，无比给力，不过如果用户没装这个插件，那这段代码就会让IE以最高的文档模式展现效果。这段代码我还是建议你们用上，不过不用也是可以的。


**进入CSS3 Media写法**
我们先来看下下面这段代码，估计很多人在响应式的网站CSS很经常看到类似下面的这段代码：

```css
@media screen and (max-width: 960px){
    body{
        background: #000;
    }
}
```

这个应该算是一个media的一个标准写法，上面这段CSS代码意思是：**当页面小于960px**的时候执行它下面的CSS.这个应该没有太大疑问。



应该有人会发现上面这段代码里面有个screen，他的意思是在告知设备在打印页面时使用衬线字体，在屏幕上显示时用无衬线字体。但是目前我发现很多网站都会直接省略screen,因为你的网站可能不需要考虑用户去打印时，你可以直接这样写：

```css

@media (max-width: 960px){
    body{
        background: #000;
    }
}
```

在第一段代码上面我用的是小于960px的尺寸的写法，那现在我们来实现等于960px尺寸的代码：

```css
@media screen and (max-device-width:960px){
    body{
        background:red;
    }
}
```


然后就是当浏览器尺寸大于960px时候的代码了：

```css
@media screen and (min-width:960px){
    body{
        background:orange;
    }
}
```


我们还可以混合使用上面的用法：

```css
@media screen and (min-width:960px) and (max-width:1200px){
    body{
        background:yellow;
    }
}
```

上面的这段代码的意思是当页面宽度大于960px小于1200px的时候执行下面的CSS。

----------


**在样式表链接中使用媒体查询**

```html
<link rel="stylesheet" href="styles/mainstyles.css">
<link rel="stylesheet" href="styles/widerscreen.css"
media="only and (min-width:40em)">
```

----------

**视口宽度和高度（媒体查询中最常用到的设备属性）**

视口宽度：width
视口高度：height
视口指的是浏览器窗口中实际包含网页的那部分区域。浏览器窗口减去页面边上的滚动条，以及顶部或底部的工具栏和菜单，剩下的区域就是视口。

**屏幕宽度与高度**

屏幕宽度：device-width
屏幕高度：device-height

```css
@media only screen and (max-device-width:40em) {...}
```

**方向：orientation**
值为：横排方向（ landscape）竖排方向（portrait）

```css
@media only screen and (orientation:landscape) {...}
```

**宽高比**

视口宽高比：aspect-ratio
设备屏幕宽高比：device-aspect-ratio
常见的显示器宽高比时16:9（如19201080或1366768像素）或者是16:10（1280800）。iphone 3和iphone 4s是3:2（480320和960640），而iPhone 5则是16:9（1136640）。安卓手机通常是4:3、3:2、16:10或16:9。

```css
@media only screen and (min-device-aspect-ratio:16/9) {...}
```
**分辨率**
设备屏幕的分辨率：resolution

```css
@media only screen and (resolution:3oodpi) {...}
```

----------


作者：味蕾里的青春
链接：http://www.jianshu.com/p/2dfa5bab1ef1
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

链接2：[转载自这里](http://www.520ued.com/)