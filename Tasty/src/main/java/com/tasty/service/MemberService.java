package com.tasty.service;

import java.util.List;

import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

public interface MemberService {

	void addMember(Member member, String role);
	
	void addMemberTaste(MemberTaste memberTaste);
	
	void updateMemberByEmail(Member member);
	
	void updateMemberTasteByEmail(MemberTaste memberTaste);
	
	void removeMemberByEmail(String email);
	
	void withdrawMemberByEmail(String email);
	
	Member selectMemberByEmail(String email);




	
}
