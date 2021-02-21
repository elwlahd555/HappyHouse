package com.ssafy.happy.map.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.happy.repository.dto.SidoGugunDong;

public interface SidoService {

	List<SidoGugunDong> getSido() throws Exception;
}