package com.kh.finalteam1.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.MainTrailerDto;
import com.kh.finalteam1.entity.NoSeriesDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.MainTrailerDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.service.HomeService;
import com.kh.finalteam1.service.PlayService;
import com.kh.finalteam1.vo.PlaylistVO;

@Controller
public class HomeController {
	@Autowired
	private PlayService playService;
	
	@Autowired
	private HomeService homeService;
	
//	@GetMapping("/")
//	public String home(Model model, HttpSession session) throws JsonProcessingException {	
//		int clientNo = (int)session.getAttribute("clientNo");
//		model.addAttribute("mainTrailerList", homeService.getMainTrailer());
//		model.addAttribute("sliderList", homeService.getSliderList(clientNo));
//			
//		return "main/home";
//	}
	
	@GetMapping("/")
	public ModelAndView home(HttpSession session){	
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("mainTrailerList", homeService.getMainTrailer());
		mv.addObject("sliderList", homeService.getSliderList());
		mv.setViewName("main/home");
		
		return mv;
	}
	
	@GetMapping("/index")
	public String index() {
		return "main/index";
	}

	@GetMapping("/play")
	public String play(@RequestParam int contentNo,
			@RequestParam int contentSeason,
			@RequestParam int contentEpisode,
			Model model, HttpSession session) {
		int clientNo = (int)session.getAttribute("clientNo");
		
		PlaylistVO playlistVO = playService.createPlaylist(contentNo, clientNo, contentSeason, contentEpisode);
				
		model.addAttribute("playlistVO", playlistVO);
		
		return "main/play";

	}
	
	@GetMapping("/play1")
	public String play() {
		return "main/play1";

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
