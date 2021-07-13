package com.kh.finalteam1.entity.genre;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class GenreDto {
	private int genreNo;
	private String genreName;

}
