package com.kh.finalteam1.restcontroller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.error.AjaxException;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.vo.ClientUpdatePasswordVO;

@RestController
@RequestMapping("/data/member")
public class MemberDataController {
	@Autowired
	private ClientDao clientDao;
	
	@PostMapping("/changePhone")
	public void changePhone(@RequestParam String phoneNumber, HttpSession session) {
		ClientDto clientDto = ClientDto.builder()
								.clientNo(getClientNo(session))
								.clientPhone(phoneNumber)
							.build();
		
		if(!clientDao.changePhone(clientDto)) {
			throw new AjaxException("에러에러");
		}
	}
	
	@PostMapping("/changeEmail")
	public void changeEmail(@RequestParam String email, HttpSession session) {
		ClientDto tempDto = clientDao.findClient(email);
		
		if(tempDto != null) {
			throw new AjaxException("에러에러");
		}
		
		ClientDto clientDto = ClientDto.builder()
								.clientNo(getClientNo(session))
								.clientId(email)
							.build();
		
		if(!clientDao.changeEmail(clientDto)) {
			throw new AjaxException("에러에러");
		}
	}
	
	@PostMapping("/changePassword")
	public void changePassword(@RequestParam String currentPassword, @RequestParam String newPassword, HttpSession session) {
		ClientUpdatePasswordVO clientVO = ClientUpdatePasswordVO.builder()
											.clientNo(getClientNo(session))
											.clientPw(currentPassword)
											.clientNewPw(newPassword)
										.build();
		
		if(!clientDao.changePassword(clientVO)) {
			throw new AjaxException("에러에러");
		}
	}	
	
	@PostMapping("/emailCheck")
	public boolean emailCheck(@RequestParam String email) {		
		return clientDao.regitCheck(email) == null;
	}
	
	public int getClientNo(HttpSession session) {
		return (int)session.getAttribute("clientNo");
	}
}
