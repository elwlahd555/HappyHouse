package com.ssafy.happy.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happy.community.service.InfoBoardService;
import com.ssafy.happy.community.service.QBoardService;
import com.ssafy.happy.repository.dto.InfoBoard;
import com.ssafy.happy.repository.dto.Member;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	private InfoBoardService infoboardService;
	@Autowired
	private QBoardService qboardService;

	@GetMapping("/info")
	public void communityInfo(Model model) {
		try {
			model.addAttribute("list", infoboardService.search());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/tables")
	public void communityTables() {
	}

	@GetMapping("/qa")
	public void communityQa(Model model) {
		try {
			model.addAttribute("list", qboardService.search());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/introduce")
	public void communityIntroduce() {}
	
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int ino = Integer.parseInt(request.getParameter("key"));
//		infoboardService.delete(ino);
//		request.setAttribute("list", infoboardService.search());
		InfoBoard iboard = new InfoBoard();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		iboard.setTitle(title);
		iboard.setContent(content);
		iboard.setIno(ino);
		infoboardService.update(iboard);
		response.sendRedirect("main.do?action=COM_INFO_LIST");
	}
	
	@GetMapping("/detailInfo")
	public String detailInfo(int ino, Model model, HttpSession session) throws Exception {
		
		Member dto=(Member) session.getAttribute("userinfo");
		model.addAttribute("userinfo",dto);
		System.out.println(ino);
		model.addAttribute("titleName", "공지사항");
		model.addAttribute("board", infoboardService.showInfo(ino));
		
		return "/community/detailInfo";

	}
	
	@GetMapping("/moveInfo")
	public void moveInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("titleName", "공지사항");
		request.setAttribute("ActionName", "COM_INFO_INSERT");
		request.getRequestDispatcher("/community/insertPage.jsp").forward(request, response);
	}
	
	@GetMapping("/deleteInfo")
	public String deleteInfo(int ino) throws Exception {
		System.out.println(ino);
		infoboardService.delete(ino);
//		request.setAttribute("list", infoboardService.search());
		return "redirect:info";
	}
	@GetMapping("/insertInfo")
	public void insertInfo() {
		
	}
	
	@PostMapping("/insertInfo")
	public String insertInfo(InfoBoard infoboard,HttpSession session) throws Exception {
		
		Member dto=(Member) session.getAttribute("userinfo");
		
		infoboard.setWriter(dto.getName());
		infoboard.setPosition("관리자");
		infoboardService.add(infoboard);
		return "redirect:info";
	}
	
	@PostMapping("/updateInfo")
	public String updateInfo(InfoBoard infoboard,HttpSession session) throws Exception {

		Member dto=(Member) session.getAttribute("userinfo");

		infoboard.setWriter(dto.getName());
		infoboard.setPosition("관리자");
		infoboardService.update(infoboard);
		return "redirect:info";
	}

}
