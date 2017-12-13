package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Route;
import com.tasty.vo.TempRoute;

public interface RouteDAO {
	
	int insertRoute(Route route);
	
	int insertTempRoute(TempRoute tempRoute);
	
	List<Integer> getAllRouteNum(String storeName, String posX, String posY);
	
	Route selectRouteByNum(int routeNum);

	List<Integer> selectRouteNum();
	
	int updateRoute(Route route);
	
	int deleteTempRoute(int routeNum);
	
	int updateTempRoute(TempRoute tempRoute);
	
	List<Integer> getRouteNumByEmail(String email, int begin, int end);

	int selectRouteCount(String email);
}
