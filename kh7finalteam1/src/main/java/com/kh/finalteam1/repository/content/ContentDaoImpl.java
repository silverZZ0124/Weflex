package com.kh.finalteam1.repository.content;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.content.ContentDto;

@Repository
public class ContentDaoImpl implements ContentDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ContentDto> list() {
		return sqlSession.selectList("content.list");
	}

}
