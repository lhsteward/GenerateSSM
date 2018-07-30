
package ${daoPackage};

import ${modelPackage}.${tableName};

import java.util.List;
import org.springframework.stereotype.Repository;


/** 
*@Title ${tableName}Mapper.java 
*@description:  ${tableName}接口
*@author lhc
**/
@Repository
public interface ${tableName}Mapper {

	/**
	 * @Title: selectAll 
	 * @Description: 查询所有信息   
	 * @return List<${tableName}>
	 * @author lhc 
	 */
	List<${tableName}> selectAll(${tableName} t);
	
	/**
	 * @Title: insert 
	 * @Description: 插入数据
	 * @return int
	 * @author lhc 
	 */
	int insert(${tableName} t);


	/**
	 * @Title: update 
	 * @Description: 修改数据
	 * @return int
	 * @author lhc 
	 */
	int update(${tableName} t);
	
	
	/**
	 * @Title: delete 
	 * @Description: 删除数据  直接删除
	 * @return int
	 * @author lhc 
	 */
	int delete(${tableName} t);
}




