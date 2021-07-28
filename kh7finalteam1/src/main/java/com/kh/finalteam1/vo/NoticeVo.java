package com.kh.finalteam1.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeVo {
	private int noticeNo;
	private int clientNo;
	private String noticeName;
	private String noticeWrite; 
	private Date noticeDate;
	private int noticeViewCount;
	private String clientName;
}
