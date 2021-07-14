package com.kh.finalteam1.entity.log;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class LikeListDto {
	private int clientNo;
	private int contentNo;
}
