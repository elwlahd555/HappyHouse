package com.ssafy.happy.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happy.environment.service.GwangJinEnvironmentService;
import com.ssafy.happy.map.service.DongService;
import com.ssafy.happy.map.service.GugunService;
import com.ssafy.happy.map.service.SidoService;
import com.ssafy.happy.repository.dto.Environment;
import com.ssafy.happy.repository.dto.HouseDeal;
import com.ssafy.happy.repository.dto.Sector;
import com.ssafy.happy.repository.dto.SidoGugunDong;
import com.ssafy.happy.sector.service.GwangJinSectorService;

@RestController
@RequestMapping("/map")
public class MAP_DongController {

	@Autowired
	DongService dongService;
	@Autowired
	SidoService sidoService;
	@Autowired
	GugunService gugunService;
	@Autowired
	GwangJinSectorService gwangJinSectorService;
	@Autowired
	GwangJinEnvironmentService gwangJinEnvironmentService;

	@GetMapping("/dong")
	public List<SidoGugunDong> mapDong(String gugun) {
		try {
			System.out.println("ㅎㅇㅎㅇ3");
			System.out.println("data size : " + dongService.getDongInGugun(gugun).size());
			System.out.println("data size : " + dongService.getDongInGugun(gugun).get(0).getDongName());
			
			return dongService.getDongInGugun(gugun);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@GetMapping("/house")
	public List<HouseDeal> mapHouse(String dong, Model model) {
		try {
			if(dongService.getHouse(dong).size()>0) {
				System.out.println("ㅎㅇㅎㅇ4");
				System.out.println("data size : " + dongService.getHouse(dong).size());
				System.out.println("data size : " + dongService.getHouse(dong).get(0).getAptName());
				
				
			}
			else {
				System.out.println("데이터 없음");
				model.addAttribute("msg","거래내역이 없습니다.");
				
			}
			return dongService.getHouse(dong);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@GetMapping("/market")
	public List<Sector> mapMarket(String gugun, Model model) {
		try {
			if(gwangJinSectorService.serch(gugun).size()>0) {
				System.out.println("ㅎㅇㅎㅇ5");
				System.out.println("data size : " + gwangJinSectorService.serch(gugun).size());
				System.out.println("data size : " + gwangJinSectorService.serch(gugun).get(0).getAddress());
				
				
			}
			else {
				System.out.println("데이터 없음");
				model.addAttribute("msg","거래내역이 없습니다.");
				
			}
			return gwangJinSectorService.serch(gugun);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@GetMapping("/airpull")
	public List<Environment> mapAirpull(Model model) {
		try {
			if(gwangJinEnvironmentService.searchAll().size()>0) {
				System.out.println("ㅎㅇㅎㅇ6");
				System.out.println("data size : " + gwangJinEnvironmentService.searchAll().size());
				System.out.println("data size : " + gwangJinEnvironmentService.searchAll().get(0).getAddress());
				
				
			}
			else {
				System.out.println("데이터 없음");
				model.addAttribute("msg","거래내역이 없습니다.");
				
			}
			return gwangJinEnvironmentService.searchAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping("/sido")
	public List<SidoGugunDong> mapSido() {
		try {
			System.out.println("ㅎㅇㅎㅇ");
			System.out.println("data size : " + sidoService.getSido().size());
			return sidoService.getSido();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping("/gugun")
	public List<SidoGugunDong> mapGugun(String sido) {
		try {
			System.out.println("ㅎㅇㅎㅇ2");
			System.out.println("data size : " + gugunService.getGugun(sido).size());
			return gugunService.getGugun(sido);
		} catch (Exception e) {
		}
		return null;
	}
}
