package com.kh.finalteam1.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.MainTrailerDto;
import com.kh.finalteam1.entity.NoSeriesDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.MainTrailerDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.service.PlayService;
import com.kh.finalteam1.vo.PlaylistVO;

@Controller
public class HomeController {
	@Autowired
	private MainTrailerDao mainTrailerDao;
	
	@Autowired
	private PlayService playService;
	
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
	public String play(@RequestParam int contentNo, Model model, HttpSession session) {
		int clientNo = (int)session.getAttribute("clientNo");
		PlaylistVO playlistVO = playService.createPlaylist(contentNo, clientNo);
				
		model.addAttribute("playlistVO", playlistVO);
		
		System.out.println(playlistVO);
		
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
	
	@GetMapping("/test")
	public String test() {
		return "template/test";

	}
}
