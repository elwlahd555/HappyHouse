package com.ssafy.happy.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.InfoBoard;
import com.ssafy.happy.repository.mapper.InfoBoardMapper;

@Service
public class InfoBoardServiceImpl implements InfoBoardService {
	
	@Autowired
	private InfoBoardMapper mapper;
	
	public List<InfoBoard> search() throws Exception{
		return mapper.selectIboard();
	}

	@Override
	public void delete(int ino) throws Exception {
		mapper.deleteIboardByIno(ino);
	}

	@Override
	public InfoBoard showInfo(int ino) throws Exception {
		return mapper.selectIboardByIno(ino);
	}

	@Override
	public void update(InfoBoard iboard) throws Exception {
		mapper.updateIBoard(iboard);
	}

	@Override
	public void add(InfoBoard iboard) throws Exception {
		mapper.InsertIBoard(iboard);
		
	}
}
