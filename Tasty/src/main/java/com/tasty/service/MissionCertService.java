package com.tasty.service;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tasty.vo.Mission;
import com.tasty.vo.MissionCert;

public interface MissionCertService {
	
	
	List<MissionCert> selectAllMissionCert();
	
	int insertMissionCert(Principal principal, MissionCert missionCert, HttpServletRequest request, List<MultipartFile> upImage) throws IllegalStateException, IOException;
	
	List<MissionCert> selectMissionCertByMissionNum(int missionNum);
	
	int updateMissionCertByMissionCertNum(int missionCertNum);
	
	int deleteMissionCertByMissionCertNum(int missionCertNum);
	

}
