package com.kh.finalteam1.restcontroller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.GenreDto;
import com.kh.finalteam1.entity.LikeListDto;
import com.kh.finalteam1.entity.ProgramFeatureDto;
import com.kh.finalteam1.entity.WatchLogDto;
import com.kh.finalteam1.entity.WishListDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.error.AjaxException;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.GenreDao;
import com.kh.finalteam1.repository.LikeListDao;
import com.kh.finalteam1.repository.ProgramFeatureDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.repository.WatchLogDao;
import com.kh.finalteam1.repository.WishListDao;
import com.kh.finalteam1.service.MainModalService;
import com.kh.finalteam1.vo.ClientUpdatePasswordVO;
import com.kh.finalteam1.vo.HoverModalVO;
import com.kh.finalteam1.vo.MainModalDetailVO;

@RestController
@RequestMapping("/data/home")
public class HomeDataController {		
	@Autowired
	private MainModalService mainModalService;
	
	@Autowired
	private WatchLogDao watchLogDao;
		
	@Autowired
	private GenreDao genreDao;
	
	@Autowired
	private ProgramFeatureDao programFeatureDao;
	
	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Autowired
	private WishListDao wishListDao;
	
	@Autowired
	private LikeListDao likeListDao;
	
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
	
	@PostMapping("/insertLikeList")
	public void insertLikeList(@RequestParam int contentNo, HttpSession session) {
		LikeListDto likeListDto = LikeListDto.builder()
									.clientNo(getClientNo(session))
									.contentNo(contentNo)
								.build();
		likeListDao.insertLikeList(likeListDto);		
	}
	
	@PostMapping("/deleteLikeList")
	public void deleteLikeList(@RequestParam int contentNo, HttpSession session) {
		LikeListDto likeListDto = LikeListDto.builder()
									.clientNo(getClientNo(session))
									.contentNo(contentNo)
								.build();
		likeListDao.deleteLikeList(likeListDto);		
	}
	
	public int getClientNo(HttpSession session) {
		return (int)session.getAttribute("clientNo");
	}
	
	@PostMapping("/getGenre")
	public List<GenreDto> getGenre() {
		return genreDao.list();
	}
	
	@PostMapping("/getFeature")
	public List<ProgramFeatureDto> getFeature() {
		return programFeatureDao.list();
	}
	
	
	@PostMapping("/getHoverModalItem")
	public HoverModalVO getHoverModalItem(@RequestParam int contentNo, HttpSession session) {		
		HoverModalVO hoverModalVO = contentDao.getHoverModalVO(contentNo);
		
		if(hoverModalVO.getContentSeries().equals("Y")) {
			hoverModalVO.setSeasonCount(seriesDao.yesTopSeason(contentNo));
		}
		else {
			hoverModalVO.setContentPlayTime((seriesDao.noGet(contentNo)).getContentPlaytime());
		}
		
		WishListDto wishListDto = WishListDto.builder()
									.clientNo(getClientNo(session))
									.contentNo(contentNo)
								.build();
		
		if( wishListDao.getWishList(wishListDto) != null )
			hoverModalVO.setWish(true);
		else
			hoverModalVO.setWish(false);
		
		LikeListDto likeParam = LikeListDto.builder()
									.clientNo(getClientNo(session))
									.contentNo(contentNo)
								.build();

		LikeListDto likeListDto = likeListDao.getLikeList(likeParam);	
						
		if( likeListDto != null )
			hoverModalVO.setLike(true);
		else
			hoverModalVO.setLike(false);
		
		return hoverModalVO;
	}
}
