package com.ssafy.happy.repository.dto;

import java.sql.Timestamp;

public class Views {
	private int viewNo;
	private int memberno;
	private Timestamp regdate;

	protected int getViewNo() {
		return viewNo;
	}

	protected void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}

	protected int getMemberno() {
		return memberno;
	}

	protected void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	protected Timestamp getRegdate() {
		return regdate;
	}

	protected void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
