package com.tasty.dao;

import java.util.List;

import com.tasty.vo.MissionCert;

public interface MissionCertDAO {
	
	int insertMissionCert(MissionCert missionCert);
	
	List<MissionCert> selectAllMissionCert();
	
	List<MissionCert> selectMissionCertByMissionNum(int missionNum);
	
	int updateMissionCertByMissionCertNum(int missionCertNum);
	
	int deleteMissionCertByMissionNum(int missionCertNum);
}

