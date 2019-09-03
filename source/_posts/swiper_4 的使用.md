---
title: swiper_4 的使用
tags: swiper.js
categories: JS插件
date: 2017-11-15
copyright: true
---
最近使用了swiper，感觉还是很不错的，比较易用，而且拓展性和兼容性都很好。就是需要在使用的时候配置一些东西。下面是swiper_4版本中的一些常用的配置项。
```HTML
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/swiper.css"/>
		<style type="text/css">
			.swiper-container {
				width: 800px;
				height:400px;
			}
			img{
				width: 100%;
				height:100%;
			}
		</style>
	</head>

	<body>
		<div class="swiper-container">
			<!--<div class="swiper-scrollbar"></div>-->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-wrapper">
				<div class="swiper-slide"><div class="swiper-zoom-container"><img src="img/code-wallpaper-16.jpg"/> </div></div>
				<div class="swiper-slide"><div class="swiper-zoom-container"><img src="img/code-wallpaper-18.png"  /> </div></div>
				<div class="swiper-slide"><div class="swiper-zoom-container"><img src="img/code-wallpaper-22.jpg" /></div></div>
				<div class="swiper-slide"><div class="swiper-zoom-container"><img src="img/code-wallpaper-8.jpg" /></div> </div>
				<div class="swiper-slide"><div class="swiper-zoom-container"><img src="img/code_by_rasmusir-d4a4dj2.jpg"/></div> </div>
				<div class="swiper-slide"><div class="swiper-zoom-container"><img src="img/maxresdefault.jpg" /></div> </div>
			</div>
			<div class="swiper-pagination"></div>
		</div>
		<script type="text/javascript" src="js/swiper.min.js"></script>
		<script>
			var swiper = new Swiper({
            el: '.swiper-container',
            //slide的切换效果，默认为"slide"（位移切换），可设置为'slide'（普通切换、默认）,"fade"（淡入）"cube"（方块）"coverflow"（3d流）"flip"（3d翻转）。
//          effect: 'coverflow',
            //开启焦距功能
            zoom:true,
            loop:true,
            //初始化显示哪个滑块，从0开始
            initialSlide:0,
            //slide之间的距离（单位px）
            spaceBetween: 5,
            //每页显示多少个图片
            slidesPerView: 3,
            //设定为true时，活动块会居中，而不是默认状态下的居左,(carousel模式)
            centeredSlides: false,
            //设置为true则点击slide会过渡到这个slide
            slideToClickedSlide: true,
            //变手
            grabCursor: true,
            //多行布局里面每列的slide数量。
//          slidesPerColumn: 2,
            //默认为false，普通模式：slide滑动时只滑动一格，并自动贴合wrapper，设置为true则变为free模式，slide会根据惯性滑动且不会贴合
//          freeMode:true,
            //添加滚动条
            scrollbar: {
              el: '.swiper-scrollbar',
            },
            //开启鼠标滚轮翻页
            mousewheel: {
              enabled: true,
            },
            //开启键盘翻页
            keyboard: {
              enabled: true,
            },
            //添加分页导航
            pagination: {
              el: '.swiper-pagination',
              clickable: true,
            },
            //前进后退按钮
            navigation: {
              nextEl: '.swiper-button-next',
              prevEl: '.swiper-button-prev',
            },
            autoplay: {
		        delay: 3000,
		        //用户操作swiper之后，是否禁止autoplay。默认为true：停止。
						//如果设置为false，用户操作swiper之后自动切换不会停止，每次都会重新启动autoplay。
						//操作包括触碰，拖动，点击pagination等。
		        disableOnInteraction: false,
		     },
        });
		</script>
	</body>

</html>
```