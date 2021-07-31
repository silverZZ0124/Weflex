package com.kh.finalteam1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

public class ClientLoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		if(isResourceHandler(handler)) {			
//			return true;
//		}
//		System.out.println("ClientLoginInterceptor");
//		System.out.println(handler);
//		Integer clientNo = (Integer)request.getSession().getAttribute("clientNo");
//		
//		if(clientNo == null) {
//			System.out.println("회원 정보 없음");
//			response.sendRedirect(request.getContextPath()+"/login");
//			return false;
//		}
//		else {
//			System.out.println(clientNo);
//			return true;
//		}		
		return true;
	}
	
	public boolean isResourceHandler(Object handler) {
		return handler instanceof ResourceHttpRequestHandler;
	}
	
}
