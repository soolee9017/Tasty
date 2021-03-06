package com.tasty.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Integer> getAllRouteNum(String storeName, String posX, String posY) {
		Map map = new HashMap<>();
		map.put("storeName",storeName);
		map.put("posX", posX);
		map.put("posY", posY);
		return session.selectList(makeSqlId("getAllRouteNum"), map);
	}


	@Override
	public Route selectRouteByNum(int routeNum) {
		return session.selectOne(makeSqlId("selectRouteByNum"), routeNum);
	}

	@Override
	public List<Integer> selectRouteNum() {
		return session.selectList(makeSqlId("selectRouteNum"));
	}

	@Override
	public int updateRoute(Route route) {
		return session.update(makeSqlId("updateRoute"), route);
	}

	@Override
	public int updateTempRoute(TempRoute tempRoute) {
		return session.update(makeSqlId("updateTempRoute"), tempRoute);
	}

	@Override
	public int deleteTempRoute(int routeNum) {
		return session.delete(makeSqlId("deleteTempRoute"), routeNum);
	}
	
	@Override
	public int deleteRoute(int routeNum) {
		return session.delete(makeSqlId("deleteRoute"), routeNum);
	}
	
	public List<Integer> getRouteNumByEmail(String email, int begin, int end) {
		Map map = new HashMap<>();
		map.put("email", email);
		map.put("begin", begin);
		map.put("end",end);
		
		return session.selectList(makeSqlId("getRouteNumByEmail"),map);
	}

	@Override
	public int selectRouteCount(String email) {
		return session.selectOne(makeSqlId("selectRouteCount"),email);
	}

	
	
	
	

}
