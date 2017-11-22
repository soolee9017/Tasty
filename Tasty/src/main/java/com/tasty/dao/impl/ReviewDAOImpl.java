package com.tasty.dao.impl;

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

	
}
