package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.WatchLogDto;

public interface WatchLogDao {
	WatchLogDto getWatchLog(int contentNo, int clientNo);
	boolean insertWatchLog(WatchLogDto watchLogDto);
}
