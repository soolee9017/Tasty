package com.tasty.service;

import java.util.List;
import java.util.Map;

import com.tasty.vo.Route;

public interface RouteService {
	

	List getAllRouteByXYName(String storeName, String posX, String posY);
	
	Route selectRouteByNum(int routeNum);
	
	int insertRoute(String routeName, String content);
	
	Map<String, Object> getAllRouteByEmail(String email, int page);
}
