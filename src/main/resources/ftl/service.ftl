package ${servicePackage};

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${daoPackage}.${tableName}Mapper;
import ${modelPackage}.${tableName};

/** 
*@Title ${tableName}Service.java 
*@description:  ${tableName}Service
*@author lhc
**/
@Service
public class ${tableName}Service {

	@Autowired
	private ${tableName}Mapper mapper;
	
	
	/**
	 * @Title: selectAll 
	 * @Description: 查询所有    参数为空默认查询所有
	 * @param @param ${tableName}
	 * @return List<${tableName}>
	 * @author lhc 
	 */
	public List<${tableName}> selectAll(${tableName} t){
		return mapper.selectAll(t);
	}
	
	
	/**
	 * @Title: insert
	 * @Description: 添加
	 * @param @param ${tableName}
	 * @return Map<String,Object>
	 * @author lhc 
	 */
	public Map<String,Object> insert(${tableName} t){
		Map<String,Object> map = new HashMap<String,Object>();
		if(t == null){
			map.put("status","error");
			map.put("msg", "参数有误");
			return map;
		}
		if(mapper.insert(t) == 1){
			map.put("status","success");
			map.put("msg", "添加成功");
		}else{
			map.put("status","error");
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	
	/**
	 * @Title: update
	 * @Description: 修改
	 * @param @param ${tableName}
	 * @return Map<String,Object>
	 * @author lhc 
	 */
	public Map<String,Object> update(${tableName} t){
		Map<String,Object> map = new HashMap<String,Object>();
		if(t == null){
			map.put("status","error");
			map.put("msg", "参数有误");
			return map;
		}
		if(mapper.update(t) == 1){
			map.put("status","success");
			map.put("msg", "修改成功");
		}else{
			map.put("status","error");
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	
	/**
	 * @Title: delete
	 * @Description: 删除  没有参数将删除全部(推荐传入主键)
	 * @param @param ${tableName}
	 * @return Map<String,Object>
	 * @author lhc 
	 */
	public Map<String,Object> delete(${tableName} t){
		Map<String,Object> map = new HashMap<String,Object>();
		if(t == null){
			map.put("status","error");
			map.put("msg", "参数有误");
			return map;
		}
		if(mapper.delete(t) == 1){
			map.put("status","success");
			map.put("msg", "删除成功");
		}else{
			map.put("status","error");
			map.put("msg", "删除失败");
		}
		return map;
	}
	
}
