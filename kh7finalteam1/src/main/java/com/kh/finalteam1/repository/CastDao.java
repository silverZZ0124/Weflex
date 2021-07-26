package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.CastDto;
import com.kh.finalteam1.vo.GenreFeatureCastVO;

public interface CastDao {
	List<GenreFeatureCastVO> contentCastLists(int contentNo); 
	
	//배우 등록(관리자)
	void regist(List<CastDto> list);

	//수정할때 모두 삭제
	boolean deleteAll(int contentNo);
}
