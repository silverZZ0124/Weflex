package com.kh.finalteam1.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.vo.ContentListVO;
import com.kh.finalteam1.vo.HoverModalVO;

@Repository
public class ContentDaoImpl implements ContentDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("content.sequence");
	}
	
	@Override
	public void insert(ContentDto contentDto) {
		sqlSession.insert("content.insert", contentDto);
	}

	@Override
	public ContentDto get(int contentNo) {
		return sqlSession.selectOne("content.get", contentNo);
	}

	@Override
	public List<ContentDto> list() {
		return sqlSession.selectList("content.list");
	}

	@Override
	public boolean delete(int contentNo) {
		int count = sqlSession.delete("content.delete",contentNo);
		return count>0;
	}

	@Override
	public boolean edit(ContentDto contentDto) {
		int count = sqlSession.update("content.edit", contentDto);
		return count>0;
	}

	@Override
	public List<ContentListVO> getSliderItem(String contentType, int type, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("contentType", contentType);		
		map.put("keyword", keyword);
		
		List<ContentListVO> list = new ArrayList<ContentListVO>();
		if(type == 2) {
			list = sqlSession.selectList("content.getContentList", map);
		}
				
		return list;
	}

	@Override
	public HoverModalVO getHoverModalVO(int contentNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		return sqlSession.selectOne("content.getHoverModalVO", contentNo);
	}
	
	//이번달 컨텐츠 추가 수
	@Override
	public int monthContentCount() {
		return sqlSession.selectOne("content.month-contentCount");
	}
	
	//올해 컨텐츠 추가 수
	@Override
	public int yearContentCount() {
		return sqlSession.selectOne("content.year-contentCount");
	}
	
	
}