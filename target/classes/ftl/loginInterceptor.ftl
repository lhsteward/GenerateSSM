package ${interceptorPackage};

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import ${modelPackage}.User;

/** 
*@Title LoginInterceptor.java 
*@description:  登录拦截
*@author lhc
**/
public class LoginInterceptor implements HandlerInterceptor{

	private static final Logger logger = Logger.getLogger(LoginInterceptor.class);
	
	/**
	 * 获取拦截器放行路径
	 */
	private List<String> interceptorList;
	public List<String> getInterceptorList() {
		return interceptorList;
	}
	public void setInterceptorList(List<String> interceptorList) {
		this.interceptorList = interceptorList;
	}

	/**
	 *  该方法将在请求处理之前进行调用，只有该方法返回true，
	 *  才会继续执行后续的Interceptor和Controller，
	 *  当返回值为true 时就会继续调用下一个Interceptor的preHandle 方法，
	 *  如果已经是最后一个Interceptor的时候就会是调用当前请求的Controller方法
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestName = request.getServletPath();
		logger.error("LoginInterceptor Start :  The URL Is :"+requestName);
		//不拦截请求路径 与 请求路径对比   存在则放行
		if(interceptorList.contains(requestName)){
			return true;
		}
		User user = (User)request.getSession().getAttribute("user");
		if(user != null){
			return true;
		}else{
			request.getRequestDispatcher("/WEB-INF/view/login/login.jsp").forward(request, response);
			return false;
		}
	}

	
	/**
	 * 该方法将在请求处理之后，DispatcherServlet进行视图返回渲染之前进行调用，
	 * 可以在这个方法中对Controller 处理之后的ModelAndView 对象进行操作。
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.debug("处理请求："+request.getRequestURI());
	}

	
	/**
	 * 该方法也是需要当前对应的Interceptor的preHandle方法的返回值为true时才会执行，
	 * 该方法将在整个请求结束之后，也就是在DispatcherServlet 渲染了对应的视图之后执行。
	 * 用于进行资源清理。
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.debug("请求完成："+request.getRequestURI());
	}

	
}
