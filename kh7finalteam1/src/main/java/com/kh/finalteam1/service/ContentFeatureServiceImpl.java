package com.kh.finalteam1.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalteam1.entity.ContentFeatureDto;
import com.kh.finalteam1.repository.ContentFeatureDao;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ContentFeatureServiceImpl implements ContentFeatureService {
	
	@Autowired
	private ContentFeatureDao contentFeatureDao;
	
	
	@Override
	public void regist(int contentNo, List<Integer> featureNo) {
		
		List<ContentFeatureDto> list = new ArrayList<>();
		
		for(int i = 0; i < featureNo.size(); i++) {
			list.add(ContentFeatureDto.builder()
																	.contentNo(contentNo)
																	.featureNo(featureNo.get(i))
														.build());	
		}
		
		log.debug("ContentFeatureDtoList = {}", list );
		contentFeatureDao.regist(list);
		
		
	}

}
