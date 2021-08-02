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
import com.kh.finalteam1.entity.GenreDto;
import com.kh.finalteam1.entity.WishListDto;
import com.kh.finalteam1.repository.CastDao;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.GenreDao;
import com.kh.finalteam1.repository.WishListDao;
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
	private WishListDao wishListDao;
	

	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private GenreDao genreDao;
	
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
		List<GenreDto> tvGenreList = genreDao.tvGenreList();
		
		model.addAttribute("tvProgramList", tvProgramList);
		model.addAttribute("tvGenreList", tvGenreList);
		return "main/TV";

	}
	
	@Autowired
	private CastDao castDao;
	
	//검색 기능 구현
	@GetMapping("/search")
	public String search(@RequestParam String keyword, Model model) {
		//System.out.println("킹덤 = " + keyword);
		List<ContentListVO> contentList = contentDao.search(keyword);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("contentList", contentList);
		return "main/search";
	}
	
//	@GetMapping("/wishlist")
//	public String wishlist(HttpSession session, Model model) {
//		int clientNo=(int)session.getAttribute("clientNo");
//
//
//		List<WishListDto> wishList=wishListDao.get(clientNo);
//		model.addAttribute("wishList",wishList);
//	
//	
//		List<ContentDto> contentList=new ArrayList<>();
//		for(int i=0;i<wishList.size();i++) {
//			
//			
//			contentList.add(contentDao.getList(wishList.get(i).getContentNo()));
//		}
//		
//		model.addAttribute("contentList", contentList);
//		return "main/wishlist";
//	}
	
	@GetMapping("/wishlist")
	public String wishlist() {
		return "main/wishlist";
	}
	
	@GetMapping("/movie")
	public String movie(Model model) {
		
		List<ContentListVO> movieList = contentDao.movieList();
		List<GenreDto> movieGenreList = genreDao.movieGenreList();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("movieGenreList", movieGenreList);
		return "main/movie";
		
	}
	
}	
	