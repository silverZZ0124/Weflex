package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.BuyListDto;
import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.vo.ClientJoinBuyCountVO;
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
	
	@Override
	public void approve(int buyNo) {
		sqlSession.update("buylist.approve", buyNo);
	}
	
	@Override
	public BuyListDto get(int clientNo) {
		return sqlSession.selectOne("buylist.get", clientNo);		 
	}
	
	//월별 결제 건수 조회
	@Override
	public ClientJoinBuyCountVO buyCount() {
		return sqlSession.selectOne("buylist.buy-count");
	}
}
