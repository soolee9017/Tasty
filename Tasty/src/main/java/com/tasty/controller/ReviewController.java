package com.tasty.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
   
   @RequestMapping(value="registerReview", method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView registerReview(HttpServletRequest request,@RequestParam String listOfMenu,@RequestParam String numOfTaste,
		   @RequestParam String listOfTaste,@RequestParam String listOfDegree,@RequestParam String title,
		   @RequestParam List<MultipartFile> upImage) throws Exception {
	
	   
	 
	   	reviewService.insertReview(request,listOfMenu, numOfTaste, listOfTaste, listOfDegree, title, upImage);
	   
	   return null;
   
   }
   
 
}
