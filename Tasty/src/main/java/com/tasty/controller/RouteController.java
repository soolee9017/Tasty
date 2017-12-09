package com.tasty.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tasty.dao.ReviewDAO;
import com.tasty.dao.RouteDAO;
import com.tasty.service.ReviewService;
import com.tasty.service.RouteService;
import com.tasty.vo.Review;
import com.tasty.vo.Route;
import com.tasty.vo.TempRoute;

@Controller
@RequestMapping("/route/")
public class RouteController {

   @Autowired
   ReviewService reviewService;

   @Autowired
   ReviewDAO reviewDao;
   
   @Autowired
   RouteDAO routeDao;
   
   @Autowired
   RouteService routeService;
   
   @RequestMapping("getXYByEmail")
   public ModelAndView getXYByEmail(@RequestParam String email){
	  String errorMessage = "작성한 리뷰가 한개거나 없습니다.";
      List<Review> list = reviewDao.selectAllReviewByEmail(email);
      if(list.isEmpty() || list.size() == 1) {
    	  return new ModelAndView("member/mypage.tiles","errorMessage",errorMessage);
      }
      List<ArrayList> bigList2 = new ArrayList<>();
      
      ArrayList smallList = new ArrayList<>();
      
      smallList.add(list.get(0).getReviewNum());
      smallList.add(list.get(0).getStoreName());
      smallList.add(list.get(0).getPosX());
      smallList.add(list.get(0).getPosY());
      bigList2.add(smallList);
      
      
      for(int i=1; i<list.size(); i++) {
    	  
    	  int flag = 0;
    	  for(int j = 0; j<bigList2.size(); j++) {
    		  
    		  if((bigList2.get(j).get(2)).equals(list.get(i).getPosX()) && (bigList2.get(j).get(3)).equals(list.get(i).getPosY())) {
    			 flag = 1;
    		  }
    	  }
    	  
    	  if(flag ==0) {
    		  ArrayList newList = new ArrayList<>();
    		  newList.add(list.get(i).getReviewNum());
    	         newList.add(list.get(i).getStoreName());
    	         newList.add(list.get(i).getPosX());
    	         newList.add(list.get(i).getPosY());
    	         
    	         bigList2.add(newList);
    	  }
      }
      ObjectMapper om = new ObjectMapper();
      String str = null;
      try {
         str = om.writeValueAsString(bigList2);
         System.out.println(str);
      } catch (JsonProcessingException e) {
         e.printStackTrace();
      }
      
      return new ModelAndView("route","list",str);
   }
   
   @RequestMapping("insertRoute")
   public ModelAndView insertRoute(@RequestParam String reviewNum, @RequestParam String storeName,
		   @RequestParam String routeName, @RequestParam String content, ModelMap model) {
	   String[] arr = reviewNum.split(",");
	   int num = 0;
	   
	   int number = routeService.insertRoute(routeName, content);
	   for(int i =0; i<arr.length; i++) {
		   num = Integer.parseInt(arr[i]);
		   routeDao.insertTempRoute(new TempRoute(0,num,i));
	   }
	   
	   Route route = routeService.selectRouteByNum(number);
	   
	   List bigList = new ArrayList<>();
	   
	   for(TempRoute tr : route.getTempRouteList()) {
		   List smallList = new ArrayList<>();
		   smallList.add(tr.getReviewNum());
		   smallList.add(tr.getReview().getStoreName());
		   smallList.add(tr.getReview().getPosX());
		   smallList.add(tr.getReview().getPosY());
		   bigList.add(smallList);
	   }
	   
	   ObjectMapper om = new ObjectMapper();
	      String str = null;
	      try {
	         str = om.writeValueAsString(bigList);
	         System.out.println(str);
	      } catch (JsonProcessingException e) {
	         e.printStackTrace();
	      }
	   
	   model.addAttribute("route",route);
	   model.addAttribute("list",str);
	   return new ModelAndView("route/route_detail.tiles");
   }
   
   //작성된 루트에서 하나의 마커를 클릭했을 때, 리뷰 상세보기가 보일것이다. 그걸 클릭하면 여태까지 쓰여진 리뷰들이 보여질 것이다.
   //그것을 처리해줄 컨트롤러 이며, Ajax 처리되어 값을 넘겨줄 것이기 때문에 ResponseBody를 붙였음.
   @RequestMapping("getReviewAtRoute")
   @ResponseBody
   public List<Review> getReviewAtRoute(@RequestParam String storeName, @RequestParam String posX, @RequestParam String posY) {
      List<Review> list = reviewDao.selectReviewByStoreNameAndPosXY(storeName, posX, posY);
      return list;
   }
/*   
   //작성된 루트들 중에서 하나의 루트를 선택하면 루트상세보기 페이지로 넘어감.
   @RequestMapping("getRouteByNum")
   public ModelAndView getRouteByNum(@RequestParam int routeNum) {
      Route route = routeDao.selectRouteByNum(routeNum);
      return new ModelAndView("route_view.tiles","route",route);
   }*/
   
   //메인검색창에서 음식점을 검색해서 들어오면 그 음식점에 대해 쓰여진 루트를 보여줄 컨트롤러.(searchClick.jsp에서)
   //Ajax 처리되어 값을 넘겨줄 것이라서 ResponseBody를 붙였다.. 언니 넘 힘들다 (feat.태은이 잔소리)
   @RequestMapping("getAllRoute")
   @ResponseBody
   public List<Route> getAllRoute(@RequestParam String storeName, @RequestParam String posX, @RequestParam String posY ){
      return null;
   }
   
   

}