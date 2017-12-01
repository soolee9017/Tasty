package com.tasty.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

public interface MissionService {
	
	int insertMission(Mission mission, HttpServletRequest request, List<MultipartFile> upImage) throws Exception;
	
	
	List<Mission> selectAllMission();
	
	
	int updateMissionByMissionNum(Mission mission);
	
	void insertMissionMember(MissionMember missionMember);
	
	int deleteMissionByMissionNum(int missionNum);
	
	List<Mission> selectMissionByMissionName(String missionName);
	
	Mission selectMissionByMissionNum(int missionNum);
	
}
