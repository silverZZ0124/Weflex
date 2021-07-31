package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.BuyListDto;
import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.vo.ClientJoinBuyCountVO;

public interface BuyListDao {

	int getSequence();
	void ready(BuyListDto buyListDto);
	void approve(int buyNo);
	BuyListDto get(int clientNo);
	List<BuyListDto> list(int clientNo);
	
	//월별 결제 건수 조회
	ClientJoinBuyCountVO buyCount();
}
