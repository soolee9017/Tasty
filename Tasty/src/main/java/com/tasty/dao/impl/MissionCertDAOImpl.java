package com.tasty.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.MissionCertDAO;
import com.tasty.vo.MissionCert;

@Repository
public class MissionCertDAOImpl implements MissionCertDAO{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "com.tasty.config.mybatis.mapper.MissionCertMapper."+id;
	}

	@Override
	public int insertMissionCert(MissionCert missionCert) {
		return session.insert(makeSqlId("insertMissionCert"),missionCert);
	}

	@Override
	public List<MissionCert> selectAllMissionCert() {
		return session.selectList(makeSqlId("selectAllMissionCert"));
	}
	
	
	
	
}
