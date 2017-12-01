package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Review;
import com.tasty.vo.ReviewUpsDownsCheck;

public interface ReviewDAO {
	
	List<Review> selectReviewByAddress(String address);
	
	List<Review> selectReviewByEmail(String email);
	
//	int insertReview(String title, String address);
	
	int insertReview(Review review);

	int insertMenu(String name);
	
	int insertMenuTaste();
	
	int deleteReview(String email);
	
	int updateReviewUpsDowns(Review review);
	
	Review selectReviewByNum(int number);
	
	float averageRating(String address);
	
	List<Integer> selectReviewNumByEmail(String email);
	
	int insertCheck(ReviewUpsDownsCheck review);
	
	ReviewUpsDownsCheck selectCheck(String email, int reviewNum);
}
