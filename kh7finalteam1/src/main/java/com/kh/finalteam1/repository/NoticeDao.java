package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.NoticeDto;
import com.kh.finalteam1.vo.NoticeVo;

public interface NoticeDao {
	List<NoticeVo> noticeList();
	
	NoticeVo noticeDetail(int noticeNo);
	
	boolean noticeDelete(int noticeNo);
	
	NoticeVo noticeGet(int noticeNo);
	
	void noticeInsert(NoticeDto noticeDto);
}
