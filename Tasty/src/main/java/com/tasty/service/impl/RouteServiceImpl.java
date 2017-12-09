package com.tasty.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasty.dao.RouteDAO;
import com.tasty.service.ReviewService;
import com.tasty.service.RouteService;
import com.tasty.vo.Route;
import com.tasty.vo.TempRoute;

@Service
public class RouteServiceImpl implements RouteService{

	@Autowired
	private RouteDAO routeDao;

	@Override
	public Route selectRouteByNum(int routeNum) {
		return routeDao.selectRouteByNum(routeNum);
	}

	@Override
	public int insertRoute(String routeName, String content) {
		
		routeDao.insertRoute(new Route(0, routeName, content));
		
		
		return routeDao.selectRouteNum().get(0);
	}
	
}
