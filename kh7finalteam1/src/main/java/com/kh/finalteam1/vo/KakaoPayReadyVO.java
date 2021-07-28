package com.kh.finalteam1.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class KakaoPayReadyVO {
	private String tid;
	private String next_redirect_pc_url;
	private String created_at;
	
	private String partner_order_id;
	private String partner_user_id;
}
