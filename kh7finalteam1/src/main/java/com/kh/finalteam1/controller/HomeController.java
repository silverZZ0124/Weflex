package com.kh.finalteam1.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.LikeListDto;

import com.kh.finalteam1.repository.ContentDao;

import com.kh.finalteam1.repository.LikeListDao;

import com.kh.finalteam1.service.HomeService;
import com.kh.finalteam1.service.PlayService;
import com.kh.finalteam1.vo.ContentListVO;
import com.kh.finalteam1.vo.PlaylistVO;

@Controller
public class HomeController {
	@Autowired
	private PlayService playService;
	
	@Autowired
	private HomeService homeService;
	

	
	@Autowired
	private LikeListDao likeListDao;
	

	@Autowired
	private ContentDao contentDao;
	
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
	public String tv(Model model) {
		
		List<ContentListVO> tvProgramList = contentDao.tvProgramList();
		model.addAttribute("tvProgramList", tvProgramList);
		return "main/TV";

	}
	

	@GetMapping("/wishlist")
	public String wishlist(HttpSession session, Model model) {
		int clientNo=(int)session.getAttribute("clientNo");


		List<LikeListDto> likeList=likeListDao.get(clientNo);
		model.addAttribute("likeList",likeList);
	
		//int no=likeList.get(0).getContentNo();
		List<ContentDto> contentList=new ArrayList<>();
		for(int i=0;i<likeList.size();i++) {
			
			
			contentList.add(contentDao.getList(likeList.get(i).getContentNo()));
		}
		
		model.addAttribute("contentList", contentList);
		return "main/wishlist";
	}
	@GetMapping("/movie")
	public String movie(Model model) {
		
		List<ContentListVO> movieList = contentDao.movieList();
		model.addAttribute("movieList", movieList);
		return "main/movie";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
