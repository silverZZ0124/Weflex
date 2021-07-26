package com.kh.finalteam1.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.NoSeriesDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.repository.CastDao;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.ContentFeatureDao;
import com.kh.finalteam1.repository.ContentGenreDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.vo.GenreFeatureCastVO;

@Controller
@RequestMapping("/admin/content")
public class AdminContentController {
	
	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Autowired
	private ContentGenreDao contentGenreDao;
	
	@Autowired
	private ContentFeatureDao contentFeatureDao;
	
	@Autowired
	private CastDao castDao;
	
	@GetMapping("/")
	public String content(Model model) {
		List<ContentDto> contentList = contentDao.list();
		model.addAttribute("contentList", contentList);
		return "admin/content";
	}
	
	@GetMapping("/contentDetail")
	public String contentDetail(@RequestParam int contentNo, Model model) {
		ContentDto contentDto = contentDao.get(contentNo);
		model.addAttribute("contentDto", contentDto);
		
		List<GenreFeatureCastVO> contentGenreList  = contentGenreDao.contentGenreLists(contentNo);
		model.addAttribute("contentGenreList", contentGenreList);
		
		List<GenreFeatureCastVO> contentFeatureList  = contentFeatureDao.contentFeatureLists(contentNo);
		model.addAttribute("contentFeatureList", contentFeatureList);
		
		List<GenreFeatureCastVO> contentCastList  = castDao.contentCastLists(contentNo);
		model.addAttribute("contentCastList", contentCastList);
		
		//연작 없으면 (해당 컨텐츠 영상길이등 단일 전달)
		if(contentDto.getContentSeries().equals("N")) {
			NoSeriesDto noSeriesDto = seriesDao.noGet(contentNo);
			model.addAttribute("noSeriesDto", noSeriesDto);
			return "admin/noContentDetail";			
		}
		//연작 있으면(시리즈 회차등 리스트로 전달)
		else {
			List<YesSeriesDto> yesSeriesList = seriesDao.yesList(contentNo);
			model.addAttribute("yesSeriesList",yesSeriesList);
			
			List<Integer> seasonSize = new ArrayList<>();
			for(YesSeriesDto yesSeriesDto : yesSeriesList) {
				if(!seasonSize.contains(yesSeriesDto.getContentSeason())) {
					seasonSize.add(yesSeriesDto.getContentSeason());
				}
			}
			
			model.addAttribute("seasonSize", seasonSize);
			return "admin/yesContentDetail";	
		}
	}
	
	//컨텐츠 삭제될때 시리즈도 삭제 (on delete cascade)
	@GetMapping("/contentDelete")
	public String contentDelete(@RequestParam int contentNo, Model model) {
		contentDao.delete(contentNo);
		return "redirect:/admin/content/";
	}
	
	@PostMapping("/noContentEdit")
	public String noContentEdit(
			@ModelAttribute ContentDto contentDto,
			@ModelAttribute NoSeriesDto noSeriesDto) {
		
		contentDao.edit(contentDto);
		seriesDao.noEdit(noSeriesDto);
		
		return "redirect:contentDetail?contentNo="+contentDto.getContentNo();
	}
	
	@PostMapping("/yesContentEdit")
	public String yesContentEdit(
			@ModelAttribute ContentDto contentDto) {
		
		contentDao.edit(contentDto);
		return "redirect:contentDetail?contentNo="+contentDto.getContentNo();
	}
	
	@PostMapping("/episodeEdit")
	public String episodeEdit(@ModelAttribute YesSeriesDto yesSeriesDto) {
		
		seriesDao.yesEdit(yesSeriesDto);
		return "redirect:contentDetail?contentNo="+yesSeriesDto.getContentNo();
	}
	
	@PostMapping("/insertEpisode")
	public String insertEpisode(@ModelAttribute YesSeriesDto yesSeriesDto) {
		seriesDao.yesInsert(yesSeriesDto);
		return "redirect:contentDetail?contentNo="+yesSeriesDto.getContentNo();
	}
	
	//에피소드 삭제하고 다시 컨텐츠 상세보기로 이동
	@GetMapping("/episodeDelete")
	public String episodeDelete(@ModelAttribute YesSeriesDto yesSeriesDto) {
		seriesDao.yesDelete(yesSeriesDto);
		return "redirect:contentDetail?contentNo="+yesSeriesDto.getContentNo();
	}
	
	//contentRegist.jsp 이동
	@GetMapping("/contentRegist")
	public String contentRegist() {
		return "admin/contentRegist";
	}
	
	//컨텐츠 등록 및 연작 여부에 따라서 연작 테이블 등록
	@PostMapping("/contentRegist")
	public String contentRegist(@ModelAttribute ContentDto contentDto, HttpSession session) {
		int contentNo = contentDao.sequence();
		contentDto.setContentNo(contentNo);
		contentDao.insert(contentDto);
		
		YesSeriesDto yesSeriesDto = (YesSeriesDto)session.getAttribute("yesSeriesDto");
		NoSeriesDto noSeriesDto = (NoSeriesDto)session.getAttribute("noSeriesDto");
		
		if(yesSeriesDto != null) {
			yesSeriesDto.setContentNo(contentNo);
			seriesDao.yesInsert(yesSeriesDto);
			session.removeAttribute("yesSeriesDto");
		}
		else if(noSeriesDto != null) {
			noSeriesDto.setContentNo(contentNo);
			seriesDao.noInsert(noSeriesDto);
			session.removeAttribute("noSeriesDto");
		}
		return "redirect:/admin/content/";
	}	
}
