package com.tasty.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

public interface MissionService {
	
	int insertMission(Principal principal,Mission mission, HttpServletRequest request, List<MultipartFile> upImage) throws Exception;
	
	
	List<Mission> selectAllMission();
	
	int cancelMissionMember(MissionMember missionMember,int missionNum);
	
	Mission selectMissionByMissionNum(int missionNum);
	
	List<Mission> selectAllMissionList();

	int enterMissionMember(MissionMember missionMember, int missionNum);

	int updateMissionByMissionNum(Principal principal, HttpServletRequest request, List<MultipartFile> upImage,
			int missionNum, String missionName, String missionContent, int currentPeople, int maxPeople, Date startDate,
			Date endDate) throws Exception;

	int deleteMissionByMissionNum(Principal principal, HttpServletRequest request, int missionNum);
	
	Map<String, Object> selectMissionByEmail(String email,int page);
		
	
}
