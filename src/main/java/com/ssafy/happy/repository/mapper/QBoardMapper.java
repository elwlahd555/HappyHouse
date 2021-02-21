package com.ssafy.happy.repository.mapper;

import java.util.List;

import com.ssafy.happy.repository.dto.QBoard;

public interface QBoardMapper {

	List<QBoard> selectQboard() throws Exception;

}