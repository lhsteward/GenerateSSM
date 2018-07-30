<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns="http://xmlns.jcp.org/xml/ns/javaee" 
xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" 
id="WebApp_ID" version="3.1">
  <display-name>${projectName}</display-name>
  <absolute-ordering/>
  <welcome-file-list>
  	<welcome-file>/view/index.html</welcome-file>
  </welcome-file-list>
  
  
  <!-- 过滤器 -->
  <filter>
      <filter-name>LoginFilter</filter-name>
      <filter-class>${filterPackage}.LoginFilter</filter-class>
  </filter>
  <filter-mapping>
      <filter-name>LoginFilter</filter-name>
      <url-pattern>*.jsp</url-pattern>
  </filter-mapping>
  
  	
  <!-- 配置log4j -->
 <listener>
  	<listener-class>org.springframework.web.util.Log4jConfigListener</listener-class>
  </listener>
  <context-param>
  	<param-name>log4jConfigLocation</param-name>
  	<param-value>classpath:properties/log4j.properties</param-value>
  </context-param>
  
  <!-- spring配置开始 -->
  
  <!-- 配置Spring启动容器 -->
<listener>
  	<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
  <!-- 指明容器的配置文件(spring配置文件 applicationcontext.xml) -->
  <context-param>
    <param-name>contextConfigLocation</param-name>
  	<param-value>classpath:spring/applicationContext.xml</param-value>
  </context-param>

  <!-- spring配置结束 -->
  
  
  <!-- springMVC配置开始 -->
  
  <!-- springMVC配置         DispatcherServlet分发-->
<servlet>
  	<servlet-name>DispatcherServlet</servlet-name>
  	<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  <!-- 	初始化参数  也就是springMVC的配置文件 -->
  	<init-param>
  		<param-name>contextConfigLocation</param-name>
  		<param-value>classpath:spring/spring-mvc.xml</param-value>
  	</init-param>
  	<!--表示容器启动的时候就加载文件初始化  -->
  	<load-on-startup>1</load-on-startup>
  	<!-- 为socket添加异步 -->
  	<async-supported>true</async-supported>
  </servlet>
  <!-- 配置DispatcherServlet响应路径 -->
  <servlet-mapping>
  	<servlet-name>DispatcherServlet</servlet-name>
  	<url-pattern>/</url-pattern>
  </servlet-mapping>
  
 <!-- springMVC配置结束 -->
  
  <!-- 阿里巴巴  数据源监控 -->
   <!-- WEB方式监控配置 -->

<servlet> 
     <servlet-name>DruidStatView</servlet-name> 
     <servlet-class>com.alibaba.druid.support.http.StatViewServlet</servlet-class> 
 </servlet> 
 <servlet-mapping> 
     <servlet-name>DruidStatView</servlet-name> 
     <url-pattern>/druid/*</url-pattern> 
 </servlet-mapping> 
 <filter> 
  <filter-name>druidWebStatFilter</filter-name> 
  <filter-class>com.alibaba.druid.support.http.WebStatFilter</filter-class> 
  <init-param> 
   <param-name>exclusions</param-name> 
   <param-value>/public/*,*.js,*.css,/druid*,*.jsp,*.swf</param-value> 
  </init-param> 
  <init-param> 
   <param-name>principalSessionName</param-name> 
   <param-value>sessionInfo</param-value> 
  </init-param> 
  <init-param> 
   <param-name>profileEnable</param-name> 
   <param-value>true</param-value> 
  </init-param> 
 </filter> 
 <filter-mapping> 
  <filter-name>druidWebStatFilter</filter-name> 
  <url-pattern>/*</url-pattern> 
 </filter-mapping>
  
  
  <!-- 配置编码的过滤器 -->
<filter>
  	<filter-name>CharacterEncodingFilter</filter-name>
  	<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
  	<!-- 为socket添加异步 -->
  	<async-supported>true</async-supported>
  	<init-param>
  		<param-name>encoding</param-name>
  		<param-value>utf-8</param-value>
  	</init-param>
</filter>
<filter-mapping>
	<filter-name>CharacterEncodingFilter</filter-name>
	<url-pattern>/*</url-pattern>
</filter-mapping>
  
  
  <!-- 不拦截静态文件 -->
  <servlet-mapping>
  	<servlet-name>default</servlet-name>
  	<url-pattern>/static/*</url-pattern>
  </servlet-mapping>
  
</web-app>