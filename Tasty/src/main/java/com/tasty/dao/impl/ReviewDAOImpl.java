package com.tasty.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.ReviewDAO;
import com.tasty.vo.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "ReviewMapper."+id;
	}

	@Override
	public List<Review> selectReviewByAddress(String address) {
		return session.selectList(makeSqlId("selectReviewByAddress"), address);
	}

	@Override
	public int insertReview(Review review) {
		return session.insert(makeSqlId("insertReview"), review);
	}

	public int insertMenu(String name) {
		return session.insert(makeSqlId("insertMenu"),name);
	}

	@Override
	public int insertMenuTaste() {
		return session.insert(makeSqlId("insertMenuTaste"));
	}

	@Override
	public int insertReview(String title) {
		return session.insert(makeSqlId("insertReview"),title);
	}

	@Override
	public int deleteReview(String email) {
		return session.delete(makeSqlId("deleteReview"), email);
	}

	@Override
	public List<Review> selectReviewByEmail(String email) {
		return session.selectList(makeSqlId("selectReviewByEmail"), email);
	}
	
	
	
	
	
}
