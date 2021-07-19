package com.kh.finalteam1.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalteam1.entity.client.ClientDto;
import com.kh.finalteam1.repository.LoginDao;

@Controller
public class LoginController {
<<<<<<< HEAD
=======
	@Autowired
	private LoginDao loginDao;

>>>>>>> branch 'main' of https://github.com/Seiyun0809/kh7final.git
	@GetMapping("/login")
	public String login() {
<<<<<<< HEAD
		return "login/loginstart"; 
=======
		return "login/login"; 
>>>>>>> branch 'main' of https://github.com/Seiyun0809/kh7final.git
	}

<<<<<<< HEAD
=======
	@GetMapping("/join1")
	public String join1() {
		return "login/join1";
	}

	@GetMapping("/join2")
	public String join2() {
		return "login/join2";
	}


	@GetMapping("join3")
	public String join3() {
		return "login/join3";
	}


	@GetMapping("join4")
	public String join4() {
		return "login/join4";
	}
	
	@PostMapping("regitCheck")
	public String regitCheck(@RequestParam String email, Model model ) {
	
		ClientDto clientDto = loginDao.regitCheck(email);
		
		if(clientDto == null) {
			return "redirect:join1";
		}
		else {
			model.addAttribute("email", email);
			return "login/login";
		}
	}
>>>>>>> branch 'main' of https://github.com/Seiyun0809/kh7final.git

}