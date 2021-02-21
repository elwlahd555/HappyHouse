package com.ssafy.happy.repository.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssafy.happy.repository.dto.Sector;

@Repository
public interface GwangJinSectorMapper {

	void loadData();

	List<Sector> getSector() throws Exception;

	List<Sector> search(String gugun);

}