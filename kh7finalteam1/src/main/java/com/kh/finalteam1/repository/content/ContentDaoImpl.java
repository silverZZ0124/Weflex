package com.kh.finalteam1.repository.content;

import java.util.List;

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

	@Override
	public List<ContentDto> list() {
		return sqlSession.selectList("content.list");
	}

	@Override
	public boolean delete(int contentNo) {
		int count = sqlSession.delete("content.delete",contentNo);
		return count>0;
	}

	@Override
	public boolean edit(ContentDto contentDto) {
		int count = sqlSession.update("content.edit", contentDto);
		return count>0;
	}
	
}
