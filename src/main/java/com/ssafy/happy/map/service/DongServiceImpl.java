package com.ssafy.happy.map.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.HouseDeal;
import com.ssafy.happy.repository.dto.SidoGugunDong;
import com.ssafy.happy.repository.mapper.SidoGugunDongMapper;

@Service
public class DongServiceImpl implements DongService{
	
	@Autowired
	SidoGugunDongMapper mapper;

	@Override
	public List<SidoGugunDong> getDongInGugun(String gugun) throws Exception {
		return mapper.getDongInGugun(gugun);
		
	}

	@Override
	public List<HouseDeal> getHouse(String dong) {
		return mapper.getHouse(dong);
	}
}
