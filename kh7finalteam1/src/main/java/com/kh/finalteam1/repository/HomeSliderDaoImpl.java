package com.kh.finalteam1.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.HomeSliderDto;

@Repository
public class HomeSliderDaoImpl implements HomeSliderDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HomeSliderDto> list() {		
		return sqlSession.selectList("homeSlider.list");
	}

	@Override
	public boolean updateHomeSlider(int homeSliderNo, String sliderTitle, String contentType, String type,
			String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("homeSliderNo", homeSliderNo);
		map.put("sliderTitle", sliderTitle);
		map.put("contentType", contentType);
		map.put("type", type);
		map.put("keyword", keyword);
				
		return sqlSession.update("homeSlider.update", map) > 0; 
	}

	@Override
	public boolean insertHomeSlider(String sliderTitle, String contentType, String type, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sliderTitle", sliderTitle);
		map.put("contentType", contentType);
		map.put("type", type);
		map.put("keyword", keyword);
				
		return sqlSession.update("homeSlider.insert", map) > 0; 
	}

}
