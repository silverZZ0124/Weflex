package com.kh.finalteam1.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.QnaBoardDto;



@Repository
public class QnaBoardDaoImpl implements QnaBoardDao {
	@Autowired private SqlSession sqlSession;
	
	@Override
	public void insertQnaBoard(QnaBoardDto qnaBoardDto) {
		sqlSession.insert("qnaBoard.insertQna", qnaBoardDto);
	}

	@Override
	public QnaBoardDto findQna(int qnaBoardNo) {
		
		return sqlSession.selectOne("qnaBoard.findQna",qnaBoardNo);
	}

}
