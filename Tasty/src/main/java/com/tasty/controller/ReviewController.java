package com.tasty.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		   @RequestParam String listOfTaste,@RequestParam String listOfDegree,@RequestParam String title 
		   /*@RequestParam String address,
         @RequestParam String storeName, @RequestParam String email,
         @RequestParam String title, @RequestParam String content,
         @RequestParam int ratings, @RequestParam int ups, @RequestParam int downs,
         @RequestParam String posX, @RequestParam String posY, @RequestParam List<String> tastes,
         @RequestParam List degrees*/) {
	   System.out.println("컨트롤러 왔쟈낭");
	 
	   	reviewService.insertReview(listOfMenu, numOfTaste, listOfTaste, listOfDegree, title);
	   
	   return null;
   
   }
   
   @RequestMapping("test")
   public ModelAndView test(@RequestParam String finalArr) {
	   
	   
	   
	   // 비지니스 로직은 service impl에서 짜려고 reviewserviceImpl에 insert review 메소드에서 새로 코드 짜는중 
	   
      System.out.println(finalArr);
      String[] menus = finalArr.split(","); //,를 빼고 menus 배열에 값이 차례로 들어간다.
      System.out.println(menus);
      
      List<String> menuList = new ArrayList<String>();
      
      for(String menu : menus) {
         menuList.add(menu); //menuList 라는 list에 menus 배열에 있는 값들을 넣는다.
      }
      
      System.out.println(",를 뺀 배열로 만든 후 : "+menuList);
      
      int listSize=menuList.size();
      int menuNum = 1;
      
      
      for(int i = 0 ; i< listSize ;i++) {
    	
    	  
      }
      
      return null;
      
            
   }
}
