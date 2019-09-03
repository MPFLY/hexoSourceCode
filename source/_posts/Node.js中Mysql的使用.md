---
title: Node.js中Mysql的使用
tags: 总结
categories: nodeJS
date: 2017-09-28
copyright: true
---

首先安装mysql模块， npm install sql，这条语句是安装mysql模块到你的项目中，而不是全局安装。

安装之后，就可以进行js代码的编写了。
**server.js**
```js
var mysql = require('mysql');
//数据库连接
var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'root',
	database: 'nodejsdemo'
});
connection.connect();
//数据库的CRUD语句
var selectAllSql = "select * from userMag";
var selectOneSql = "select * from userMag where uname like ? ";
var insertSql = "insert into userMag (uname,uphone,age) values (?,?,?)";
var delSql = "delete from userMag where uid = ?";
var updateSql = "update userMag set uname = ?,uphone = ?,age = ? where uid = ?";
//执行sql语句
connection.query(selectAllSql, function(err, rows) {
	if(err) {
		console.log(err);
		return;
	}
	//对查找到的数据进行操作，此处我将数据传递给了ejs模版。
	res.render("index.ejs",{data:rows});
});
```

编写好js代码之后，就可以进行测试了，将你的mysql开启。在项目文件中，在命令行中输入node  server.js。就将这个node服务开启，之后你就可以在你的mysql中看到数据的变化。`connection.query(paramA,paramB[],callback())` 方法执行sql语句。第一个参数为要执行的sql语句，第二个参数（可选）是一个数组类型，为sql语句中要传入的参数，第三个参数为回调函数。
**例如:**

```js
var updateSql = "update userMag set uname = ?,uphone = ?,age = ? where uid = ?";
connection.query(updateSql, ["张三","155","23","05"],function(err, rows) {
	if(err) {
		console.log(err);
		return;
	}
});
```

