package com.tasty.service;

import java.util.List;

import com.tasty.vo.Mission;

public interface MissionService {
	
	int insertMission(Mission mission);
	
	
	List<Mission> selectAllMission();
	
	
	int updateMissionByMissionNum(Mission mission);
	
	
	int deleteMissionByMissonNum(int missionNum);
	
	
	
}
