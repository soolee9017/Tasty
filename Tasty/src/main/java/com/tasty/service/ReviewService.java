package com.tasty.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tasty.vo.Review;
import com.tasty.vo.ReviewBoard;

public interface ReviewService {

	List<Review> selectReviewByAddress(String address);
	
	List<Review> selectReviewByEmail(String email);
	
//	int insertReview(String finalArr, String title);
	
	int deleteReview(String email);



	int insertReview(Principal principal, HttpServletRequest request, String listOfMenu, String numOfTaste,
			String listOfTaste, String listOfDegree, String rating, String title, String content,
			List<MultipartFile> upImage) throws Exception;


}
