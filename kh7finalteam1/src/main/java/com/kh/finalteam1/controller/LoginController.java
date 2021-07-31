package com.kh.finalteam1.controller;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.repository.ClientDao;

@Controller
public class LoginController {
	@Autowired
	private ClientDao clientDao; 
	
	@GetMapping("/login")
	public String login(@RequestParam(required = false) String email, @CookieValue(required = false) String emailCookie, Model model) {
		if(email != null) {
			System.out.println("null인가");
			model.addAttribute("email", email);
		}
		else {
			model.addAttribute("email", emailCookie);
		}

		return "login/login"; 
	}

	@GetMapping("/join1")
	public String join1() {
		return "login/join1";
	}
	
	@PostMapping("/join1")
	public String join1(@RequestParam(required = false) String email, Model model){
		if(email != null) {
			model.addAttribute("email", email);
		}
		return "redirect:/join2";
	}

	@GetMapping("/join2")
	public String join2() {
		
		return "login/join2";
	}


	@GetMapping("join3")
	public String join3(HttpSession session, @RequestParam(required = false) String clientNo) {
		if(clientNo != null) {
			session.setAttribute("clientNo", Integer.parseInt(clientNo));			
		}
		return "login/join3";
	}


	@GetMapping("join4")
	public String join4() {
		return "login/join4";
	}
	
	@PostMapping("regitCheck")
	public String regitCheck(@RequestParam String email , Model model ) {
	
		ClientDto clientDto = clientDao.regitCheck(email);
		
		model.addAttribute("email", email);
		
		if(clientDto == null) {
			return "redirect:join1";
		}
		else {			
			return "login/login";
		}
	}
	@PostMapping("loginCheck")
	public String loginCheck(@ModelAttribute ClientDto clientDto, 
			@RequestParam(required = false) boolean loginInfo, 
			HttpSession session,
			HttpServletResponse response) throws UnsupportedEncodingException {
		ClientDto client = clientDao.loginCheck(clientDto);

		Cookie checkCookie = new Cookie("loginInfo", "true");
		if(loginInfo) 						
			checkCookie.setMaxAge(86400);
		else
			checkCookie.setMaxAge(0);
		
		response.addCookie(checkCookie);		
				
		if(client ==null) {
			return "redirect: login?email="+clientDto.getClientId();
		}
		else {
			Cookie emailCookie = new Cookie("emailCookie", client.getClientId());

			if(loginInfo) 
				emailCookie.setMaxAge(86400);
			else
				emailCookie.setMaxAge(0);
			
			response.addCookie(emailCookie);
			
			session.setAttribute("clientNo", client.getClientNo());
			return "redirect:/home";
		}
	}
	
	@PostMapping("joinCheck")
	public String joinCheck(@ModelAttribute ClientDto clientDto) {
		
		clientDao.joinCheck(clientDto);
		
		ClientDto client = clientDao.regitCheck(clientDto.getClientId());
		return "redirect:/join3?clientNo="+client.getClientNo();
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("clientNo");

		return "redirect: login";
	}
	
}