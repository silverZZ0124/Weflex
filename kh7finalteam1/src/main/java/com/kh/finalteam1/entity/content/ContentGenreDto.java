package com.kh.finalteam1.entity.content;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ContentGenreDto {
	private int content_no;
	private int genre_no;
}
