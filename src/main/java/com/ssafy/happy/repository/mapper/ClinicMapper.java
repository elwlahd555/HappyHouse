package com.ssafy.happy.repository.mapper;
import java.util.List;

import com.ssafy.happy.repository.dto.Clinic;


public interface ClinicMapper {
	public List<Clinic> selectIboard() throws Exception;
}
