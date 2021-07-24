package com.kh.finalteam1.service;

import java.util.List;

public interface MainModalService {
	List<String> getGenre(int contentNo);
	List<String> getFeature(int contentNo);
	List<String> getCast(int contentNo);
}
