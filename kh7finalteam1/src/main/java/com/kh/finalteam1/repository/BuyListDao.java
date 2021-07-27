package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.BuyListDto;

public interface BuyListDao {

	int getSequence();
	void ready(BuyListDto buyListDto);
}
