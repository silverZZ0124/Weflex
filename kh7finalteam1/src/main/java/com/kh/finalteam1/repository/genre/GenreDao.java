package com.kh.finalteam1.repository.genre;

import java.util.List;

import com.kh.finalteam1.entity.content.GenreDto;

public interface GenreDao {
	void insert(String genreName);
	List<GenreDto> list();
	List<GenreDto> get(String genreName);
	boolean delete(String genreName);
	boolean edit(GenreDto genreDto);
}
