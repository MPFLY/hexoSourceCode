---
title: ES6的class的使用
tags: class
categories: JS
date: 2017-09-01
copyright: true
---





# ES6——Class

## ES5如何编写类以及类的继承

```javascript
	function Person(name,sex,type){
		this.name = name;
		this.sex = sex;
		this.type = type
		
		this.showName = function(){
			alert(this.name);
		};
		this.showSex = function (){
			alert(this.sex);
		};
	};
	
	//继承Person类
	function Teacher(name,sex,tall,type){
		Person.call(this,name,sex,type);
		this.tall = tall;
	}
```

 ## ES6如何编写类以及类的继承

```javascript
	class Person{
		constructor(name,sex){
			this.name = name;
			this.sex = sex;
		};
		showName(){
			alert(this.name);
		}
      	//静态方法
      	static demoFunc(){
			alert("我是静态方法");
		}
	}
	//继承Person类
	class Teacher extends Person{
		constructor(name,sex,tall){
			super(name,sex);
			this.tall = tall;
		}
		showTall(){
			alert(this.tall);
		}
      //覆写父类中的方法
		showName(){
			alert("我的名字是："+this.name);
		}
	}
```



