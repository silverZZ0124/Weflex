package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.MainTrailerDto;

@Repository
public class MainTrailerDaoImpl implements MainTrailerDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MainTrailerDto> list() {		
		return sqlSession.selectList("mainTrailer.list");
	}

}
