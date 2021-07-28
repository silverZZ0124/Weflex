package com.kh.finalteam1.restcontroller;

import java.sql.Date;

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
	public void changePhone(@RequestParam String phoneNumber) {
		ClientDto clientDto = ClientDto.builder()
								.clientNo(2)
								.clientPhone(phoneNumber)
							.build();
		
		if(!clientDao.changePhone(clientDto)) {
			throw new AjaxException("에러에러");
		}
	}
	
	@PostMapping("/changeEmail")
	public void changeEmail(@RequestParam String email) {
		ClientDto clientDto = ClientDto.builder()
								.clientNo(2)
								.clientId(email)
							.build();
		
		if(!clientDao.changeEmail(clientDto)) {
			throw new AjaxException("에러에러");
		}
	}
	
	@PostMapping("/changePassword")
	public void changePassword(@RequestParam String currentPassword, @RequestParam String newPassword) {
		ClientUpdatePasswordVO clientVO = ClientUpdatePasswordVO.builder()
											.clientNo(2)
											.clientPw(currentPassword)
											.clientNewPw(newPassword)
										.build();
		
		if(!clientDao.changePassword(clientVO)) {
			throw new AjaxException("에러에러");
		}
	}
	
/*	@PostMapping("/regitCheck")
	public boolean regitCheck(
													 @RequestParam String clientPw,
													 @RequestParam String clientName,
													 @RequestParam Date clientBirth,
													 @RequestParam String clientPhone) {

		System.out.println(clientPw);
		System.out.print(clientName);
		System.out.print(clientBirth);
		System.out.print(clientPhone);
		
		return false;
		}
		*/
	
}
