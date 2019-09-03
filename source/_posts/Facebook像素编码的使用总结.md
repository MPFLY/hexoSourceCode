---
title: Facebook像素编码的使用总结
tags: 
    - Facebook像素编码
    - JS
categories: JS
date: 2019-08-23 09:54
copyright: true
---



### 1. 前言

之前在做【跨境电商】项目时，由于需要使用Facebook进行广告的投放，所以接触到了**Facebook像素编码**。他的主要功能就是对电商各个页面的各种操作进行统计，如：浏览商品、加入购物车、购买等动作。每个商户都有一个后台监控系统，可以实时看到每个像素编码的的各个“动作”的统计量。



业务上的大体讲这么多，接下来我将展示几个主要的“**动作**”的具体代码。🙃🙃🙃



### 2. 具体代码

在代码上的，其实就是几段`javaScript`代码，下面是几个代码片段。

我将以一个完整的购物流程进行说明：

访问电商 ➡️ 查看某个产品 ➡️ 将该产品添加到购物车 ➡️ 完善地址等购物信息 ➡️ 发起结账 ➡️ 完成结账



#### 1. 初始化像素编码

- 说明：

  在开始进行一系列动作之前，需要先初始化Facebook像素，即引入相关`javaScript`代码，https://connect.facebook.net/en_US/fbevents.js（该文件需要开启科学上网才能访问到）。

  在引入相关必须的`JS`代码之后，需要执行一个`fbq('init', facebookID)`方法，即**初始化该像素编码**。这个facebookID可以通过异步操作从后台获取，也可以是一个固定的像素编码。

  

  建议将初始化的代码放在一个公共方法中。

  

  此处需要注意的是，可以一次性初始化**多个**像素编码。举个例子：

  ```js
  let facebookIdList = ['1111111111', '2222222222'];
  facebookIdList.forEach(facebookID => {
    fbq('init', facebookID)
  })
  ```

- 代码：

  ```js
  function initFacebook(facebookID) {
    !function (f, b, e, v, n, t, s) {
      if (f.fbq) return; n = f.fbq = function () {n.callMethod ?
  		n.callMethod.apply(n, arguments) : n.queue.push(arguments)
  		};if (!f._fbq) f._fbq = n;n.push = n;n.loaded = !0;n.version = '2.0';
  		n.queue = [];t = b.createElement(e);t.async = !0;t.src = v;
  		s = b.getElementsByTagName(e)[0]; 
  		s.parentNode.insertBefore(t, s)
    }(window, document, 'script','https://connect.facebook.net/en_US/fbevents.js');
  
    fbq('init', facebookID); // 其中的facebookID可以异步获取，也可以是一个固定的像素编码
  }
  ```



#### 2. 访问页面

- 说明：

  每次访问页面都会执行这个方法。该方法无需参数。

- 代码：

  ```js
  fbq('track', 'PageView');
  ```

  

#### 3. 查看商品

- 说明：

  点击查看某个产品的详情。

- 参数：

  - 产品id
  - 产品编号

- 代码：

  ```js
  fbq('track', 'ViewContent', {
      content_ids: 'affProductId',//产品id
      content_type: 'productSn'//产品编号
  });
  ```



#### 4. 加入购物车

- 说明：

  将产品**加入购物车**时执行。

- 参数：

  - 产品id
  - 产品编号

- 代码：

  ```js
  fbq('track', 'AddToCart', {
      content_ids: 'affProductId',//产品id
      content_type: 'productSn'//产品编号
  });
  ```



#### 5. 添加支付信息

- 说明：

  在用户将要下单前，需要添加收货地址或者完善其他购物信息时执行。该方法无需传参。

- 代码：

  ```js
  fbq('track', 'AddPaymentInfo');
  ```



#### 6. 发起结账

- 说明：

  从购物车或者产品详情页发起结账时执行。

- 参数：

  - 产品价格
  - 产品货币种类

- 代码：

  ```js
  fbq('track', 'InitiateCheckout', {
      value: totalprice,//产品价格
      currency: 'TWD'//产品货币种类
  });
  ```



#### 7. 完成结账，生成订单

- 说明：

  通过**线上付款**或者**货到付款完成**结账动作**并且生成订单后**执行。

- 参数：

  - 产品价格
  - 产品货币种类
  - 产品id
  - 产品编号

- 代码：

  ```js
  fbq('track', 'Purchase', {
      value: '1200',
      currency: 'TWD',
      content_ids: 'affProductId',
      content_type: 'productSn'
  });
  ```



### 3. 如何测试

上面我们列举了大部分统计方法，相信大家很容易就能掌握并添加到自己的代码中。但是我们添加后，怎么进行测试呢？

大家可以安装一款`Chrome`插件??`Facebook Pixel Helper`，可以在该插件上看到各个方法的执行过程。该插件也需要科学上网才能起作用。

![mBaYGj.png](https://s2.ax1x.com/2019/08/23/mBaYGj.png)



### 4. 在`React`项目中的初始化

在`React`项目中，初始化时遇到了一些问题，下面是在`React`项目中初始化的方法：

```js
let fbq = '';
//初始化facebook像素
export function initFacebook() {
  (function (f, b, e, v, n, t, s){
    if (f.fbq) return; 
    n = f.fbq = function () {
      n.callMethod ? n.callMethod.apply(n, arguments) : n.queue.push(arguments)
    };
    
    if (!f._fbq) 
    f._fbq = n;
    n.push = n;
    n.loaded = !0;
    n.version = '2.0';
    n.queue = [];
    t = b.createElement(e);
    t.async = !0;t.src = v;
    s = b.getElementsByTagName(e)[0]; 
    s.parentNode.insertBefore(t, s)
    fbq = n
  })(window, document, 'script','https://connect.facebook.net/en_US/fbevents.js');

  fbq('init', facebookId); // 初始化像素编码
}
```

