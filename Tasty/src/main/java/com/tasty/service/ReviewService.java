package com.tasty.service;

import java.util.List;
import java.util.Map;

import com.tasty.vo.Review;

public interface ReviewService {

	List<Review> selectReviewByAddress(String address);
	
	List<Review> selectReviewByEmail(String email);
	
//	int insertReview(String finalArr, String title);
	
	int deleteReview(String email);

	int insertReview(String listOfMenu, String numOfTaste, String listOfTaste, String listOfDegree, String title);

}
