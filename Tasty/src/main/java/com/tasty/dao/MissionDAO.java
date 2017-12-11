package com.tasty.dao;

import java.util.List;
import java.util.Map;

import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

public interface MissionDAO {
	
	int insertMission(Mission mission);
	
	List<Mission> selectAllMission();
	
	int deleteMissionByMissionNum(int missionNum);
	
	int updateMissionByMissionNum(Map map);
	
	List<Mission> selectMissionByMissionName(String missionName);
	
	int insertMissionMember(MissionMember missionMember);
	
	int deleteMissionMember(MissionMember missionMember);
	
	int plusMissionCurrentPeoplePlus(int missionNum);
	
	int minusMissionCurrentPeoplePlus(int missionNum);
	
	boolean selectMissionMemberByMissionMember(MissionMember missionMember);//있으면 1없으면 0 return
	
	Mission selectMissionByMissionNum(int missionNum);
	
	List<Mission> selectAllMissionList();
	
}

