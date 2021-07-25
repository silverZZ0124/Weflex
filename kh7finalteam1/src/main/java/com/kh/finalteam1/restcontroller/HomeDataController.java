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
import com.kh.finalteam1.entity.WatchLogDto;
import com.kh.finalteam1.entity.WishListDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.error.AjaxException;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.repository.ContentDao;
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
	private WatchLogDao watchLogDao;
		
	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private MainModalService mainModalService;
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Autowired
	private WishListDao wishListDao;
	
	@PostMapping("/insertWatchLog")
	public void insertWatchLog(@ModelAttribute WatchLogDto watchLogDto) {
		watchLogDao.insertWatchLog(watchLogDto);
	}
	
	@PostMapping("/getContent")
	public MainModalDetailVO getContent(@RequestParam int contentNo) {
		MainModalDetailVO mainModalDetailVO;
		
		//해당 content 가져오는 메소드
		ContentDto contentDto = contentDao.get(contentNo);
		
		//series 여부가 Y면 seriesDto List 가져오기
		List<YesSeriesDto> seriesList = new ArrayList<YesSeriesDto>();
		if(contentDto.getContentSeries().equals("Y")) {
			seriesList = seriesDao.yesList(contentNo);
		}			
		
		//해당 content의 장르 가져오는 메소드
		List<String> genreList = mainModalService.getGenre(contentNo);
		
		//해당 content의 프로그램 특징 가져오는 메소드
		List<String> featureList = mainModalService.getFeature(contentNo);
		
		//해당 content의 출연진 가져오는 메소드
		List<String> castList = mainModalService.getCast(contentNo);
		
		return mainModalDetailVO = MainModalDetailVO.builder()
								.contentDto(contentDto)
								.genreList(genreList)
								.featureList(featureList)
								.castList(castList)
								.seriesList(seriesList)
							.build();
		 
	}
	
	@PostMapping("/insertWishList")
	public void insertWishList(@RequestParam int contentNo, HttpSession session) {
		int clientNo = (int)session.getAttribute("clientNo");
		WishListDto wishListDto = WishListDto.builder()
									.clientNo(clientNo)
									.contentNo(contentNo)
								.build();
		
		wishListDao.insertWishList(wishListDto);
	}
	
	@PostMapping("/deleteWishList")
	public void deleteWishList(@RequestParam int contentNo, HttpSession session) {
		int clientNo = (int)session.getAttribute("clientNo");
		WishListDto wishListDto = WishListDto.builder()
									.clientNo(clientNo)
									.contentNo(contentNo)
								.build();
		
		wishListDao.deleteWishList(wishListDto);
	}
}
