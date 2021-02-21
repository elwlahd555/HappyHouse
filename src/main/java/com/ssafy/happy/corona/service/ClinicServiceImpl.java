package com.ssafy.happy.corona.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.Clinic;
import com.ssafy.happy.repository.mapper.ClinicMapper;

@Service
public class ClinicServiceImpl implements ClinicService {
	
	@Autowired
	private ClinicMapper mapper;

	@Override
	public List<Clinic> search() throws Exception {
		return mapper.selectIboard();
	}
	

}
