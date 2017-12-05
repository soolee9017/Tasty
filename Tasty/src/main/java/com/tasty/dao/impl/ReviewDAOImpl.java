package com.tasty.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.ReviewDAO;
import com.tasty.vo.Review;
import com.tasty.vo.ReviewUpsDownsCheck;

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
	public int insertMenuWithMn(Map map) {
		return session.insert(makeSqlId("insertMenuWithMn"),map);
	}
	
	@Override
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
	public int updateReviewUpsDowns(Review review) {
		return session.update(makeSqlId("updateReviewUpsDowns"),review);
	}
	
	@Override
	public Review selectReviewByNum(int number) {
		return session.selectOne(makeSqlId("selectReviewByNum"),number);
	}

	@Override
	public float averageRating(String address) {
		return session.selectOne(makeSqlId("averageRatingByAddress"), address);
	}

	@Override
	public List<Integer> selectReviewNumByEmail(String email) {
		return session.selectList(makeSqlId("selectReviewNumByEmail"),email);
	}	
	
	@Override
	public int insertCheck(ReviewUpsDownsCheck review) {
		return session.insert(makeSqlId("insertCheck"), review);
	}

	@Override
	public ReviewUpsDownsCheck selectCheck(String email, int reviewNum) {
		Map map = new HashMap<>();
		map.put("email", email);
		map.put("reviewNum",reviewNum);
		
		return session.selectOne(makeSqlId("selectCheck"), map);
	}

	@Override
	public List<Review> selectReviewAndMemberByAddress(String address, int tasteNum) {
		Map map = new HashMap<>();
		map.put("address", address);
		map.put("tasteNum", tasteNum);
		return session.selectList(makeSqlId("selectReviewAndMemberByAddress"),map);
	}

	@Override
	public List<Review> selectAllReviewAndMemberByAddress(String address) {
		return session.selectList(makeSqlId("selectAllReviewAndMemberByAddress"),address);
	}

	@Override
	public int updateReviewWithMap(Map map) {
		return session.update(makeSqlId("updateReviewWithMap"),map);
	}
	
	
	
	
}
