package com.kh.finalteam1.controller;

import java.util.List;

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
	
	@GetMapping("/noContentDetail")
	public String contentDetail(@RequestParam int contentNo, Model model) {
		ContentDto contentDto = contentDao.get(contentNo);
		NoSeriesDto noSeriesDto = seriesDao.noGet(contentNo);
		model.addAttribute("contentDto", contentDto);
		model.addAttribute("noSeriesDto", noSeriesDto);
		return "admin/noContentDetail";
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
		
		return "redirect:noContentDetail?contentNo="+contentDto.getContentNo();
	}
}
