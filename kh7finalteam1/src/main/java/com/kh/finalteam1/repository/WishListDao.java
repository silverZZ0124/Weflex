package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.LikeListDto;
import com.kh.finalteam1.entity.WishListDto;

public interface WishListDao {
	boolean insertWishList(WishListDto wishListDto);
	boolean deleteWishList(WishListDto wishListDto);
	WishListDto getWishList(WishListDto wishListDto);
	List<WishListDto> get(int clientNo);
}
