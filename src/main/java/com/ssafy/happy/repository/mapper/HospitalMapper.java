package com.ssafy.happy.repository.mapper;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssafy.happy.repository.dto.Hospital;


@Repository
public interface HospitalMapper {
	public List<Hospital> selectHospital() throws Exception;
}
