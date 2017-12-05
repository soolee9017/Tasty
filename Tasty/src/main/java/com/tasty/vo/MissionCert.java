package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class MissionCert implements Serializable{

	private int missionCertNum;
	private String title;
	private String content;
	private int missionNum;
	
	private Mission mission;
	private List<MissionCertPhoto> missionCertPhotoList;
	
	public MissionCert() {}

	public MissionCert(int missionCertNum, String title, String content, int missionNum,
			List<MissionCertPhoto> missionCertPhotoList) {
		this.missionCertNum = missionCertNum;
		this.title = title;
		this.content = content;
		this.missionNum = missionNum;
		this.missionCertPhotoList = missionCertPhotoList;
	}

	public MissionCert(int missionCertNum, String title, String content, int missionNum, Mission mission,
			List<MissionCertPhoto> missionCertPhotoList) {
		this.missionCertNum = missionCertNum;
		this.title = title;
		this.content = content;
		this.missionNum = missionNum;
		this.mission = mission;
		this.missionCertPhotoList = missionCertPhotoList;
	}

	public int getMissionCertNum() {
		return missionCertNum;
	}

	public void setMissionCertNum(int missionCertNum) {
		this.missionCertNum = missionCertNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public List<MissionCertPhoto> getMissionCertPhotoList() {
		return missionCertPhotoList;
	}

	public void setMissionCertPhotoList(List<MissionCertPhoto> missionCertPhotoList) {
		this.missionCertPhotoList = missionCertPhotoList;
	}

	@Override
	public String toString() {
		return "MissionCert [missionCertNum=" + missionCertNum + ", title=" + title + ", content=" + content
				+ ", missionNum=" + missionNum + ", mission=" + mission + ", missionCertPhotoList="
				+ missionCertPhotoList + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((mission == null) ? 0 : mission.hashCode());
		result = prime * result + missionCertNum;
		result = prime * result + ((missionCertPhotoList == null) ? 0 : missionCertPhotoList.hashCode());
		result = prime * result + missionNum;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		MissionCert other = (MissionCert) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (mission == null) {
			if (other.mission != null)
				return false;
		} else if (!mission.equals(other.mission))
			return false;
		if (missionCertNum != other.missionCertNum)
			return false;
		if (missionCertPhotoList == null) {
			if (other.missionCertPhotoList != null)
				return false;
		} else if (!missionCertPhotoList.equals(other.missionCertPhotoList))
			return false;
		if (missionNum != other.missionNum)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	
	
	
	
	
}
