package com.ssafy.happy.environment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.Environment;
import com.ssafy.happy.repository.mapper.EnvironmentMapper;

@Service
public class GwangJinEnvironmentServiceImpl implements GwangJinEnvironmentService {
	
	
	@Autowired
	private EnvironmentMapper mapper;

	@Override
	public List<Environment> searchAll() throws Exception{
		return mapper.getEnvironment();
	}

}
