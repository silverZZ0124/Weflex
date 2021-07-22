package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.content.ProgramFeatureDto;

@Repository
public class ProgramFeatureDaoImpl implements ProgramFeatureDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(String featureName) {
		sqlSession.insert("program-feature.insert", featureName);
	}

	@Override
	public List<ProgramFeatureDto> list() {
		return sqlSession.selectList("program-feature.list");
	}

	@Override
	public List<ProgramFeatureDto> get(String featureName) {
		return sqlSession.selectList("program-feature.search", featureName);
	}

	@Override
	public boolean delete(String featureName) {
		int count = sqlSession.delete("program-feature.delete", featureName);
		return count>0;
	}

	@Override
	public boolean edit(ProgramFeatureDto programFeatureDto) {
		int count = sqlSession.update("program-feature.edit", programFeatureDto);
		return count>0;
	}

}
