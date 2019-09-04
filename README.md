# hexo博客源文件



## File Tree

> |__ scaffolds
>
> ​	|__ source  （markdown源文件）
>
> ​		|___ _posts （博客原始.md文件）
>
> ​		|___ about（【关于我】原始.md文件）
>
> ​		|___ favicon.ico（博客网站图标）
>
> ​	|__ themes （hexo主题文件）
>
> ​		|__ next （next主题）
>
> ​			|__  _config.yml （next主题配置文件）
>
> ​	|__ _config.yml （hexo配置文件）

​	

## Installation

```
$ npm install hexo-cli -g
```

```
$ npm install i
```



## Quick Start

### 1. 新增博文

使用

```
$ hexo new "新的博客文章标题"
```

或者直接在`source/_posts` 文件夹下新增`新的博客文章标题.md`文档。

需要在博客内部添加头部信息：

```
​```
title: 文章名称
tags: 
    - 第1个标签
    - 第2个标签
categories: 文章类别
date: 2017-01-13 16:07:32
copyright: true
password: 111111
​```
```

### 2. 构建博客

```
$ hexo g
```

### 3. 本地测试

```
$ hexo s
```

### 4. 部署到github

```
$ hexo d
```



## More Information

该博客模板使用`Next`主题，版本为`V4.0`

在`Next`主题下，配置了如下功能：

- 博客底部标签样式修改
- 文章结束标志
- RSS订阅
- 修改代码样式
- 站点访问量统计
- 站点字数统计
- 文章阅读时间、字数统计
- 文章底部版权信息展示
- 文章加密访问
- 添加评论
- 站点博文搜索

详情请查看[Hexo使用Next主题的配置](https://mpfly.github.io/2019/08/21/Hexo使用Next主题的配置)



