package com.tasty.service.impl;

import java.util.ArrayList;
import java.util.List;

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
	public List getAllRouteByXYName(String storeName, String posX, String posY) {
		List<Integer> listOfNum = routeDao.getAllRouteNum(storeName, posX, posY);
		List<Integer> newList = new ArrayList<>();
		
	
			for(int a:listOfNum) {
				
				int flag = 0;	
					for(int b:newList) {
						if(a==b) {
							flag = 1;
						}
					}
				if (flag==0) {
					newList.add(a);
				}
			}
		
		List bigList = new ArrayList();
			for(int a : newList) {
				Route route = routeDao.selectRouteByNum(a);
				bigList.add(route);
			}
		
		return bigList;
	}
	
	
	@Override
	public int insertRoute(String routeName, String content) {
		
		routeDao.insertRoute(new Route(0, routeName, content));
		
		
		return routeDao.selectRouteNum().get(0);
	}

	@Override
	public List getAllRouteByEmail(String email) {
		List<Integer> listOfNum = routeDao.getRouteNumByEmail(email);
		
		List<Integer> newList = new ArrayList<>();
		
		
		for(int a:listOfNum) {
			
			int flag = 0;	
				for(int b:newList) {
					if(a==b) {
						flag = 1;
					}
				}
			if (flag==0) {
				newList.add(a);
			}
		}
		
		List bigList = new ArrayList();
		for(int a : newList) {
			Route route = routeDao.selectRouteByNum(a);
			bigList.add(route);
		}
	
	return bigList;
	}
	
	
	
}
