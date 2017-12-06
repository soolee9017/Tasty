package com.tasty.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.ReviewDAO;
import com.tasty.service.ReviewService;
import com.tasty.vo.Review;

@Controller
@RequestMapping("/route/")
public class RouteController {

	@Autowired
	ReviewService reviewService;

	@Autowired
	ReviewDAO reviewDao;

	@RequestMapping("getXYByEmail")
	public ModelAndView getXYByEmail(@RequestParam String email){

		List<Review> list = reviewService.selectReviewByEmail(email);
		
		List<HashMap> bigList = new ArrayList<>();
		List<ArrayList> bigList2 = new ArrayList<>();
		
		
		for(Review r: list) {
			HashMap<String,String> map = new HashMap<>();
			map.put("storeName", r.getStoreName());
			map.put("x",r.getPosX());
			map.put("y",r.getPosY());
				bigList.add(map);
		}
		
		
		for(Review r: list) {
			ArrayList smallList = new ArrayList<>();
			smallList.add(r.getStoreName());
			smallList.add(r.getPosX());
			smallList.add(r.getPosY());
				bigList2.add(smallList);
		}
		
		
		System.out.println(bigList);
		System.out.println(bigList2);
		
		return new ModelAndView("route/route_select.jsp","list",bigList2);
	}

}
