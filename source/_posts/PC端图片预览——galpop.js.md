---
title: PC端图片预览——galpop.js
categories: jquery插件
date: 2019-04-04
copyright: true
---



之前在项目中使用过一个基于 `jquery` 的图片预览插件—— [jquery.galpop.js](https://github.com/Richard1320/Galpop/blob/master/js/jquery.galpop.js)，甚是好用。并对它念念不忘🎈🎈🎈。今天来回顾一下，并总结一点使用方法。

### 1. 介绍

该插件由[Richard Hung](http://www.magicmediamuse.com/)制作，[Github地址](https://github.com/Richard1320/Galpop)，[官方介绍及使用教程](http://galpop.magicmediamuse.com/)。





### 2. 可选参数

|     参数      | 默认值 |       可选值        |                      描述                       |
| :-----------: | :----: | :-----------------: | :---------------------------------------------: |
|   arrowKeys   |  true  |     true/false      |      使用键盘左箭头键和右箭头键。Esc关闭。      |
|   controls    |  true  |     true/false      |             显示next / prev控制箭头             |
|     loop      |  true  |     true/false      |                允许循环回到开始                 |
|   maxWidth    |  null  |       integer       |                宽度的最大像素量                 |
|   maxHeight   |  null  |       integer       |                高度的最大像素量                 |
|   maxScreen   |   90   |       integer       | 屏幕大小的最大百分比（覆盖maxWidth和maxHeight） |
|   updateRsz   |  true  |     true/false      |                  更新窗口大小                   |
|   callback    |  null  |      Function       |            函数在每个面板完成后运行             |
|  lockScroll   |  true  |     true/false      |        当弹出窗口打开时，防止浏览器滚动         |
|  contentType  | image  | image, AJAX, iframe |           要在弹出框中打开的内容类型            |
| AJAXContainer |  null  |   jQuery selector   |        要查找并加载到弹出框中的HTML元素         |

```js
$(function () {
  $('.className').galpop({
    arrowKeys: false,
    loop: false
  });
})
```

------

### 3. `<a>` 标签上使用的参数

（准备接受杨超越地洗礼吧）😆😆😆

1. `title`

   - 代码:

     ```html
     <a href="..." title="杨超越">
       <img src="..."/>
     </a>
     ```

   - 效果:

     [![A2iVgA.png](https://s2.ax1x.com/2019/04/04/A2iVgA.png)](https://s2.ax1x.com/2019/04/04/A2iVgA.png)

1. `data-galpop-link`

   - 代码:

     ```html
     <a href="..." title="杨超越" data-galpop-link="http://www.baidu.com">
       <img src="..."/>
     </a>
     ```

   - 效果:

     [![A2i83j.png](https://s2.ax1x.com/2019/04/04/A2i83j.png)](https://s2.ax1x.com/2019/04/04/A2i83j.png)

2. `data-galpop-link-title`

   - 代码:

     ```html
     <a href="..." title="杨超越" data-galpop-link="http://www.baidu.com" data-galpop-link-title="百度链接">
       <img src="..."/>
     </a>
     ```

   - 效果:

     [![A2is29.png](https://s2.ax1x.com/2019/04/04/A2is29.png)](https://s2.ax1x.com/2019/04/04/A2is29.png)

3. `data-galpop-link-target`

   加上该属性后，锚点中的页面将会在新的页面打开。

   - 代码:

     ```html
     <a href="..." title="杨超越" data-galpop-link="http://www.baidu.com" data-galpop-link-title="百度链接" data-galpop-link-target="http://www.baidu.com">
       <img src="..."/>
     </a>
     ```

------

### 4. 使用示例

因为是基于 `jquery` 制作的插件，在使用时需要引入[ jquery.js](http://code.jquery.com/jquery-latest.js) 。此外还需要引入该插件的 `js`/ `css` 文件。

#### 1. 预览单个图片

```html
<a href="https://s2.ax1x.com/2019/03/13/AkieC6.md.jpg" class="galpop"  title="图片1">
  <img src="https://s2.ax1x.com/2019/03/13/AkieC6.md.jpg" alt="图片1" />
</a>
<script>
  $(function () {
    $('.galpop').galpop();
  })
</script>
```

#### 2. 预览多张图片

需要在 `<a>` 标签上添加 `data-galpop-group=""` 属性，图片左右两侧会出现箭头，点击浏览上一张或下一张。

```html
<a href="https://s2.ax1x.com/2019/03/13/AkieC6.md.jpg" class="galpop-multiple" data-galpop-group="multiple" title="图片1">
  <img src="https://s2.ax1x.com/2019/03/13/AkieC6.md.jpg" alt="图片1" />
</a>
<a href="https://s2.ax1x.com/2019/03/13/Akim8K.md.jpg" class="galpop-multiple" data-galpop-group="multiple" title="图片2">
  <img src="https://s2.ax1x.com/2019/03/13/Akim8K.md.jpg" alt="图片2" />
</a>

<script>
  $(function () {
    $('.galpop-multiple').galpop();
  })
</script>
```

[![A29brV.gif](https://s2.ax1x.com/2019/04/04/A29brV.gif)](https://s2.ax1x.com/2019/04/04/A29brV.gif)

#### 3. 回调函数

```js
$(function () {
    $('.galpop-multiple').galpop({
      callback: callback
    });
  
    function callback() {
      var wrapper = $('#galpop-wrapper'); // 图片的包裹区域 
      var info    = $('#galpop-info'); // 图片左下角的信息展示区域

      var count   = wrapper.data('count'); // 图片总数
      var index   = wrapper.data('index') + 1; //当前正在浏览第几个
      
      var string  =  index +' / '+ count;
      info.append('<p>'+ string +'</p>').fadeIn();
      
    }
})
```

效果:

[![A2kj3Q.png](https://s2.ax1x.com/2019/04/04/A2kj3Q.png)](https://s2.ax1x.com/2019/04/04/A2kj3Q.png)

#### 4. 手动打开一张图片

使用 `openBox()` 方法，可以传入参数对象，当然也可以加入回调函数。

```js
<button class="openAImage">手动打开一张图片</button>
$('.openAImage').click(function (e) {
  var params = {
    maxWidth: 200,
    callback: function() {
      console.log('手动打开回调函数');
    }
  }
  $.fn.galpop('openBox', params,'https://s2.ax1x.com/2019/03/13/AkieC6.md.jpg')
})
```

[![A2VJ0I.gif](https://s2.ax1x.com/2019/04/04/A2VJ0I.gif)](https://s2.ax1x.com/2019/04/04/A2VJ0I.gif)

#### 5. 手动打开多张图片

和手动打开一张图片同样使用 `openBox()` 方法，只不过之前的方法中传入的是一个图片的`URL`，现在需要由多个图片`URL`组成的数组，其他参数不变。

```js
<button class="openAImage">手动打开一组图片</button>
var imgs = [
    'https://s2.ax1x.com/2019/03/13/AkieC6.md.jpg',
    'https://s2.ax1x.com/2019/03/13/Akim8K.md.jpg'
]
$('.openAImage').click(function (e) {
  var params = {
    maxWidth: 200,
    callback: function() {
      console.log('手动打开回调函数');
    }
  }
  $.fn.galpop('openBox', params, imgs)
})
```

[![A2V4c4.gif](https://s2.ax1x.com/2019/04/04/A2V4c4.gif)](https://s2.ax1x.com/2019/04/04/A2V4c4.gif)

#### 6. 打开一个iframe页面

```html
<a href="./iframe.html" class="click-open-iframe">点击打开iframe</a>

<script>
  $('.click-open-iframe').galpop({
    contentType: 'iframe',
  })
</script>
```

效果我就不演示了，总感觉不是特别实用。😏



### 5. 结语

⛳⛳⛳

首先感谢大家能读到这里，不胜感激！！！🤗

以上就是关于该插件的简单介绍和使用方法，以及对其参数的解读和实例，希望能帮到有需要的人。如果有不准确的地方，欢迎在下方评论中指正。😉