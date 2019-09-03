---
title: ie8及其以下版本兼容性问题之圆角阴影
tags: ie8
categories: css
date: 2018-08-07
copyright: true
---



### 解决办法

在<http://css3pie.com/>页面下载一个PIE.htc的文件，加载到根目录下，然后在css中加上一句`behavior:url(../js/PIE.htc);`



### 示例

```css
.border_radius  {
     border:1px solid #000;
     -moz-border-radius:15px;    
     -webkit-border-radius:15px;
     border-radius:15px;
     behavior:url(../js/PIE.htc);
}
```

其中文件的路径是相对html的，所以在服务器上最好用绝对路径。

对于有些父元素已经设置了position属性的元素，会出现无法显示的情况，此时可以给元素加上`position:relative`；如下：

```css
.border_radius  {
     border:1px solid #000;
     -moz-border-radius:15px;    
     -webkit-border-radius:15px;
     border-radius:15px;
     position:relative;
     behavior:url(../js/PIE.htc);
}
```



也可以将元素的`z-index`值设大一些。
如果元素不能显示，可以考虑给其父级元素设置定位属性。

使用css3的`box-shadow`属性时，也在样式中添加`behavior:url(../js/PIE.htc);`即可。