package com.tasty.vo;

import java.io.Serializable;

public class ReviewUpsDownsCheck implements Serializable{
	private String email;
	private int reviewNum;
	
	public ReviewUpsDownsCheck() {}

	public ReviewUpsDownsCheck(String email, int reviewNum) {
		this.email = email;
		this.reviewNum = reviewNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	@Override
	public String toString() {
		return "ReviewUpsDownsCheck [email=" + email + ", reviewNum=" + reviewNum + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + reviewNum;
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
		ReviewUpsDownsCheck other = (ReviewUpsDownsCheck) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (reviewNum != other.reviewNum)
			return false;
		return true;
	}
	
	

}
