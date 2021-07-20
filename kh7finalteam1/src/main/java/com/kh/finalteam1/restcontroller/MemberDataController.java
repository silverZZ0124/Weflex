package com.kh.finalteam1.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalteam1.entity.client.ClientDto;
import com.kh.finalteam1.repository.ClientDao;

@RestController
@RequestMapping("/data/member")
public class MemberDataController {
	@Autowired
	private ClientDao clientDao;
	
	@PostMapping("/changePhone")
	public void changePhone(@RequestParam String phoneNumber) throws Exception {
		ClientDto clientDto = ClientDto.builder()
								.clientNo(2)
								.clientPhone(phoneNumber)
							.build();
		if(!clientDao.changePhone(clientDto)) {
			throw new Exception("에러에러");
		}
	}
}
