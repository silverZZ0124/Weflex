package com.kh.finalteam1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

@GetMapping("/login")
public String login() {
	return "login/loginstart"; 
}
@Controller
public class Join1Controller{
	@GetMapping("/join1")
	public String login() {
		return "login/join1";

	}
}
@Controller
public class Join2Controller{
	@GetMapping("/join2")
	public String login() {
		return "login/join2";
	}
}
@Controller
public class Join3Controller{
	@GetMapping("join3")
	public String login() {
		return "login/join3";
	}
}
@Controller
public class Join4Controller{
	@GetMapping("join4")
	public String login() {
		return "login/join4";
	}
}
}