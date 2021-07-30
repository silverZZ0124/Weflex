package com.kh.finalteam1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.repository.NoticeDao;
import com.kh.finalteam1.vo.NoticeVo;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {
	
	@Autowired
	NoticeDao noticeDao;
	
	@RequestMapping("/list")
	public String notice2(Model model) {
		List<NoticeVo> noticeList = noticeDao.noticeList();
		model.addAttribute("list", noticeList);
		return "admin/notice";
	}
	
	@RequestMapping("/noticeDetail")
	public String noticeDetail(@RequestParam int noticeNo, Model model) {
		NoticeVo noticeVo = noticeDao.noticeGet(noticeNo);
		model.addAttribute("noticeVo", noticeVo);
		return "admin/noticeDetail";
	}
	
	@RequestMapping("/write")
	public String noticeWrite() {
		return "admin/noticeWrite1";
	}
	
	@RequestMapping("/return")
	public String noticesReturn() {
		return "admin/notice";	
	}
}
