package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.ContentFeatureDto;
import com.kh.finalteam1.vo.GenreFeatureCastVO;

public interface ContentFeatureDao {
	List<GenreFeatureCastVO> contentFeatureLists(int contentNo); 
	
	//Content_feature 테이블 등록(컨텐츠 특징 추가)
	void regist(List<ContentFeatureDto> list);

	boolean deleteAll(int contentNo);
}
