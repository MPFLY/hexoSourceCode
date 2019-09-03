---
title: 使用Hexo建好博客之后如何上传至Github
tags: Hexo
categories: 个人经验
date: 2017-12-21 14:20
copyright: true
---



### 1. 问题描述

之前就使用Hexo配合Github创建了一个个人博客，使用的还不错。但是最近突然出了一小问题，下面是问题描述：

- 创建新的博客之后，`hexo g`,`hexo s`之后，在本地的`localhost:4000`上可以看到新的文章生成，但是不能上传到我的Github仓库中。

- 我之前使用的上传方法是这样的：

  自己写了一个脚本文件，文件内容如下：

~~~shell
hexo generate
cp -R public/* .deploy/mpfly.github.io
cd .deploy/mpfly.github.io
git add .
git commit -m “update”
git push origin master
~~~

​	我很确定应该是我的上传方法出现了问题。



### 2. 解决问题

发现了问题那就解决吧，换一种上传的方法。当然需要足够的简单和便利。

**下面是新的方法：**

1. 在你的Hexo根目录下，执行`npm install hexo-deployer-git --save` 可以使用git的小黑框或者windows的。进行node组件安装。该组件是专门用来进行Github的上传。

2. 打开Hexo的配置文件`_config.yml`，修改如下字段：

   ```yaml
   url: http://yourName.github.io/
   
   deploy:
       type: git
       repo: http://github.com/yourName/yourName.github.io.git
       branch: master
   ```

   **在此处需要注意几点：**

   - yml文件的字段名的冒号和后面的数据需要隔开一个空格，否则会报错。
   - 此处的配置适用于你的Github仓库是没有分支的情况下，如果你的仓库有分支，需要将`branch`字段修改成你的分支名字。上面的url需要带上你的分支，并且还需要填写`root`字段，就在url下面。
   - 上面的几个网址，其实是https协议的，但是我看到论坛上有人说会报错，所以就替换成http了。因为自己没有试，也不知道究竟是否会有影响。你们可以试试。

### 3. 总结

以上就是配置了。现在将时间跳转至你已经写完了一篇新的文章，并且使用`hexo g`形成了静态页面，并且使用`hexo s`在本地浏览了一下。没问题之后就要把新的页面推到Github上了。你现在只需要在Hexo根目录执行`hexo deploy`就大功告成了。

好了，以上就是将Hexo博客推到Github上的一个小方法，配置起来还是比较简单，而且使用起来也很便利。