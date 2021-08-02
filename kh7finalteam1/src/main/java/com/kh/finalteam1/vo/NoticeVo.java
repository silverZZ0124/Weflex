package com.kh.finalteam1.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date noticeDate;
	private int noticeViewCount;
	private String clientName;
}
