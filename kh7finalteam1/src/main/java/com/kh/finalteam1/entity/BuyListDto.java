package com.kh.finalteam1.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BuyListDto {
	private int buyNo;
	private int clientNo;
	private Date buyPaymentDate;
	private int buyPaymentPrice;
}
