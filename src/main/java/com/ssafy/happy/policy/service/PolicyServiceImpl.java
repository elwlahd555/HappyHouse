package com.ssafy.happy.policy.service;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class PolicyServiceImpl implements PolicyService {

	@Override
	public String getCorona() {
		String URL = "http://ncov.mohw.go.kr/supportPolicyBoardList.do";
		String BASE_URL = "http://ncov.mohw.go.kr/";
		Document doc = null;
		try {
			doc = Jsoup.connect(URL).get();
			Elements els = doc.getElementsByTag("a");
			for(Element el : els) {
				if(!el.attr("href").startsWith("http")) {
					System.out.println("http 없다 : " + el.toString());
					String elString = BASE_URL + el.attr("href");
					el.attr("href", elString);
					System.out.println("http 추가 : " + el.toString());
				}
			}
			return doc.toString();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
