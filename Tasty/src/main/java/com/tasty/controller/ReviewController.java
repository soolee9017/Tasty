package com.tasty.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
   public ModelAndView getReviewByAddress(@RequestParam String address){
      List<Review> list = reviewService.selectReviewByAddress(address);
      return new ModelAndView("review/searchClick.jsp","list",list);
   }
   
  @RequestMapping("registerReview")
   public ModelAndView registerReview(Principal principal,HttpServletRequest request, @RequestParam String listOfMenu, @RequestParam String numOfTaste,
         @RequestParam String listOfTaste,@RequestParam String listOfDegree,@RequestParam String rating, @RequestParam String title,
         @RequestParam String content,@RequestParam List<MultipartFile> upImage) throws Exception {
   
     
        
     
         reviewService.insertReview(principal,request,listOfMenu, numOfTaste, listOfTaste, listOfDegree, rating, title, content, upImage);
      
      return null;
   
   }
  
  @RequestMapping("selectReview")
  public ModelAndView selectReview(@RequestParam String reviewNum) {
	  
	  int number=Integer.parseInt(reviewNum);
	  Review review = reviewService.selectReviewByNum(number);
	  System.out.println(review);
	  return new ModelAndView("review/reviewDetail2.jsp","review",review);
  }
   

   
 
}
