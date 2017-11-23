package com.tasty.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.MissionDAO;
import com.tasty.vo.Mission;

@Repository
public class MissionDAOImpl implements MissionDAO{

	@Autowired
	private SqlSessionTemplate session;

	private String makeSqlId(String id) {
		return "MissionMapper."+id;
	}
	
	/*@Override
	public int insertMission(Mission mission) {
		return session.insert(makeSqlId("insertMission"), mission);
		
	}*/

	@Override
	public List<Mission> selectAllMission() {
		return session.selectList(makeSqlId("selectAllMission"));
	}

	
	
}
