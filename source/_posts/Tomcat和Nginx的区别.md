---
title: Tomcat和Nginx的区别
tags: 区别
categories: 总结与区别
date: 2017-08-02
copyright: true
---


1. `nginx`在负载均衡里是前端服务器，用来处理请求的转发（反向代理等）；是静态页面服务器.绝大部分时候他们本身并不会运行项目。
2. Tomcat是后端服务器，属于`Java Servlet`容器.用来生成动态页面.是直接用来运行项目的容器。简单来说就是你发出一个请求,先经过`nginx`，它们会合理地把请求分配到后台比较不忙的`Tomcat`。`Tomcat`会把请求处理好返回给`Nginx`,然后`Nginx`会把最终的结果传送给浏览器.当然,如果是一些静态的数据,`Nginx`就可以直接处理了。

3. `Tomcat/Jetty` 等等这一类叫`Web Container`,也就是Web容器，所谓容器，是和他负责的东西管理整个的生命周期的。所以`Web Container`会管理整个`Servlet`的生命周期。类似的`Spring `的`Ioc`容器则会管理整个`Bean`的生命周期。而`GlassFish/Weblogic`这一类的 `application Server`，则会管理更多，包含命名服务器，`EJB`等资源。
4. `Nginx/apache` 可以说是`web server`，也就是他们可以处理静态资源，比如`html`、图片等，但如果把`Servlet`交给它则处理不了。所以，一般把`Nginx`放在前端处理静态资源，如果有对应的`Servlet`请求，则通过`AJP`转给后面的`Tomcat、Jetty`进行处理。
5. `tomcat`用在`java`后台程序上，`java`后台程序难道不能用`apache`和`nginx`吗？"不能。`apache`和`nginx`不是`servlet`容器。什么是`servlet`容器呢？即实现`HttpServletRequest`、`HttpServletResponse`、`HttpSession`等等接口，解析`http`请求，通过类加载器加载对应的`servlet`实现类并调用。也就是说`servlet`容器必须由`java`或者基于`jvm`的语言实现。



