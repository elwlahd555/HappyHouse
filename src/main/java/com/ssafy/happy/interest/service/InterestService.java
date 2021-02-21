package com.ssafy.happy.interest.service;

import java.util.List;

import com.ssafy.happy.repository.dto.Interest;

public interface InterestService {

	List<Interest> selectAll(String email);

	void addInterest(Interest interest);

}
