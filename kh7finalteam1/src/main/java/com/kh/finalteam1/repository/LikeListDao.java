package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.LikeListDto;

public interface LikeListDao {
	boolean insertLikeList(LikeListDto likeListDto);
	boolean deleteLikeList(LikeListDto likeListDto);
	LikeListDto getLikeList(LikeListDto likeListDto);
}
