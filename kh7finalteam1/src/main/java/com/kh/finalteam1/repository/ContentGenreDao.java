package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.ContentGenreDto;
import com.kh.finalteam1.vo.GenreFeatureCastVO;

public interface ContentGenreDao {
	List<GenreFeatureCastVO> contentGenreLists(int contentNo); 
	
	//content_genre 테이블 추가(컨텐츠 장르 등록)
	void regist(List<ContentGenreDto> list);

	boolean deleteAll(int contentNo);
}
