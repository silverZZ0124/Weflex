package com.kh.finalteam1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "main/home";
	}

	@GetMapping("/play")
	public String play() {
		return "main/play";

	}
	
	@GetMapping("/tv")
	public String tv() {
		return "main/TV";

	}
	
	@GetMapping("/movie")
	public String movie() {
		return "main/movie";

	}
}
