package com.kh.finalteam1.vo;

import com.kh.finalteam1.entity.WishListDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SimilarContentVO {
	private int contentNo;
	private String contentThumbnail;
	private int contentLimit;
	private int contentRelease;
	private String contentInfo;
	private int seasonCount;
	private int contentPlayTime;
	private WishListDto wishListDto;
}
