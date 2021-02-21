package com.ssafy.happy.community.service;

import java.util.List;

import com.ssafy.happy.repository.dto.InfoBoard;

public interface InfoBoardService {
	public List<InfoBoard> search() throws Exception;
	public void delete(int ino) throws Exception;
	public InfoBoard showInfo(int ino) throws Exception;
	public void update(InfoBoard iboard) throws Exception;
	public void add(InfoBoard iboard) throws Exception;
}