
package com.tasty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tasty.dao.MemberDAO;
import com.tasty.service.MemberService;
import com.tasty.vo.Authority;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;
import com.tasty.vo.Review;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	@Transactional
	public void addMember(Member member, String role) {
		
		//패스워드 암호화
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		//회원
		memberDao.insertMember(member);
		//권한
		memberDao.insertAuthority(new Authority(member.getEmail(), role));
		//
		if(role.equals("ROLE_ADMIN")) {
			memberDao.insertAuthority(new Authority(member.getEmail(), "ROLE_MEMBER"));
		}
	}
	
	@Override
	public void addMemberTaste(MemberTaste memberTaste) {
		memberDao.insertMemberTaste(memberTaste);
	}	
	

	@Override
	public void removeMemberByEmail(String email) {
		memberDao.deleteMemberByEmail(email);
	}

	@Override
	public void removeAuthorityByEmail(String email) {
		memberDao.deleteAuthorityByEmail(email);
	}
	
	@Override
	public void removeMemberTasteByEmail(String email) {
		memberDao.deleteMemberTasteByEmail(email);
	}
	
	@Override
	public void updateMemberByEmail(Member member) {
		memberDao.updateMemberByEmail(member);
	}
	
	@Override
	public Member selectMemberByEmail(String email) {
		return memberDao.selectMemberByEmail(email);
	}

	@Override
	public List<MemberTaste> selectMemberTasteByEmail(String email) {
		return memberDao.selectMemberTasteByEmail(email);
	}

	@Override
	public List<Member> selectAllMember() {
		return memberDao.selectAllMember();
	}

	//마저할것
	@Override
	public int updateMemberCertByEmail(String email) {
		return memberDao.updateMemberCertByEmail(email);
	}

	@Override
	public List<Member> selectMemberByMemberCert(int memberCert) {
		return memberDao.selectMemberByMemberCert(memberCert);
	}

	@Override
	public List<Review> selectReviewByEmail(String email) {
		return memberDao.selectReviewByEmail(email);
	}

	
}







