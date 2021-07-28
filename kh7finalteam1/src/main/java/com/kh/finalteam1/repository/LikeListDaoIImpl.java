package com.kh.finalteam1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.LikeListDto;

@Repository
public class LikeListDaoIImpl implements LikeListDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertLikeList(LikeListDto likeListDto) {
		sqlSession.insert("likeList.mergeInto", likeListDto);
	}

	@Override
	public void deleteLikeList(LikeListDto likeListDto) {
		sqlSession.insert("likeList.delete", likeListDto);
	}

	@Override
	public LikeListDto getLikeList(LikeListDto likeListDto) {		
		return sqlSession.selectOne("likeList.getLikeList", likeListDto);
	}
	
}
