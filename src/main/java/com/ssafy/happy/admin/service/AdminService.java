package com.ssafy.happy.admin.service;

import java.util.List;

import com.ssafy.happy.repository.dto.Realtime;


public interface AdminService {
	List<Integer> getAllViews(String month);
	List<Realtime> getRealtime();
}
