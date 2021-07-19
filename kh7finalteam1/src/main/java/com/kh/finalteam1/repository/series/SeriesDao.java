package com.kh.finalteam1.repository.series;

import com.kh.finalteam1.entity.content.NoSeriesDto;
import com.kh.finalteam1.entity.content.YesSeriesDto;

public interface SeriesDao {
	void yesInsert(YesSeriesDto yesSeriesDto);
	void noInsert(NoSeriesDto noSeriesDto);
}
