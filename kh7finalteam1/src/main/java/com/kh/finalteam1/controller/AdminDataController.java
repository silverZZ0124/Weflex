package com.kh.finalteam1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalteam1.entity.genre.GenreDto;
import com.kh.finalteam1.repository.genre.GenreDao;

@RestController
@RequestMapping("/data")
public class AdminDataController {
	
	@Autowired
	private GenreDao genreDao;
	
	@GetMapping("/admin/searchGenre")
	public List<GenreDto> searchGenre(@RequestParam String genreName) {
		return genreDao.get(genreName);
		
	}
}
