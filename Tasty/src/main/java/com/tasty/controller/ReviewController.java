package com.tasty.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
   public List getReviewByAddress(@RequestParam String address){
      List<Review> list = reviewService.selectReviewByAddress(address);
      System.out.println(list);
      return list;
   }
   
   @RequestMapping(value="registerReview", method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView registerReview(HttpSession session, HttpServletRequest request,@RequestParam String listOfMenu,@RequestParam String numOfTaste,
		   @RequestParam String listOfTaste,@RequestParam String listOfDegree,@RequestParam String title,
		   @RequestParam List<MultipartFile> upImage) throws Exception {
	
	   
	 
	   	reviewService.insertReview(session, request,listOfMenu, numOfTaste, listOfTaste, listOfDegree, title, upImage);
	   
	   return null;
   
   }
   
 
}
