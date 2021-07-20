package com.kh.finalteam1.controller;

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
	
	@Autowired
	private SeriesDao seriesDao;
	
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
			return "admin/yesContentDetail";	
		}
	}
	
	@GetMapping("/contentDelete")
	public String contentDelete(@RequestParam int contentNo, Model model) {
		contentDao.delete(contentNo);
		
		return "redirect:/admin/content/";
	}
	
	@RequestMapping("/noContentEdit")
	public String noContentEdit(
			@ModelAttribute ContentDto contentDto,
			@ModelAttribute NoSeriesDto noSeriesDto) {
		
		contentDao.edit(contentDto);
		seriesDao.noEdit(noSeriesDto);
		
		return "redirect:contentDetail?contentNo="+contentDto.getContentNo();
	}
	
	@RequestMapping("/yesContentEdit")
	public String yesContentEdit(
			@ModelAttribute ContentDto contentDto) {
		
		contentDao.edit(contentDto);
		return "redirect:contentDetail?contentNo="+contentDto.getContentNo();
	}
	
	@RequestMapping("/episodeEdit")
	public String episodeEdit(@ModelAttribute YesSeriesDto yesSeriesDto) {
		
		seriesDao.yesEdit(yesSeriesDto);
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
