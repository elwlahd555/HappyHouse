package com.ssafy.happy.repository.dto;

public class Realtime {
	private String dong;
	private String count;

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "{dong:" + dong + ", count:" + count + "}";
	}

}
