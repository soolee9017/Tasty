package com.tasty.service;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tasty.vo.MissionCert;

public interface MissionCertService {
	
	
	List<MissionCert> selectAllMissionCert();
	
	int insertMissionCert(MissionCert missionCert);
	
	List<MissionCert> selectMissionCertByMissionNum(int missionNum);
	
	int updateMissionCertByMissionCertNum(int missionCertNum);
	
	int deleteMissionCertByMissionCertNum(int missionCertNum);
	

}
