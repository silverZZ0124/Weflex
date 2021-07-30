package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.ClientGradeDto;
import com.kh.finalteam1.entity.ClientGradeListDto;
import com.kh.finalteam1.vo.ClientAgeCountVO;
import com.kh.finalteam1.vo.ClientJoinBuyCountVO;
import com.kh.finalteam1.vo.ClientUpdatePasswordVO;

public interface ClientDao {
	ClientDto findClient(int clientNo);
	ClientGradeDto getGrade(int gradeNo);
	boolean changePhone(ClientDto clientDto);
	ClientDto regitCheck(String email);
	ClientDto loginCheck(ClientDto clientDto);
	void  joinCheck(ClientDto clientDto);
	boolean changeEmail(ClientDto clientDto);
	boolean changePassword(ClientUpdatePasswordVO clientVO);	
	void updateExpire(int clientNo);
	void updateGradeStandard(int clientNo);
	void updateGradePremium(int clientNo);
	
	List<ClientGradeListDto> list();//회원 전체 목록 출력(관리자 게시판 사용)
	int monthMemberCount();//이번달 회원 가입 수
	int yearMemberCount();//올해 회원 가입 수
	ClientAgeCountVO ageCount();//연령대별 회원 수
	ClientJoinBuyCountVO joinCount();////올 해 가입 한 회원 수 출력(월별) 
}
