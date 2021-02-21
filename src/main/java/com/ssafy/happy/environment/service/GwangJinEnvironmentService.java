package com.ssafy.happy.environment.service;

import java.util.List;

import com.ssafy.happy.repository.dto.Environment;
import com.ssafy.happy.repository.dto.SidoGugunDong;

public interface GwangJinEnvironmentService {

	List<Environment> searchAll() throws Exception;

 
}