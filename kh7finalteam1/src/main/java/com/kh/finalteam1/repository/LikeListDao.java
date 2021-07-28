package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.LikeListDto;

public interface LikeListDao {
	void insertLikeList(LikeListDto likeListDto);
	void deleteLikeList(LikeListDto likeListDto);
	LikeListDto getLikeList(LikeListDto likeListDto);
}
