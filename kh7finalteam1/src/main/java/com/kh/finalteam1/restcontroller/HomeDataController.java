package com.kh.finalteam1.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.WatchLogDto;
import com.kh.finalteam1.error.AjaxException;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.WatchLogDao;
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
	
	@PostMapping("/insertWatchLog")
	public void insertWatchLog(@ModelAttribute WatchLogDto watchLogDto) {
		watchLogDao.insertWatchLog(watchLogDto);
	}
	
	@PostMapping("/getContent")
	public MainModalDetailVO getContent(@RequestParam int contentNo) {
		MainModalDetailVO mainModalDetailVO;
		
		//해당 content 가져오는 메소드
		ContentDto contentDto = contentDao.get(contentNo);
		
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
							.build();
		 
	}
}
