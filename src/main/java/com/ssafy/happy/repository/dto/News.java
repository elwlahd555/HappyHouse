package com.ssafy.happy.repository.dto;

public class News {
	private String link;
	private String content;

	protected String getLink() {
		return link;
	}

	protected void setLink(String link) {
		this.link = link;
	}

	protected String getContent() {
		return content;
	}

	protected void setContent(String content) {
		this.content = content;
	}

}
