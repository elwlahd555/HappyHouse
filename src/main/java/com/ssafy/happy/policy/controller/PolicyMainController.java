package com.ssafy.happy.policy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/policy")
public class PolicyMainController {
	
	@GetMapping("/policy")
	public void getPolicy() {}
}
