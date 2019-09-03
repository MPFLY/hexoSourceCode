---
title: swiper_3 的使用
tags: swiper.js
categories: JS插件
date: 2017-11-21
copyright: true
---

swiper在版本3和4之间的配置文件还是有所差异的，所以，写一下3的使用。
大部分的配置文件3和4还是差不多的，用起来区分好就可以了。

### HTML

```html
<div class="swiper-container" id="Pic">
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
            <div class="swiper-wrapper">
                <div class="swiper-slide swiper-slide-active swiper-slide-next" index="1" style="text-align: center;">
                	<div class="swiper-zoom-container">
                    <a><img src="/static/css/img/code-wallpaper-8.jpg"  /></a>
                    </div>
                </div>
                <div class="swiper-slide swiper-slide-active swiper-slide-next" index="2" style="text-align: center;">
                	<div class="swiper-zoom-container">
                    <a><img src="/static/css/img/code_by_rasmusir-d4a4dj2.jpg"  /></a>
                    </div>
                </div>
                <div class="swiper-slide swiper-slide-active swiper-slide-next" index="2" style="text-align: center;">
                	<div class="swiper-zoom-container">
                    <a><img src="/static/css/img/code-wallpaper-18.png"  /></a>
                    </div>
                </div>
                <div class="swiper-slide swiper-slide-active swiper-slide-next" index="2" style="text-align: center;">
                	<div class="swiper-zoom-container">
                    <a><img src="/static/css/img/code-wallpaper-16.jpg"  /></a>
                    </div>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>

```
### 配置文件

```js
var mySwiper = new Swiper('.swiper-container', {
		centeredSlides: true,
	  	loop: true,
		slidesPerView: '1',
		effect: 'slide',
		initialSlide: 0,
		observer: true,
		
		zoom:true,
		//自动播放
		autoplay: 3000,
		//鼠标操作之后是否继续自动轮播
		autoplayDisableOnInteraction : false,
		
		//分页
		pagination: '.swiper-pagination',
		//分页样式，以下三种：
//		‘bullets’  圆点（默认）
//		‘fraction’  分式 
//		‘progress’  进度条
		paginationType : 'progress',
		
		//前进后退按钮
		nextButton: '.swiper-button-next',
		prevButton: '.swiper-button-prev',
		//滚动条
		scrollbar:'.swiper-scrollbar',
	});
```