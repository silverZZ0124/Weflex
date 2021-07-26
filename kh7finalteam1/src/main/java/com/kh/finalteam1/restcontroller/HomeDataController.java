package com.kh.finalteam1.restcontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.GenreDto;
import com.kh.finalteam1.entity.ProgramFeatureDto;
import com.kh.finalteam1.entity.WatchLogDto;
import com.kh.finalteam1.entity.WishListDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.error.AjaxException;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.GenreDao;
import com.kh.finalteam1.repository.ProgramFeatureDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.repository.WatchLogDao;
import com.kh.finalteam1.repository.WishListDao;
import com.kh.finalteam1.service.MainModalService;
import com.kh.finalteam1.vo.ClientUpdatePasswordVO;
import com.kh.finalteam1.vo.MainModalDetailVO;

@RestController
@RequestMapping("/data/home")
public class HomeDataController {		
	@Autowired
	private MainModalService mainModalService;
	
	@Autowired
	private WatchLogDao watchLogDao;
			
	@PostMapping("/insertWatchLog")
	public void insertWatchLog(@ModelAttribute WatchLogDto watchLogDto) {
		watchLogDao.insertWatchLog(watchLogDto);
	}
	
	@PostMapping("/getContent")
	public MainModalDetailVO getContent(@RequestParam int contentNo, HttpSession session) {		
		MainModalDetailVO mainModalDetailVO = mainModalService.getModalDetailVO(contentNo, getClientNo(session));
		
		return mainModalDetailVO;
	}
	
	@PostMapping("/insertWishList")
	public void insertWishList(@RequestParam int contentNo, HttpSession session) {
		mainModalService.insertWishList(getClientNo(session), contentNo);		
	}
	
	@PostMapping("/deleteWishList")
	public void deleteWishList(@RequestParam int contentNo, HttpSession session) {
		mainModalService.deleteWishList(getClientNo(session), contentNo);
	}
	
	public int getClientNo(HttpSession session) {
		return (int)session.getAttribute("clientNo");
	}
	
	@Autowired
	private GenreDao genreDao;
	
	@Autowired
	private ProgramFeatureDao programFeatureDao;
	
	@PostMapping("/getGenre")
	public List<GenreDto> getGenre() {
		return genreDao.list();
	}
	
	@PostMapping("/getFeature")
	public List<ProgramFeatureDto> getFeature() {
		return programFeatureDao.list();
	}
}
