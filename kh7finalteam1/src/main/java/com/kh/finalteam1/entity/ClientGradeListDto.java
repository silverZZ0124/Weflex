package com.kh.finalteam1.entity;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
//client + client_grade inner join(등급명을 가져오기 위함)
public class ClientGradeListDto {
	private int clientNo;
	private int gradeNo;
	private String clientId;
	private String clientPw;
	private String clientName;
	private Date clientBirth;
	private String clientPhone;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date clientExpire, clientJoin;
	
	private String gradeName;
}

