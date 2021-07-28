package com.kh.finalteam1.service;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.WatchLogDto;
import com.kh.finalteam1.vo.PlaylistVO;

public interface PlayService {
	PlaylistVO createPlaylist(int contentNo, int clientNo);
	ContentDto getContent(int contentNo);
	ClientDto getClient(int clientNo);
	WatchLogDto getWatchLog(int contentNo, int clientNo);
}
