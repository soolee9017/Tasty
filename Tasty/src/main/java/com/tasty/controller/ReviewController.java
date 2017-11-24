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
	
	@RequestMapping("registerReview")
	public ModelAndView registerReview(@RequestParam String address,
			@RequestParam String storeName, @RequestParam String email,
			@RequestParam String title, @RequestParam String content,
			@RequestParam int ratings, @RequestParam int ups, @RequestParam int downs,
			@RequestParam String posX, @RequestParam String posY, @RequestParam List<String> tastes,
			@RequestParam List degrees) {
	
		//맛 3가지 중 같은 맛 골라서 넘겼는지 중복체크
		String firstTaste = tastes.get(0); //첫번째로 고른 맛
		String secondTaste = tastes.get(1);
		String thirdTaste = tastes.get(2);
		if(firstTaste.equals(secondTaste) || firstTaste.equals(thirdTaste) || secondTaste.equals(thirdTaste)) {
			String errorMessage = "맛이 중복되었습니다.";
			return new ModelAndView("","result", errorMessage);
		}
		
		
		
		Review review = new Review(0, address, storeName, email, title, content, ratings, ups, downs, posX, posY);
		return new ModelAndView("", "result", review);
	}
	
	@RequestMapping("test")
	public ModelAndView test(@RequestParam List everymeal, @RequestParam List food) {
		
		for(Object meal : everymeal) {
			System.out.println(meal);
		}
		
		for(Object f : food) {
			System.out.println(f);
		}
		String result="";
		return new ModelAndView("", "result", result);
				
	}
}
