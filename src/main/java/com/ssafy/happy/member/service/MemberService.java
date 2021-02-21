package com.ssafy.happy.member.service;

import java.util.List;

import com.ssafy.happy.repository.dto.Member;

public interface MemberService {

	void join(Member member) throws Exception;

	void update(Member member);

	Member searchByEmail(String email);
	
	List<Member> search() throws Exception;
	
	void updateByEmail(Member member) throws Exception;
	public void delete(String email) throws Exception ;


	void updateMember(Member member) throws Exception;
}