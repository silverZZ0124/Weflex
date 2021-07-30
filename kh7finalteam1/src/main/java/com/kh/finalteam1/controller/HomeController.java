package com.kh.finalteam1.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalteam1.repository.CastDao;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.service.HomeService;
import com.kh.finalteam1.service.PlayService;
import com.kh.finalteam1.vo.CastListVO;
import com.kh.finalteam1.vo.ContentListVO;
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
	public String index() {
		return "main/index";
	}
	
	@GetMapping("/home")
	public ModelAndView home(HttpSession session){	
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("mainTrailerList", homeService.getMainTrailer());
		mv.addObject("sliderList", homeService.getSliderList());
		mv.setViewName("main/home");
		
		return mv;
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
	
	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private CastDao castDao;
	
	@GetMapping("/search")
	public String search(@RequestParam String keyword, Model model) {
		System.out.println("킹덤 = " + keyword);
		List<ContentListVO> contentList = contentDao.search(keyword);
		List<CastListVO> castList = castDao.search(keyword);
		
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("contentList", contentList);
		model.addAttribute("castList", castList);
		return "main/search";
	}
	
}