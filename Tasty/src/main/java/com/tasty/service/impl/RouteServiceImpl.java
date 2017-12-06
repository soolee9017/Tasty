package com.tasty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tasty.dao.MemberDAO;
import com.tasty.dao.ReviewDAO;
import com.tasty.dao.RouteDAO;
import com.tasty.service.RouteService;
import com.tasty.vo.Route;

public class RouteServiceImpl implements RouteService{

	@Autowired
	private RouteDAO routeDao;
	
	@Autowired
	private ReviewDAO reviewDao;
	
	@Autowired
	private MemberDAO memberDao;
	
	
	@Override
	public void addRoute(String email, String content, String routeName, List<String> storeName, List<String> posX, List<String> posY) {
		
		Route route = new Route();
		
		/*
		 * 루트 이름, 루트 내용, 작성한 리뷰 목록에 있는 가게 이름, 작성한 리뷰 목록에 있는 좌표 X:Y 
		 */
		
		
		routeDao.insertRoute(route);
		reviewDao.selectReviewByEmail(email);
		
		
		
		
		
		
		
	}
	
	
	@Override
	public void updateRoute(Route route) {
		routeDao.updateRoute(route);
	}

	
	@Override
	public void removeRoute(int routeNum) {
		routeDao.deleteRoute(routeNum);
	}

	
	@Override
	public List<Route> selectRouteByEmail(String email) {
		return routeDao.selectRouteByEmail(email);
	}

	
	@Override
	public List<Route> selectRouteByReviewNum(int reviewNum) {
		return routeDao.selectRouteByReviewNum(reviewNum);
	}

	
}
