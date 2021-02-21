package com.ssafy.happy.repository.dto;

public class InfoBoard {
	int ino;
	String title;
	String content;
	String writer;
	String position;
	int viewcnt;
	String wday;
	
	
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
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
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
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
		return "InfoBoardDTO [qno=" + ino + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", position=" + position + ", viewcnt=" + viewcnt + ", wday=" + wday + "]";
	}
	
}
