package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.vo.GenreFeatureCastVO;

@Repository
public class CastDaoImpl implements CastDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GenreFeatureCastVO> contentCastLists(int contentNo) {
		return sqlSession.selectList("genre-feature-cast.getContentCast", contentNo);
	}

}
