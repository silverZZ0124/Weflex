 package com.kh.finalteam1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.client.ClientDto;

@Repository
public class LoginDaoImpl implements LoginDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ClientDto regitCheck(String email) {
	
		ClientDto clientDto = sqlSession.selectOne("client.regitCheck", email);
	
		return clientDto;
	}
}
