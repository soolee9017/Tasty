package com.tasty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasty.dao.MissionCertDAO;
import com.tasty.service.MissionCertService;
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
	
	
	
	
	
	
	
	
	
	
	
	
}

