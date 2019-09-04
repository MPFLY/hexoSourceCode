---
title: Hexo使用Next主题的配置
tags: Hexo
categories: Hexo
date: 2019-08-21
copyright: true
---





## 1. 博客底部标签样式

只需要修改模板`/themes/next/layout/_macro/post.swig`，搜索 `rel="tag">#`，将 # 换成`<i class="fa fa-tag"></i>`



## 2. 文章结束标志

在路径 `\themes\next\layout\_macro` 中新建 `passage-end-tag.swig` 文件,并添加以下内容：

```html
<div>
    {% if not is_index %}
        <div style="text-align:center;color: #ccc;font-size:14px;">-------------本文结束<i class="fa fa-paw"></i>感谢您的阅读-------------</div>
    {% endif %}
</div>
```

接着打开`\themes\next\layout\_macro\post.swig`文件，在`post-body` 之后(`END POST BODY`)， `post-footer` 之前添加如代码：

```html
<div>
  {% if not is_index %}
    {% include 'passage-end-tag.swig' %}
  {% endif %}
</div>
```

然后打开主题配置文件（`_config.yml`),在末尾添加：

```yml
# 文章末尾添加“本文结束”标记
passage_end_tag:
  enabled: true
```



## 3. RSS

1. 切换到根目录下，然后运行如下代码，安装`hexo-generator-feed`

   ```shell
   $ npm install --save hexo-generator-feed
   ```

2. 在`hexo`的`_config.yml`中，在最后添加如下代码：

   ```yml
   # Extensions
   ## Plugins: http://hexo.io/plugins/
   plugins: hexo-generate-feed
   ```

3. 在`next`主题的`_config.yml`中`ctrl + F`找到`rss:`，添加代码如下：

   （**注意**在冒号后面要加一个空格）

   ```yml
   # Set rss to false to disable feed link.
   # Leave rss as empty to use site's feed link.
   # Set rss to specific value if you have burned your feed already.
   rss: /atom.xml
   ```

4. 重新生成一次，你会在`./public` 文件夹中看到 `atom.xml` 文件。然后启动服务器查看是否有效，之后再部署到 `github `中。



## 4. 修改文章内链接文本样式

修改文件 `themes\next\source\css\_common\components\post\post.styl`，在末尾添加如下`css`样式

```stylus
// 文章内链接文本样式
.post-body p a{
  color: #0593d3;
  border-bottom: none;
  border-bottom: 1px solid #0593d3;
  transition color .3s;
  &:hover {
    color: #fc6423;
    border-bottom: none;
    border-bottom: 1px solid #fc6423;
  }
}
```



## 5. 文章字体大小改为`16px`

修改文件 `themes\next\source\css\_common\components\post\post.styl`，找到`.post-body`，修改其中代码如下：

```stylus
.post-body {
  font-family: $font-family-posts;
  font-size 16px;
  +mobile() {
    word-break: break-word;
  }
}
```



## 6. 修改作者头像鼠标上移旋转

打开`\themes\next\source\css\_common\components\sidebar\sidebar-author.styl`，在里面添加如下代码：

```stylus
.site-author-image {
  display: block;
  margin: 0 auto;
  cursor pointer;
  padding: $site-author-image-padding;
  max-width: $site-author-image-width;
  height: $site-author-image-height;
  border: $site-author-image-border-width solid $site-author-image-border-color;
  /* 头像圆形 */
  border-radius: 80px;
  -webkit-border-radius: 80px;
  -moz-border-radius: 80px;
  box-shadow: inset 0 -1px 0 #333sf;
  /* 设置循环动画 [animation: (play)动画名称 (2s)动画播放时长单位秒或微秒 (ase-out)动画播放的速度曲线为以低速结束 
    (1s)等待1秒然后开始动画 (1)动画播放次数(infinite为循环播放) ]*/
 
  /* 鼠标经过头像旋转360度 */
  -webkit-transition: -webkit-transform .5s ease-out;
  -moz-transition: -moz-transform .5s ease-out;
  transition: transform .5s ease-out;
}
img:hover {
  /* 鼠标经过停止头像旋转 
  -webkit-animation-play-state:paused;
  animation-play-state:paused;*/
  /* 鼠标经过头像旋转360度 */
  -webkit-transform: rotateZ(360deg);
  -moz-transform: rotateZ(360deg);
  transform: rotateZ(360deg);
}
/* Z 轴旋转动画 */
@-webkit-keyframes play {
  0% {
    -webkit-transform: rotateZ(0deg);
  }
  100% {
    -webkit-transform: rotateZ(-360deg);
  }
}
@-moz-keyframes play {
  0% {
    -moz-transform: rotateZ(0deg);
  }
  100% {
    -moz-transform: rotateZ(-360deg);
  }
}
@keyframes play {
  0% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(-360deg);
  }
}
```



