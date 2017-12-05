package com.tasty.service.impl;

import java.io.File;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.tasty.dao.MissionDAO;
import com.tasty.dao.PhotoDAO;
import com.tasty.service.MissionService;
import com.tasty.vo.Member;
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
	public int insertMission(Principal principal, Mission mission, HttpServletRequest request, List<MultipartFile> upImage) throws Exception{
		HttpSession session = request.getSession();
		
		
		//로그인한 사람의 정보
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member member= (Member)authentication.getPrincipal();
	
		
		int a = missionDao.insertMission(mission);
		System.out.println(a);   
		File file = new File(request.getServletContext().getRealPath("/photos/mission"));
        
        if(!file.exists()) {
           file.mkdirs();
        }
       
        System.out.println(mission);
        for(MultipartFile photo : upImage) {
              if(photo != null && !photo.isEmpty()) {
              String fileName = UUID.randomUUID().toString().replace("-", "")+photo.getOriginalFilename();
              

             photo.transferTo(new File(request.getServletContext().getRealPath("/photos/mission"),fileName));
//             FileCopyUtils.copy(new File(request.getServletContext().getRealPath("/photos/mission"),fileName),
//                   new File("C:\\Java\\gitRepository\\Tasty\\Tasty\\src\\main\\webapp\\photos\\mission",fileName));
             
             
              photoDao.insertPhoto(fileName);
              request.setAttribute("photos", fileName);
              photoDao.insertMissionPhoto();
              }
           }
		return 0;
	}

	@Override
	public List<Mission> selectMissionByMissionName(String missionName) {
		return missionDao.selectMissionByMissionName(missionName);
	}

	@Override
	public void enterMissionMember(MissionMember missionMember,int missionNum) {
		missionDao.insertMissionMember(missionMember);
		missionDao.updateMissionCurrentPeoplePlus(missionNum);
	}

	@Override
	public Mission selectMissionByMissionNum(int missionNum) {
		return missionDao.selectMissionByMissionNum(missionNum);
	}

	@Override
	public List<Mission> selectAllMissionList() {
		return missionDao.selectAllMissionList();
	}
	
	
	
	
}

