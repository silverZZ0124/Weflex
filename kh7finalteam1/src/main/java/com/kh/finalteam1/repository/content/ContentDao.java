package com.kh.finalteam1.repository.content;

import java.util.List;

import com.kh.finalteam1.entity.content.ContentDto;

public interface ContentDao {
	int sequence();//시퀀스 번호 추출
	void insert(ContentDto contentDto);//컨텐츠 테이블 등록
	ContentDto get(int contentNo);//단일 조회
	
	List<ContentDto> list();
	
}