## 7. 代码样式——包括代码块和多行代码

打开`\themes\next\source\css\_custom\custom.styl`,向里面加入：

```stylus
code {
    color: #ff7600;
    background: #fbf7f8;
    margin: 2px;
    border: 1px solid #d6d6d6;
}
// 大代码块的自定义样式
.highlight, pre {
    margin: 5px 0;
    padding: 5px;
    border-radius: 3px;
}
.highlight, code, pre {
    border: 1px solid #d6d6d6;
}
.highlight .line {
    height: 24px;
}
```



## 8. 站点访问量

**较低版本的`next`没有内置`busuanzi`，推荐以下方法**

打开`\themes\next\layout\_partials\footer.swig`文件

1. 在一开头加上以下代码：

   ```html
   <script async 					src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js">
   </script>
   ```

2. 然后在合适的位置添加显示统计的代码

   ```html
   <div class="powered-by">
     <i class="fa fa-user-md"></i>
     <span id="busuanzi_container_site_uv">
       本站访客数:<span id="busuanzi_value_site_pv"></span>
     </span>
   </div>
   ```

   在这里有两中不同计算方式的统计代码：

   1. **pv**的方式，单个用户连续点击n篇文章，记录n次访问量

      ```html
      <span id="busuanzi_container_site_pv">
          本站总访问量<span id="busuanzi_value_site_pv"></span>次
      </span>
      ```

      

   2. **uv**的方式，单个用户连续点击n篇文章，只记录1次访客数

      ```html
      <span id="busuanzi_container_site_uv">
        本站总访问量<span id="busuanzi_value_site_uv"></span>次
      </span>
      ```

3. 清除缓存，重新加载，搞定。

**版本较高的内置的`busuanzi`**

只需要在主题配置文件中修改如下：

```yaml
# Show PV/UV of the website/page with busuanzi.
# Get more information on http://ibruce.info/2015/04/04/busuanzi/
busuanzi_count:
  # count values only if the other configs are false
  enable: true
  # custom uv span for the whole site
  site_uv: true
  site_uv_header: <i class="fa fa-user"></i> 本站访问量
  site_uv_footer:
  # custom pv span for the whole site
  site_pv: true
  site_pv_header: <i class="fa fa-eye"></i> 本站访客数
  site_pv_footer:
  # custom pv span for one page only
  page_pv: true
  page_pv_header: <i class="fa fa-file-o"></i> 文章阅读量
  page_pv_footer:
```





## 9. 全站字数统计

**针对较低版本的`next`，推荐一下方法**

1. 切换到根目录下，然后运行如下代码：

   ```shell
   $ npm install hexo-wordcount --save
   ```

2. 在`/themes/next/layout/_partials/footer.swig`文件内合适位置加上：

   ```html
   <div class="theme-info">
     <div class="powered-by"></div>
     <span class="post-count">博客全站共{{ totalcount(site) }}字</span>
   </div>
   ```

3. 清除缓存，重新加载，搞定。

**版本比较高的**

打开主题配置文件，找到`post_wordcount`，配置如下：

```yaml
# Post wordcount display settings
# Dependencies: https://github.com/willin/hexo-wordcount
post_wordcount:
  item_text: true
  wordcount: true
  min2read: true
  totalcount: true
  separated_meta: true
```





## 10. 阅读时间、文章字数

1. 切换到根目录下，然后运行如下代码：

   ```shell
   $ npm install hexo-wordcount --save
   ```

2. 然后在主题的配置文件中，配置如下：

   ```yaml
   # Post wordcount display settings
   # Dependencies: https://github.com/willin/hexo-wordcount
   post_wordcount:
     item_text: true
     wordcount: true
     min2read: true
   ```

3. 清除缓存，重新加载，搞定。



## 11. 在文章底部增加版权信息

