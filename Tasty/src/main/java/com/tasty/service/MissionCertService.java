package com.tasty.service;

import java.util.List;

import com.tasty.vo.MissionCert;

public interface MissionCertService {
	
	
	List<MissionCert> selectAllMissionCert();
	
	int insertMissionCert(MissionCert missionCert);
	
	List<MissionCert> selectMissionCertByMissionNum(int missionNum);

}
