package com.tasty.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
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

	int updateReview(Principal principal, HttpServletRequest request, 
			String reviewNum,
		 String numOfOg,String ogMenuNum,
			String listOfMenu, String numOfTaste,
			String listOfTaste, String listOfDegree, String rating, String title, String content,
			List<MultipartFile> upImage) throws Exception;
	
	
	int updateReviewUpsDowns(Review review);
	
	
	Review selectReviewByNum(int number);
	
	float averageRating(String address);
	

	List<Review> getListAndMemberByAdd(Principal principal, String address);

	
	List<Review> selectAllReviewAndMemberByAddress(String address);
}
