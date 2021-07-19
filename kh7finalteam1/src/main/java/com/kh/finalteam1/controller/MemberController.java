package com.kh.finalteam1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("/yourAccount")
	public String yourAccount() {
		return "member/yourAccount";
	}
	
	@RequestMapping("/loginPage")
	public String login() {
		return "member/loginPage";
	}
}
