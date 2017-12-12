package com.tasty.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

public interface MissionService {
	
	int insertMission(Principal principal,Mission mission, HttpServletRequest request, List<MultipartFile> upImage) throws Exception;
	
	
	List<Mission> selectAllMission();
	
	
	int updateMissionByMissionNum(Principal principal, 
								  HttpServletRequest request, 
								  List<MultipartFile>upImage, 
								  int missionNum, String missionName, 
								  int currentPeople, 
								  int maxPeople, 
								  Date startDate, 
								  Date endDate) throws Exception;
	
	int enterMissionMember(MissionMember missionMember,int missionNum);
	
	int cancelMissionMember(MissionMember missionMember,int missionNum);
	
	int deleteMissionByMissionNum(int missionNum);
	
	List<Mission> selectMissionByMissionName(String missionName);
	
	Mission selectMissionByMissionNum(int missionNum);
	
	List<Mission> selectAllMissionList();
	
	
}
