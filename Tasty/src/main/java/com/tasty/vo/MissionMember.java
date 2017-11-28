package com.tasty.vo;

public class MissionMember {
	
	private String email;
	private int missionNum;
	
	
	private Member member;
	private Mission mission;
	
	
	public MissionMember(String email, int missionNum) {
		this.email = email;
		this.missionNum = missionNum;
	}
	public MissionMember() {
	}
	public MissionMember(String email, int missionNum, Member member, Mission mission) {
		this.email = email;
		this.missionNum = missionNum;
		this.member = member;
		this.mission = mission;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getMissionNum() {
		return missionNum;
	}
	public void setMissionNum(int missionNum) {
		this.missionNum = missionNum;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Mission getMission() {
		return mission;
	}
	public void setMission(Mission mission) {
		this.mission = mission;
	}
	@Override
	public String toString() {
		return "MissionMember [email=" + email + ", missionNum=" + missionNum + ", member=" + member + ", mission="
				+ mission + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + ((mission == null) ? 0 : mission.hashCode());
		result = prime * result + missionNum;
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
		MissionMember other = (MissionMember) obj;
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
		if (missionNum != other.missionNum)
			return false;
		return true;
	}
	
	
}
