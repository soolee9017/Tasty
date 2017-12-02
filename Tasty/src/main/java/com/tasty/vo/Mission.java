package com.tasty.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.tasty.util.DateJsonSerializer;

public class Mission implements Serializable{
	private int missionNum;
	private String missionName;
	private String missionContent;
	private int currentPeople;
	private int maxPeople;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
	private List<MissionPhoto> missionPhotoList;//생성자 만들었음
	
	
	
	public Mission() {
	}


	public Mission(int missionNum, String missionName, String missionContent, int currentPeople, int maxPeople,
			Date startDate, Date endDate) {
		this.missionNum = missionNum;
		this.missionName = missionName;
		this.missionContent = missionContent;
		this.currentPeople = currentPeople;
		this.maxPeople = maxPeople;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	
	public Mission(int missionNum, String missionName, String missionContent, int currentPeople, int maxPeople,
			Date startDate, Date endDate, List<MissionPhoto> missionPhotoList) {
		this.missionNum = missionNum;
		this.missionName = missionName;
		this.missionContent = missionContent;
		this.currentPeople = currentPeople;
		this.maxPeople = maxPeople;
		this.startDate = startDate;
		this.endDate = endDate;
		this.missionPhotoList = missionPhotoList;
	}


	public int getMissionNum() {
		return missionNum;
	}


	public void setMissionNum(int missionNum) {
		this.missionNum = missionNum;
	}


	public String getMissionName() {
		return missionName;
	}


	public void setMissionName(String missionName) {
		this.missionName = missionName;
	}


	public String getMissionContent() {
		return missionContent;
	}


	public void setMissionContent(String missionContent) {
		this.missionContent = missionContent;
	}


	public int getCurrentPeople() {
		return currentPeople;
	}


	public void setCurrentPeople(int currentPeople) {
		this.currentPeople = currentPeople;
	}


	public int getMaxPeople() {
		return maxPeople;
	}


	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public List<MissionPhoto> getMissionPhotoList() {
		return missionPhotoList;
	}


	public void setMissionPhotoList(List<MissionPhoto> missionPhotoList) {
		this.missionPhotoList = missionPhotoList;
	}


	@Override
	public String toString() {
		return "Mission [missionNum=" + missionNum + ", missionName=" + missionName + ", missionContent="
				+ missionContent + ", currentPeople=" + currentPeople + ", maxPeople=" + maxPeople + ", startDate="
				+ startDate + ", endDate=" + endDate + ", missionPhotoList=" + missionPhotoList + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + currentPeople;
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + maxPeople;
		result = prime * result + ((missionContent == null) ? 0 : missionContent.hashCode());
		result = prime * result + ((missionName == null) ? 0 : missionName.hashCode());
		result = prime * result + missionNum;
		result = prime * result + ((missionPhotoList == null) ? 0 : missionPhotoList.hashCode());
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
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
		Mission other = (Mission) obj;
		if (currentPeople != other.currentPeople)
			return false;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (maxPeople != other.maxPeople)
			return false;
		if (missionContent == null) {
			if (other.missionContent != null)
				return false;
		} else if (!missionContent.equals(other.missionContent))
			return false;
		if (missionName == null) {
			if (other.missionName != null)
				return false;
		} else if (!missionName.equals(other.missionName))
			return false;
		if (missionNum != other.missionNum)
			return false;
		if (missionPhotoList == null) {
			if (other.missionPhotoList != null)
				return false;
		} else if (!missionPhotoList.equals(other.missionPhotoList))
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		return true;
	}


	

	
	
	
	
	
	
}
