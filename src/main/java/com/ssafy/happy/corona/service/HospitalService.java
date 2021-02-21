package com.ssafy.happy.corona.service;

import java.util.List;

import com.ssafy.happy.repository.dto.Hospital;


public interface HospitalService {
	List<Hospital> search() throws Exception;
	
}