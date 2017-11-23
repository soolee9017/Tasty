package com.tasty.vo;

import java.io.Serializable;

import java.util.List;

public class Member implements Serializable {

	private String email;
	private String password;
	private String nickname;
	private String name;
	private String phoneNum;
	private String gender;
	private int totalUps;
	private int totalDowns;
	
	private List<Review> reviewList;
	
	public Member() {}

	public Member(String email, String password, String nickname, String name, String phoneNum, String gender,
			int totalUps, int totalDowns) {
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.phoneNum = phoneNum;
		this.gender = gender;
		this.totalUps = totalUps;
		this.totalDowns = totalDowns;
	}

	public Member(String email, String password, String nickname, String name, String phoneNum, String gender,
			int totalUps, int totalDowns, List<Review> reviewList) {
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.phoneNum = phoneNum;
		this.gender = gender;
		this.totalUps = totalUps;
		this.totalDowns = totalDowns;
		this.reviewList = reviewList;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getTotalUps() {
		return totalUps;
	}

	public void setTotalUps(int totalUps) {
		this.totalUps = totalUps;
	}

	public int getTotalDowns() {
		return totalDowns;
	}

	public void setTotalDowns(int totalDowns) {
		this.totalDowns = totalDowns;
	}

	public List<Review> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
		result = prime * result + ((reviewList == null) ? 0 : reviewList.hashCode());
		result = prime * result + totalDowns;
		result = prime * result + totalUps;
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
		Member other = (Member) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (nickname == null) {
			if (other.nickname != null)
				return false;
		} else if (!nickname.equals(other.nickname))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phoneNum == null) {
			if (other.phoneNum != null)
				return false;
		} else if (!phoneNum.equals(other.phoneNum))
			return false;
		if (reviewList == null) {
			if (other.reviewList != null)
				return false;
		} else if (!reviewList.equals(other.reviewList))
			return false;
		if (totalDowns != other.totalDowns)
			return false;
		if (totalUps != other.totalUps)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format(
				"Member [email=%s, password=%s, nickname=%s, name=%s, phoneNum=%s, gender=%s, totalUps=%s, totalDowns=%s, reviewList=%s]",
				email, password, nickname, name, phoneNum, gender, totalUps, totalDowns, reviewList);
	}
	
	
	
	
}
