package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.client.ClientDto;

public interface LoginDao {
ClientDto regitCheck(String email);
}
