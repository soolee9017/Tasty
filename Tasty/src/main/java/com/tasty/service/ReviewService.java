package com.tasty.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.tasty.vo.Review;

public interface ReviewService {

	List<Review> selectReviewByAddress(String address);
	
	List<Review> selectReviewByEmail(String email);
	
//	int insertReview(String finalArr, String title);
	
	int deleteReview(String email);

//	int insertReview(String listOfMenu, String numOfTaste, String listOfTaste, String listOfDegree, String title);

	int insertReview(HttpSession session, HttpServletRequest request,String listOfMenu, String numOfTaste, String listOfTaste, String listOfDegree, String title,
			List<MultipartFile> upImage) throws Exception;

}
