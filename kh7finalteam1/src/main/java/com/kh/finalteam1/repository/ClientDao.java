package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.ClientGradeDto;
import com.kh.finalteam1.vo.ClientUpdatePasswordVO;

public interface ClientDao {
	ClientDto findClient(int clientNo);
	ClientGradeDto getGrade(int gradeNo);
	boolean changePhone(ClientDto clientDto);
	boolean changeEmail(ClientDto clientDto);
	boolean changePassword(ClientUpdatePasswordVO clientVO);
}
