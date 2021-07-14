package com.kh.finalteam1.entity.client;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClientGradeDto {
	private int gradeNo;
	private String gradeName;
}
