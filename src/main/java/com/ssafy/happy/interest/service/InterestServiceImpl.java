package com.ssafy.happy.interest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.Interest;
import com.ssafy.happy.repository.mapper.InterestMapper;

@Service
public class InterestServiceImpl implements InterestService{

	@Autowired
	private InterestMapper mapper;

	@Override
	public List<Interest> selectAll(String email) {
		// TODO Auto-generated method stub
		return mapper.selectAll(email);
	}

	@Override
	public void addInterest(Interest interest) {
		// TODO Auto-generated method stub
		mapper.addInterest(interest);
	}
}
