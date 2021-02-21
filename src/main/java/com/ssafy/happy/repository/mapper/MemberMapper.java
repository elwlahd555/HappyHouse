package com.ssafy.happy.repository.mapper;

import java.util.List;

import com.ssafy.happy.repository.dto.Member;

public interface MemberMapper {

	void insert(Member member);

	void update(Member member);

	Member selectMemberByEmail(String email);
	
	List<Member> selectUser();
	
	void updateUserByEmail(Member member);

	void deleteUser(String email);

	void updateMember(Member member);
}