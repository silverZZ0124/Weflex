package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.ClientGradeDto;
import com.kh.finalteam1.entity.ClientGradeListDto;
import com.kh.finalteam1.vo.ClientUpdatePasswordVO;


@Repository
public class ClientDaoImpl implements ClientDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ClientDto findClient(int clientNo) {
		return sqlSession.selectOne("client.findClient", clientNo);		 
	}

	@Override
	public ClientGradeDto getGrade(int gradeNo) {		
		return sqlSession.selectOne("client.getGrade", gradeNo);
	}

	@Override
	public boolean changePhone(ClientDto clientDto) {
		return sqlSession.update("client.changePhone", clientDto) > 0;
	}

	@Override
	public ClientDto regitCheck(String email) {
		ClientDto clientDto = sqlSession.selectOne("client.regitCheck", email);
		return clientDto;
	}
	@Override
	public ClientDto loginCheck(ClientDto clientDto) {
		//System.out.println(clientDto);
		ClientDto client = sqlSession.selectOne("client.loginCheck",clientDto);
		return client;
	}
	@Override
	public void joinCheck(ClientDto clientDto){
		sqlSession.insert("client.joinCheck",clientDto);
	}

	public boolean changeEmail(ClientDto clientDto) {
		return sqlSession.update("client.changeEmail", clientDto) > 0;
	}

	@Override
	public boolean changePassword(ClientUpdatePasswordVO clientVO) {
		return sqlSession.update("client.changePassword", clientVO) > 0;
	}

	//회원 전체 목록 출력(관리자 게시판 사용)
	@Override
	public List<ClientGradeListDto> list() {
		return sqlSession.selectList("client.grade-list");
	}
}