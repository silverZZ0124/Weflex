package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.GenreDto;

public interface GenreDao {
	void insert(String genreName);
	List<GenreDto> list();
	List<GenreDto> get(String genreName);
	boolean delete(String genreName);
	boolean edit(GenreDto genreDto);
	
	//tv프로그램 검색용
	List<GenreDto> tvGenreList();
	//영화 검색용
	List<GenreDto> movieGenreList();
}
