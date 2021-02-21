package com.ssafy.happy.repository.mapper;

import java.util.List;

import com.ssafy.happy.repository.dto.Realtime;

public interface AdminMapper {
	List<Integer> getAllViews(int month) throws Exception;
	List<Realtime> getRealtime() throws Exception;
}
