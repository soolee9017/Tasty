package com.tasty.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int insertMenu(String name) {
		return session.insert(makeSqlId("insertMenu"),name);
	}

	@Override
	public int insertMenuTaste() {
		return session.insert(makeSqlId("insertMenuTaste"));
	}

//	@Override
//	public int insertReview(String title, String address) {
//		Map<String,String> map = new HashMap<>();
//		map.put("title", title);
//		map.put("address", address);
//		return session.insert(makeSqlId("insertReview"),map);

	@Override
	public int insertReview(Review review) {
		return session.insert(makeSqlId("insertReview"),review);
	}
	

	@Override
	public int deleteReview(String email) {
		return session.delete(makeSqlId("deleteReview"), email);
	}



	@Override
	public List<Review> selectReviewByEmail(String email) {
		return session.selectList(makeSqlId("selectReviewByEmail"), email);
	}

	@Override
	public int updateReviewUpsDowns(int reviewNum) {
		return session.update(makeSqlId("updateReviewUpsDowns"),reviewNum);
	}
	
	
	
	
	
}
