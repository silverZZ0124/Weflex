package com.kh.finalteam1.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SliderListVO {
	private int homeSliderNo;
	private String sliderTitle;
	private List<ContentListVO> contentList;
}
