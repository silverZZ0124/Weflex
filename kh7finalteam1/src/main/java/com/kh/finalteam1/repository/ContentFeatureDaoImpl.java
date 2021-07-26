package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.ContentFeatureDto;
import com.kh.finalteam1.vo.GenreFeatureCastVO;

@Repository
public class ContentFeatureDaoImpl implements ContentFeatureDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GenreFeatureCastVO> contentFeatureLists(int contentNo) {
		return sqlSession.selectList("genre-feature-cast.getContentFeature", contentNo);
	}
	
	//Content_feature 테이블 등록(컨텐츠 특징 추가)
	@Override
	public void regist(List<ContentFeatureDto> list) {
		sqlSession.insert("content-feature.regist", list);
	}
}
