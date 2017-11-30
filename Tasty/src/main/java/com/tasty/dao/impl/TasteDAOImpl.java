package com.tasty.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.TasteDAO;

@Repository
public class TasteDAOImpl implements TasteDAO{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "TasteMapper."+id;
	}
	
	@Override
	public List selectAllTaste() {
		return session.selectList(makeSqlId("selectAllTaste"));
	}
	
	@Override
	public int insertAllTaste(Map map) {
		return session.insert(makeSqlId("insertAllTaste"),map);
	}

}
