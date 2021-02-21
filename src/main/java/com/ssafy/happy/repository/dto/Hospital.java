package com.ssafy.happy.repository.dto;

public class Hospital {
	private int hospitalid;
	private String sido;
	private String gugun;
	private String hospitalname;
	private String hospitaladdress;
	private String apply;
	private String hospitaltel;
	public int getHospitalid() {
		return hospitalid;
	}
	public void setHospitalid(int hospitalid) {
		this.hospitalid = hospitalid;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getHospitalname() {
		return hospitalname;
	}
	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}
	public String getHospitaladdress() {
		return hospitaladdress;
	}
	public void setHospitaladdress(String hospitaladdress) {
		this.hospitaladdress = hospitaladdress;
	}
	public String getApply() {
		return apply;
	}
	public void setApply(String apply) {
		this.apply = apply;
	}
	public String getHospitaltel() {
		return hospitaltel;
	}
	public void setHospitaltel(String hospitaltel) {
		this.hospitaltel = hospitaltel;
	}
	
	@Override
	public String toString() {
		return "HospitalDTO [hospitalid=" + hospitalid + ", sido=" + sido + ", gugun=" + gugun + ", hospitalname="
				+ hospitalname + ", hospitaladdress=" + hospitaladdress + ", apply=" + apply + ", hospitaltel="
				+ hospitaltel + "]";
	}
	
	
	
}
