package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class Degree implements Serializable{

	private int degreeNum;
	private String degree;
	
	private List<AllTaste> atList;
	
	public Degree() {}

	public Degree(int degreeNum, String degree) {
		this.degreeNum = degreeNum;
		this.degree = degree;
	}

	public Degree(int degreeNum, String degree, List<AllTaste> atList) {
		this.degreeNum = degreeNum;
		this.degree = degree;
		this.atList = atList;
	}

	public int getDegreeNum() {
		return degreeNum;
	}

	public void setDegreeNum(int degreeNum) {
		this.degreeNum = degreeNum;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public List<AllTaste> getAtList() {
		return atList;
	}

	public void setAtList(List<AllTaste> atList) {
		this.atList = atList;
	}

	@Override
	public String toString() {
		return String.format("Degree [degreeNum=%s, degree=%s, atList=%s]", degreeNum, degree, atList);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((atList == null) ? 0 : atList.hashCode());
		result = prime * result + ((degree == null) ? 0 : degree.hashCode());
		result = prime * result + degreeNum;
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
		Degree other = (Degree) obj;
		if (atList == null) {
			if (other.atList != null)
				return false;
		} else if (!atList.equals(other.atList))
			return false;
		if (degree == null) {
			if (other.degree != null)
				return false;
		} else if (!degree.equals(other.degree))
			return false;
		if (degreeNum != other.degreeNum)
			return false;
		return true;
	}
	
	
	
}
