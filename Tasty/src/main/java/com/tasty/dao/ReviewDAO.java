package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Review;

public interface ReviewDAO {
	List<Review> selectReviewByAddress(String address);
	
	int insertReview(Review review);
}
