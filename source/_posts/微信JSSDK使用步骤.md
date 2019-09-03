---
title: 微信JSSDK使用步骤
tags: 微信
categories: 微信
date: 2019-05-17
copyright: true
password: 123456
---



最近在做一个公众号项目，其中用到了微信的【扫一扫】，如何在项目中接入扫一扫呢？下面开始详细说说。



首先查看文档，之前也看到过很多人抱怨腾讯的文档。不得不说，微信的文档写的真的是“普通”。有的东西解释的太过于简单，让人摸不着头脑。无奈只得求救于网上广大的微信开发先行者，看他们写的一些总结并配合官方文档能更速度的了解整个公众号开发。

[官方文档](<https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1421141115>)



在学习过后，自己也想系统的总结一下，遂有了这篇文章。下面是微信**JSSDK使用步骤**



### 1. 在公众号设置js接口安全域名

即将你使用的域名在微信公众号设置中绑定安全域名。设置JS接口安全域名后哦，公众号开发者可在该域名下调用微信开放的JS接口

注意事项：

- 可填写三个域名或路劲，需使用字母、数字及“-”组合，不支持IP地址、端口号及短链域名。
- 填写的域名必须通过ICP备案的验证
- 一个自然月内最多可修改并保存3次
- 可同时绑定3个域名

详情如下面截图：

[![EqXYY8.md.png](https://s2.ax1x.com/2019/05/17/EqXYY8.md.png)](https://imgchr.com/i/EqXYY8)



### 2. 引入JS文件

单页面应用支持以模块化的方式引用，非单页面应用支持在当前页面直接通过script标签的方式引用

- 安装依赖 `npm i -S weixin-js-sdk`

- 引用 `import wx from 'weixin-js-sdk'`

- ```js
  <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
  ```



### 3. 从后台异步获取appId等数据

此时会获得以下数据：

- appId：公众号的唯一标识
- timestamp： 生成签名的时间戳
- nonceStr：生成签名的随机串
- signature：签名



### 4. 通过config接口注入权限验证配置

此处我把`config()`  、`error()` 和 `ready()` 集成到一个方法中，在上一步异步获取数据成功后，执行该方法。

`config()`方法中的参数即为上一步异步方法获取到的数据，传入即可。

`jsApiList`参数需要填入你要使用的微信JS接口，此处为`scanQRCode，即【扫一扫】。

```js
wxConfig( _appid, _timestamp, _nonceStr, _signature) { // 初始化微信api
        wx.config({ 
            debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。   
            appId: _appid, // 必填，公众号的唯一标识
            timestamp: _timestamp, // 必填，生成签名的时间戳
            nonceStr: _nonceStr, // 必填，生成签名的随机串
            signature: _signature,// 必填，签名，见附录1
            jsApiList: ['scanQRCode',] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2 
        }); 
  
        wx.error(function(res) {
            console.log("初始化出错了：" + res.errMsg);//这个地方的好处就是wx.config配置错误，会弹出窗口哪里错误，然后根据微信文档查询即可。
        });
        
        wx.ready(function() {
            wx.checkJsApi({
                jsApiList : ['scanQRCode'],
                success : function(res) {
                  console.log('初始化扫一扫成功!');
                }
            });
        });
}
```



### 5. 调起微信扫一扫方法

```js
wx.scanQRCode({
    desc: 'scanQRCode desc',
    needResult: 0, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
    scanType: ["qrCode","barCode"], // 可以指定扫二维码还是一维码，默认二者都有
    success: function (res) {
       // 回调
    }
    error: function(res){
          if(res.errMsg.indexOf('function_not_exist') > 0){
               alert('版本过低请升级')
            }
     }
});
```



### 6. 结语

 以上是以扫一扫为例，做一个大概得总结。调用微信的其他方法大致也一样。欢迎大家转载享用。