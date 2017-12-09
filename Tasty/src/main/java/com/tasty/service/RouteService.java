package com.tasty.service;

import com.tasty.vo.Route;
import com.tasty.vo.TempRoute;

public interface RouteService {
	

	Route selectRouteByNum(int routeNum);
	
	int insertRoute(String routeName, String content);
}
