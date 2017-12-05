package com.tasty.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.RouteDAO;
import com.tasty.vo.Route;

@Repository
public class RouteDAOImpl implements RouteDAO{


	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "com.tasty.config.mybatis.mapper.routeMapper."+id;
	}

	
	@Override
	public int insertRoute(Route route) {
		return session.insert(makeSqlId("insertRoute"), route);
	}

	@Override
	public int updateRoute(Route route) {
		return session.update(makeSqlId("updateRoute"), route);
	}

	@Override
	public int deleteRoute(int routeNum) {
		return session.delete(makeSqlId("deleteRoute"), routeNum);
	}


	@Override
	public List<Route> selectRouteByEmail(String email) {
		return session.selectList(makeSqlId("selectRouteByEmail"), email);
	}


	@Override
	public List<Route> selectRouteByReviewNum(int reviewNum) {
		return session.selectList(makeSqlId("selectRouteByReviewNum"), reviewNum);
	}
	


}
