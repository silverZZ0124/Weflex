package com.kh.finalteam1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.content.ContentDto;
import com.kh.finalteam1.repository.content.ContentDao;

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
}
