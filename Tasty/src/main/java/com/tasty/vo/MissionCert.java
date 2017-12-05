package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class MissionCert implements Serializable{
	private int missionCertNum;
	private String email;
	private String title;
	private String content;
	private int missionNum;
	
	private Mission mission;
	private Photo photo;
	private Member member;
	
	private List<MissionCertPhoto> missionCertPhotoList;
	public MissionCert() {
	}
	public MissionCert(int missionCertNum, String email, String title, String content, int missionNum) {
		this.missionCertNum = missionCertNum;
		this.email = email;
		this.title = title;
		this.content = content;
		this.missionNum = missionNum;
	}
	public MissionCert(int missionCertNum, String email, String title, String content, int missionNum,
			Mission mission) {
		this.missionCertNum = missionCertNum;
		this.email = email;
		this.title = title;
		this.content = content;
		this.missionNum = missionNum;
		this.mission = mission;
	}
	public MissionCert(int missionCertNum, String email, String title, String content, int missionNum, Photo photo) {
		this.missionCertNum = missionCertNum;
		this.email = email;
		this.title = title;
		this.content = content;
		this.missionNum = missionNum;
		this.photo = photo;
	}
	public MissionCert(int missionCertNum, String email, String title, String content, int missionNum, Member member) {
		this.missionCertNum = missionCertNum;
		this.email = email;
		this.title = title;
		this.content = content;
		this.missionNum = missionNum;
		this.member = member;
	}
	public int getMissionCertNum() {
		return missionCertNum;
	}
	public void setMissionCertNum(int missionCertNum) {
		this.missionCertNum = missionCertNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Photo getPhoto() {
		return photo;
	}
	public void setPhoto(Photo photo) {
		this.photo = photo;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	@Override
	public String toString() {
		return "MissionCert [missionCertNum=" + missionCertNum + ", email=" + email + ", title=" + title + ", content="
				+ content + ", missionNum=" + missionNum + ", mission=" + mission + ", photo=" + photo + ", member="
				+ member + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + ((mission == null) ? 0 : mission.hashCode());
		result = prime * result + missionCertNum;
		result = prime * result + missionNum;
		result = prime * result + ((photo == null) ? 0 : photo.hashCode());
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
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (member == null) {
			if (other.member != null)
				return false;
		} else if (!member.equals(other.member))
			return false;
		if (mission == null) {
			if (other.mission != null)
				return false;
		} else if (!mission.equals(other.mission))
			return false;
		if (missionCertNum != other.missionCertNum)
			return false;
		if (missionNum != other.missionNum)
			return false;
		if (photo == null) {
			if (other.photo != null)
				return false;
		} else if (!photo.equals(other.photo))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	
	
	
	
}
