package com.kh.finalteam1.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalteam1.entity.ContentGenreDto;
import com.kh.finalteam1.repository.ContentGenreDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ContentGenreServiceImpl implements ContentGenreService {
	
	@Autowired
	private ContentGenreDao contentGenreDao;
	
	@Override
	public void regist(int contentNo, List<Integer> genreNo) {
	
	List<ContentGenreDto> list = new ArrayList<>();

	for(int i = 0; i < genreNo.size(); i++) {
		list.add(ContentGenreDto.builder()	
															.contentNo(contentNo)
															.genreNo(genreNo.get(i))
												.build());	
	}
	
	log.debug("ContentGenreDtoList = {}", list);
	contentGenreDao.regist(list);	
	}

	

}