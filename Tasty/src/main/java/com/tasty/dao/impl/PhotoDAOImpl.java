package com.tasty.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tasty.dao.PhotoDAO;

@Repository
public class PhotoDAOImpl implements PhotoDAO{

	@Autowired
	private SqlSessionTemplate session;
	
	private String makeSqlId(String id) {
		return "PhotoMapper."+id;
	}
	
	@Override
	public int insertPhoto(String path) {
		return session.insert(makeSqlId("insertPhoto"),path);
	}

	@Override
	public int insertReviewPhoto() {
		return session.insert(makeSqlId("insertReviewPhoto"));
	}

	@Override
	public int insertMissionPhoto() {
		return session.insert(makeSqlId("insertMissionPhoto"));
	}
	
	@Override
	public int insertMissionPhoto(int missionNumber) {
		return session.insert(makeSqlId("insertMissionPhoto2"),missionNumber);
	}

	@Override
	public int deletePhoto(int number) {
		return session.delete(makeSqlId("deletePhoto"),number);
	}

	@Override
	public int deleteReviewPhoto(int number) {
		return session.delete(makeSqlId("deleteReviewPhoto"),number);
	}

	@Override
	public int insertReviewPhotoWithRn(int number) {
		return session.insert(makeSqlId("insertReviewPhotoWithRn"),number);
	}

	@Override
	public int insertMissionCertPhoto() {
		return session.insert(makeSqlId("insertMissionCertPhoto"));
	}

	@Override
	public int deleteMissionPhoto(int photoNumber) {
		return session.delete(makeSqlId("deleteMissionPhoto"),photoNumber);
	}

	@Override
	public int deleteMissionCertPhoto(int photoNumber) {
		return session.delete(makeSqlId("deleteMissionCertPhoto"),photoNumber);
	}

	@Override
	public int insertMissionCertPhoto(int missionCertNumber) {
		return session.insert(makeSqlId("insertMissionCertPhoto2"),missionCertNumber);
	}
	
	
	
	

}
