package com.kh.finalteam1.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class GenreFeatureCastVO {
	private int contentNo;
	private int genreNo;
	private int featureNo;
	private String castName;
}
