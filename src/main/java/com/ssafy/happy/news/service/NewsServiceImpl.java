package com.ssafy.happy.news.service;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl implements NewsService {

	@Override
	public String getHeadLine() {

		String URL = "https://news.naver.com/";
		Document doc = null;
		try {
			doc = Jsoup.connect(URL).get();
			Element e = doc.getElementById("main_content");
			Elements els = e.getElementsByTag("a");
			for (Element el : els) {
				System.out.println("el : " + el);
				if (!el.attr("href").startsWith("http")) {
					String elString = URL + el.attr("href");
					System.out.println("elString : " + elString);
					el.attr("href", elString);
				}
			}
			return e.toString();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String getModal(String href) {
		Document doc = null;
		try {
			System.out.println("href : " + href);
			doc = Jsoup.connect(href).get();
			return doc.toString();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
