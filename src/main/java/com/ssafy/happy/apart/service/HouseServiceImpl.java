package com.ssafy.happy.apart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.HouseDeal;
import com.ssafy.happy.repository.mapper.HouseMapper;

@Service
public class HouseServiceImpl implements HouseService{
	
	@Autowired
	private HouseMapper mapper;
	
	@Override
	public List<HouseDeal> selectHouse(String dong) throws Exception {
		List<HouseDeal> list = mapper.getAptDeal(dong);
		return list;
	}

	@Override
	public List<HouseDeal> selectHouse() throws Exception {
		// TODO Auto-generated method stub
		List<HouseDeal> list = mapper.AptDeal();
		return list;
	}
	
}
