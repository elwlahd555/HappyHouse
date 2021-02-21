package com.ssafy.happy.repository.mapper;

import java.util.Map;

import com.ssafy.happy.repository.dto.Member;

public interface LoginMapper {

	Member selectLogin(Map<String, String> map);

}