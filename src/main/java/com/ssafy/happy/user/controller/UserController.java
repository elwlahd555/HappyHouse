package com.ssafy.happy.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happy.member.service.MemberService;
import com.ssafy.happy.repository.dto.Member;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/userInfo")
	public void userInfo(Model model) throws Exception {
		model.addAttribute("list",memberService.search());
		
		
	}
	
	@GetMapping("/userDetail")
	public void userDetail(Model model, String email) throws Exception {
		
		model.addAttribute("member",memberService.searchByEmail(email));
		
	}
	
	@GetMapping("/userInsert")
	public void userInsert() throws Exception {
	}

	@PostMapping("/userUpdate")
	public String userUpdate(Member member) throws Exception {
	System.out.println(member.getAddress());
		memberService.updateByEmail(member);
		
		return "redirect:userInfo";
	}
	
	@GetMapping("/userDelete")
	   public String service(String email) throws Exception {
		      // TODO Auto-generated method stub
		
		System.out.println(email);

		         memberService.delete(email);


		         return "redirect:userInfo";
		   }
	
	@PostMapping("/interestPlace")
	public void interestPlace() throws Exception {
		
	}
	
}
