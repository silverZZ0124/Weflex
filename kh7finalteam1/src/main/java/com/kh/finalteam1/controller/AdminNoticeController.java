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

import com.kh.finalteam1.entity.NoticeDto;
import com.kh.finalteam1.repository.NoticeDao;
import com.kh.finalteam1.vo.NoticeVo;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {
	
	@Autowired
	NoticeDao noticeDao;
	
	@Autowired
	HttpSession session;
	
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
		return "admin/noticeWrite";
	}
	
	@RequestMapping("/return")
	public String noticesReturn() {
		return "admin/notice";	
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite(@ModelAttribute NoticeDto noticeDto) {
		int clientNo = (Integer)session.getAttribute("clientNo");
		noticeDto.setClientNo(clientNo);
		noticeDao.noticeInsert(noticeDto);
		return "admin/notice";
	}
	
	@GetMapping("/noticeEdit")
	public String noticeEdit(@RequestParam int noticeNo, Model model) {
		NoticeVo noticeVo = noticeDao.noticeGet(noticeNo);
		model.addAttribute("noticeVo", noticeVo);
		return "admin/noticeEdit";
	}
	
	@PostMapping("/noticeEdit")
	public String noticeEdit(@ModelAttribute NoticeDto noticeDto) {
		int clientNo = (Integer)session.getAttribute("clientNo");
		noticeDto.setClientNo(clientNo);
		noticeDao.noticeUpdate(noticeDto);
		return "admin/notice";
	}
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(@RequestParam int noticeNo) {
		noticeDao.noticeDelete(noticeNo);
		return "admin/notice";
	}
}
