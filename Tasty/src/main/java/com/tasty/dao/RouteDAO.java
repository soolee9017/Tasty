package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Route;

public interface RouteDAO {

	int insertRoute(Route route);
	
	int updateRoute(Route route);
	
	int deleteRoute(int routeNum);
	
	List<Route> selectRouteByEmail(String email);
	
	List<Route> selectRouteByReviewNum(int reviewNum);
	
}
