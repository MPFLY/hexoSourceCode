---
title: VSCode常用的插件
tags: VSCode
categories: 总结
date: 2019-07-15
copyright: true
---





## VSCode常用的插件



### 必备

|                           插件                            |                             说明                             |
| :-------------------------------------------------------: | :----------------------------------------------------------: |
|                         Beautify                          | 格式化各种语言的代码。`ctrl + shift + p` 打开控制面板，输入`Beautify file	`， |
|                      Auto Close Tag                       |                  自动添加HTML / XML关闭标签                  |
|                      Auto Rename Tag                      |                自动重命名配对的HTML / XML标签                |
|                **Bracket Pair Colorizer**                 |                       颜色识别匹配括号                       |
| Chinese (Simplified) Language Pack for Visual Studio Code |                        中文简体语言包                        |
|                         filesize                          | 在底部状态栏显示当前文件大小，点击后还可以看到详细创建、修改时间 |
|                GitLens — Git supercharged                 |     显示文件最近的 commit 和作者，显示当前行 commit 信息     |
|            **JavaScript (ES6) code snippets**             |                         es6代码片段                          |
|                      **Live Server**                      |                        浏览器实时刷新                        |
|                     Path Intellisense                     |                         路径自动补全                         |
|                        SVG Viewer                         | 可以打开 SVG 文件并查看它们。同时，它还包含了用于转换为 PNG 格式和生成数据 URI 模式的选项 |
|                           Vetur                           | Vue 语法高亮显示, 语法错误检查, 代码自动补全(配合 ESLint 插件效果更佳) |
|                      **js snippets**                      |                          js代码片段                          |
|                       **Easy LESS**                       |            将less文件自动保存为相同名字的css文件             |
|                     HTML Boilerplate                      |                    自动生成h5文件头部信息                    |
|                      open in browser                      |                   将静态页面在浏览器中打开                   |
|                       vscode-icons                        |                        修改编辑器icon                        |
|                      Trailing Spaces                      |               高亮那些冗余的空格，可以快速删掉               |
|                   Reactjs code snippets                   |           用 ES6 语法去开发 React.js 应用非常方便            |
|                        Color Info                         |                鼠标上移颜色块，显示该颜色信息                |
|                       autoprefixer                        |                     自动完成css代码兼容                      |
|                     vscode-fileheader                     | 顶部注释模板，可定义作者、时间等信息，并会自动更新最后修改时间<br/>快捷键: Ctrl+Alt+i |






### 小程序开发

|      插件       |                  说明                  |
| :-------------: | :------------------------------------: |
|   vscode wxml   | 为 VSCode 提供 wxml 语法支持及代码片段 |
|   小程序助手    |                                        |
|     minapp      |     微信小程序标签、属性的智能补全     |
|      wxml       |          格式化功能、高亮组件          |
| **Easy WXLESS** |      将less文件自动转换成wxss文件      |



### 主题

|        插件        |
| :----------------: |
|    One Dark Pro    |
| One Dark Pro Vivid |
|                    |
|                    |





### 快捷键

```json
[
    {
        "key": "ctrl+alt+",
        "command": "editor.action.addSelectionToNextFindMatch",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+d",
        "command": "-editor.action.addSelectionToNextFindMatch",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+d",
        "command": "editor.action.deleteLines",
        "when": "textInputFocus && !editorReadonly"
    },
    {
        "key": "ctrl+shift+k",
        "command": "-editor.action.deleteLines",
        "when": "textInputFocus && !editorReadonly"
    },
    {   "key": "alt+shift+t",
        "command": "trailing-spaces.deleteTrailingSpaces",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+shift+f",
        "command": "HookyQR.beautify",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+shift+c",
        "command": "autoprefixer.execute"
    }
]
```





