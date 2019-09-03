---
title: 阿里巴巴fonticon字体图标的使用
tags: fonticon
categories: 字体图标
date: 2018-08-17
copyright: true
---



很早之前就知道阿里巴巴的fonticon矢量图标库，以前是这么使用的：下载某个图标的.png格式，然后引用到项目中，通过img标签或者background来使用。当然我知道该矢量图库可以将图标转换为字体文件来使用，但是一直没有机会来使用。因为大部分时间，设计都会把图标以图片的格式准备好，我只需要做一张雪碧图，就可以很好的使用了。
下面来总结一下该字体图标的使用方法。

## 1. 如何将字体图标下载到本地

以图说明（本次下载的是一个多色图标）：

[![这里写图片描述](https://img-blog.csdn.net/20180817101953198?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01QRkxZ/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)](https://img-blog.csdn.net/20180817101953198?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01QRkxZ/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
[![这里写图片描述](https://img-blog.csdn.net/20180817102011616?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01QRkxZ/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)](https://img-blog.csdn.net/20180817102011616?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01QRkxZ/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

[![这里写图片描述](https://img-blog.csdn.net/20180817102023648?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01QRkxZ/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)](https://img-blog.csdn.net/20180817102023648?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01QRkxZ/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

下载到本地后，是一个压缩包，解压之后，会看到下面的文件。

那3个示例网页中得到以下信息：

1. 在使用Unicode引入时，图标的Unicode编码
2. 在使用-class引入时，图标的类名
3. 各种引入方式的简单介绍

[![这里写图片描述](https://img-blog.csdn.net/20180817102036672?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01QRkxZ/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)](https://img-blog.csdn.net/20180817102036672?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01QRkxZ/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)



## 2. 怎么在html页面中使用

在页面上使用时，有三种引入方式：

### 1.unicode引入：

unicode是字体在网页端最原始的应用方式，特点是：

- 兼容性最好，支持ie6+，及所有现代浏览器。
- 支持按字体的方式去动态调整图标大小，颜色等等。
- 但是因为是字体，所以不支持多色。只能使用平台里单色的图标，就算项目里有多色图标也会自动去色。

在刚刚下载下的文件夹中找到`iconfont.woff`文件，并放到你项目的根目录下。
页面中是这样的：

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<style type="text/css">
			@font-face {
			  font-family: 'iconfont';
			  src: url('iconfont.eot');
			  src: url('iconfont.eot?#iefix') format('embedded-opentype'),
			  url('iconfont.woff') format('woff'),
			  url('iconfont.ttf') format('truetype'),
			  url('iconfont.svg#iconfont') format('svg');
			}
			.iconfont{
			  font-family:"iconfont" !important;
			  font-size:16px;font-style:normal;
			  -webkit-font-smoothing: antialiased;
			  -webkit-text-stroke-width: 0.2px;
			  -moz-osx-font-smoothing: grayscale;
			}
			i{
				font-size: 34px !important;
				color: red;
			}
		</style>
	</head>
	<body>
		
		<h1>unicode引入</h1>
		<i class="iconfont">&#xe616;</i>
		
	</body>
</html>
```



### 2.font-class方式：

font-class是unicode使用方式的一种变种，主要是解决unicode书写不直观，语意不明确的问题。

与unicode使用方式相比，具有如下特点：

- 兼容性良好，支持ie8+，及所有现代浏览器。
- 相比于unicode语意明确，书写更直观。可以很容易分辨这个icon是什么。
- 因为使用class来定义图标，所以当要替换图标时，只需要修改class里面的unicode引用。
- 不过因为本质上还是使用的字体，所以多色图标还是不支持的。

在刚刚下载下的文件夹中找到`iconfont.css`文件，放到你项目的任意位置，并在页面中引入该css文件。
页面中是这样的：

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>阿里巴巴fonticon字体图标的使用</title>
		<link rel="stylesheet" type="text/css" href="iconfont.css"/>
		<style type="text/css">
			i{
				font-size: 34px !important;
				color: red;
			}
		</style>
	</head>
	<body>
		<h1>font-class引入</h1>
		<i class="iconfont icon-bofang-tingzhi-zanting"></i>
	</body>
</html>
```



### 3.symbol方式：

这是一种全新的使用方式，应该说这才是未来的主流， 这种用法其实是做了一个svg的集合，与另外两种相比具有如下特点：
在刚刚下载下的文件夹中找到`iconfont.js`文件，放到你项目的任意位置，并在页面中引入该css文件。
页面中是这样的：

- 支持多色图标了，不再受单色限制。
- 通过一些技巧，支持像字体那样，通过font-size,color来调整样式。
- 兼容性较差，支持 ie9+,及现代浏览器。
- 浏览器渲染svg的性能一般，还不如png。

在刚刚下载下的文件夹中找到`iconfont.js`文件，放到你项目的任意位置，并在页面中引入该js文件。
页面中是这样的：

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>阿里巴巴fonticon字体图标的使用</title>
		<script src="iconfont.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.icon {
			   width: 1em; height: 1em;
			   vertical-align: -0.15em;
			   fill: currentColor;
			   overflow: hidden;
			}
			svg{
				font-size: 34px !important;
				color: red;
			}
		</style>
	</head>
	<body>
		<h1>symbol引入</h1>
		<svg class="icon" aria-hidden="true">
		  <use xlink:href="#icon-bofang-tingzhi-zanting"></use>
		</svg>
	</body>
</html>
```



## 3. 总结

以上就是使用阿里矢量图库的字体图标的三种方法，除了symbol方式可以直接使用多色图标（也就是一个图标中有多个颜色），其他的两种都不能直接使用。只能使用单色。

总的来说，还是第二种，也就是通过类名来引入更加的方便使用（个人意见）。在切换图标时，可以直接通过更换类名来实现。而且对于现在的我而言，多色图标使用频率较少，大部分时间都是在使用单色图标，就完全可以满足我的需求了。

好了，以上就是一个简单的使用过程，希望能帮到大家。