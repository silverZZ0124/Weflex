package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.ContentGenreDto;
import com.kh.finalteam1.vo.GenreFeatureCastVO;

@Repository
public class ContentGenreDaoImpl implements ContentGenreDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GenreFeatureCastVO> contentGenreLists(int contentNo) {
		return sqlSession.selectList("genre-feature-cast.getContentGenre", contentNo);
	}
	
	//content_genre 테이블 추가(컨텐츠 장르 등록)
	@Override
	public void regist(List<ContentGenreDto> list) {
		sqlSession.insert("content-genre.regist", list);
	}

	@Override
	public boolean deleteAll(int contentNo) {
		int count = sqlSession.delete("content-genre.delete", contentNo);
		return count>0;
	}

}
