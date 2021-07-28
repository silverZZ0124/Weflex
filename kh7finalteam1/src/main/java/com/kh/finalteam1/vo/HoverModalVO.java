package com.kh.finalteam1.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.kh.finalteam1.entity.GenreDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class HoverModalVO {
	private int contentNo;
	private String contentSeries;
	private String contentTrailer;
	private int contentLimit;
	private List<GenreDto> genreList;
	private int contentPlayTime;
	private int seasonCount;
	private boolean isWish;
	private boolean isLike;
}
