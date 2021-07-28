package com.kh.finalteam1.entity;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ContentDto {
	private int contentNo;
	private String contentName;
	private String contentInfo;
	private int contentLimit;
	private String contentSeries;
	private String contentRelease;
	private String contentLogo;
	private int contentLikes;
	private int contentViews;
	private String contentThumbnail;
	private String contentType;
	private String contentTrailer;
	private Date contentJoin;
}
