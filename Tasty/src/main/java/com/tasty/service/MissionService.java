package com.tasty.service;

import java.util.List;

import com.tasty.vo.Mission;

public interface MissionService {
	
	void insertMission(Mission mission);
	
	
	List<Mission> selectAllMission();
	
	
	int updateMissionByMissionNum(Mission mission);
	
	
	int deleteMissionByMissonNum(int missionNum);
	
	List<Mission> selectMissionByMissionName(String missionName);
	
}
