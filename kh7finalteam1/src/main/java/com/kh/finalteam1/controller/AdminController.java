package com.kh.finalteam1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.content.ContentDto;
import com.kh.finalteam1.entity.content.GenreDto;
import com.kh.finalteam1.entity.content.NoSeriesDto;
import com.kh.finalteam1.entity.content.ProgramFeatureDto;
import com.kh.finalteam1.entity.content.YesSeriesDto;
import com.kh.finalteam1.repository.content.ContentDao;
import com.kh.finalteam1.repository.genre.GenreDao;
import com.kh.finalteam1.repository.programfeature.ProgramFeatureDao;
import com.kh.finalteam1.repository.series.SeriesDao;

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
	
	//contentRegist.jsp 이동
	@GetMapping("/contentRegist")
	public String contentRegist() {
		return "admin/contentRegist";
	}
	
	//content 등록 관련 controller
	@Autowired
	private ContentDao contentDao;
	
	@PostMapping("/contentRegist")
	public String contentRegist(@ModelAttribute ContentDto contentDto) {
		int contentNo = contentDao.sequence();
		contentDto.setContentNo(contentNo);
		contentDao.insert(contentDto);
		return "redirect:/admin/seriesRegist/"+contentNo;
	}
	
	//series 등록 관련 controller
	@GetMapping("/seriesRegist/{contentNo}")
	public String seriesRegist(
			@PathVariable int contentNo, Model model) {
			ContentDto contentDto = contentDao.get(contentNo);
			model.addAttribute("contentDto", contentDto);
		return "admin/seriesRegist";
	}
	
	@Autowired
	private SeriesDao seriesDao;
	
	@PostMapping("/seriesRegist/yes")
	public String seriesRegistYes(@ModelAttribute YesSeriesDto yesSeriesDto) {
		seriesDao.yesInsert(yesSeriesDto);
		return "redirect:/admin/";
	}
	
	@PostMapping("/seriesRegist/no")
	public String seriesRegistNo(@ModelAttribute NoSeriesDto noSeriesDto) {
		seriesDao.noInsert(noSeriesDto);
		return "redirect:/admin/";
	}

}
