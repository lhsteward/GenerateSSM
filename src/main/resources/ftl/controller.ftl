package ${controllerPackage};

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ${modelPackage}.${tableName};
import ${servicePackage}.${tableName}Service;

/** 
*@Title ${tableName}Controller.java 
*@description:  ${tableName}controller
*@author lhc
**/
@Controller
@RequestMapping(value="${tableNameL}")
public class DeptController {

	@Autowired
	private ${tableName}Service service;
	
	
	/**
	 * @Title: selectAll 
	 * @Description: 查询所有信息
	 * @param @param ${tableName}
	 * @return Map<String,Object>
	 * @author lhc 
	 */
	@RequestMapping(value = "selectAll",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	private List<${tableName}> selectAll(${tableName} t){
		return service.selectAll(t);
	}


	
	/**
	 * @Title: selectAll 
	 * @Description: 查询所有信息
	 * @param @param ${tableName}
	 * @return Map<String,Object>
	 * @author lhc 
	 */
	@RequestMapping(value = "insert",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> insert(${tableName} t){
		return service.insert(t);
	}


	/**
	 * @Title: update 
	 * @Description: 修改
	 * @param @param ${tableName}
	 * @return Map<String,Object>
	 * @author lhc 
	 */
	@RequestMapping(value = "update",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> update(${tableName} t){
		return service.update(t);
	}
	
	
	/**
	 * @Title: delete 
	 * @Description: 删除 没有参数将删除全部(推荐传入主键)
	 * @param @param ${tableName}
	 * @return Map<String,Object>
	 * @author lhc 
	 */
	@RequestMapping(value = "delete",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> delete(${tableName} t){
		return service.delete(t);
	}

}
