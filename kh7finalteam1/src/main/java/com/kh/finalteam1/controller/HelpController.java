package com.kh.finalteam1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.QnaBoardDto;
import com.kh.finalteam1.repository.QnaBoardDao;

@Controller
@RequestMapping("/help")
public class HelpController {
	@Autowired
	private QnaBoardDao qnaBoardDao;
	
	@RequestMapping("")
	public String help() {
		return "help/help";
	}
	
	@GetMapping("/node/{qnaBoardNo}")
	public String node(@PathVariable("qnaBoardNo") int quaBoardNo, Model model) {
		QnaBoardDto qnaBoardDto = qnaBoardDao.findQna(quaBoardNo);
		model.addAttribute("qnaBoardDto", qnaBoardDto);
		
		return "help/node";
	}
	
	@GetMapping("/editor")
	public String editor() {
		return "help/toastEditor";
	}
	
	@PostMapping("/editor")
	public String editor(@RequestParam int categoryNo, @RequestParam String title, @RequestParam String content) {
		System.out.println("ee");
		QnaBoardDto qnaBoardDto = QnaBoardDto.builder()
									.categoryNo(categoryNo)
									.qnaBoardTitle(title)
									.qnaBoardContent(content)
								.build();
		
		qnaBoardDao.insertQnaBoard(qnaBoardDto);
		
		return "redirect:editor";
	}
}
