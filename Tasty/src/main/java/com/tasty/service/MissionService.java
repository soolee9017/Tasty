package com.tasty.service;

import java.util.List;

import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

public interface MissionService {
	
	void insertMission(Mission mission);
	
	
	List<Mission> selectAllMission();
	
	
	int updateMissionByMissionNum(Mission mission);
	
	void insertMissionMember(MissionMember missionMember);
	
	int deleteMissionByMissionNum(int missionNum);
	
	List<Mission> selectMissionByMissionName(String missionName);
	
	Mission selectMissionByMissionNum(int missionNum);
	
}
