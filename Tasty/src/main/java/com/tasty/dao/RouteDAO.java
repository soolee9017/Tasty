package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Route;
import com.tasty.vo.TempRoute;

public interface RouteDAO {
	
	int insertRoute(Route route);
	int insertTempRoute(TempRoute tempRoute);
	
	List<Route> getAllRoute();
	
	Route selectRouteByNum(int routeNum);

}
