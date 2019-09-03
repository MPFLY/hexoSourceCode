---
title: gulp使用
tags: gulp
categories: nodeJS
date: 2017-10-22
copyright: true
---



### 为什么要使用gulp

来说说为什么要使用gulp等类似的前端自动化工具吧，用它之前总得知道为什么要用吧。

我们在完成一个复杂项目的时候，可能会用到less或者sass。还会创建很多的js。当然还有很多的图片文件。如果这些文件很少，那问题不大。项目跑起来也没有什么性能的忧虑（浏览器的性能）。如果js、css、图片文件很多、很大时，浏览器渲染起来就有点吃力了。我们需要把这些“庞大的”文件进行压缩，去掉其中的无用的空格和回车。来减小他们的体积。并将他们合并--将多个文件合并成一个，这样也可以有效的提高浏览器的效率。

当然，我们可以选择手动来压缩和合并这些文件。可是上文也已经说了，文件很多，很大。你还愿意手动来干这些简单且重复的工作吗？

所以，聪明的人总是很懒的。他们发明出了诸如grunt和gulp这样的自动化工具。让你只需要配置一遍，就可以让它来重复地完成这些“低级”的任务。



### 如何使用gulp

下面是几个gulp中常用的例子。前提：windows系统，已装好nodeJS，已装好了gulp。

#### 1. 编译less文件

1. 在你的项目中安装相应的gulp插件。我这儿使用的是`gulp-less`.

   在你的项目目录中，安装`npm install gulp-less`

   

2. 创建gulpfile.js文件，这是gulp的配置文件。如果熟悉nodeJS的同学会很熟悉这样的语法。require相应的模块，下面的`gulp.task()`就是gulp特有的了。task翻译过来是任务的意思。该方法下两个参数：

   - 第一个是该任务的名称，你可以在之后的小黑框中通过gulp [任务名称]来调用。
   - 第二个参数是一个函数，用来放你要执行的方法。

   ```javascript
   var gulp = require('gulp');
   	less = require('gulp-less');

   //编译less
   gulp.task('testLess', function() {
   	gulp.src('less/index.less')//该任务针对的文件
   	.pipe(less())//该任务调用的模块
   	.pipe(gulp.dest('css'));//将会在src/css下生成index.css
   });
   //定义默认任务
   gulp.task('default', ['testLess']);
   ```

   

3. 配置完成之后，在该项目下打开小黑框，输入`gulp testless`或者只输入`gulp`，如果只输入`gulp`将会执行配置文件中的默认任务，该默认任务名字为"default"。

#### 2. 压缩css文件

1. 安装插件`npm install gulp-minify-css`

2. 创建gulpfile.js文件

   ```js
   var gulp = require('gulp');
   	minifycss = require('gulp-minify-css');
   	
   gulp.task('minifycss', function() {
   	gulp.src('css/*.css') //要压缩的文件
       .pipe(minifycss())  //执行压缩
   	.pipe(gulp.dest('min.css')); //输出文件夹
   });
   gulp.task('default', ['minifycss']);
   ```

3. 执行：`gulp minifycss`或`gulp`

#### 3. 合并压缩js文件

1. 安装插件

   - 合并：`npm install gulp-concat`
   - 压缩js：`npm install gulp-uglify`
   - 重命名：`npm install gulp-rename`

2. 创建gulpfile.js文件

   ```javascript
   var gulp = require('gulp');
   	uglify = require('gulp-uglify');
   	concat = require('gulp-concat');
   	rename = require('gulp-rename');
   	
   	//合并压缩js文件
   gulp.task('minifyjs', function () {
           gulp.src('js/*.js')//拿到该文件夹下的所有js文件
           .pipe(concat('main.js'))//合并成main.js文件,还没有压缩
           .pipe(gulp.dest('main'))//将main.js放入该文件夹下
            .pipe(rename({suffix: '.min'}))   //rename压缩后的文件名
           .pipe(uglify())//进行压缩
           .pipe(gulp.dest('min.js'));//将合并、压缩之后的文件保存在这个目录下
   });

   //定义默认任务
   gulp.task('default', ['minifyjs']);
   ```

   

3. 执行：`gulp minifyjs`或`gulp`





### 总结

​	好了，以上就是gulp中比较常用的插件，写此总结。其实配置文件还有很多好玩的东西。比如：

- `pipe()`，pipe翻译过来是管道的意思。相信大家看gulp简介的时候会看到，gulp是基于管道流实现的。当然，我对这个“管道流”也实在是了解不深，但是可以从代码上看出一二。

  ​	配置文件中的`task()`方法中都是链式编程，从`gulp.src()`选择源头开始，一个`pipe()`方法链接着一个`pipe()`方法，直到最后进入`gulp.dest()`方法输出来。src()方法选择要操作的文件，每通过一个管道，进行一次处理，到最后dest()方法，完成所有操作后，指定一个文件夹输出出来。

  ​	像上面的合并压缩js任务，就需要好几条“管道”进行链接。第一个管道进行合并操作，第二个将上一个管道处理完成的输出出去并传递给的第三个，第三个将拿到后进行压缩，第四个重命名，知道最后将合并且压缩且重命名的文件输出出去。这就完成了一次“格式化”。

- 默认任务：

  ​	配置文件中有一个默认任务，当你在小黑框中输入gulp时，默认执行该方法。该方法的第二个参数是一个数组，将你定义好的人物依次放入该数组中，你只需要在gulp一次，就会依次执行，得到最后的结果。

  

  当然，要学习和研究的东西还有很多。**Stay Hungry,Stay Foolish.**



