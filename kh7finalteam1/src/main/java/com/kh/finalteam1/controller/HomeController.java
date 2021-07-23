package com.kh.finalteam1.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.finalteam1.entity.MainTrailerDto;
import com.kh.finalteam1.repository.MainTrailerDao;

@Controller
public class HomeController {
	@Autowired
	private MainTrailerDao mainTrailerDao;
	
	@GetMapping("/")
	public String home(Model model) {
		List<MainTrailerDto> mainTrailerList = mainTrailerDao.list();
		
		Random ran = new Random();
		int trailerIndex = ran.nextInt(mainTrailerList.size());
								
		model.addAttribute("mainTrailerList", mainTrailerList.get(trailerIndex));
		
		return "main/home";
	}
	
	@GetMapping("/index")
	public String index() {
		return "main/index";
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
