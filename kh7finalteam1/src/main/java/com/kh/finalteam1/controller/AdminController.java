package com.kh.finalteam1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.content.GenreDto;
import com.kh.finalteam1.repository.genre.GenreDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/")
	public String index() {
		return "admin/index";
	}
	
	@Autowired
	private GenreDao genreDao;
	
	@GetMapping("/genre")
	public String genre(Model model) {
		List<GenreDto> genreList = genreDao.list();
		model.addAttribute("genreList", genreList);
		return "admin/genre";
	}
	
	@GetMapping("/insertGenre")
	public String insertGenre(@RequestParam String genreName) {
		genreDao.insert(genreName);
		return "redirect:/admin/genre";
	}
	
	@GetMapping("/genreEdit")
	public String genreEdit(@RequestParam String genreName, Model model) {
		List<GenreDto> genreList = genreDao.list();
		model.addAttribute("genreList", genreList);
		model.addAttribute("editGenreName", genreName);
		return "admin/genreEdit";
	}
	
	@GetMapping("/genreDelete")
	public String genreDelete(@RequestParam String genreName, Model model) {
		boolean isDelete = genreDao.delete(genreName);
		if(isDelete) {
			return "redirect:/admin/genre";
		}
		else {
			model.addAttribute("genreName", genreName);
			return "genreEdit";
		}
	}
	
}
