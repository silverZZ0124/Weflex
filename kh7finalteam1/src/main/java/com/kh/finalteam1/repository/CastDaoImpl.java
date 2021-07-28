package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.CastDto;
import com.kh.finalteam1.vo.GenreFeatureCastVO;

@Repository
public class CastDaoImpl implements CastDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GenreFeatureCastVO> contentCastLists(int contentNo) {
		return sqlSession.selectList("genre-feature-cast.getContentCast", contentNo);
	}
	
	//배우 등록(관리자)
	@Override
	public void regist(List<CastDto> list) {
		sqlSession.insert("cast.regist", list);	
	}

	@Override
	public boolean deleteAll(int contentNo) {
		int count = sqlSession.delete("cast.delete", contentNo);
		return count>0;
	}

}
