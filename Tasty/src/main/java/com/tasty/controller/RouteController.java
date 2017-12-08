package com.tasty.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tasty.dao.ReviewDAO;
import com.tasty.dao.RouteDAO;
import com.tasty.service.ReviewService;
import com.tasty.vo.Review;
import com.tasty.vo.Route;

@Controller
@RequestMapping("/route/")
public class RouteController {

	@Autowired
	ReviewService reviewService;

	@Autowired
	ReviewDAO reviewDao;

	@Autowired
	RouteDAO routeDao;

	@RequestMapping("getXYByEmail")
	public ModelAndView getXYByEmail(@RequestParam String email) {

		int page = 1;
		Map m = reviewService.selectReviewByEmail(email, page);
		List<Review> list = (List<Review>) m.get("list");

		List<ArrayList> bigList2 = new ArrayList<>();

		ArrayList smallList = new ArrayList<>();

		for (int i = 0; i < list.size(); i++) {
			smallList.add(list.get(i).getStoreName());
			smallList.add(list.get(i).getPosX());
			smallList.add(list.get(i).getPosY());
			bigList2.add(smallList);
		}
		
		System.out.println(bigList2);
		System.out.println("------------------------------");
		ObjectMapper om = new ObjectMapper();
		String str = null;
		try {
			str = om.writeValueAsString(bigList2);
			System.out.println(str);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return new ModelAndView("route", "list", str);
	}

	// 작성된 루트에서 하나의 마커를 클릭했을 때, 리뷰 상세보기가 보일것이다. 그걸 클릭하면 여태까지 쓰여진 리뷰들이 보여질 것이다.
	// 그것을 처리해줄 컨트롤러 이며, Ajax 처리되어 값을 넘겨줄 것이기 때문에 ResponseBody를 붙였음.
	@RequestMapping("getReviewAtRoute")
	@ResponseBody
	public List<Review> getReviewAtRoute(@RequestParam String storeName, @RequestParam String posX,
			@RequestParam String posY) {
		List<Review> list = reviewDao.selectReviewByStoreNameAndPosXY(storeName, posX, posY);
		return list;
	}

	// 작성된 루트들 중에서 하나의 루트를 선택하면 루트상세보기 페이지로 넘어감.
	@RequestMapping("getRouteByNum")
	public ModelAndView getRouteByNum(@RequestParam int routeNum) {
		Route route = routeDao.selectRouteByNum(routeNum);
		return new ModelAndView("route_view.tiles", "route", route);
	}

	// 메인검색창에서 음식점을 검색해서 들어오면 그 음식점에 대해 쓰여진 루트를 보여줄 컨트롤러.(searchClick.jsp에서)
	// Ajax 처리되어 값을 넘겨줄 것이라서 ResponseBody를 붙였다.. 언니 넘 힘들다 (feat.태은이 잔소리)
	@RequestMapping("getAllRoute")
	@ResponseBody
	public List<Route> getAllRoute(@RequestParam String storeName, @RequestParam String posX,
			@RequestParam String posY) {
		List<Route> list = routeDao.getAllRoute(storeName, posX, posY);
		return list;
	}

}
