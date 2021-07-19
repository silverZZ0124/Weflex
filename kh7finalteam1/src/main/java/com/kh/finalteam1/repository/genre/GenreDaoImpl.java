package com.kh.finalteam1.repository.genre;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalteam1.entity.content.GenreDto;

@Repository
public class GenreDaoImpl implements GenreDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(String genreName) {
		sqlSession.insert("genre.insert", genreName);
	}

	@Override
	public List<GenreDto> list() {
		return sqlSession.selectList("genre.list");
	}

	@Override
	public List<GenreDto> get(String genreName) {
		return sqlSession.selectList("genre.search", genreName);
	}

	@Override
	public boolean delete(String genreName) {
		int count = sqlSession.delete("genre.delete", genreName);
		return count>0;
	}

	@Override
	public boolean edit(GenreDto genreDto) {
		int count = sqlSession.update("genre.edit", genreDto);
		return count>0;
	}

}
