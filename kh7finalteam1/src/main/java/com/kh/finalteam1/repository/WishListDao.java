package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.WishListDto;

public interface WishListDao {
	boolean insertWishList(WishListDto wishListDto);
	boolean deleteWishList(WishListDto wishListDto);
}
