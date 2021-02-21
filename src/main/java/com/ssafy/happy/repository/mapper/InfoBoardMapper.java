package com.ssafy.happy.repository.mapper;

import java.util.List;

import com.ssafy.happy.repository.dto.InfoBoard;

public interface InfoBoardMapper {

	List<InfoBoard> selectIboard() throws Exception;
	void deleteIboardByIno(int ino) throws Exception;
	InfoBoard selectIboardByIno(int ino) throws Exception;
	void updateIBoard(InfoBoard iboard) throws Exception;
	void InsertIBoard(InfoBoard iboard) throws Exception;
}