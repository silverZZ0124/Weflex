package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.vo.GenreFeatureCastVO;

public interface ContentGenreDao {
	List<GenreFeatureCastVO> contentGenreLists(int contentNo); 
}
