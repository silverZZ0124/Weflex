package com.kh.finalteam1.repository.content;

import com.kh.finalteam1.entity.content.ContentDto;

public interface ContentDao {
	int sequence();
	void insert(ContentDto contentDto);
	ContentDto get(int contentNo);
	
}
