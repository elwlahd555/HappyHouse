package com.ssafy.happy.repository.mapper;

import java.util.List;

import com.ssafy.happy.repository.dto.HouseDeal;
import com.ssafy.happy.repository.dto.SidoGugunDong;

public interface SidoGugunDongMapper {

	List<SidoGugunDong> getSido() throws Exception;

	List<SidoGugunDong> getGugunInSido(String sido) throws Exception;

	List<SidoGugunDong> getDongInGugun(String gugun) throws Exception;

	List<HouseDeal> getHouse(String dong);

}