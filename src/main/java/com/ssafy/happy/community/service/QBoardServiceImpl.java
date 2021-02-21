package com.ssafy.happy.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.QBoard;
import com.ssafy.happy.repository.mapper.QBoardMapper;

@Service
public class QBoardServiceImpl implements QBoardService {
	
	@Autowired
	private QBoardMapper mapper;
	
	public List<QBoard> search() throws Exception{
		return mapper.selectQboard();
	}
}
