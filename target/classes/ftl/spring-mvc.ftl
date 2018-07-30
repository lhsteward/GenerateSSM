<?xml version="1.0" encoding="UTF-8"?> 
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	   xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="
        http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context.xsd ">


    <!--扫描Controller-->
    <context:component-scan base-package="${controllerPackage}" />

    <!--配置映射器、处理器-->
    <mvc:annotation-driven/>

    <!--配置页面解析器-->
    <bean id="InternalResourceViewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <!-- jsp文件的前缀和后缀 -->
        <property name="prefix" value="/WEB-INF/view/"></property>
        <property name="suffix" value=".jsp"></property>
    </bean>



    <!-- 资源映射 -->
    <mvc:resources location="/WEB-INF/static/" mapping="/**"/>


    <!-- 定义文件上传解析器 -->
    <bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
        <!-- 设定默认编码 -->
        <property name="defaultEncoding" value="UTF-8"></property>
        <!-- 设定文件上传的最大值5MB，5*1024*1024 -->
        <property name="maxUploadSize" value="5242880"></property>
    </bean>


	<!--start:使用Jackson 2.x的配置，需要导入的jar包：jackson-core-xxx.jar、jackson-annotations-xxx.jar、jackson-databind-xxx.jar-->
	<!--通过处理器映射DefaultAnnotationHandlerMapping来开启支持@Controller注解-->
	<bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping" />
	<!--通过处理器适配器AnnotationMethodHandlerAdapter来开启支持@RequestMapping注解-->
	<bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter">
	    <property name="messageConverters">
	        <list>
	            <!-- 设置返回字符串编码 -->
	            <bean class="org.springframework.http.converter.StringHttpMessageConverter">
	                <property name = "supportedMediaTypes">
	                    <list>
	                        <value>text/html;charset=UTF-8</value>
	                        <value>application/json;charset=UTF-8</value>
	                    </list>
	                </property>
	            </bean>
	            <!-- json转换器 -->
	            <bean class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter">
	                <property name="supportedMediaTypes">
	                    <list>
	                        <value>text/html;charset=UTF-8</value>
	                        <value>application/json;charset=UTF-8</value>
	                    </list>
	                </property>
	            </bean>
	        </list>
	    </property>
	</bean>



	<!-- 登录拦截器 -->
	<mvc:interceptors>
		<mvc:interceptor>
			<mvc:mapping path="/**"/>
			<!-- 需要排除拦截的请求 -->
			<bean id="LoginInterceptor" class="com.lhc.interceptors.LoginInterceptor">
				<property name="interceptorList">
					<list>
						<!-- 登录放行 -->
						<value>/user/checkLogin</value>
					</list>
				</property>		
			</bean>
		</mvc:interceptor>
	</mvc:interceptors>

</beans>