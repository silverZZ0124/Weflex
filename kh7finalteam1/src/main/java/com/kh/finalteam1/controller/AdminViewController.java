package com.kh.finalteam1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminViewController {
	
	
	@RequestMapping("/")
	public String index() {
		return "admin/index";
	}
}
