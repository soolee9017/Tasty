package com.tasty.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.ReviewService;
import com.tasty.vo.Review;

@Controller
@RequestMapping("/review/")
public class ReviewController {

	@Autowired
	ReviewService service;
	
	@RequestMapping("getAllReview")
	public ModelAndView getAllReview(@RequestParam String address){
		List<Review> list = service.selectReviewByAddress(address);
		return new ModelAndView("response.jsp","result",list);
	}
}
