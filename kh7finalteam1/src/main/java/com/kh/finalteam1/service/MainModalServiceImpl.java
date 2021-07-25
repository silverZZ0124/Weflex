package com.kh.finalteam1.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainModalServiceImpl implements MainModalService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<String> getGenre(int contentNo) {
		return sqlSession.selectList("mainModalService.getGenre", contentNo);
	}

	@Override
	public List<String> getFeature(int contentNo) {
		return sqlSession.selectList("mainModalService.getFeature", contentNo);
	}

	@Override
	public List<String> getCast(int contentNo) {
		return sqlSession.selectList("mainModalService.getCast", contentNo);
	}

}
