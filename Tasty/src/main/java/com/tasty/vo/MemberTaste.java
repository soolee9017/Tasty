package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class MemberTaste implements Serializable{
	
	private String email;
	private int tasteNum;
	
	private Member member;
	private List<Taste> tasteList;
	
	public MemberTaste() {
		
	}

	public MemberTaste(String email, int tasteNum, Member member, List<Taste> tasteList) {
		this.email = email;
		this.tasteNum = tasteNum;
		this.member = member;
		this.tasteList = tasteList;
	}


	public List<Taste> getTasteList() {
		return tasteList;
	}

	public void setTasteList(List<Taste> tasteList) {
		this.tasteList = tasteList;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTasteNum() {
		return tasteNum;
	}

	public void setTasteNum(int tasteNum) {
		this.tasteNum = tasteNum;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + ((tasteList == null) ? 0 : tasteList.hashCode());
		result = prime * result + tasteNum;
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
		MemberTaste other = (MemberTaste) obj;
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
		if (tasteList == null) {
			if (other.tasteList != null)
				return false;
		} else if (!tasteList.equals(other.tasteList))
			return false;
		if (tasteNum != other.tasteNum)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberTaste [email=" + email + ", tasteNum=" + tasteNum + ", member=" + member + ", tasteList="
				+ tasteList + "]";
	}


	

}
