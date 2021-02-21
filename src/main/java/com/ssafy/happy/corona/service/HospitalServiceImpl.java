package com.ssafy.happy.corona.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.Hospital;
import com.ssafy.happy.repository.mapper.HospitalMapper;

@Service
public class HospitalServiceImpl implements HospitalService {

	@Autowired
	private HospitalMapper mapper;

	@Override
	public List<Hospital> search() throws Exception {
		return mapper.selectHospital();
	}

}
