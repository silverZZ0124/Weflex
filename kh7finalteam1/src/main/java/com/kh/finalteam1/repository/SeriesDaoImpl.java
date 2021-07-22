package com.kh.finalteam1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.NoSeriesDto;
import com.kh.finalteam1.entity.YesSeriesDto;

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

	@Override
	public NoSeriesDto noGet(int contentNo) {
		return sqlSession.selectOne("series.noGet", contentNo);
	}

	@Override
	public boolean noEdit(NoSeriesDto noSeriesDto) {
		int count = sqlSession.update("series.noEdit", noSeriesDto);
		return count>0;
	}
	
}
