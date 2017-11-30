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
	
	

}
