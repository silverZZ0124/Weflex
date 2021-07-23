package com.kh.finalteam1.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalteam1.entity.ClientGradeListDto;
import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.GenreDto;
import com.kh.finalteam1.entity.NoSeriesDto;
import com.kh.finalteam1.entity.ProgramFeatureDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.GenreDao;
import com.kh.finalteam1.repository.ProgramFeatureDao;
import com.kh.finalteam1.repository.SeriesDao;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/data")
@Slf4j
public class AdminDataController {
	
	@Autowired
	private GenreDao genreDao;
	
	@Autowired
	private ProgramFeatureDao programFeatureDao;
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Autowired
	private ContentDao contentDao;
	
	@GetMapping("/content/list")
	public List<ContentDto> contentList(){
		return contentDao.list();
	}
	
	@GetMapping("/admin/searchGenre")
	public List<GenreDto> searchGenre(@RequestParam String genreName) {
		return genreDao.get(genreName);
		
	}
	
	@GetMapping("/admin/searchFeature")
	public List<ProgramFeatureDto> searchFeature(@RequestParam String featureName) {
		return programFeatureDao.get(featureName);
		
	}
	
	@GetMapping("/admin/content/selectSeason")
	public List<YesSeriesDto> selectSeason(@ModelAttribute YesSeriesDto yesSeriesDto) {
		return seriesDao.yesSeason(yesSeriesDto);
		
	}
	
	@Autowired
	private ClientDao clientDao;
	
	//회원 목록 출력 (관리자 페이지 회원 목록)
	@GetMapping("/client/list")
	public List<ClientGradeListDto> list(){
		return clientDao.list();
	}
	
	
	@PostMapping("/series/yes")
	public void seriesInsertYes(
			HttpSession session, @ModelAttribute YesSeriesDto yesSeriesDto) {
			log.debug("yesSeriesDto = {}" , yesSeriesDto);
			session.setAttribute("yesSeriesDto", yesSeriesDto);
	}
	
	@PostMapping("/series/no")
	public void seriesInsertNo(
			HttpSession session, @ModelAttribute NoSeriesDto noSeriesDto) {
			log.debug("noSeriesDto = {}" , noSeriesDto);
			session.setAttribute("noSeriesDto", noSeriesDto);
	}
	
}
