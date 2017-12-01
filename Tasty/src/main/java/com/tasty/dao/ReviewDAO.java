package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Review;

public interface ReviewDAO {
	
	List<Review> selectReviewByAddress(String address);
	
	List<Review> selectReviewByEmail(String email);
	
//	int insertReview(String title, String address);
	
	int insertReview(Review review);

	int insertMenu(String name);
	
	int insertMenuTaste();
	
	int deleteReview(String email);
	
	int updateReviewUpsDowns(int reviewNum);
	
	Review selectReviewByNum(int number);
}
