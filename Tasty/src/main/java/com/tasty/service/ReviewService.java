package com.tasty.service;

import java.util.List;
import java.util.Map;

import com.tasty.vo.Review;

public interface ReviewService {

	List<Review> selectReviewByAddress(String address);
	
	List<Review> selectReviewByEmail(String email);
	
	int insertReview(Review review);
	int insertReview(String finalArr, String title);
	
	int deleteReview(String email);

}
