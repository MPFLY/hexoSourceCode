---
title: 微信小程序canvas压缩
tags: 微信
categories: 微信
date: 2019-07-23 12:30
copyright: true
---



最近在开发小程序，需要使用压缩图片，遂做出如下总结。

👇👇👇

### 1. wxml

首先需要在`wxml`文件中写一个`<canvas></canvas>`。给一个绝对定位样式，这样会隐藏到页面中。不过我习惯在调试的时候，让其显示出来。等调试ok之后，再将其隐藏起来。

```html
<canvas canvas-id="canvas" style="width:{{cWidth}}px;height:{{cHeight}}px; position: absolute;left:-1000px;top:-1000px;"></canvas>
```



### 2. javaScript

- 首先使用`wx.chooseImage()`方法从相册选取一张照片

  - 可获得该照片的大小，可以用来筛选体积比较大的图片

- 使用`wx.getImageInfo()`拿到该图片信息，包括：

  - 图片原始的宽/高

  可以通过该原始宽/高来计算该图片在`canvas`的大小。

- 使用`wx.createCanvasContext()`来画图。

- 使用`wx.canvasToTempFilePath()`将`canvas`画板转化成最终的**压缩后的**图片路径

```js
wx.chooseImage({
    count: 1, // 默认9
    sizeType: ['compressed'], // 指定只能为压缩图，首先进行一次默认压缩
    sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
    success: function (photo) {
        //-----返回选定照片的本地文件路径列表，获取照片信息-----------
        wx.getImageInfo({
            src: photo.tempFilePaths[0],  
            success: function(res){
              //---------利用canvas压缩图片--------------
              var ratio = 2;
              var canvasWidth = res.width //图片原始长宽
              var canvasHeight = res.height
              while (canvasWidth > 400 || canvasHeight > 400){// 保证宽高在400以内
                  canvasWidth = Math.trunc(res.width / ratio)
                  canvasHeight = Math.trunc(res.height / ratio)
                  ratio++;
              }
              that.setData({
                  cWidth: canvasWidth,
                  cHeight: canvasHeight
              })
        
              //----------绘制图形并取出图片路径--------------
              var ctx = wx.createCanvasContext('canvas')
              ctx.drawImage(res.path, 0, 0, canvasWidth, canvasHeight)
              ctx.draw(false, setTimeout(function(){
                  wx.canvasToTempFilePath({
                      canvasId: 'canvas',
                      destWidth: canvasWidth,
                      destHeight: canvasHeight,
                    	quality: 0.3, // 压缩倍率
                      success: function (res) {
                          console.log(res.tempFilePath)//压缩过后的最终图片路径
                      },
                      fail: function (res) {
                          console.log(res.errMsg)
                      }
                  })
              },100))    //留一定的时间绘制canvas
            },
            fail: function(res){
                console.log(res.errMsg)
            }
         })
    }
  })
```



### 3. 遇到的问题

#### 问题：

在开发过程中，发现一个比较有意思的事情：🤔🤔

在使用`wx.chooseImage()`方法时，在`success()`回调函数中拿到选择的图片路径，在显示到页面上之后。有的会出现向左偏转90度的问题。而其他都是正常方向显示。

一开始猜测是图片体积大小影响显示方向。在经过若干测试后发现，并不是体积问题。

后来又猜测是图片的尺寸问题，但经过验证后确定，也并不是尺寸影响，😵



#### 解决方法：



在`wx.chooseImage()`后，继续使用`wx.getImageInfo()`方法。在该方法的`success()`回调函数中可以拿到图片的原始尺寸。:

```js
// 来自于微信官网文档
wx.chooseImage({
  success (res) {
    wx.getImageInfo({
      src: res.tempFilePaths[0],
      success (res) {
        console.log(res.width)  // 原始宽度
        console.log(res.height) // 原始高度
      }
    })
  }
})
```



我上传的图片都是原始宽度小于原始高度的图片，如`960*1920`的照片。在上传该图片后，打印该图片的原始宽高，会发现变成了`1920*960`的尺寸。这也就是其“摔倒”的证据。所以可以在`wx.getImageInfo()`中判断该图片的宽高。如果他的`宽 > 高` ，就说明该图片“摔倒了”。需要添加让其转过来的代码。否则不需要操作。





### 4. 结语



在小程序开发过程中，时常会遇到类似的问题。并且在各大论坛上也找不到相关的解决方法，只能通过自己的小操作来实现业务。

打铁还需自身硬呀~















