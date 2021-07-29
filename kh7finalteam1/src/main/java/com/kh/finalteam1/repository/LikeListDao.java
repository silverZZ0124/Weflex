package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.LikeListDto;

public interface LikeListDao {
	void insertLikeList(LikeListDto likeListDto);
	void deleteLikeList(LikeListDto likeListDto);
	LikeListDto getLikeList(LikeListDto likeListDto);
	List<LikeListDto> get(int clientNo);
}
