package com.ssafy.happy.model.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
//import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.ssafy.happy.repository.dto.HouseDeal;


public class BILLADealHandler {

	private List<HouseDeal> houses = new ArrayList<>();
	private HouseDeal house;

	public BILLADealHandler() {
		BufferedReader br = null;

		try {
			String str = "http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcRHTrade?LAWD_CD=11110&DEAL_YMD=201512&serviceKey=ng%2B9adJCQm9rvqGUApsSL7DJT381Sa2GRmyTllx5%2F90Fqq5IXrU46RQIFm%2BMpo0bdzaI%2BJDJP58Hq1U3%2FV3Omg%3D%3D";
			URL url = new URL(str);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
			StringBuilder result = new StringBuilder();
			String line;
			while ((line = br.readLine()) != null) {
				result.append(line).append("\n");
				result.append("\n");
			}
			System.out.println(result.toString());
			System.out.println("----------------");

			DocumentBuilderFactory dbFactory = null;
			DocumentBuilder docBuilder = null;
			Document doc = null;
			NodeList nodes = null;
//			Node node = null;
			Element element = null;
			InputSource is = new InputSource();

			dbFactory = DocumentBuilderFactory.newInstance();
			docBuilder = dbFactory.newDocumentBuilder();
			is = new InputSource();
			is.setCharacterStream(new StringReader(result.toString()));
			doc = docBuilder.parse(is);
			nodes = doc.getElementsByTagName("item");
			System.out.println(nodes.getLength());
			for (int i = 0, t_len = nodes.getLength(); i < t_len; i++) {
				element = (Element) nodes.item(i);
				house = new HouseDeal(HouseParser.no++);
				house.setType(HouseDeal.APT_DEAL);

				try {
					house.setCode(Integer.parseInt(getTagValue("지역코드", element)));
					house.setAptName(getTagValue("아파트", element));
					house.setDong(getTagValue("법정동", element));
					house.setDealAmount(getTagValue("거래금액", element));
					house.setBuildYear(Integer.parseInt(getTagValue("건축년도", element)));
					house.setDealYear(Integer.parseInt(getTagValue("년", element)));
					house.setDealMonth(Integer.parseInt(getTagValue("월", element)));
					house.setDealDay(Integer.parseInt(getTagValue("일", element)));
					house.setArea(Double.parseDouble(getTagValue("전용면적", element)));
					house.setJibun(getTagValue("지번", element));
					if(getTagValue("층", element)!=null && !getTagValue("층", element).equals(""))
						house.setFloor(Integer.parseInt(getTagValue("층", element)));


					houses.add(house);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<HouseDeal> getHouses() {

		return houses;
	}

	private String getTagValue(String sTag, Element element) {
		try {
			String result = element.getElementsByTagName(sTag).item(0).getTextContent();
			return result;
		} catch (NullPointerException e) {
			return "";
		} catch (Exception e) {
			return "";
		}
	}
}
