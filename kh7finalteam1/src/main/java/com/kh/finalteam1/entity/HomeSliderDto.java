package com.kh.finalteam1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class HomeSliderDto {
	private int homeSliderNo;
	private String homeSliderTitle;
	private String homeSliderType;
	private String homeSliderCondition;
	private String homeSliderKeyword;
}
