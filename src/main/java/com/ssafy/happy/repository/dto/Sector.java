package com.ssafy.happy.repository.dto;

public class Sector {
	private String sectionno;
	private String sectionname;
	private String branchname;
	private String maincategory;
	private String subcategory;
	private String sidocode;
	private String guguncode;
	private String dongcode;
	private String address;
	private String lon;
	private String lat;
	public String getSectionno() {
		return sectionno;
	}
	public void setSectionno(String sectionno) {
		this.sectionno = sectionno;
	}
	public String getSectionname() {
		return sectionname;
	}
	public void setSectionname(String sectionname) {
		this.sectionname = sectionname;
	}
	public String getBranchname() {
		return branchname;
	}
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}
	public String getMaincategory() {
		return maincategory;
	}
	public void setMaincategory(String maincategory) {
		this.maincategory = maincategory;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getSidocode() {
		return sidocode;
	}
	public void setSidocode(String sidocode) {
		this.sidocode = sidocode;
	}
	public String getGuguncode() {
		return guguncode;
	}
	public void setGuguncode(String guguncode) {
		this.guguncode = guguncode;
	}
	public String getDongcode() {
		return dongcode;
	}
	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	@Override
	public String toString() {
		return "SectorDTO [sectionno=" + sectionno + ", sectionname=" + sectionname + ", branchname=" + branchname
				+ ", maincategory=" + maincategory + ", subcategory=" + subcategory + ", sidocode=" + sidocode
				+ ", guguncode=" + guguncode + ", dongcode=" + dongcode + ", address=" + address + ", lon=" + lon
				+ ", lat=" + lat + "]";
	}

	
}
