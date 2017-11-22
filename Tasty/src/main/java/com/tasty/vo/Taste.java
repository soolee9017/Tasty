package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class Taste implements Serializable {

	private int tasteNum;
	private String tasteName;
	
	private List<AllTaste> atList;
	
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

	@Override
	public String toString() {
		return String.format("Taste [tasteNum=%s, tasteName=%s, atList=%s]", tasteNum, tasteName, atList);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((atList == null) ? 0 : atList.hashCode());
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
