package com.tasty.dao;

import java.util.List;

import com.tasty.vo.Mission;

public interface MissionDAO {
	
	/**
	 * 미션을 등록하는 dao
	 * @param mission
	 * @return
	 */
	int insertMission(Mission mission);
	
	/**
	 * 미션을 조회하는 dao
	 * @return
	 */
	List<Mission> selectAllMission();
	
	/**
	 * 미션번호로 미션을 삭제하는 dao
	 * @param missionNum
	 * @return
	 */
	int deleteMissionByMissionNum(int missionNum);
	
	/**
	 * 미션을 수정하는 dao
	 * @param missionNum
	 * @return
	 */
	int updateMissionByMissionNum(Mission mission);
	
	
	List<Mission> selectMissionByMissionName(String missionName);
	
	
}

