package com.tasty.service;

import java.util.List;

import com.tasty.vo.Route;
import com.tasty.vo.TempRoute;

public interface RouteService {
	
	void insertRoute(Route route, TempRoute tempRoute);

	List getAllRouteByXYName(String storeName, String posX, String posY);
}
