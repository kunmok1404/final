package com.kh.spring.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ShopInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		String type = (String) request.getSession().getAttribute("type");
		Integer shop_code = (Integer) request.getSession().getAttribute("shop_code");
		if(shop_code != null && type != null && type.equals("업주")) {
			return true;
		}
		else {
			response.sendRedirect(request.getContextPath() + "/shop_admin/member/login");
			return false;
		}
	}

}
