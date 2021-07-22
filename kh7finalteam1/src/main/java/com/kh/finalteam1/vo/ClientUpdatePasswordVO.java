package com.kh.finalteam1.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ClientUpdatePasswordVO {
	private int clientNo;
	private String clientPw;
	private String clientNewPw;
}
