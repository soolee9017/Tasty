package com.tasty.vo;

import java.util.List;

public class MissionPhoto {
	
	private int photoNum;
	private int missionNum;
	
	private Mission mission;
	
	private Photo photo;

	public MissionPhoto() {
	}

	public MissionPhoto(int photoNum, int missionNum) {
		this.photoNum = photoNum;
		this.missionNum = missionNum;
	}

	public MissionPhoto(int photoNum, int missionNum, Mission mission) {
		this.photoNum = photoNum;
		this.missionNum = missionNum;
		this.mission = mission;
	}

	public MissionPhoto(int photoNum, int missionNum, Photo photo) {
		this.photoNum = photoNum;
		this.missionNum = missionNum;
		this.photo = photo;
	}

	public MissionPhoto(int photoNum, int missionNum, Mission mission, Photo photo) {
		this.photoNum = photoNum;
		this.missionNum = missionNum;
		this.mission = mission;
		this.photo = photo;
	}

	public int getPhotoNum() {
		return photoNum;
	}

	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}

	public int getMissionNum() {
		return missionNum;
	}

	public void setMissionNum(int missionNum) {
		this.missionNum = missionNum;
	}

	public Mission getMission() {
		return mission;
	}

	public void setMission(Mission mission) {
		this.mission = mission;
	}

	public Photo getPhoto() {
		return photo;
	}

	public void setPhoto(Photo photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "MissionPhoto [photoNum=" + photoNum + ", missionNum=" + missionNum + ", mission=" + mission + ", photo="
				+ photo + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mission == null) ? 0 : mission.hashCode());
		result = prime * result + missionNum;
		result = prime * result + ((photo == null) ? 0 : photo.hashCode());
		result = prime * result + photoNum;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MissionPhoto other = (MissionPhoto) obj;
		if (mission == null) {
			if (other.mission != null)
				return false;
		} else if (!mission.equals(other.mission))
			return false;
		if (missionNum != other.missionNum)
			return false;
		if (photo == null) {
			if (other.photo != null)
				return false;
		} else if (!photo.equals(other.photo))
			return false;
		if (photoNum != other.photoNum)
			return false;
		return true;
	}
	
	
	
	
	

}
