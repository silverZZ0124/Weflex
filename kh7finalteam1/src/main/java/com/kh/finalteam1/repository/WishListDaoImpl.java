package com.kh.finalteam1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.WishListDto;

@Repository
public class WishListDaoImpl implements WishListDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insertWishList(WishListDto wishListDto) {
		return sqlSession.insert("wishList.mergeInto", wishListDto) > 0;
	}

	@Override
	public boolean deleteWishList(WishListDto wishListDto) {
		return sqlSession.delete("wishList.delete", wishListDto) > 0;
	}

	@Override
	public WishListDto getWishList(WishListDto wishListDto) {
		return sqlSession.selectOne("wishList.get", wishListDto);
	}

}
