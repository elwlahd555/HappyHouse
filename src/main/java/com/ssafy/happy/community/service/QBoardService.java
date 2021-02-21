package com.ssafy.happy.community.service;

import java.util.List;

import com.ssafy.happy.repository.dto.QBoard;

public interface QBoardService {
	public List<QBoard> search() throws Exception;
}