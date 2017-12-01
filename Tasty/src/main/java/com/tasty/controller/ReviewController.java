package com.tasty.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.ReviewService;
import com.tasty.service.TasteService;
import com.tasty.vo.Review;

@Controller
@RequestMapping("/review/")
public class ReviewController {

   @Autowired
   ReviewService reviewService;
   
   @Autowired
   TasteService tasteService;
   
   @RequestMapping("getReviewByAddress")
   @ResponseBody
   public List<Review> getReviewByAddress(@RequestParam String address){
      List<Review> list = reviewService.selectReviewByAddress(address);
      return list;
   }
   
  @RequestMapping("registerReview")
   public ModelAndView registerReview(Principal principal,HttpServletRequest request, @RequestParam String listOfMenu, @RequestParam String numOfTaste,
         @RequestParam String listOfTaste,@RequestParam String listOfDegree,@RequestParam String rating, @RequestParam String title,
         @RequestParam String content,@RequestParam List<MultipartFile> upImage) throws Exception {
         reviewService.insertReview(principal,request,listOfMenu, numOfTaste, listOfTaste, listOfDegree, rating, title, content, upImage);
      return null;
   }
  
  @RequestMapping("selectReviewByNum")
  public ModelAndView selectReview(@RequestParam String reviewNum) {
	
	 int number=Integer.parseInt(reviewNum);
	  Review review = reviewService.selectReviewByNum(number);
	  return new ModelAndView("review/reviewDetail2.jsp","review",review);
}
  
  
  @RequestMapping("updateReviewUps")
  @ResponseBody
  public Review updateReviewUps(@RequestParam int reviewNum) {
	  Review review = reviewService.selectReviewByNum(reviewNum); //해당 리뷰번호를 가진 Review를 업데이트 할 것이다.
	  reviewService.updateReviewUpsDowns(new Review(reviewNum, review.getUps()+1 , review.getDowns())); //select해 온 review번호의 리뷰에 추천수/비추천수 update.

	  return reviewService.selectReviewByNum(reviewNum); //업데이트한 리뷰를 searchClick.jsp에 return.
  }
  
  @RequestMapping("updateReviewDowns")
  @ResponseBody
  public Review updateReviewDowns(@RequestParam int reviewNum) {
	  Review review = reviewService.selectReviewByNum(reviewNum); //해당 리뷰번호를 가진 Review를 업데이트 할 것이다.
	  reviewService.updateReviewUpsDowns(new Review(reviewNum, review.getUps() , review.getDowns()+1)); //select해 온 review번호의 리뷰에 추천수/비추천수 update.
	  
	  return reviewService.selectReviewByNum(reviewNum); //업데이트한 리뷰를 searchClick.jsp에 return.
  }
}