package com.ssafy.happy.news.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/news")
public class NewsMainController {
	
	@GetMapping("/news")
	public void getNews() {}
}
