package com.kh.finalteam1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.NoSeriesDto;
import com.kh.finalteam1.entity.WatchLogDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.repository.ClientDao;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.repository.WatchLogDao;
import com.kh.finalteam1.vo.PlaylistVO;

@Service
public class PlayServiceImpl implements PlayService{
	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Autowired
	private ClientDao clientDao;
	
	@Autowired
	private WatchLogDao watchLogDao;
		
	@Override
	public PlaylistVO createPlaylist(int contentNo, int clientNo) {
		int season, episode, playtime;
		String contentUrl = "";
		String contentSeries = "";
		
		ContentDto contentDto = getContent(contentNo);
		WatchLogDto watchLogDto = getWatchLog(contentNo, clientNo);
				
		if(watchLogDto != null) {			
			season = watchLogDto.getWatchLogSeason();		
			episode = watchLogDto.getWatchLogEpisode();
			playtime = watchLogDto.getWatchLogPlaytime();
		}else {		
			season = 1;
			episode = 1;
			playtime = 0;
		}
						
		if(contentDto.getContentSeries().equals("Y")) {
			contentSeries = "Y";
			YesSeriesDto yesSeriesDto = seriesDao.yesGet(contentNo, season, episode);
			contentUrl = yesSeriesDto.getSeriesPath();
		}
		else if(contentDto.getContentSeries().equals("N")){
			contentSeries = "N";
			NoSeriesDto noSeriesDto = seriesDao.noGet(contentNo);
			contentUrl = noSeriesDto.getSeriesPath();
			season = -1;
			episode = -1;
		}

		PlaylistVO playlistVO = PlaylistVO.builder()
				.contentNo(contentNo)
				.clientNo(clientNo)
				.contentTitle(contentDto.getContentName())
				.contentLimit(contentDto.getContentLimit())
				.lastPlaytime(playtime)
				.contentUrl(contentUrl)
				.contentSeason(season)
				.contentEpisode(episode)
				.contentSeries(contentSeries)
				.build();
		
		return playlistVO;
	}

	@Override
	public ContentDto getContent(int contentNo) {
		return contentDao.get(contentNo);
	}

	@Override
	public ClientDto getClient(int clientNo) {
		return clientDao.findClient(clientNo);
	}

	@Override
	public WatchLogDto getWatchLog(int contentNo, int clientNo) {
		return watchLogDao.getWatchLog(contentNo, clientNo);
	}
	
}
