package com.ssafy.happy.corona.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happy.corona.service.ClinicService;
import com.ssafy.happy.corona.service.HospitalService;

@Controller
@RequestMapping("/corona")
public class Corona_ClinicController {

	@Autowired
	private ClinicService clinicService;

	@Autowired
	private HospitalService hospitalService;
	
	@GetMapping("/clinic")
	public void coronaClinic(Model model) {
		try {
			model.addAttribute("list", clinicService.search());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/hospital")
	public void coronaList(Model model) {
		try {
			model.addAttribute("list", hospitalService.search());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
