package com.tasty.vo;

import java.io.Serializable;

public class MissionCert implements Serializable{
	private int missionCertNum;
	private String email;
	private String title;
	private String content;
	private int missionNum;
	public MissionCert() {
	}
	public MissionCert(int missionCertNum, String email, String title, String content, int missionNum) {
		this.missionCertNum = missionCertNum;
		this.email = email;
		this.title = title;
		this.content = content;
		this.missionNum = missionNum;
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
	@Override
	public String toString() {
		return "MissionCert [missionCertNum=" + missionCertNum + ", email=" + email + ", title=" + title + ", content="
				+ content + ", missionNum=" + missionNum + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + missionCertNum;
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
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (missionCertNum != other.missionCertNum)
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
