package com.tasty.service;

import java.util.List;

import com.tasty.vo.Route;

public interface RouteService {

	void addRoute(String email, String content, String routeName, List<String> storeName, List<String> posX, List<String> posY);
	
	void updateRoute(Route route);
	
	void removeRoute(int routeNum);
	
	List<Route> selectRouteByEmail(String email);
	
	List<Route> selectRouteByReviewNum(int reviewNum);
	
}
