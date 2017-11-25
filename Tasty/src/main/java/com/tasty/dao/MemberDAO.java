package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

public interface MemberDAO {
	
	
	/**
	 * 회원등록(가입?)
	 * @param member
	 * @return
	 */
	int insertMember(Member member);
	
	int insertMemberTaste(MemberTaste memberTaste);
	
	/**
	 * 삭제(탈퇴)
	 * @param email
	 * @return
	 */
	int deleteMemberByEmail(String email);
	
	/**
	 * 회원정보 수정
	 * @param Member
	 * @return
	 */
	int updateMemberByEmail(Member Member);
	
	/**
	 * Email(ID)로 회원 조회
	 * @param email
	 * @return
	 */
	Member selectMemberByEmail(String email);
	
	
}




