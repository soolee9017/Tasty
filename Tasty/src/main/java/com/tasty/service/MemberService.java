package com.tasty.service;

import java.util.List;

import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

public interface MemberService {

	void addMember(Member member);
	
	void addMemberTaste(MemberTaste memberTaste);
	
	//void addMemberTaste(int tasteNum);
	
	void updateMemberByEmail(Member member);
	
	void removeMemberByEmail(String email);
	
	Member selectMemberByEmail(String email);




	
}
