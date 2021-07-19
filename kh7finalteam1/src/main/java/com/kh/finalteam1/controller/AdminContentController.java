package com.kh.finalteam1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.content.ContentDto;
import com.kh.finalteam1.entity.content.NoSeriesDto;
import com.kh.finalteam1.entity.content.YesSeriesDto;
import com.kh.finalteam1.repository.content.ContentDao;
import com.kh.finalteam1.repository.series.SeriesDao;

@Controller
@RequestMapping("/admin/content")
public class AdminContentController {
	
	@Autowired
	private ContentDao contentDao;
	
	@GetMapping("/")
	public String content(Model model) {
		List<ContentDto> contentList = contentDao.list();
		model.addAttribute("contentList", contentList);
		return "admin/content";
	}
	
	@GetMapping("/contentDetail")
	public String contentEdit(@ModelAttribute ContentDto contentDto, Model model) {
		contentDto = contentDao.get(contentDto.getContentNo());
		model.addAttribute("contentDto", contentDto);
		return "admin/contentDetail";
	}
	
	
	//contentRegist.jsp 이동
	@GetMapping("/contentRegist")
		public String contentRegist() {
			return "admin/contentRegist";
		}
	
	//content 등록
	@PostMapping("/contentRegist")
	public String contentRegist(@ModelAttribute ContentDto contentDto) {
		int contentNo = contentDao.sequence();
		contentDto.setContentNo(contentNo);
		contentDao.insert(contentDto);
		return "redirect:/admin/content/seriesRegist/"+contentNo;
	}
	
	//series 등록 관련 controller
		@GetMapping("/seriesRegist/{contentNo}")
		public String seriesRegist(
				@PathVariable int contentNo, Model model) {
				ContentDto contentDto = contentDao.get(contentNo);
				model.addAttribute("contentDto", contentDto);
			return "admin/seriesRegist";
		}
		
		@Autowired
		private SeriesDao seriesDao;
		
		@PostMapping("/seriesRegist/yes")
		public String seriesRegistYes(@ModelAttribute YesSeriesDto yesSeriesDto) {
			seriesDao.yesInsert(yesSeriesDto);
			return "redirect:/admin/";
		}
		
		@PostMapping("/seriesRegist/no")
		public String seriesRegistNo(@ModelAttribute NoSeriesDto noSeriesDto) {
			seriesDao.noInsert(noSeriesDto);
			return "redirect:/admin/";
		}
}
