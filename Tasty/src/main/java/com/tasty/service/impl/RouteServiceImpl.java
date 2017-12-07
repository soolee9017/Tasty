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
	
	@Autowired
	private ReviewService reviewService;
	
	@Override
	public void insertRoute(Route route, TempRoute tempRoute) {
		//route 먼저 넣고
		routeDao.insertRoute(route);
		
		//route_temp 넣고(선택한 review들의 reviewNum을 넣으면 됨..
//		routeDao.insertTempRoute(route.getRouteNum(),)
		
	}

}
