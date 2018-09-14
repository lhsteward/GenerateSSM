package com.lhc.main;

import com.lhc.utils.DatabaseUtils;

/** 
*@Title runMethod.java 
*@description:  运行方法
*@author lhc
*@time 创建时间：2018年7月30日 上午9:44:57  
**/
public class runMethod {

	
	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		DatabaseUtils db = new DatabaseUtils();
		db.generateModel();//生成实体类
		db.generateInterface();//生成dao,service,controller
		//db.generateSSMProperties();//生成配置文件
		System.out.println("文件已生成");
	}
	
	
	
	/*以下登录 需要的自行放到controller中 */
	
	
	/**
     * @Title: checkLogin 
     * @Description: 用户登录 controller
     * @param @param name
     * @param @param password
     * @return Map<String,Object>
     * @author lhc 
     *//*
    @RequestMapping(value="checkLogin",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> checkLogin(HttpSession session,String user_name,String password){
        return service.checkLogin(session,user_name,password);
    }
*/
	

	/**
     * @Title: checkLogin 
     * @Description: 用户登录   service
     * @param @param user_name
     * @param @param password
     * @return Map<String,Object>
     * @author lhc 
     *//*
	public Map<String,Object> checkLogin(HttpSession session,String user_name,String password){
    	Map<String,Object> map = new HashMap<>();
    	User u = new User();
    	u.setUser_name(user_name);
    	u.setPassword(password);
    	List<User> user = mapper.selectAll(u);
    	if(user.size() == 1){
    	session.setAttribute("user",user.get(0));
    		session.setMaxInactiveInterval(30*60);
    		map.put("status","SUCCESS");
			map.put("msg", "验证成功");
    	}else{
    		map.put("status","ERROR_OF_ACCOUNT");
			map.put("msg", "用户名或密码错误");
    	}
    	return map;
    }
	*/
	
}
