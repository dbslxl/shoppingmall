package com.test.interceptors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import com.test.beans.UserBean;

public class CheckManagerInterceptor implements HandlerInterceptor{
	@Resource(name="loginUserBean")
	@Lazy
	UserBean loginUserBean;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//로그인한 사용자가 관리자가 아니라면..
			if(loginUserBean.getUser_grade()!=2) {
				//강제 이동시킨다
				String contextPath=request.getContextPath();
				response.sendRedirect(contextPath+"/not_manager");
				return false;
			}
			return true;
	}
}
