package com.tasty.dao;

import java.util.List;
import java.util.Map;

public interface PhotoDAO {
	
	int insertPhoto(String path);
	
	int insertReviewPhoto();
	
	int insertMissionPhoto();
	
	int deletePhoto(int number);
	
	int deleteReviewPhoto(int number);
	
	int insertReviewPhotoWithRn(int number);
	
	int insertMissionCertPhoto();

	int insertMissionPhoto(int missionNumber);
	
	int deleteMissionPhoto(int photoNumber);
	
	int insertMissionCertPhoto(int missionCertNumber);
	
	int deleteMissionCertPhoto(int photoNumber);
	
}



