package com.ssafy.happy.sector.service;

import java.util.List;

import com.ssafy.happy.repository.dto.Sector;
import com.ssafy.happy.repository.dto.SidoGugunDong;

public interface GwangJinSectorService {

	List<Sector> searchAll() throws Exception;

	List<Sector> serch(String gugun);

}