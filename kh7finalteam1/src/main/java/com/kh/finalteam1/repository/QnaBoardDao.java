package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.qna.QnaBoardDto;

public interface QnaBoardDao {
	void insertQnaBoard(QnaBoardDto qnaBoardDto);
	QnaBoardDto findQna(int qnaBoardNo);
}
