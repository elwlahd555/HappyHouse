package com.ssafy.happy.repository.mapper;

import java.util.List;

import com.ssafy.happy.repository.dto.Environment;

public interface EnvironmentMapper {

	void loadData();

	List<Environment> getEnvironment() throws Exception; 


}