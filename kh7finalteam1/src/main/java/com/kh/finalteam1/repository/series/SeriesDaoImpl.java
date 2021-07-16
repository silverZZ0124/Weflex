package com.kh.finalteam1.repository.series;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.content.NoSeriesDto;
import com.kh.finalteam1.entity.content.YesSeriesDto;

@Repository
public class SeriesDaoImpl implements SeriesDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void yesInsert(YesSeriesDto yesSeriesDto) {
			sqlSession.insert("series.yesInsert", yesSeriesDto);
	}

	@Override
	public void noInsert(NoSeriesDto noSeriesDto) {
			sqlSession.insert("series.noInsert", noSeriesDto);
	}
	
}
