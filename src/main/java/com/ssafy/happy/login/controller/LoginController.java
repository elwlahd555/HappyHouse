package com.ssafy.happy.login.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happy.interest.service.InterestService;
import com.ssafy.happy.login.service.LoginService;
import com.ssafy.happy.member.service.MemberService;
import com.ssafy.happy.repository.dto.Interest;
import com.ssafy.happy.repository.dto.Member;


@Controller
@RequestMapping("/login")
public class LoginController{
	
	@Autowired
	private LoginService loginService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private InterestService interestService;
	
	@GetMapping("/login")
	public void login(Model model) {
		model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
	}
	
	@GetMapping("/mypage")
	public void mypage(HttpSession session, Model model) throws Exception {
		System.out.println("마이페이지호출");
		Member dto=(Member) session.getAttribute("userinfo");
		model.addAttribute("member",memberService.searchByEmail(dto.getEmail()));
		
		
	}
	
	@GetMapping("/interest")
	public void interest(Model model,HttpSession session) throws Exception {
		Member dto=(Member)session.getAttribute("userinfo");
		System.out.println(dto.getEmail());
		
		 System.out.println(interestService.selectAll(dto.getEmail()).toString());
		 model.addAttribute("interests",interestService.selectAll(dto.getEmail()));
		 
	}
	@PostMapping("/addInterest")
	public String addInterest(Model model,HttpSession session, Interest interest) throws Exception {
		Member dto=(Member)session.getAttribute("userinfo");
		System.out.println(dto.getEmail());
		interest.setEmail(dto.getEmail());
		interestService.addInterest(interest);
		
		return"redirect:houseTransaction";
	}
	
	
	@PostMapping("/login")
	public String service(@RequestParam Map<String, String> map, HttpSession session, HttpServletResponse response, Model model) throws Exception {


		try {
			Member member = loginService.login(map);
			if(member != null) {
				session.setAttribute("userinfo", member);
				System.out.println(member.getEmail());
				Cookie cookie = new Cookie("ssafy_id", member.getEmail());
				cookie.setPath("/");
				if("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);//40년간 저장.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
				
			} else {
				return "redirect:login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "redirect:/main";
		
	}
	
	
	
	
	@PostMapping("/update")
	public String update(Member member,HttpSession session) throws Exception {
		// TODO Auto-generated method stub
			memberService.updateMember(member);
			session.setAttribute("userinfo", member);
		
		return "redirect:/main";
	}
	
	@PostMapping("/join")
	public String join(Member member) throws ServletException, IOException {

		try {
			memberService.join(member);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		return "redirect:logout";
	}
	
	@GetMapping("/join")
	public String join() throws Exception {
		return "/login/register";
	}
	
	@GetMapping("/findpass")
	public String findpass() throws Exception {
		return "/login/password";
	}
	@GetMapping("/password")
	public void password(Model model) throws Exception {
		model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
	}
	
	
	@PostMapping("/resetpass")
	public String resetpass(String email, Model model,HttpSession session){
		// TODO Auto-generated method stub
		
		System.out.println(email+"컨트롤러");
		
			Member member = memberService.searchByEmail(email);
			if(member==null) {

				return "redirect:password";
			}
			// 로그인 성공시 
			else if (member.getEmail().equals(email)) {
				member.setPassword("0000");
				session.setAttribute("member", member);
				memberService.update(member);
				return "redirect:resetResult";
			}
			else {
				return "redirect:password";
			}
	
		
		
	}
	
	@GetMapping("resetResult")
	public void resetResult() {
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "login/login";

	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session) throws Exception {

		Member dto=(Member) session.getAttribute("userinfo");
		memberService.delete(dto.getEmail());
		session.invalidate();
		return "login/login";

	}
}
