---
title: Hibernate数据库框架的入门
categories: Hibernate
date: 2017-05-16
copyright: true
---



Hibernate是一个开放源代码的对象关系映射框架，它对JDBC进行了非常轻量级的对象封装，它将POJO与数据库表建立映射关系，是一个全自动的orm框架，hibernate可以自动生成SQL语句，自动执行，使得Java程序员可以随心所欲的使用对象编程思维来操纵数据库。 Hibernate可以应用在任何使用JDBC的场合，既可以在Java的客户端程序使用，也可以在Servlet/JSP的Web应用中使用，最具革命意义的是，Hibernate可以在应用EJB的J2EE架构中取代CMP，完成数据持久化的重任。

### 搭建框架的步骤:(使用xml方式) ###
1. 导入许多包,以下:包括框架包/注释包/Mysql包/日志包/测试包,当然测试包和日志包可选.
   ![14个jar包,包括框架包,注释包,Mysql包,日志包,测试包](http://img.blog.csdn.net/20170516220443812?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

2. 创建一个实体类
   在beans包下加入一个xml文件 如下:
   ![这里写图片描述](http://img.blog.csdn.net/20170516221042758?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
3. 在src下加入一个另一个xml文件,这个文件是使用Hibernate的关键,千万不能出错。

![这里写图片描述](http://img.blog.csdn.net/20170516221201643?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

4. 具体代码：
   **实体类中的字段**

```java
	private int uid;
	private String name;
	private String password;
	private int age;
```
**User.hbm.xml中的代码**,也就是在beans包中的那个xml文件的.相应的代码有注释解释.

```xml
<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC
      "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
          "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">

<hibernate-mapping package="com.mi.beans">
	<!-- 写上类名以及对应到数据库中的表明 -->
    <class name="User" table="t_user">
    <!-- 这是设置主键 -->
        <id name="uid">
        	<!-- 设置主键生成策略,这里一般都用native方法 -->
        	<generator class="native"></generator>
        </id>
        <!-- 将实体类中的其他字段都映射到数据库中 -->
        <property name="name"></property>
        <property name="password" ></property>
        <property name="age" ></property>
    </class>

</hibernate-mapping>

```
**hibernate.cfg.xml中的代码**
主要是配置hibernate的基本设置,包括方言/数据库名称之类的.

```xml
<!DOCTYPE hibernate-configuration PUBLIC
	"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
	"http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd">

<hibernate-configuration>
	<session-factory>
		<!-- 指定方言，指定要使用的是哪一个数据库 -->
		<property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>
		<!-- 创建数据库连接 -->
		<property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property>
		<!-- 在这里的hibernate是要新建的数据库名  "///"可以用localhost代替-->
		<property name="hibernate.connection.url">jdbc:mysql:///hibernate</property>
		<!-- 这里是你的数据库的用户名和密码 -->
		<property name="hibernate.connection.username">root</property>
		<property name="hibernate.connection.password">root</property>
		
		<!-- 自动创建数据库 -->
		<property name="hibernate.hbm2ddl.auto">update</property>
		<!-- 显示sql语句 -->
		<property name="hibernate.show_sql">true</property>
		
		<!-- 配置映射信息   即找到beans包下面的实体类相对应的配置文件-->
		<mapping resource="com/mi/beans/User.hbm.xml"/>
		<!--使用注解--> 
		<!-- <mapping class="com.mi.beans.User_girlf"/>   -->
	</session-factory>
</hibernate-configuration>
```

**测试类中的代码**

```java
public static void main(String[] args) {
		//1.读取hibernate.cfg.xml
		Configuration con = new Configuration().configure();
		//2.创建sessionFactory
		SessionFactory sf = con.buildSessionFactory();
		//3.创建session
		Session session = sf.openSession();
		//开启事务
		session.beginTransaction();
		User user = new User("ls", "123", 23);
		session.save(user);
		//提交
		session.getTransaction().commit();
		//关闭
		session.close();
		sf.close();
	}
}
```
最后数据库中就能看到新建的表以及刚刚User创建的对象中的数据。

### 写在最后

大概的步骤就是这个了，如果有不对的地方，欢迎大神指点。