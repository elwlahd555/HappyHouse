package com.ssafy.happy.policy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happy.policy.service.PolicyService;

@RestController
@RequestMapping("/policy")
public class PolicyController {

	@Autowired
	private PolicyService policyService;
	
	@GetMapping("corona")
	public String getCorona() {
		return policyService.getCorona();
	}
}
