package com.ssafy.happy.model.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssafy.happy.repository.dto.HouseDeal;

public class HouseParser {
	private Map<String, List<HouseDeal>> deals;
	private int size;
	
	public static int no;
	
	public HouseParser() {
		loadData();
	}
	
	private void loadData() {
		APTDealHandler  aptDealHandler = new APTDealHandler();
		aptDealHandler.getHouses();
		List<HouseDeal> aptDeals = aptDealHandler.getHouses();
		
		APTRentHandler  aptRentHandler = new APTRentHandler();
		aptRentHandler.getHouses();
		List<HouseDeal> aptRents = aptRentHandler.getHouses();
		
		BILLADealHandler  billaDealHandler = new BILLADealHandler();
		billaDealHandler.getHouses();
		List<HouseDeal> billaDeals = billaDealHandler.getHouses();
		
		BILLARentHandler  billaRentHandler = new BILLARentHandler();
		billaRentHandler.getHouses();
		List<HouseDeal> billaRents = billaRentHandler.getHouses();
		
		size = aptDeals.size()+aptRents.size()+billaDeals.size()+billaRents.size();
		System.out.println("--------------");
		System.out.println(aptDeals.size());
		System.out.println(aptRents.size());
		System.out.println(billaDeals.size());
		System.out.println(billaRents.size());
		System.out.println("--------------");
		deals = new HashMap<String, List<HouseDeal>>();
		
		deals.put(HouseDeal.APT_DEAL, aptDeals);
		deals.put(HouseDeal.APT_RENT, aptRents);
		deals.put(HouseDeal.HOUSE_DEAL, billaDeals);
		deals.put(HouseDeal.HOUSE_RENT, billaRents);
	}

	public Map<String, List<HouseDeal>> getDeals() {
		return deals;
	}

	public void setDeals(Map<String, List<HouseDeal>> deals) {
		this.deals = deals;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
	
	
}
