package com.ssafy.happy.repository.mapper;

import java.util.List;

import com.ssafy.happy.repository.dto.HouseDeal;

public interface HouseMapper {

	/**
		 * 아파트 정보와 아파트 거래 정보를  xml String에서 읽어온다.
		 */
	//	public void loadData() {
	//		HouseParser parser = new HouseParser();
	//		deals = parser.getDeals();
	//		size = parser.getSize();
	//		search = new ArrayList<HouseDealDTO>(size);
	//	}

	List<HouseDeal> getAptDeal(String dong) throws Exception;
	List<HouseDeal> AptDeal() throws Exception;

}