<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation="
        http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/tx
        http://www.springframework.org/schema/tx/spring-tx.xsd
        http://www.springframework.org/schema/aop
		http://www.springframework.org/schema/aop/spring-aop.xsd">


<!--Spring Dao Start-->
    <!-- 读取properties文件 -->
    <bean id="propertyConfigurer" class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
        <property name="locations">
            <list>
                <value>classpath:/properties/db.properties</value>
            </list>
        </property>
    </bean>

    <!--配置数据源 数据库连接池-->
    <bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource"  destroy-method="close">
        <property name="url" value="${r"${jdbc.url}"} } ${r"}"} " />
        <property name="username" value="${r"${jdbc.username}"}" />
        <property name="password" value="${r"${jdbc.password}"}" />
        <property name="driverClassName" value="${r"${jdbc.driver}"}" />
        <!-- 初始化连接大小 -->
        <property name="initialSize" value="${r"${initialSize}"}"/>
        <!-- 最小空闲 -->
        <property name="minIdle" value="${r"${minIdle}"}" />
        <!--  最大连接池数量 -->
        <property name="maxActive" value="${r"${maxActive}"}" />
        <!-- 获取连接最大等待时间 -->
        <property name="maxWait" value="${r"${maxWait}"}"></property>
        <!-- 监控统计用的filter:stat   日志用的filter:log4j  防御sql注入的filter:wall -->
        <property name="filters" value="${r"${filters}"}" />
        <!-- 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒 -->
        <property name="timeBetweenEvictionRunsMillis" value="${r"${timeBetweenEvictionRunsMillis}"}" />
        <!-- 配置一个连接在池中最小生存的时间，单位是毫秒 -->
        <property name="minEvictableIdleTimeMillis" value="${r"${minEvictableIdleTimeMillis}"}" />
        <!-- 建议配置为true，不影响性能，并且保证安全性。 申请连接的时候检测 -->
        <property name="testWhileIdle" value="${r"${testWhileIdle}"}"/>
        <!-- 申请连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能。 -->
        <property name="testOnBorrow" value="${r"${testOnBorrow}"}"/>
        <!-- 归还连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能 -->
        <property name="testOnReturn" value="false" />
        <!-- 是否缓存preparedStatement，也就是PSCache  适用支持游标的数据库  如Oracle -->
        <property name="poolPreparedStatements" value="${r"${poolPreparedStatements} "}"/>
        <!-- 要启用PSCache，必须配置大于0，当大于0时 poolPreparedStatements自动触发修改为true。 -->
        <property name="maxOpenPreparedStatements" value="${r"${maxOpenPreparedStatements} "}"/>
        <!-- 定义监控日志输出间隔 -->
        <property name="timeBetweenLogStatsMillis">  
		 	<value>60000</value>  
		</property>  
		<property name="statLogger" ref ="statLoggerb"/> 
		<!-- 若需要mybatis的批量sql需配置     不配置则报错:nested exception is java.sql.SQLException: sql injection violation, multi-statement not allow-->
		<property name="proxyFilters">
			<list>  
                <ref bean="wall-filter"/>  
            </list>
		</property>    
    </bean>
	<!-- 若需要mybatis的批量sql需配置 -->
	<bean id="wall-filter" class="com.alibaba.druid.wall.WallFilter">  
        <property name="config" ref="wall-config" />  
    </bean>  
      
    <bean id="wall-config" class="com.alibaba.druid.wall.WallConfig">  
        <property name="multiStatementAllow" value="true" />  
    </bean> 



    <!-- 让spring管理sqlsessionfactory 使用mybatis和spring整合包中的 -->
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <!-- 数据库连接池 -->
        <property name="dataSource" ref="dataSource" />
        <!-- 加载mybatis的全局配置文件 -->
        <property name="configLocation" value="classpath:/mybatis/mybatis.cfg.xml" />
        <!-- 加载Mybatis全局配置文件 -->
        <property name="mapperLocations" value="classpath:com/ys/mapper/*Mapper.xml"/>
    </bean>

    <!--扫描dao-->
    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <property name="basePackage" value="${daoPackage}" />
        <!-- <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory"></property> -->
    </bean>

<!--Spring Dao End-->

<!--Spring Service Start-->

    <context:component-scan base-package="${servicePackage}"/>

<!--Spring Service End-->

<!--Spring Transaction Start-->

    <!-- 事务管理器 -->
    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <!-- 数据源 -->
        <property name="dataSource" ref="dataSource" />
    </bean>

	<!-- 扫描事务注解 -->
	 <tx:annotation-driven transaction-manager="transactionManager"/>


    <!-- AOP 事务  通知 -->
    <!-- <tx:advice id="txAdvice" transaction-manager="transactionManager">
        <tx:attributes>
            传播行为
            <tx:method name="insert*" propagation="REQUIRED" />
            <tx:method name="delete*" propagation="REQUIRED" />
            <tx:method name="update*" propagation="REQUIRED" />
            <tx:method name="select*" propagation="SUPPORTS" read-only="true" />
        </tx:attributes>
    </tx:advice> 
    
	<aop:config>
		<aop:pointcut id="shiwuguanli"
   			expression="execution(* service.UserService.*(..))"/>
   			<aop:advisor advice-ref="txAdvice" pointcut-ref="shiwuguanli"/>
	</aop:config>
    -->
    <!--Spring Transaction End-->
	
	
	<!-- Druid监控日志输出 实现 -->
	<bean id="statLoggerb" class="com.alibaba.druid.pool.DruidDataSourceStatLoggerImpl">  
	    <property name="logger" ref="log4jb" />  
	</bean>  
	  
	<bean id="log4jb" class="com.alibaba.druid.support.logging.Log4jImpl">  
	    <constructor-arg>  
	        <value>druid.statlog</value>  
	    </constructor-arg>  
	</bean> 
	

	<!-- druid spring monitor 监控 setting -->
	<bean id="druid-stat-interceptor"
	     class="com.alibaba.druid.support.spring.stat.DruidStatInterceptor">
	</bean>
	
	<bean id="druid-stat-pointcut" class="org.springframework.aop.support.JdkRegexpMethodPointcut" scope="prototype">
	   <property name="patterns">
	      <list>
	         <value>${servicePackage}.*</value>
	         <value>${daoPackage}.*</value>
	      </list>
	   </property>
	</bean>  
	     
	<aop:config> 
	   <aop:advisor advice-ref="druid-stat-interceptor" pointcut-ref="druid-stat-pointcut" />
	</aop:config>
	
 
</beans>