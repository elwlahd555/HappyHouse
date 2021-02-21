package com.ssafy.happy.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.SidoGugunDong;
import com.ssafy.happy.repository.mapper.SidoGugunDongMapper;

@Service
public class GugunServiceImpl implements GugunService{
	
	@Autowired
	SidoGugunDongMapper mapper;
	
	@Override
	public List<SidoGugunDong> getGugun(String sido) throws Exception {
		return mapper.getGugunInSido(sido);
	}
}
