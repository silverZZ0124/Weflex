package com.kh.finalteam1.repository.content;

import java.util.List;

import com.kh.finalteam1.entity.content.ContentDto;

public interface ContentDao {
<<<<<<< HEAD
	
	int sequence();
	void insert(ContentDto contentDto);
	ContentDto get(int contentNo);
	boolean delete(int contentNo);
	boolean edit(ContentDto contentDto);
=======
	int sequence();//시퀀스 번호 추출
	void insert(ContentDto contentDto);//컨텐츠 테이블 등록
	ContentDto get(int contentNo);//단일 조회
>>>>>>> branch 'main' of https://github.com/Seiyun0809/kh7final.git
	
	List<ContentDto> list();
	
}
