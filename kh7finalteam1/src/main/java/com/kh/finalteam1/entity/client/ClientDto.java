package com.kh.finalteam1.entity.client;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClientDto {
	private int clientNo;
	private int gradeNo;
	private String clientId;
	private String clientPw;
	private String clientName;
	private Date clientBirth;
	private String clientPhone;
	private Date clientExpire;
	private Date clientJoin;
}
