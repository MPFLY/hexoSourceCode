---
title: 关于Java中反射的认识
tags: 总结
categories: 总结与区别
date: 2017-05-29
copyright: true
---

首先讲一下,以下的内容,源自下面的连接,关于反射,讲得很清楚,我也只是根据链接中的内容,加一点自己的理解.写一下。
[java反射](https://mp.weixin.qq.com/s/Dn8M1jsAT8tM8a31gAkd0g)

----------
### 引出反射

先给一个Hello类:

```java
package com.mi.beans;

public class Hello {
	private String name;
	
	public Hello() {
		// TODO Auto-generated constructor stub
	}
	
	public void sayHello() {
		System.out.println("hello");
	}
}

```
#### 下面是要求:

1. 实例化Hello类，但是不能使用`Hello hello = new Hello()`来实例化。

2. 调用Hello类中的`sayHello()`方法，但是不能直接使用Hello的实例来调用。

   在这里,就用到了反射了，下面是代码:

```java
package com.mi.test;

import java.lang.reflect.Method;

public class ReflectTest {
	public static void main(String[] args) {
		try {
			Class claz = Class.forName("com.mi.beans.Hello");
			Object obj = claz.newInstance();
			Method method = claz.getDeclaredMethod("sayHello");
			method.invoke(obj);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}

```
说一下代码里涉及到的几个方法和类:

**1. Class类**

 - Class类也是java中的一个类,隶属于lang包下。只是和关键字class长相相似。而java是大小写敏感的。
 - Class类的对象内容是你创建的类的类型信息，比如你创建一个shapes类，那么，Java会生成一个内容是shapes的Class类的对象
 - Class 没有公共构造方法。Class 对象是在加载类时由 Java 虚拟机以及通过调用类加载器中的 defineClass 方法自动构造的。所以不能像普通类一样，通过New来创建对象。



**2. forName()**

 - **参数**：className - 所需类的**完全限定名**。
 - **返回值**：具有指定名的类的 Class 对象。

**3. newInstance()**

 **返回值**:此对象所表示的类的一个新分配的实例。Object类型
 也就是创建一个对象。
 **4.getDeclaredMethod()**

 - 参数：name - 方法名
parameterTypes - 参数数组 
 - 返回值：该类与指定名和参数相匹配的方法的 **Method 对象**，需要Method对象来接收。

也就是拿到该对象的某个方法，方法的参数用来找到这个方法，包括方法名，和方法参数。找到唯一的一个方法。

**5. Method类**
存放方法的类，方法也是对象。所以需要对方法进行操作。

 **6. invoke();**


 - **参数**：obj - 从中调用底层方法的对象
args - 用于方法调用的参数 
 - **返回值**：使用参数 args 在 obj 上指派该对象所表示方法的结果 

也就是执行某个方法，注意是Method对象调用该方法.该方法的参数中有被执行方法的方法名以及参数列表。用以执行某一个具体的方法。

<hr>
**实例**
上面是使用反射所需要到的最基本的东西，下面举一个应用中的实例：【spring】中的反射。前两天在学spring框架，只是会一点使用而已，对一些原理性的东西还不是很懂.借此机会,也深入的了解一下底层的东西。下面是具体的代码：

 **1. 创建一个Bean：**


```java
public  class   Hello
{
    private String message;
    public void setMessage(String message){
        this.message  = message;
    }
    public void getMessage(){
        System.out.println("My Message : "+ message);
    }
}
```

 **2. 配置信息**
下面是在spring的配置文件中,通过set注入的方式对Hello类中的字段进行赋值.前提是你的实体类中的字段有get/set方法.

```java
<bean id="hello"class="com.mi.beans.Hello">
    <propertyname="message"value="Hello World!"/>
</bean>
```
**3.调用**

```java
ApplicationContext context =newClassPathXmlApplicationContext("Beans.xml");
Hello hello = (Hello) context.getBean("hello");
hello.getMessage();
```
上面的代码,可以想到它的底层应该是这样实现的:
1.通过参数中的Beans.xml文件,解析xml文件中的信息.
2.根据xml文件中的信息,包括类名/字段/,通过反射创建对象.
3.再通过反射,调用set方法或者get方法,这样你就能拿到最后的结果了.
[newClassPathXmlApplicationContext()源代码](http:ayu//blog.csdn.net/zhengyong15984285623/article/details/51690969)

###  总结

反射最大的作用就是：**以申明式的方式(xml或注解)来描述应用的行为**。也就是不用把一切的东西写死，而是可以变化地来操作，极大的增强了编程时的灵活性。
	简单的来讲， 反射能让你在**运行时而不是编程时**做下面的事情：
(1) 获取一个类的内部结构信息（或者称为元数据）， 包括包名，类名， 类所有的方法。
(2) 运行时对一个Java对象进行操作， 包括创建这个类的实例， 设置一个属性的值， 调用这个类的方法等等。

（对了，我们经常使用MyEclipse也是使用了反射，才可以给出我们相对应的提示信息的，反射无处不在啊！）


