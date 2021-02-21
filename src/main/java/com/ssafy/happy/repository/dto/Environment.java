package com.ssafy.happy.repository.dto;

public class Environment {
	private String licenseno;
	private String company;
	private String sectorscode;
	private String sectorsname;
	private String checkdate;
	private char Disposaltarget;
	private String checklisting;
	private String checkresult;
	private String address;
	public String getLicenseno() {
		return licenseno;
	}
	public void setLicenseno(String licenseno) {
		this.licenseno = licenseno;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getSectorscode() {
		return sectorscode;
	}
	public void setSectorscode(String sectorscode) {
		this.sectorscode = sectorscode;
	}
	public String getSectorsname() {
		return sectorsname;
	}
	public void setSectorsname(String sectorsname) {
		this.sectorsname = sectorsname;
	}
	public String getCheckdate() {
		return checkdate;
	}
	public void setCheckdate(String checkdate) {
		this.checkdate = checkdate;
	}
	public char getDisposaltarget() {
		return Disposaltarget;
	}
	public void setDisposaltarget(char disposaltarget) {
		Disposaltarget = disposaltarget;
	}
	public String getChecklisting() {
		return checklisting;
	}
	public void setChecklisting(String checklisting) {
		this.checklisting = checklisting;
	}
	public String getCheckresult() {
		return checkresult;
	}
	public void setCheckresult(String checkresult) {
		this.checkresult = checkresult;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "EnvironmentDTO [licenseno=" + licenseno + ", company=" + company + ", sectorscode=" + sectorscode
				+ ", sectorsname=" + sectorsname + ", checkdate=" + checkdate + ", Disposaltarget=" + Disposaltarget
				+ ", checklisting=" + checklisting + ", checkresult=" + checkresult + ", address=" + address + "]";
	}
	
	
	

}
