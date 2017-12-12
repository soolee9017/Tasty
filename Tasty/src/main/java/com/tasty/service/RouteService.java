package com.tasty.service;

import java.util.List;

import com.tasty.vo.Route;
import com.tasty.vo.TempRoute;

public interface RouteService {
	

	List getAllRouteByXYName(String storeName, String posX, String posY);
	
	Route selectRouteByNum(int routeNum);
	
	int insertRoute(String routeName, String content);
	
	List getAllRouteByEmail(String email);
}
