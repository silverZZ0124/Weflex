package com.kh.finalteam1.entity.log;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class WatchLogDto {
	private int clientNo;
	private int contentNo;
	private int watchLogSeason;
	private int watchLogEpisode;
	private Date watchLogPlaytime;
}
