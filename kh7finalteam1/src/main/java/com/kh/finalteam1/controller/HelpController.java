package com.kh.finalteam1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/help")
public class HelpController {
	@GetMapping("/help")
	public String help() {
		return "help/help";
	}
}
