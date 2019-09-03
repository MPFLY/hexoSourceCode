---
title: 使用express框架，如何在ejs文件中导入外部的js、css文件
tags: 总结
categories: nodeJS
date: 2017-09-29
copyright: true
---
最近在用nodejs写一点东西，当然也用到了express框架和ejs模版了。在使用ejs模版的过程中遇到了这个问题：如何在ejs模版中导入外部的js、css文件。

我猜测，ejs和html导入外部文件的方式应该是不一样的。但是我还是决定试一试。按照之前在html文件中的方式导入，结果失败。

这也证明我之前的想法，这些静态文件一经过服务器，就不能直接进行导入了。那该如何导入呢？

这是我的文件结构：
![这里写图片描述](http://img.blog.csdn.net/20170929155626453?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

我现在需要在index.ejs文件中导入public文件夹下的table.css以及table.js两个文件。
我为什么要将两个静态文件放到public文件夹下呢？

大家应该都知道，在使用express框架时，在安装了express模块之后，在该项目下的命令行输入`express -e` 就会自动生成相应的文件目录。当然，上面的截图中的目录是我自己写的，下面是express自动生成的目录：
![这里写图片描述](http://img.blog.csdn.net/20170929160307318?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

可以看到，其中的public文件夹是其自动生成的，也就是让你放静态文件的文件夹。（当然也不是必须是“public”）

好了，继续。那把包括了js、css以及图片的静态文件放到public文件夹下又该怎么使用呢？

看图：
![这里写图片描述](http://img.blog.csdn.net/20170929160717211?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

在servers.js中写上这句

```js
//获取放置在public文件夹下的静态文件,
app.use(express.static(__dirname + '/public'));
```
关于app.use()这个方法具体的介绍，这里有篇文章，写的很好[app.use(express.static)方法详解](http://www.cnblogs.com/A-dam/p/5053299.html)

这样，就可以在ejs文件中导入外部静态文件了。
这里需要注意一点，在导入写URL时，只需要写public后面的路径就好，不需要再加上“public”了。如下：

```html
<link rel="stylesheet" type="text/css" href="table.css"/>
<script type="text/javascript" src="table.js"></script>
```

