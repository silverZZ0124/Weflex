package com.kh.finalteam1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.BuyListDto;
@Repository
public class BuyListDaoImpl implements BuyListDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getSequence(){
		return sqlSession.selectOne("buylist.sequence");
	}
	
	@Override
	public void ready(BuyListDto buyListDto) {
		sqlSession.insert("buylist.ready",buyListDto);
	}
}
