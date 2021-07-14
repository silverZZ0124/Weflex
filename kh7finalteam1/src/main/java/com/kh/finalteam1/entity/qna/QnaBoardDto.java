package com.kh.finalteam1.entity.qna;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class QnaBoardDto {
	private int qnaBoardNo;
	private int categoryNo;
	private String qnaBoardTitle;
	private String qnaBoardContent;
}
