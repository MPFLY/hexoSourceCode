---
title: 使用Hibernate,一对多和多对一的实现(双向)
categories: Hibernate
date: 2017-05-17
copyright: true
---

在这里，我们分别通过配置文件的方式和写注释的方式来创建表。
例子：
现在有一个顾客表和一个订单表，一个顾客可以拥有多个订单，而每个订单只能从属于一个客户，这就是一对多的意思。

```java
//顾客的字段
private int cid;
private String cname;
```

```java
//订单的字段
private int oid;
private String oname;
```
在这里我们需要解释一下了，一般的多对一或者一对多，可以放在一起理解,在创建表的时候，需要将外键设置到[多]的这一方，而不是放到[一]的这一方。即将外键放在此处的订单表中，而不是放到顾客表中，我们找的是从属关系，而不是拥有关系。因为我们要建的是双向的表，即可以通过任意一方找到另一方的数据。所以我们要来一点准备工作。

```java
//1.在顾客实体类中加入订单的set字段,当然get和set方法要转备好
private Set<Order> orders;

//2.在订单实体类中加入顾客的字段
private Costum costum;
```

现在我们创建表：
**1.使用配置文件的方式**
使用Hibernate之前的准备工作就不在这里赘述了,直接说代码：
**hibernate.cfg.xml的代码**：

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
		<property name="hibernate.connection.url">jdbc:mysql:///hibernate</property>
		<property name="hibernate.connection.username">root</property>
		<property name="hib
		ernate.connection.password">root</property>
		
		<!-- 自动创建数据库 -->
		<property name="hibernate.hbm2ddl.auto">update</property>
		<!-- 显示sql语句 -->
		<property name="hibernate.show_sql">true</property>
		<!-- 格式化sql语句 -->
		<!-- <property name="format_sql">true</property> -->
		
		<!-- 配置映射信息 -->
		<mapping resource="com/mi/beans/Costum.hbm.xml"/>
		<mapping resource="com/mi/beans/Order.hbm.xml"/>
	</session-factory>
</hibernate-configuration>
```
**Costum.hbm.xml的代码:(顾客实体类的配置文件)**

```xml
<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC
      "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
          "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">

<hibernate-mapping package="com.mi.beans">

    <class name="Costum" table="t_costum">
        <id name="cid">
        	<generator class="native"></generator>
        </id>
        <property name="cname"></property>
        <!-- 因为在顾客的实体类中将order放入了set中,所以标签为set,还有list等 -->
		<set name="orders" >
		<!-- //此处极容易错 -->
			<key column="cid"></key>
		<!--对于顾客来说,是一对多的关系-->
			<one-to-many  class="Order" />
		</set>        
		
    </class>

</hibernate-mapping>

```
**Order.hbm.xml中的代码:**

```xml
<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC
      "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
          "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">

<hibernate-mapping package="com.mi.beans">

    <class name="Order" table="t_order">
        <id name="oid">
        	<generator class="native"></generator>
        </id>
        <property name="oname"></property>
        <!-- 对于order来说,是多对一的关系,即多个订单对应一个顾客 -->
		<many-to-one name="costum" column="cid"></many-to-one>
    </class>

</hibernate-mapping>
	
```
这是结果
![这里写图片描述](http://img.blog.csdn.net/20170517175609460?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

----------
**2.使用注解的方式:**
*当然需要导入注解包才能进行*.
**hibernate.cfg.xml的代码:**
和用配置文件的方法有一点不同:

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
		<property name="hibernate.connection.url">jdbc:mysql:///hibernate</property>
		<property name="hibernate.connection.username">root</property>
		<property name="hibernate.connection.password">root</property>
		
		<!-- 自动创建数据库 -->
		<property name="hibernate.hbm2ddl.auto">update</property>
		<!-- 显示sql语句 -->
		<property name="hibernate.show_sql">true</property>
		<!-- 格式化sql语句 -->
		<!-- <property name="format_sql">true</property> -->
		
		<!-- 配置映射信息 上面注释掉的是使用配置文件的映射信息,下面的是使用注解的映射信息-->
		<!-- <mapping resource="com/mi/beans/Costum.hbm.xml"/>
		<mapping resource="com/mi/beans/Order.hbm.xml"/> -->
		<mapping class="com.mi.beans.Costum"/>
		<mapping class="com.mi.beans.Order"/>
	</session-factory>
</hibernate-configuration>
```


**Order实体类:**
有几点要注意:
1.所有注释用到的包都是javax下的,不要导错包.
2.主键和主键的生成策略要写到get方法之前,且必须有!!
3.生成表需要有!即@Entity@Table.
```java
package com.mi.beans;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity //形成一个以"t_order"为名的表,表中的字段和该实体类中的字段相同(每张表必须要有,否则无法建立)
@Table(name="t_order")
public class Order {
	private int oid;
	private String oname;
	private Costum costum;
	
	
	//订单中的顾客字段,要形成外键,"JoinColumn"表示在表中新增一个字段,表示该实体类中的字段,也是建立关系的字段
	@ManyToOne
	@JoinColumn(name="cid")
	public Costum getCostum() {
		return costum;
	}
	public void setCostum(Costum costum) {
		this.costum = costum;
	}
	//这是这个表的主键以及主键的生成策略(每张表必须要有,否则无法建立,注意实在get方法之前)
	@Id
	@GeneratedValue
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", oname=" + oname + "]";
	}
	public Order(int oid, String oname) {
		super();
		this.oid = oid;
		this.oname = oname;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}	
}
```
**Costum实体类:**
该实体类和上面的差不多,只是在关系字段(order)有一点不同
```java
package com.mi.beans;

import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="t_costum")
public class Costum {
	private int cid;
	private String cname;
	private Set<Order> orders;
	//被映射为costum
	@OneToMany(mappedBy="costum")
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	@Id
	@GeneratedValue
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Costum(int cid, String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}
	public Costum() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Costum [cid=" + cid + ", cname=" + cname + "]";
	}	
}
```
会形成和上一个方式相同的结果,
![这里写图片描述](http://img.blog.csdn.net/20170517181225607?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTVBGTFk=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

<br>
<hr>
**总结:**
**xml方式**

1. `hibernate.cfg.xml`中的映射信息为下面的：

```java
<mapping resource="com/mi/beans/Costum.hbm.xml"/>
<mappingresource="com/mi/beans/Order.hbm.xml"/>
```
2. 一对多的信息需要写在set标签下(或其他)

```java
//Costum:
<set name="orders" >
    <key column="cid"></key>
    <one-to-many  class="Order" />
</set>     
```
3. 

```java
//Order:
<many-to-one name="costum" column="cid"></many-to-one>
```

**注解方式**

1.  hibernate.cfg.xml中的映射信息为下面的:

```java
<mapping class="com.mi.beans.Costum"/>
<mapping class="com.mi.beans.Order"/>
```
2. 

```java
//Order:
@ManyToOne
@JoinColumn(name="cid")
```
3. 

```java
//Costum:
@OneToMany(mappedBy="costum")
```
上述简单的讲述，如果有大神看到有问题的地方，不吝赐教！！！
