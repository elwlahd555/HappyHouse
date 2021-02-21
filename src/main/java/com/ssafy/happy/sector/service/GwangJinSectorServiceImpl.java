package com.ssafy.happy.sector.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.Sector;
import com.ssafy.happy.repository.dto.SidoGugunDong;
import com.ssafy.happy.repository.mapper.GwangJinSectorMapper;

@Service
public class GwangJinSectorServiceImpl implements GwangJinSectorService {
	
	@Autowired
	private GwangJinSectorMapper mapper;

	@Override
	public List<Sector> searchAll() throws Exception{
		return mapper.getSector();
	}

	@Override
	public List<Sector> serch(String gugun) {
		// TODO Auto-generated method stub
		return mapper.search(gugun);
	}
}
