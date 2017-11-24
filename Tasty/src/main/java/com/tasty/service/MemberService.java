package com.tasty.service;

import java.util.List;

import com.tasty.vo.Member;

public interface MemberService {

	void addMember(Member member);
	
	void updateMemberByEmail(Member member);
	
	void removeMemberByEmail(String email);
	
	Member selectMemberByEmail(String email);
	
}
