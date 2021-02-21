package com.ssafy.happy.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.repository.dto.Member;
import com.ssafy.happy.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public void join(Member member) throws Exception{
		mapper.insert(member);
	}
	@Override
	public void update(Member member){
		// TODO Auto-generated method stub
		mapper.update(member);
	}
	@Override
	public Member searchByEmail(String email){
		
		return mapper.selectMemberByEmail(email);
	}
	@Override
	public List<Member> search() throws Exception {
		
		return mapper.selectUser();
	}
	@Override
	public void updateByEmail(Member member) throws Exception {
		mapper.updateUserByEmail(member);
		
	}
	@Override
	public void delete(String email) throws Exception {
		mapper.deleteUser(email);

	}

	@Override
	public void updateMember(Member member) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(member.getEmail());
		mapper.updateMember(member);
	}
}
