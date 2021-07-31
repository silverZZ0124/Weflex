package com.kh.finalteam1.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.QnaBoardDto;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.repository.QnaBoardDao;

@Controller
@RequestMapping("/help")
public class HelpController {
	@Autowired
	private QnaBoardDao qnaBoardDao;
	
	@Autowired
	private ClientDao clientDao;
	
	@RequestMapping("")
	public String help(HttpSession session, Model model) {
		
		int clientNo = (int)session.getAttribute("clientNo");
		
		ClientDto clientDto = clientDao.findClient(clientNo);
		
		model.addAttribute("clientName", clientDto.getClientName());
		return "help/help";
	}
	
	@GetMapping("/node/{qnaBoardNo}")
	public String node(@PathVariable("qnaBoardNo") int quaBoardNo, HttpSession session, Model model) {
		int clientNo = (int)session.getAttribute("clientNo");
		ClientDto clientDto = clientDao.findClient(clientNo);
		
		QnaBoardDto qnaBoardDto = qnaBoardDao.findQna(quaBoardNo);
		
		model.addAttribute("qnaBoardDto", qnaBoardDto);
		model.addAttribute("clientName", clientDto.getClientName());
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
