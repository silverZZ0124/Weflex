package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.WatchLogDto;

public interface WatchLogDao {
	WatchLogDto getWatchLog(int contentNo, int clientNo);
	WatchLogDto getWatchLog(int contentNo, int clientNo, int contentSeason, int contentEpisode);
	boolean insertWatchLog(WatchLogDto watchLogDto);
}
