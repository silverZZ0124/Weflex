package com.kh.finalteam1.vo;

import java.util.List;

import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.WishListDto;
import com.kh.finalteam1.entity.YesSeriesDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MainModalDetailVO {
	private ContentDto contentDto;
	private List<String> genreList;
	private List<String> featureList;
	private List<String> castList;
	private List<YesSeriesDto> seriesList;
	private WishListDto wishListDto;
}
