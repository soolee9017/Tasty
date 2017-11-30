package com.tasty.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tasty.dao.MissionDAO;
import com.tasty.dao.PhotoDAO;
import com.tasty.service.MissionService;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

@Service
public class MissionServiceImpl implements MissionService{

	@Autowired
	private MissionDAO missionDao;
	
	@Autowired
	private PhotoDAO photoDao;
	
	
	@Override
	public List<Mission> selectAllMission() {
		return missionDao.selectAllMission();
	}

	@Override
	public int updateMissionByMissionNum(Mission mission) {
		return missionDao.updateMissionByMissionNum(mission);
	}

	@Override
	public int deleteMissionByMissionNum(int missionNum) {
		return missionDao.deleteMissionByMissionNum(missionNum);
	}

	@Override
	@Transactional
	public int insertMission(Mission mission, HttpServletRequest request, List<MultipartFile> upImage) throws Exception{
		
		missionDao.insertMission(mission);
		   
		   if(upImage != null & !upImage.isEmpty()) {
			   for(MultipartFile photo : upImage) {
				   
				   String fileName = UUID.randomUUID().toString().replace("-", "")+"+"+photo.getOriginalFilename();
				   
				   System.out.println(fileName);
				   
				   photo.transferTo(new File(request.getServletContext().getRealPath("/photos/review"),fileName));
				   photoDao.insertPhoto(fileName);
				   photoDao.insertReviewPhoto();
			   }
		   }
		   
		  
			   
			   
		   
		   
		   
		   
		   return 0;
	}

	@Override
	public List<Mission> selectMissionByMissionName(String missionName) {
		return missionDao.selectMissionByMissionName(missionName);
	}

	@Override
	public void insertMissionMember(MissionMember missionMember) {
		missionDao.insertMissionMember(missionMember);
	}

	@Override
	public Mission selectMissionByMissionNum(int missionNum) {
		return missionDao.selectMissionByMissionNum(missionNum);
	}
	
	
	
	
}

