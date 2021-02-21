package com.ssafy.happy.news.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happy.news.service.NewsService;

@RestController
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	@GetMapping("/headline")
	public String getHeadLine() {
		return newsService.getHeadLine();
	}
	
	@GetMapping("/modal")
	public String getModal(String href) {
		System.out.println("href in controller : " + href);
		return newsService.getModal(href);
	}
	
}
