package com.ssafy.happy.login.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.Member;
import com.ssafy.happy.repository.mapper.LoginMapper;


@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginMapper mapper;

	@Override
	public Member login(Map<String, String> map) throws Exception {
		
		if(map.get("email") == null || map.get("password") == null)
			return null;
		return mapper.selectLogin(map);
	}
}
