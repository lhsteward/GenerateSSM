package ${modelPackage}.${tableName};


<#list typeList as list>
<#if list == "Timestamp">
import java.sql.Timestamp;
</#if>
</#list>


/** 
*@Title ${tableName}.java 
*@description:  ${tableName}
*@author lhc
**/
public class ${tableName}{
	
	${property}
	
}
