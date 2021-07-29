  package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.vo.ContentListVO;
import com.kh.finalteam1.vo.HoverModalVO;
import com.kh.finalteam1.vo.SimilarContentVO;

public interface ContentDao {
	
	int sequence();
	void insert(ContentDto contentDto);
	ContentDto get(int contentNo);
	boolean delete(int contentNo);
	boolean edit(ContentDto contentDto);
	List<ContentListVO> getSliderItem(String contentType, int type, String keyword);
	HoverModalVO getHoverModalVO(int contentNo);
	List<ContentDto> list();
	int monthContentCount();//이번달 컨텐츠 추가 수
	int yearContentCount();//올해 컨텐츠 추가 수
	List<ContentListVO> tvProgramList(); //TV프로그램(장르 검색 안했을때)
	List<ContentListVO> movieList(); //영화
	List<SimilarContentVO> getSimilarList(int contentNo, String contentType, List<String> genreList, int clientNo, int count);
	List<SimilarContentVO> getSimilarListAll(int contentNo, String contentType, int clientNo);
	boolean updateContentViews(int contentNo);
	boolean increaseContentLikes(int contentNo);
	boolean decreaseContentLikes(int contentNo);
}