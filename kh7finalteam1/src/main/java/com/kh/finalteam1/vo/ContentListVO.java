package com.kh.finalteam1.vo;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kh.finalteam1.entity.CastDto;
import com.kh.finalteam1.entity.ClientGradeListDto;
import com.kh.finalteam1.entity.GenreDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ContentListVO {
	private int contentNo;
//	private String contentName;
//	private String contentInfo;
//	private int contentLimit;
//	private String contentSeries;
//	private String contentRelease;
//	private String contentLogo;
//	private int contentLikes;
//	private int contentViews;
	private String contentThumbnail;
//	private String contentType;
//	private String contentTrailer;	
//	private int clientNo;
//	private int contentTopSeason;
//	
//	private List<GenreDto> genreList;
//	private List<String> castList;
}
