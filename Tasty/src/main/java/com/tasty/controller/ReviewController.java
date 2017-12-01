package com.tasty.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.ReviewDAO;
import com.tasty.service.ReviewService;
import com.tasty.service.TasteService;
import com.tasty.vo.Member;
import com.tasty.vo.Review;
import com.tasty.vo.ReviewUpsDownsCheck;

@Controller
@RequestMapping("/review/")
public class ReviewController {

   @Autowired
   ReviewService reviewService;
   
   @Autowired
   TasteService tasteService;
   
   @Autowired
   ReviewDAO reviewDao;
   
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
         
	  int num = reviewService.insertReview(principal,request,listOfMenu, numOfTaste, listOfTaste, listOfDegree, rating, title, content, upImage);
         
         Review review = reviewService.selectReviewByNum(num);
         return new ModelAndView("review/reviewDetail.jsp","review",review);
   }
  
  @RequestMapping("selectReviewByNum")
  public ModelAndView selectReview(@RequestParam String reviewNum) {
	
	 int number=Integer.parseInt(reviewNum);
	  Review review = reviewService.selectReviewByNum(number);
	  return new ModelAndView("review/reviewDetail.jsp","review",review);
}
  
  
  @RequestMapping("updateReviewUps")
  @ResponseBody
  public int updateReviewUps(Principal principal, @RequestParam int reviewNum) {
	  Review review = reviewService.selectReviewByNum(reviewNum); //해당 리뷰번호를 가진 Review를 업데이트 할 것이다.
	  Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	  Member member = (Member)authentication.getPrincipal();
	  
	  if(reviewDao.selectCheck(member.getEmail(), reviewNum)==null) {
		  reviewService.updateReviewUpsDowns(new Review(reviewNum, review.getUps()+1 , review.getDowns())); //select해 온 review번호의 리뷰에 추천수/비추천수 update.
		  reviewDao.insertCheck(new ReviewUpsDownsCheck(member.getEmail(), reviewNum));
		
		  return reviewService.selectReviewByNum(reviewNum).getUps(); //업데이트한 리뷰를 searchClick.jsp에 return.
		  
	  }
	  return -1;
  }
  
  @RequestMapping("updateReviewDowns")
  @ResponseBody
  public int updateReviewDowns(Principal principal, @RequestParam int reviewNum) {
	  Review review = reviewService.selectReviewByNum(reviewNum); //해당 리뷰번호를 가진 Review를 업데이트 할 것이다.
	  Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	  Member member = (Member)authentication.getPrincipal();
	  
	  if(reviewDao.selectCheck(member.getEmail(), reviewNum)==null) {
		  reviewService.updateReviewUpsDowns(new Review(reviewNum, review.getUps() , review.getDowns()+1)); //select해 온 review번호의 리뷰에 추천수/비추천수 update.
		  reviewDao.insertCheck(new ReviewUpsDownsCheck(member.getEmail(), reviewNum));
		  
		  return reviewService.selectReviewByNum(reviewNum).getDowns();
	  }
	  
	  return -1; //업데이트한 리뷰를 searchClick.jsp에 return.
  }
  
  
  @RequestMapping("getAverageRating")
  @ResponseBody
  public String getAverageRating(@RequestParam String address){

	  DecimalFormat df = new DecimalFormat("#######.##");
	  String avg = df.format(reviewService.averageRating(address));
	  
	  float average = reviewService.averageRating(address);
	  
	  return avg;
  }
  
  
  
}