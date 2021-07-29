package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.HomeSliderDto;

public interface HomeSliderDao {
	List<HomeSliderDto> list();
	boolean updateHomeSlider(
			int homeSliderNo,
			String sliderTitle,
			String contentType,
			String type,
			String keyword);
	boolean insertHomeSlider(
			String sliderTitle,
			String contentType,
			String type,
			String keyword);
}
