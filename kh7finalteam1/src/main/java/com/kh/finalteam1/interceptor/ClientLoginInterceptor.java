package com.kh.finalteam1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.repository.ClientDao;

public class ClientLoginInterceptor implements HandlerInterceptor {
	@Autowired
	private ClientDao clientDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(isResourceHandler(handler)) {			
			return true;
		}

		Integer clientNo = (Integer)request.getSession().getAttribute("clientNo");
		
		if(clientNo == null) {
			System.out.println("회원 정보 없음");
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
		else {
			ClientDto clientDto = clientDao.findClient(clientNo);

			if(clientDto.getGradeNo() < 2) {
				response.sendRedirect(request.getContextPath()+"/join3");				
				return false;
			}
			else {
				return true;
			}			
		}		
//		return true;
	}
	
	public boolean isResourceHandler(Object handler) {
		return handler instanceof ResourceHttpRequestHandler;
	}
	
}
