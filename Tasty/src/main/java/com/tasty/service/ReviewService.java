package com.tasty.service;

import java.util.List;

import com.tasty.vo.Review;

public interface ReviewService {

	List<Review> selectReviewByAddress(String address);
}
