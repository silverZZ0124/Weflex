package com.kh.finalteam1.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.ClientGradeListDto;
import com.kh.finalteam1.entity.LikeListDto;

@Repository
public class LikeListDaoIImpl implements LikeListDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insertLikeList(LikeListDto likeListDto) {
		return sqlSession.insert("likeList.mergeInto", likeListDto) > 0;
	}

	@Override
	public boolean deleteLikeList(LikeListDto likeListDto) {
		return sqlSession.insert("likeList.delete", likeListDto) > 0;
	}

	@Override
	public LikeListDto getLikeList(LikeListDto likeListDto) {		
		return sqlSession.selectOne("likeList.getLikeList", likeListDto);
	}
	
	
}
