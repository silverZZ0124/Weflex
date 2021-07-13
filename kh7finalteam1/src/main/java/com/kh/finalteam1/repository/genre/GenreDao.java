package com.kh.finalteam1.repository.genre;

import java.util.List;

import com.kh.finalteam1.entity.genre.GenreDto;

public interface GenreDao {
	void insert(String genreName);
	List<GenreDto> list();
	List<GenreDto> get(String genreName);
}
