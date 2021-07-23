package com.kh.finalteam1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MainTrailerDto {
	private int trailerNo;
	private int contentNo;
	private int trailerLimit;
	private String trailerLogo;
	private String trailerUrl;
	private String trailerInfo;
}
