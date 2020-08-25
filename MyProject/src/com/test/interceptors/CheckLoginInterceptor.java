package com.test.interceptors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import com.test.beans.UserBean;


public class CheckLoginInterceptor implements HandlerInterceptor {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		//로그인을 안 했을때
		if(loginUserBean.getUser_name()==null) {
			//강제 이동 시킨다.
			String contextPath = request.getContextPath();
			
			response.sendRedirect(contextPath+"/not_login");
			return false;
		}
		return true;
	}
}
