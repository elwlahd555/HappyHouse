package com.ssafy.happy.apart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happy.apart.service.HouseService;
import com.ssafy.happy.environment.service.GwangJinEnvironmentService;
import com.ssafy.happy.sector.service.GwangJinSectorService;

@Controller
@RequestMapping("/apart")
public class ApartController {

	@Autowired
	private GwangJinSectorService gwangJinSectorService;
	@Autowired
	private HouseService houseService;

	@Autowired
	private GwangJinEnvironmentService gwangJinEnvironmentService;

	@GetMapping("/houseTransaction")
	public void apartHouseTransaction(Model model) throws Exception {
		model.addAttribute("houses",houseService.selectHouse());
	}

	@GetMapping("sector")
	public void apartSector(Model model) {
		try {
			model.addAttribute("sectors", gwangJinSectorService.searchAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/airpull")
	public void apartAirpull(Model model) {
		try {
			model.addAttribute("environments", gwangJinEnvironmentService.searchAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}