package com.kh.finalteam1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.repository.ClientDao;

public class AdminLoginInterceptor implements HandlerInterceptor{
	@Autowired
	private ClientDao clientDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("AdminLoginInterceptor");
//		Integer clientNo = (Integer)request.getSession().getAttribute("clientNo");
//		
//		if(clientNo == null) {
//			response.sendRedirect(request.getContextPath()+"/login");
//			return false;
//		}
//		else {
//			ClientDto clientDto = clientDao.findClient(clientNo);
//			
//			if(clientDto.getGradeNo() < 4){				
//				String referer = request.getHeader("Referer");
//				if(referer == null)
//					response.sendRedirect(request.getContextPath()+"/home");
//				else					
//					response.sendRedirect(request.getHeader("Referer"));
//				
//				return false;
//			}
//			else
//				return true;
//				
//		}		
		return true;
	}
	
}