1. 在目录 `next/layout/_macro/下`添加 `my-copyright.swig`：

   ```html
   {% if page.copyright %}
   <div class="my_post_copyright">
     <script src="//cdn.bootcss.com/clipboard.js/1.5.10/clipboard.min.js"></script>
     
     <!-- JS库 sweetalert 可修改路径 -->
     <script src="https://cdn.bootcss.com/jquery/2.0.0/jquery.min.js"></script>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     <p><span>本文标题:</span><a href="{{ url_for(page.path) }}">{{ page.title }}</a></p>
     <p><span>文章作者:</span><a href="/" title="访问 {{ theme.author }} 的个人博客">{{ theme.author }}</a></p>
     <p><span>发布时间:</span>{{ page.date.format("YYYY年MM月DD日 - HH:mm") }}</p>
     <p><span>最后更新:</span>{{ page.updated.format("YYYY年MM月DD日 - HH:mm") }}</p>
     <p><span>原始链接:</span><a href="{{ url_for(page.path) }}" title="{{ page.title }}">{{ page.permalink }}</a>
       <span class="copy-path"  title="点击复制文章链接"><i class="fa fa-clipboard" data-clipboard-text="{{ page.permalink }}"  aria-label="复制成功！"></i></span>
     </p>
     <p><span>许可协议:</span><i class="fa fa-creative-commons"></i> <a rel="license" href="https://creativecommons.org/licenses/by-nc-nd/4.0/" target="_blank" title="Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)">署名-非商业性使用-禁止演绎 4.0 国际</a> 转载请保留原文链接及作者。</p>  
   </div>
   <script> 
       var clipboard = new Clipboard('.fa-clipboard');
       $(".fa-clipboard").click(function(){
         clipboard.on('success', function(){
           swal({   
             title: "",   
             text: '复制成功',
             icon: "success", 
             showConfirmButton: true
             });
   	});
       });  
   </script>
   {% endif %}
   ```

2. 在目录`next/source/css/_common/components/post/`下添加`my-post-copyright.styl`：

   ```stylus
   .my_post_copyright {
     width: 85%;
     max-width: 45em;
     margin: 2.8em auto 0;
     padding: 0.5em 1.0em;
     border: 1px solid #d3d3d3;
     font-size: 0.93rem;
     line-height: 1.6em;
     word-break: break-all;
     background: rgba(255,255,255,0.4);
   }
   .my_post_copyright p{margin:0;}
   .my_post_copyright span {
     display: inline-block;
     width: 5.2em;
     color: #b5b5b5;
     font-weight: bold;
   }
   .my_post_copyright .raw {
     margin-left: 1em;
     width: 5em;
   }
   .my_post_copyright a {
     color: #808080;
     border-bottom:0;
   }
   .my_post_copyright a:hover {
     color: #a3d2a3;
     text-decoration: underline;
   }
   .my_post_copyright:hover .fa-clipboard {
     color: #000;
   }
   .my_post_copyright .post-url:hover {
     font-weight: normal;
   }
   .my_post_copyright .copy-path {
     margin-left: 1em;
     width: 1em;
     +mobile(){display:none;}
   }
   .my_post_copyright .copy-path:hover {
     color: #808080;
     cursor: pointer;
   }
   ```

3. 修改`next/layout/_macro/post.swig`，在代码

   ```html
   <div>
         {% if not is_index %}
           {% include 'wechat-subscriber.swig' %}
         {% endif %}
   </div>
   ```

   之前添加增加如下代码：

   ```html
   <div>
         {% if not is_index %}
           {% include 'my-copyright.swig' %}
         {% endif %}
   </div>
   ```

4. 修改`next/source/css/_common/components/post/post.styl`文件，在最后一行增加代码：

   ```yaml
   @import "my-post-copyright"
   ```

5. 保存重新生成即可。

