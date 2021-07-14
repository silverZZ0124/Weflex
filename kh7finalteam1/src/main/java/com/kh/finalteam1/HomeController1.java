package com.kh.finalteam1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller//이 클래스가 "컨트롤러" 계층임을 명시하는 어노테이션
public class HomeController1{

	//아래 메소드는 "/" 라는 요청에 대한 처리 내용임을 명시하는 어노테이션
	@RequestMapping("/")
	public String home() {
		//return "/WEB-INF/views/home.jsp";
		return "home1"; 
	}
}