package com.ssafy.happy.repository.mapper;

import java.util.List;

import com.ssafy.happy.repository.dto.Interest;

public interface InterestMapper {

	public List<Interest> selectAll(String email);

	public void addInterest(Interest interest);

}