6. 需要在每篇文章的头部添加如下代码：

   ```yaml
   copyright: true
   ```

   ![](<https://upload-images.jianshu.io/upload_images/5308475-51f087ce1f1903a6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240>)



## 12. 文章加密访问

打开`themes->next->layout->_partials->head.swig`文件，在顶部位置插入这样一段代码：

```html
<script>
    (function () {
        if ('{{ page.password }}') {
            if (prompt('请输入文章密码') !== '{{ page.password }}') {
                alert('密码错误！');
                if (history.length === 1) {
                    location.replace("http://xxxxxxx.xxx"); // 这里替换成你的首页
                } else {
                    history.back();
                }
            }	
        }
    })();
</script>
```

在写文章时，如需对该文章加密，需要在文章头部添加以下代码：

```yaml
password: ******
```

这样在打开文章时，会自动弹出密码输入框。



## 13. 修改打赏字体不闪动

修改文件`next/source/css/_common/components/post/post-reward.styl`，然后注释其中的函数`wechat:hover`和`alipay:hover`，如下：

```stylus
/* 注释文字闪动函数
 #wechat:hover p{
    animation: roll 0.1s infinite linear;
    -webkit-animation: roll 0.1s infinite linear;
    -moz-animation: roll 0.1s infinite linear;
}
 #alipay:hover p{
   animation: roll 0.1s infinite linear;
    -webkit-animation: roll 0.1s infinite linear;
    -moz-animation: roll 0.1s infinite linear;
}
*/
```



## 14. 添加友情链接

打开主题配置文件修改成这样就行了(links里面写你想要的链接)：

```yaml
links_icon: link
links_title: 友情链接
# links_layout: block
links_layout: inline
links:
  慧行说: https://www.liuyude.com/
  张鑫旭: https://www.zhangxinxu.com/
```



## 15. 评论

我使用Valine来进行评论，具体的步骤如下：

1. 在[leanCloud]([https://leancloudblog.com](https://leancloudblog.com/))上注册一个账号

2. 注册成功并登录后，你会得到两个数据：

   - App ID
   - App Key

   复制并保存

3. 打开主题配置文件，我的版本是v5.1.3，其中已经内置了Valine评论系统，只需要打开即可：

   ```yaml
   valine:
     enable: true
     appid: yourAppid
     appkey: yourAppkey
     notify: false # mail notifier , https://github.com/xCss/Valine/wiki
     verify: false # Verification code
     placeholder: 请输入您的评论，看到必回复！ # comment box placeholder
     avatar: mm # gravatar style
     guest_info: nick,mail,link # custom comment header
     pageSize: 10 # pagination size
   ```

4. Valine 目前使用的是[Gravatar](http://cn.gravatar.com/) 作为评论列表头像。

   请自行登录或注册[Gravatar](http://cn.gravatar.com/)，然后修改自己的头像。

   评论的时候，留下在[Gravatar](http://cn.gravatar.com/)注册时所使用的邮箱即可。

## 16. 添加文章更新时间

1. 修改`/themes/next/layout/_macro/post.swig` 文件，在`<span class="post-time">...</span>`标签后添加：

   ```html
   {%if post.updated and post.updated > post.date%}
     <span class="post-updated">
       &nbsp; | &nbsp; {{ __('post.updated') }}
       <time itemprop="dateUpdated" datetime="{{ moment(post.updated).format() }}" content="{{ date(post.updated, config.date_format) }}">
         {{ date(post.updated, config.date_format) }}
       </time>
     </span>
   {% endif %}
   ```

2. 在`/themes/next/languages/zh_Hans.yml`中新增：

   ```
   post:
     updated: 更新于
   ```

3. 修改主题配置文件`/themes/next/_config.yml`，增加一行

   ```yaml
   display_updated: true
   ```

4. 写文章的时候可以直接在文章开头设置更新时间：

   ```yaml
   updated: 2018-01-01 12:30
   ```

   没有参数的话将会默认显示`.md`文件的修改日期



## 17. 文章搜索

1. 根目录下执行：

   ```shell
   npm install hexo-generator-searchdb --save
   ```

2. 在主题配置文件`/theme/next/_config.yml`中添加配置：

   ```yaml
   search:
     path: search.xml
     field: post
     format: html
     limit: 10000
   ```

   并修改数据

   ```yaml
   local_search:
     enable: true
   ```

   

## 18. 阅读次数

打开主题配置文件`/theme/next/_config.yml`修改配置如下

```yaml
busuanzi_count:
  # count values only if the other configs are false
  enable: true
  # custom uv span for the whole site
  site_uv: false
  site_uv_header: <i class="fa fa-user"></i>
  site_uv_footer:
  # custom pv span for the whole site
  site_pv: false
  site_pv_header: <i class="fa fa-eye"></i>
  site_pv_footer:
  # custom pv span for one page only
  page_pv: true
  page_pv_header: <i class="fa fa-file-o"></i> 文章阅读量
  page_pv_footer:
```

由上到下分别是

- 全站的UV
- 全站的PV
- 文章的PV



## 19. 配置背景动画

打开主题配置文件`/theme/next/_config.yml`修改配置如下：

```yaml
# Canvas-nest
canvas_nest: false

# three_waves
three_waves: false

# canvas_lines
canvas_lines: false

# canvas_sphere
canvas_sphere: false
```



## 20. 首页文章列表鼠标上移样式

打开`\themes\next\source\css\_custom\custom.styl`，向里面加入：

```stylus
// 主页文章添加阴影效果
.post {
    margin-top: 60px;
    padding: 25px;
    transition: box-shadow .3s;
    &:hover{
        box-shadow: 0px 6px 8px 6px rgba(202,203,203,0.5);
        -webkit-box-shadow: 0px 6px 8px 6px rgba(202,203,203,0.5);
        -moz-box-shadow: 0px 6px 8px 6px rgba(202,203,203,0.5);
    }
}
```



## 21. 去掉文章目录自动生成的编号

打开主题配置文件`/theme/next/_config.yml`修改配置如下：

```yaml
 # Automatically add list number to toc.
  number: false
```



## 22. 文章头部添加【天气】

打开`\themes\next\layout\_macro\post.swig`，在合适位置加入：

```html
{% if post.weather%}
  <span class="post-meta-divider">|</span>
  <span class="post-meta-item-text">天气：</span>
  <span>{{ post.weather }}</span>
{% endif %}
```

在写博文时，需要在头部新增`weather`字段

```
title: 
tags: 
    - 1
    - 2
categories: 
weather: 晴
date: 2017-01-13 16:07:32
copyright: true
password: 
```

