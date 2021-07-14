package com.kh.finalteam1.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @Builder @AllArgsConstructor
public class LoginDto {
private int client_No;
private String client_Id;
private String client_Pw;
private String client_Name;
private String client_Birth;
private String client_Phone;
private String client_expire;
}
