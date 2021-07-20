package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.client.ClientDto;
import com.kh.finalteam1.entity.client.ClientGradeDto;

public interface ClientDao {
	ClientDto findClient(int clientNo);
	ClientGradeDto getGrade(int gradeNo);
	boolean changePhone(ClientDto clientDto);
}
