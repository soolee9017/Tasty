package com.tasty.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.RouteDAO;
import com.tasty.vo.Route;
import com.tasty.vo.TempRoute;

@Repository
public class RouteDAOImpl implements RouteDAO{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "RouteMapper."+id;
	}
	
	@Override
	public int insertRoute(Route route) {
		return session.insert(makeSqlId("insertRoute"),route);
	}

	@Override
	public int insertTempRoute(TempRoute tempRoute) {
		return session.insert(makeSqlId("insertTempRoute"),tempRoute);
	}

	@Override
	public List<Route> getAllRoute() {
		return session.selectList(makeSqlId("getAllRoute"));
	}

	@Override
	public Route selectRouteByNum(int routeNum) {
		return session.selectOne(makeSqlId("selectRouteByNum"), routeNum);
	}
	
	

}
