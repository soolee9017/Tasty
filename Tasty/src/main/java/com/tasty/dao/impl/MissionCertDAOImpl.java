package com.tasty.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.MissionCertDAO;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionCert;

@Repository
public class MissionCertDAOImpl implements MissionCertDAO{

	@Autowired
	private SqlSessionTemplate session;

	private String makeSqlId(String id) {
		return "com.tasty.config.mybatis.mapper.MissionCertMapper."+id;
	}

	@Override
	public int insertMissionCert(MissionCert missionCert) {
		return session.insert(makeSqlId("insertMissionCert"),missionCert);
	}

	@Override
	public List<MissionCert> selectAllMissionCert() {
		return session.selectList(makeSqlId("selectAllMissionCert"));
	}

	@Override
	public List<MissionCert> selectMissionCertByMissionNum(int missionNum) {
		return session.selectList(makeSqlId("selectMissionCertByMissionNum"),missionNum);
	}
	
	@Override
	public List<MissionCert> selectAllMissionCert2(int missionNum) {
		return session.selectList(makeSqlId("selectAllMissionCertByNum"),missionNum);
	}

	@Override
	public Mission selectMissionCertByMissionNum2(int missionNum) {
		return session.selectOne(makeSqlId("selectMissionByMissionNum"),missionNum);
	}

	@Override
	public int updateMissionCertByMissionCertNum(int missionCertNum) {
		return session.update(makeSqlId("updateMissionCertByMissionCertNum"),missionCertNum);
	}

	@Override
	public int deleteMissionCertByMissionNum(int missionCertNum) {
		return session.delete(makeSqlId("deleteMissionCertByMissionCertNum"),missionCertNum);
	}

	@Override
	public MissionCert selectMissionCertByMCN(int number) {
		return session.selectOne(makeSqlId("selectMissionCertByMCN"),number);
	}

	/*@Override
	public MissionCert selectMissionCertByMissionCertNum(int missionCertNum) {
		return session.selectOne(makeSqlId("selectMissionCertByMissionCertNum"),missionCertNum);
	}
	*/
	


		




}