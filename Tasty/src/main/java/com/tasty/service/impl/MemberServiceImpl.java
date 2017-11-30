
package com.tasty.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tasty.dao.MemberDAO;
import com.tasty.service.MemberService;
import com.tasty.vo.Authority;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

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
	public void withdrawMemberByEmail(String email) {
		memberDao.withdrawMemberByEmail(email);
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
	public void updateMemberTasteByEmail(MemberTaste memberTaste) {
		memberDao.updateMemberTasteByEmail(memberTaste);
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return memberDao.selectMemberByEmail(email);
	}



	
}
