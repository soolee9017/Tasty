package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Authority;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

public interface MemberDAO {
	
	
	/**
	 * 회원등록(가입?)
	 * @param member
	 * @return
	 */
	int insertMember(Member member);
	
	/**
	 * 맛 등록
	 * @param memberTaste
	 * @return
	 */
	int insertMemberTaste(MemberTaste memberTaste);
	
	/**
	 * 탈퇴 처리
	 * @param email
	 * @return
	 */
	int withdrawMemberByEmail(String email);
	
	/**
	 * 완전 삭제
	 * @param email
	 * @return
	 */
	int deleteMemberByEmail(String email);
	
	/**
	 * 
	 * @param email
	 * @return
	 */
	int deleteMemberTasteByEmail(String email);
	
	/**
	 * 회원정보 수정
	 * @param Member
	 * @return
	 */
	
	int updateMemberByEmail(Member Member);
	
	/**
	 * 맛 수정
	 * @param memberTaste
	 * @return
	 */
	int updateMemberTasteByEmail(MemberTaste memberTaste);
	
	/**
	 * Email(ID)로 회원 조회
	 * @param email
	 * @return
	 */
	Member selectMemberByEmail(String email);
	
	/**
	 * 권한 추가
	 * @param authority
	 * @return
	 */
	int insertAuthority(Authority authority);
	
	
	/**
	 * 권한 조회
	 * @param email
	 * @return
	 */
	List<Authority> selectAuthorityByEmail(String email);
	
	
	
}




