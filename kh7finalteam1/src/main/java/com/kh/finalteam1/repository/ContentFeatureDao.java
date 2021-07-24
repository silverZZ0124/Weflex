package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.vo.GenreFeatureCastVO;

public interface ContentFeatureDao {
	List<GenreFeatureCastVO> contentFeatureLists(int contentNo); 
}
