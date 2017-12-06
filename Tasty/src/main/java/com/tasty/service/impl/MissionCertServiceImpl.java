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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.tasty.dao.MissionCertDAO;
import com.tasty.service.MissionCertService;
import com.tasty.vo.Member;
import com.tasty.vo.MissionCert;

@Service
public class MissionCertServiceImpl implements MissionCertService{

	@Autowired
	private MissionCertDAO missionCertDao;

	@Override
	public List<MissionCert> selectAllMissionCert() {
		return missionCertDao.selectAllMissionCert();
	}

	@Override
	public int insertMissionCert(MissionCert missionCert) {
		return missionCertDao.insertMissionCert(missionCert);
	}

	@Override
	public List<MissionCert> selectMissionCertByMissionNum(int missionNum) {
		return missionCertDao.selectMissionCertByMissionNum(missionNum);
	}

	@Override
	public int updateMissionCertByMissionCertNum(int missionCertNum) {
		return missionCertDao.updateMissionCertByMissionCertNum(missionCertNum);
	}

	@Override
	public int deleteMissionCertByMissionCertNum(int missionCertNum) {
		return missionCertDao.deleteMissionCertByMissionNum(missionCertNum);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

