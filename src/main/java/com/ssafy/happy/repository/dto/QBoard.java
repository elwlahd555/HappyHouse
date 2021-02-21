package com.ssafy.happy.repository.dto;

public class QBoard {
	int qno;
	String title;
	String content;
	String writer;
	int viewcnt;
	String wday;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getWday() {
		return wday;
	}
	public void setWday(String wday) {
		this.wday = wday;
	}
	@Override
	public String toString() {
		return "qboard [qno=" + qno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", viewcnt="
				+ viewcnt + ", wday=" + wday + "]";
	}
	
	
}
