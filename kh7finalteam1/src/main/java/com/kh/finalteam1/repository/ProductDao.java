package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.ProductDto;

public interface ProductDao {
	List<ProductDto> list();
	ProductDto get(int no);
}
