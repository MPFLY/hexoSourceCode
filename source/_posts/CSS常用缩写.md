---
title: CSS常用缩写
tags: 常用查询
categories: CSS
date: 2017-10-25
copyright: true
---

## border

```css
/*缩写前*/
element{
    border-top-width:1px;
    border-top-style:solid;
    border-top-color:#cccccc;
}
element{
    border-top:1px solid #cccccc;
    border-left:1px solid #cccccc;
    border-right:1px soli #cccccc;
    border-bottom:1px solid #cccccc;
}
/*缩写后*/
element{
    border:1px solid #ccc;
}
```

## background
```css
/* 缩写前 */
element{
    background-color:#ccc;
    background-image:url(sample.gif);
    background-repeat:repeat-x;
    background-attachment:scroll;//scroll是背景图像随对象内容滚动为默认值，可以不写
    background-position:top right;
}
/* 缩写后 */
element{
    background:#ccc url(sample.gif) repeat-x top right;
    //属性依次为：颜色-背景图-X轴平铺-背景图像位置(背景图片路径不需要加引号)
}
```
## margin
```css
element{
    margin-top:15px;
    margin-right:20px;
    margin-bottom:12px;
    margin-left:24px;    
}
/*缩写后*/

element{
    margin:15px 20px 12px 24px; //上，右，下，左 
}
```
## padding
```css
element{
    padding-top:15px;
    padding-right:20px;
    padding-bottom:12px;
    padding-left:24px;    
}
/*缩写后*/

element{
    padding:15px 20px 12px 24px;  //上，右，下，左 
}
```
## font
```css
element{
    font-style:italic //设置或检索对象中的字体样式
    font-variant:normal //设置或检索对象中的文本是否为小型的大写字母
    //前2项如果没有特殊设置，可以不写，用默认值即可
    font-weight:bold;
    font-size:12px;
    line-height:20px;
    font-family:"宋体";  
}
/*缩写后*/

element{
    font:bold 12px/20px "宋体";
    //属性依次为：字体的粗细 - 字体大小/行高 - 文本的字体 
}
```
## list-style
```css
element{
    list-style-image:url(sample.gif);
    list-style-position:outside;
    list-style-type:circle; 
}
/*缩写后*/

element{
    list-style:circle inside url(sample.gif);
}
/*属性依次为：预设标记 - 标记位置 - 标记图片(标记图片路径不需要加引号)，
预设标记和标记图片可二选一，如果二者都定义，则标记图片覆盖预设标记，不过在项目中基本都是用背景图片进行定义；*/
```