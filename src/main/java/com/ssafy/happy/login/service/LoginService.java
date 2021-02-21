package com.ssafy.happy.login.service;

import java.util.Map;

import com.ssafy.happy.repository.dto.Member;

public interface LoginService {

	Member login(Map<String, String> map) throws Exception;

}