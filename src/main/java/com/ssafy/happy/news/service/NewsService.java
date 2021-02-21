package com.ssafy.happy.news.service;

import java.util.List;

import com.ssafy.happy.repository.dto.News;

public interface NewsService {
	String getHeadLine();
	String getModal(String href);
}
