package com.tasty.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.MemberDAO;
import com.tasty.vo.Authority;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;
import com.tasty.vo.Review;

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
			return session.selectList(makeSqlId("selectAllMember"));
		}


		@Override
		public int updateMemberCertByEmail(String email) {
			return session.update(makeSqlId("updateMemberCertByEmail"), email);
		}


		@Override
		public List<MemberTaste> selectMemberTasteByEmail(String email) {
			return session.selectList(makeSqlId("selectMemberTasteByEmail"), email);
		}


		@Override
		public List<Member> selectMemberByMemberCert(int memberCert) {
			return session.selectList(makeSqlId("selectMemberByMemberCert"), memberCert);
		}


	
		public int updateMemberUps(String email) {
			return session.update(makeSqlId("updateMemberUps"),email);
		}


		@Override
		public int updateMemberDowns(String email) {
			return session.update(makeSqlId("updateMemberDowns"),email);
		}
		
		@Override
		public int getTotalsOfMember(String email) {
			return session.selectOne(makeSqlId("getTotalsOfMember"), email);
		}


		@Override
		public float getPosPercentage(String email) {
			return session.selectOne(makeSqlId("getPosPercentage"),email);
		}
		
		

		
	}


