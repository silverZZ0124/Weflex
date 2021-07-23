package com.kh.finalteam1.restcontroller;

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
import com.kh.finalteam1.vo.ClientUpdatePasswordVO;

@RestController
@RequestMapping("/data/home")
public class HomeDataController {
	@Autowired
	private WatchLogDao watchLogDao;
		
	@Autowired
	private ContentDao contentDao;
	
	@PostMapping("/insertWatchLog")
	public void insertWatchLog(@ModelAttribute WatchLogDto watchLogDto) {
		watchLogDao.insertWatchLog(watchLogDto);
	}
	
	@PostMapping("/getContent")
	public ContentDto getContent(@RequestParam int contentNo) {
		return contentDao.get(contentNo);		
	}
}
