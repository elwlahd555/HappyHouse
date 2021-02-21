package com.ssafy.happy.apart.service;

import java.util.List;

import com.ssafy.happy.repository.dto.HouseDeal;

public interface HouseService {

	List<HouseDeal> selectHouse(String dong) throws Exception;
	List<HouseDeal> selectHouse() throws Exception;

}