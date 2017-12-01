package com.tasty.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.MemberDAO;
import com.tasty.vo.Authority;
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
		public int insertAuthority(Authority authority) {
			return session.insert(makeSqlId("insertAuthority"), authority);
		}


		@Override
		public int insertMemberTaste(MemberTaste memberTaste) {
			return session.insert(makeSqlId("insertMemberTaste"), memberTaste);
		}
		
		@Override
		public int deleteAuthorityByEmail(String email) {
			return session.update(makeSqlId("deleteAuthorityByEmail"), email);
		}

		@Override
		public int deleteMemberByEmail(String email) {
			return session.delete(makeSqlId("deleteMemberByEmail"), email);
		}
		
		@Override
		public int deleteMemberTasteByEmail(String email) {
			return session.delete(makeSqlId("deleteMemberTasteByEmail"), email);
		}

		@Override
		public int updateMemberByEmail(Member member) {
			return session.update(makeSqlId("updateMemberByEmail"), member);
		}


		@Override
		public Member selectMemberByEmail(String email) {
			return session.selectOne(makeSqlId("selectMemberByEmail"), email);
		}


		@Override
		public List<Authority> selectAuthorityByEmail(String email) {
			return session.selectList(makeSqlId("selectAuthorityByEmail"), email);
		}


		@Override
		public List<Member> selectAllMember() {
			// TODO Auto-generated method stub
			return session.selectList(makeSqlId("selectAllMember"));
		}


		@Override
		public int updateMemberCertByEmail(int memberCert) {
			return session.update(makeSqlId("updateMemberCertByEmail"), memberCert);
		}


		@Override
		public List<MemberTaste> selectMemberTasteByEmail(String email) {
			return session.selectList(makeSqlId("selectMemberTasteByEmail"));
		}


	
		
	}


