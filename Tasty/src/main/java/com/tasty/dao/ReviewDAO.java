package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Review;

public interface ReviewDAO {
	
	List<Review> selectReviewByAddress(String address);
	
	List<Review> selectReviewByEmail(String email);
	
//	int insertReview(Review review);
	int insertReview(String title, String address);

	int insertMenu(String name);
	
	int insertMenuTaste();
	
	int deleteReview(String email);
}
