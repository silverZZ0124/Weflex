package com.kh.finalteam1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.repository.GenreDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/")
	public String index() {
		return "admin/index";
	}
	
	@GetMapping("/genre")
	public String genre() {
		return "admin/genre";
	}
	
	@Autowired
	private GenreDao genreDao;
	
	@GetMapping("/insertGenre")
	public String insertGenre(@RequestParam String genreName) {
		genreDao.insert(genreName);
		return "redirect:/";
	}
}
