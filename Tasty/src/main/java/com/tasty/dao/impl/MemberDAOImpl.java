package com.tasty.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.MemberDAO;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

@Repository
public class MemberDAOImpl implements MemberDAO{

		@Autowired
		private SqlSessionTemplate session;
		
		private String makeSqlId(String id) {
			return "com.tasty.config.mybatis.mapper.memberMapper."+id;
		}


		@Override
		public int insertMember(Member member) {
			return session.insert(makeSqlId("insertMember"), member);
		}

		@Override
		public int insertMemberTaste(MemberTaste memberTaste) {
			return session.insert(makeSqlId("insertMemberTaste"), memberTaste);
		}
		
		@Override
		public int deleteMemberByEmail(String email) {
			return session.delete(makeSqlId("deleteMemberByEmail"), email);
		}

		@Override
		public int updateMemberByEmail(Member Member) {
			return session.update(makeSqlId("updateMemberByEmail"), Member);
		}

		@Override
		public Member selectMemberByEmail(String email) {
			return session.selectOne(makeSqlId("selectMemberByEmail"), email);
		}


		
	}


