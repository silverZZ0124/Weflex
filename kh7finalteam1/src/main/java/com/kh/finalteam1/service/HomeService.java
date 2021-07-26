package com.kh.finalteam1.service;

import java.util.List;

import com.kh.finalteam1.entity.MainTrailerDto;
import com.kh.finalteam1.vo.SliderListVO;

public interface HomeService {
	MainTrailerDto getMainTrailer();
	SliderListVO getSlider(String contentType, int type, String keyword);
	List<SliderListVO> getSliderList();
}
