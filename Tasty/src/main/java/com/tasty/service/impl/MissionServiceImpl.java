package com.tasty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasty.dao.MissionDAO;
import com.tasty.service.MissionService;
import com.tasty.vo.Mission;

@Service
public class MissionServiceImpl implements MissionService{
	@Autowired
	private MissionDAO missionDao;
	
	
	
	@Override
	public List<Mission> selectAllMission() {
		return missionDao.selectAllMission();
	}

	/*@Override
	public int insertMission(Mission mission) {
		return missionDao.insertMission(mission);
	}
*/
	
	
	
	
}
