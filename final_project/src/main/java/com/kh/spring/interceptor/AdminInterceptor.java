package com.kh.spring.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		String type = (String) request.getSession().getAttribute("type");
		if(type != null && type.equals("관리자")) {
			return true;
		}
		else {
			response.sendRedirect(request.getContextPath() + "/super_admin/member/login");
			return false;
		}
	}

}
