package com.tasty.controller;

import java.util.ArrayList;
import java.util.List;

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
   
   @RequestMapping("getAllReview")
   public ModelAndView getAllReview(@RequestParam String address){
      List<Review> list = reviewService.selectReviewByAddress(address);
      return new ModelAndView("response.jsp","result",list);
   }
   
   @RequestMapping(value="registerReview", method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView registerReview(@RequestParam String listOfMenu,@RequestParam String numOfTaste,
		   @RequestParam String listOfTaste,@RequestParam String listOfDegree,@RequestParam String title,
		   @RequestParam List<MultipartFile> upImage) {
	
	   
	   System.out.println("컨트롤러 왔쟈낭");
	 
	   	reviewService.insertReview(listOfMenu, numOfTaste, listOfTaste, listOfDegree, title, upImage);
	   
	   return null;
   
   }
   
 
}
