package com.kh.finalteam1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.content.GenreDto;
import com.kh.finalteam1.entity.content.ProgramFeatureDto;
import com.kh.finalteam1.repository.genre.GenreDao;
import com.kh.finalteam1.repository.programfeature.ProgramFeatureDao;

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
	
	@Autowired
	private ProgramFeatureDao programFeatureDao;
	
	@GetMapping("/feature")
	public String feature(Model model) {
		List<ProgramFeatureDto> featureList = programFeatureDao.list();
		model.addAttribute("featureList", featureList);
		return "admin/programFeature";
	}
	
	@GetMapping("/insertFeature")
	public String insertfeature(@RequestParam String featureName) {
		programFeatureDao.insert(featureName);
		return "redirect:/admin/feature";
	}
	
	@GetMapping("/featureEdit")
	public String featureEdit(@RequestParam String featureName, Model model) {
		List<ProgramFeatureDto> featureList = programFeatureDao.list();
		model.addAttribute("featureList", featureList);
		model.addAttribute("editFeatureName", featureName);
		return "admin/programFeatureEdit";
	}
	
	@GetMapping("/featureDelete")
	public String featureDelete(@RequestParam String featureName, Model model) {
		boolean isDelete = programFeatureDao.delete(featureName);
		if(isDelete) {
			return "redirect:/admin/feature";
		}
		else {
			model.addAttribute("featureName", featureName);
			return "admin/programFeatureEdit";
		}
	}

}
