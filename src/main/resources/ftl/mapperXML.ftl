<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "mybatis-3-mapper.dtd" >
	<mapper namespace="${daoPackage}.${tableName}Mapper"> 
	
 	<select id="selectAll"  parameterType="${modelPackage}.${tableName}" resultType="${modelPackage}.${tableName}"> 
		SELECT * FROM ${tableNameL} 
		<trim prefix=" WHERE " prefixOverrides="AND">
			<#list column as list>
				<if test="${list} != null"> AND ${list} = ${r"#{"} ${list} ${r"}"} </if> 
			</#list> 
    	</trim>
    </select> 
    
    <!-- 添加 -->
    <insert id="insert" parameterType="${modelPackage}.${tableName}">
        INSERT INTO ${tableNameL} ( 
	    <trim prefix="   ">
	    	<#list column as list>
	    		<#if list_index != 0>
					<if test="${list} != null"> , ${list}</if> 
				</#if>
			</#list>
	 	</trim>
	     )
        VALUES( 
        <trim prefix="   "> 
        	<#list column as list>
        		<#if list_index != 0>
					<if test="${list} != null"> , ${r"#{"} ${list} ${r"}"}</if> 
				</#if>
			</#list>
        </trim>
        )
    </insert>
    
    <!-- 修改 -->
    <update id="update" parameterType="${modelPackage}.${tableName}">
        UPDATE ${tableNameL}  
        <trim prefix=" SET  " prefixOverrides=",">
        	<#list column as list>
				<if test="${list} != null"> ,${list} = ${r"#{"} ${list} ${r"}"}</if> 
			</#list>
        </trim>
        <trim prefix=" WHERE  " prefixOverrides="">
        	<#list column as list>
        		<#if list_index == 0>
					<if test="${list} != null"> ,${list} = ${r"#{"} ${list} ${r"}"}</if> 
				</#if>
			</#list>
        </trim>
    </update>
    
    <!-- 删除 -->
    <delete id="delete"  parameterType="${modelPackage}.${tableName}">  
		DELETE FROM ${tableNameL}  
	        <trim prefix=" WHERE " prefixOverrides="AND">
		        <#list column as list>
					<if test="${list} != null"> AND ${list} = ${r"#{"} ${list} ${r"}"}</if> 
				</#list>
	       </trim>
    </delete>
    
	
</mapper>
