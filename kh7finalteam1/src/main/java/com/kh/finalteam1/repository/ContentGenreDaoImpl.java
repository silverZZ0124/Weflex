package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.vo.GenreFeatureCastVO;

@Repository
public class ContentGenreDaoImpl implements ContentGenreDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GenreFeatureCastVO> contentGenreLists(int contentNo) {
		return sqlSession.selectList("genre-feature-cast.getContentGenre", contentNo);
	}

}
