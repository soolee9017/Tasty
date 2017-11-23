package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class Taste implements Serializable {

	private int tasteNum;
	private String tasteName;
	
	private List<AllTaste> atList;
	
	private MemberTaste memberTaste;
	
	public Taste() {}

	public Taste(int tasteNum, String tasteName) {
		this.tasteNum = tasteNum;
		this.tasteName = tasteName;
	}

	public Taste(int tasteNum, String tasteName, List<AllTaste> atList) {
		this.tasteNum = tasteNum;
		this.tasteName = tasteName;
		this.atList = atList;
	}
	
	

	public Taste(int tasteNum, String tasteName, MemberTaste memberTaste) {
		this.tasteNum = tasteNum;
		this.tasteName = tasteName;
		this.memberTaste = memberTaste;
	}

	public int getTasteNum() {
		return tasteNum;
	}

	public void setTasteNum(int tasteNum) {
		this.tasteNum = tasteNum;
	}

	public String getTasteName() {
		return tasteName;
	}

	public void setTasteName(String tasteName) {
		this.tasteName = tasteName;
	}

	public List<AllTaste> getAtList() {
		return atList;
	}

	public void setAtList(List<AllTaste> atList) {
		this.atList = atList;
	}
	

	public MemberTaste getMemberTaste() {
		return memberTaste;
	}

	public void setMemberTaste(MemberTaste memberTaste) {
		this.memberTaste = memberTaste;
	}

	@Override
	public String toString() {
		return "Taste [tasteNum=" + tasteNum + ", tasteName=" + tasteName + ", atList=" + atList + ", memberTaste="
				+ memberTaste + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((atList == null) ? 0 : atList.hashCode());
		result = prime * result + ((memberTaste == null) ? 0 : memberTaste.hashCode());
		result = prime * result + ((tasteName == null) ? 0 : tasteName.hashCode());
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
		Taste other = (Taste) obj;
		if (atList == null) {
			if (other.atList != null)
				return false;
		} else if (!atList.equals(other.atList))
			return false;
		if (memberTaste == null) {
			if (other.memberTaste != null)
				return false;
		} else if (!memberTaste.equals(other.memberTaste))
			return false;
		if (tasteName == null) {
			if (other.tasteName != null)
				return false;
		} else if (!tasteName.equals(other.tasteName))
			return false;
		if (tasteNum != other.tasteNum)
			return false;
		return true;
	}
	
	
	
}
