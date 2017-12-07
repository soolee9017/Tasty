package com.tasty.service;

import java.util.List;

import org.springframework.dao.DuplicateKeyException;

import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

public interface MemberService {

	/**
	 * 회원 등록(가입)
	 * @param member
	 * @param role
	 */
	void addMember(Member member, String role);
	
	/**
	 * 맛 추가
	 * @param memberTaste
	 */
	void addMemberTaste(MemberTaste memberTaste);
	
	/**
	 * 회원 정보 수정
	 * @param member
	 */
	void updateMemberByEmail(Member member);
	
	/**
	 * 회원 삭제
	 * @param email
	 */
	void removeMemberByEmail(String email);
	
	/**
	 * 권한 삭제(탈퇴)
	 * @param email
	 */
	void removeAuthorityByEmail(String email);
	
	/**
	 * 맛 삭제
	 * @param email
	 */
	void removeMemberTasteByEmail(String email);
	
	/**
	 * 회원 조회(email)
	 * @param email
	 * @return
	 */
	Member selectMemberByEmail(String email);
	
	/**
	 * 회원 전체 조회
	 * @return
	 */
	List<Member> selectAllMember();
	
	//마저할것
	int updateMemberCertByEmail(String email);
	
	List<MemberTaste> selectMemberTasteByEmail(String email);

	
	List<Member> selectMemberByMemberCert(int memberCert);


	
}
