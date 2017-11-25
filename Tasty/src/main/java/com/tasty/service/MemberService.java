package com.tasty.service;

import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

public interface MemberService {

	void addMember(Member member);
	
	void addMemberTaste(MemberTaste memberTaste);
	
	void updateMemberByEmail(Member member);
	
	void removeMemberByEmail(String email);
	
	Member selectMemberByEmail(String email);




	
}
