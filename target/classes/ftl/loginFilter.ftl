package ${filterPackage};

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import ${modelPackage}.User;

/** 
*@Title LoginFilter.java 
*@description:  登录过滤器
*@author lhc
**/
public class LoginFilter implements Filter{

	private static final Logger logger = Logger.getLogger(LoginFilter.class);
	
	
	@Override
	public void destroy() {
		logger.debug("LoginFilter Is Destroy");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		String servletPath = request.getServletPath();
		logger.debug("过滤器启动 ： 请求路径为 ："+servletPath+"-----");
		User user = (User) request.getSession().getAttribute("user");
		if(user != null){
			chain.doFilter(req, resp);
			return ;
		}else{
			System.out.println("拦截");
			request.getRequestDispatcher("/WEB-INF/view/login/login.jsp").forward(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		logger.debug("LoginFilter Is Init");
	}

}
