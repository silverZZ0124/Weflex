package com.kh.finalteam1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GenreDaoImpl implements GenreDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(String genreName) {
		sqlSession.insert("genre.insert", genreName);
	}

}
