package com.tasty.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.MissionDAO;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

@Repository
public class MissionDAOImpl implements MissionDAO{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "com.tasty.config.mybatis.mapper.MissionMapper."+id;
	}
	
	@Override
	public List<Mission> selectMissionByMissionName(String missionName) {
		
		return session.selectList(makeSqlId("selectMissionByMissionName"),missionName);
	}

	@Override
	public int deleteMissionByMissionNum(int missionNum) {
		return session.delete(makeSqlId("deleteMissionByMissionNum"), missionNum);
	}

	@Override
	public int updateMissionByMissionNum(Map map) {
		return session.update(makeSqlId("updateMissionByMissionNum"), map);
	}

	
	@Override
	public int insertMission(Mission mission) {
		return session.insert(makeSqlId("insertMission"), mission);
		
	}

	@Override
	public int insertMissionMember(MissionMember missionMember) {
		return session.insert(makeSqlId("insertMissionMember"),missionMember);
	}

	@Override
	public int deleteMissionMember(MissionMember missionMember) {
		return session.delete(makeSqlId("deleteMissionMember"),missionMember);
	}

	@Override
	public List<Mission> selectAllMission() {
		return session.selectList(makeSqlId("selectAllMission"));
	}

	@Override
	public Mission selectMissionByMissionNum(int missionNum) {
		return session.selectOne(makeSqlId("selectMissionByMissionNum"),missionNum);
	}

	@Override
	public int plusMissionCurrentPeoplePlus(int missionNum) {
		return session.update(makeSqlId("plusCurrentPeople"),missionNum);
	}
	
	@Override
	public int minusMissionCurrentPeoplePlus(int missionNum) {
		return session.update(makeSqlId("minusCurrentPeople"),missionNum);
	}
	
	
	@Override
	public boolean selectMissionMemberByMissionMember(MissionMember missionMember) {
		return session.selectOne(makeSqlId("selectMissionMemberByMissionMember"),missionMember) != null;
		
	}

	@Override
	public List<Mission> selectAllMissionList() {
		return session.selectList(makeSqlId("selectAllMission2"));
	}
	
	
	
}
