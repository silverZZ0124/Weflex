package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.ContentDto;

public interface ContentDao {
	
	int sequence();
	void insert(ContentDto contentDto);
	ContentDto get(int contentNo);
	boolean delete(int contentNo);
	boolean edit(ContentDto contentDto);

	
	List<ContentDto> list();
	
}
