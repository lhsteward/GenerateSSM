package com.lhc.utils;

import java.util.Arrays;

/** 
*@Title StringUtils.java 
*@description:  工具类
*@author lhc
**/
public class StringUtils {

	/**
	 * @Title: upperCase 
	 * @Description: String字符串首字母大写
	 * @param @param str
	 * @return String
	 * @author lhc 
	 */
	public static String upperCase(String str) {
	    char[] ch = str.toCharArray();
	    if (ch[0] >= 'a' && ch[0] <= 'z') {
	        ch[0] = (char) (ch[0] - 32);
	    }
	    return new String(ch);
	}
	
	
	/**
	 * @Title: toLowerCaseFirstOne 
	 * @Description: 首字母小写
	 * @param @param s
	 * @return String
	 * @author lhc 
	 */
	public static String toLowerCaseFirstOne(String s){
	    if(Character.isLowerCase(s.charAt(0)))
	      return s;
	    else
	      return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
	}
	
	
	/**
	 * @Title: useList 
	 * @Description: 判断数组中是否包含某个值
	 * @param @param arr
	 * @param @param value
	 * @return boolean
	 * @author lhc 
	 */
	public static boolean containsArr(Integer[] arr,Integer value){
		return Arrays.asList(arr).contains(value);
	}
	
	
}
