package com.tasty.controller;

import java.util.ArrayList;
import java.util.Collection;
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
	public ModelAndView test(@RequestParam String menuLists/*넘어올 이름으로 바꾸기*/) {
		String[] menus = menuLists.split(","); //,를 빼고 menus 배열에 값이 차례로 들어간다.
		List<String> menuList = new ArrayList<String>();
		
		for(String menu : menus) {
			menuList.add(menu); //menuList 라는 list에 menus 배열에 있는 값들을 넣는다.
		}
		
		
		List<String> list = new ArrayList<String>(menuList.size()); // /를 기준으로 메뉴를 하나씩 넣을 리스트.
		
		int cnt = -1;
		for(int i=0; i<menuList.size(); i++) {
			cnt++;
			if(!(menuList.get(i)).equals("/")) {
				list.add(cnt, menuList.get(i));
				
				continue;
			}
		}
		

		System.out.println("run");
		System.out.println(list);
		return null;
		
				
	}
}
