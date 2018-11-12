package com.two_shop.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import com.two_shop.bean.User;
import com.two_shop.tools.Constants;


public class SysInterceptor extends HandlerInterceptorAdapter{

	
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object obj) throws IOException {
	
		HttpSession session=request.getSession();
		User user =(User)session.getAttribute(Constants.USER_SESSION);
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/401.html");
			return false;
		}
		return true;
	}
}
