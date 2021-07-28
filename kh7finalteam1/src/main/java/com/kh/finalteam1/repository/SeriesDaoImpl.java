package com.kh.finalteam1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<YesSeriesDto> yesList(int contentNo) {
		return sqlSession.selectList("series.yesList", contentNo);
	}

	@Override
	public boolean yesEdit(YesSeriesDto yesSeriesDto) {
		int count = sqlSession.update("series.yesEdit", yesSeriesDto);
		return count>0;
	}
	
	@Override
	public boolean yesDelete(YesSeriesDto yesSeriesDto) {
		int count = sqlSession.delete("series.yesDelete", yesSeriesDto);
		return count>0;
	}

	@Override
	public List<YesSeriesDto> yesSeason(YesSeriesDto yesSeriesDto) {
		return sqlSession.selectList("series.selectSeason", yesSeriesDto);
	}

	@Override
	public YesSeriesDto yesGet(int contentNo, int season, int episode) {	
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("contentNo", contentNo);
		map.put("season", season);
		map.put("episode", episode);
		
		return sqlSession.selectOne("series.yesGet", map);
	}

	@Override
	public int yesTopSeason(int contentNo) {
		return sqlSession.selectOne("series.yesTopseason", contentNo);
	}

}
