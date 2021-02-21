package com.ssafy.happy.map.service;

import java.util.List;

import com.ssafy.happy.repository.dto.HouseDeal;
import com.ssafy.happy.repository.dto.SidoGugunDong;

public interface DongService {

	List<SidoGugunDong> getDongInGugun(String gugun) throws Exception;

	List<HouseDeal> getHouse(String dong);

}