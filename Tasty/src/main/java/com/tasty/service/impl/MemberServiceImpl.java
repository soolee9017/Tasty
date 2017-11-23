
package com.tasty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasty.dao.MemberDAO;
import com.tasty.service.MemberService;
import com.tasty.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public void addMember(Member member) {
		memberDao.insertMember(member);
	}

	@Override
	public void removeMemberByEmail(String email) {
		memberDao.deleteMemberByEmail(email);
	}

	@Override
	public void updateMemberByEmail(Member member) {
		memberDao.updateMemberByEmail(member);
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return memberDao.selectMemberByEmail(email);
	}

	
}
