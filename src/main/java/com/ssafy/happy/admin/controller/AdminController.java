package com.ssafy.happy.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happy.admin.service.AdminService;
import com.ssafy.happy.repository.dto.Realtime;

@RestController
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/all-views")
	public List<Integer> getAllViews(String month) {
		return adminService.getAllViews(month);
	}
	@GetMapping("/realtime-search")
	public List<Realtime> getRealtime() { 
		return adminService.getRealtime();
	}
}
