package com.kh.finalteam1.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.swing.text.AbstractDocument.Content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalteam1.entity.MainTrailerDto;
import com.kh.finalteam1.repository.MainTrailerDao;
import com.kh.finalteam1.vo.SliderListVO;

@Service
public class HomeServiceImpl implements HomeService {
	class ContentType{
		public static final String KOREA_MOVIE = "km";
		public static final String FOREIGN_MOVIE = "fm";
		public static final String KOREA_DRAMA = "kd";
		public static final String FOREIGN_DRAMA = "fd";
		public static final String ENTERTAINMENT = "co";
		public static final String ANIMATION = "an";
		public static final String DOCUMENTARY = "do";
	}
	
	static final int CAST = 1;
	static final int GENRE = 2;
	static final int FEATURE = 3;
	static final int CONTENTTITLE = 4;
	
	@Autowired
	private MainTrailerDao mainTrailerDao;
	
	@Override
	public MainTrailerDto getMainTrailer() {
		List<MainTrailerDto> mainTrailerList = mainTrailerDao.list();
		
		Random ran = new Random();
		int trailerIndex = ran.nextInt(mainTrailerList.size());
		return mainTrailerList.get(trailerIndex);
	}

	@Override
	public List<SliderListVO> getSliderList() {
		List<SliderListVO> list = new ArrayList<SliderListVO>();

		return list;
	}

	@Override
	public SliderListVO getSlider(String contentType, int type, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
