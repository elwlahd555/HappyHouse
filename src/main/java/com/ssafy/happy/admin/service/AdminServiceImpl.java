package com.ssafy.happy.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.Realtime;
import com.ssafy.happy.repository.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;

	@Override
	public List<Integer> getAllViews(String month) {
		try {
			return adminMapper.getAllViews(Integer.parseInt(month));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Realtime> getRealtime() {
		try {
			return adminMapper.getRealtime();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
