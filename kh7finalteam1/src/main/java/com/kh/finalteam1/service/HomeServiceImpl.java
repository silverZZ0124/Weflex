package com.kh.finalteam1.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.swing.text.AbstractDocument.Content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.HomeSliderDto;
import com.kh.finalteam1.entity.MainTrailerDto;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.HomeSliderDao;
import com.kh.finalteam1.repository.MainTrailerDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.vo.ContentListVO;
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
	
	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Autowired
	private HomeSliderDao homeSliderDao;
	
	@Override
	public MainTrailerDto getMainTrailer() {
		List<MainTrailerDto> mainTrailerList = mainTrailerDao.list();
		
		Random ran = new Random();
		int trailerIndex = ran.nextInt(mainTrailerList.size());
		return mainTrailerList.get(trailerIndex);
	}

	@Override
	public List<SliderListVO> getSliderList(){
		List<SliderListVO> list = new ArrayList<SliderListVO>();
		
		List<HomeSliderDto> homeSliderDtoList = homeSliderDao.list();
		
		for(HomeSliderDto dto : homeSliderDtoList) {
			SliderListVO temp = getSlider(dto.getHomeSliderTitle(), dto.getHomeSliderType(), 
					dto.getHomeSliderCondition(), dto.getHomeSliderKeyword());
			temp.setHomeSliderNo(dto.getHomeSliderNo());
			list.add(temp);
		}
				
		return list;
	}

	@Override
	public SliderListVO getSlider(String sliderTitle, String contentType, String condition, String keyword){		
		List<ContentListVO> contentDtoList = contentDao.getSliderItem(contentType, condition, keyword);
						
		SliderListVO sliderListVO = SliderListVO.builder()
										.sliderTitle(sliderTitle)
										.contentList(contentDtoList)
									.build();
		return sliderListVO;
	}

}
