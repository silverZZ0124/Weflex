package com.kh.finalteam1.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PlaylistVO {
	private int clientNo;
	private int contentNo;
	private String contentTitle;
	private int lastPlaytime;
	private int contentLimit;
	private String contentUrl;
	private int contentSeason;
	private int contentEpisode;
	private String contentSeries;
}
