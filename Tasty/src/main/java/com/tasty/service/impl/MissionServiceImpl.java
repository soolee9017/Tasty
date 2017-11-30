package com.tasty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasty.dao.MissionDAO;
import com.tasty.service.MissionService;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

@Service
public class MissionServiceImpl implements MissionService{

	@Autowired
	private MissionDAO missionDao;
	
	
	
	@Override
	public List<Mission> selectAllMission() {
		return missionDao.selectAllMission();
	}

	@Override
	public int updateMissionByMissionNum(Mission mission) {
		return missionDao.updateMissionByMissionNum(mission);
	}

	@Override
	public int deleteMissionByMissionNum(int missionNum) {
		return missionDao.deleteMissionByMissionNum(missionNum);
	}

	@Override
	public void insertMission(Mission mission) {
		missionDao.insertMission(mission);
	}

	@Override
	public List<Mission> selectMissionByMissionName(String missionName) {
		return missionDao.selectMissionByMissionName(missionName);
	}

	@Override
	public void insertMissionMember(MissionMember missionMember) {
		missionDao.insertMissionMember(missionMember);
	}

	@Override
	public Mission selectMissionByMissionNum(int missionNum) {
		return missionDao.selectMissionByMissionNum(missionNum);
	}
	
	
	
	
}

