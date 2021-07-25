package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.NoSeriesDto;
import com.kh.finalteam1.entity.YesSeriesDto;

public interface SeriesDao {
	void yesInsert(YesSeriesDto yesSeriesDto);
	void noInsert(NoSeriesDto noSeriesDto);
	NoSeriesDto noGet(int contentNo);
	YesSeriesDto yesGet(int contentNo, int season, int episode);
	boolean noEdit(NoSeriesDto noSeriesDto);
	List<YesSeriesDto> yesList(int contentNo);
	boolean yesEdit(YesSeriesDto yesSeriesDto);
	boolean yesDelete(YesSeriesDto yesSeriesDto);
	
	List<YesSeriesDto> yesSeason(YesSeriesDto yesSeriesDto);
}
