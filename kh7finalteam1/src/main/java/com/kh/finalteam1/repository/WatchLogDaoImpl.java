package com.kh.finalteam1.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.WatchLogDto;

@Repository
public class WatchLogDaoImpl implements WatchLogDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public WatchLogDto getWatchLog(int contentNo, int clientNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("contentNo", contentNo);
		map.put("clientNo", clientNo);
		
		return sqlSession.selectOne("watchlog.get", map);
	}

	@Override
	public boolean insertWatchLog(WatchLogDto watchLogDto) {		
		return sqlSession.insert("watchlog.mergeInto", watchLogDto) > 0;
	}

}
