package com.kh.finalteam1.repository.content;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.content.ContentDto;

@Repository
public class ContentDaoImpl implements ContentDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("content.sequence");
	}
	
	@Override
	public void insert(ContentDto contentDto) {
		sqlSession.insert("content.insert", contentDto);
	}

	@Override
	public ContentDto get(int contentNo) {
		return sqlSession.selectOne("content.get", contentNo);
	}

}
