package com.ssafy.happy.corona.service;

import java.util.List;

import com.ssafy.happy.repository.dto.Clinic;
import com.ssafy.happy.repository.dto.Hospital;


public interface ClinicService {
	List<Clinic> search() throws Exception;
}