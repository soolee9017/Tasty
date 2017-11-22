package com.tasty.vo;

import java.io.Serializable;

public class AllTaste implements Serializable {

	private int tdNum;
	private int tasteNum;
	private int degreeNum;
	
	private Degree degree;
	private Taste taste;
	
	public AllTaste() {}

	public AllTaste(int tdNum, int tasteNum, int degreeNum) {
		this.tdNum = tdNum;
		this.tasteNum = tasteNum;
		this.degreeNum = degreeNum;
	}

	public AllTaste(int tdNum, int tasteNum, int degreeNum, Degree degree) {
		this.tdNum = tdNum;
		this.tasteNum = tasteNum;
		this.degreeNum = degreeNum;
		this.degree = degree;
	}

	public AllTaste(int tdNum, int tasteNum, int degreeNum, Taste taste) {
		this.tdNum = tdNum;
		this.tasteNum = tasteNum;
		this.degreeNum = degreeNum;
		this.taste = taste;
	}

	public AllTaste(int tdNum, int tasteNum, int degreeNum, Degree degree, Taste taste) {
		this.tdNum = tdNum;
		this.tasteNum = tasteNum;
		this.degreeNum = degreeNum;
		this.degree = degree;
		this.taste = taste;
	}

	public int getTdNum() {
		return tdNum;
	}

	public void setTdNum(int tdNum) {
		this.tdNum = tdNum;
	}

	public int getTasteNum() {
		return tasteNum;
	}

	public void setTasteNum(int tasteNum) {
		this.tasteNum = tasteNum;
	}

	public int getDegreeNum() {
		return degreeNum;
	}

	public void setDegreeNum(int degreeNum) {
		this.degreeNum = degreeNum;
	}

	public Degree getDegree() {
		return degree;
	}

	public void setDegree(Degree degree) {
		this.degree = degree;
	}

	public Taste getTaste() {
		return taste;
	}

	public void setTaste(Taste taste) {
		this.taste = taste;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((degree == null) ? 0 : degree.hashCode());
		result = prime * result + degreeNum;
		result = prime * result + ((taste == null) ? 0 : taste.hashCode());
		result = prime * result + tasteNum;
		result = prime * result + tdNum;
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
		AllTaste other = (AllTaste) obj;
		if (degree == null) {
			if (other.degree != null)
				return false;
		} else if (!degree.equals(other.degree))
			return false;
		if (degreeNum != other.degreeNum)
			return false;
		if (taste == null) {
			if (other.taste != null)
				return false;
		} else if (!taste.equals(other.taste))
			return false;
		if (tasteNum != other.tasteNum)
			return false;
		if (tdNum != other.tdNum)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("AllTaste [tdNum=%s, tasteNum=%s, degreeNum=%s, degree=%s, taste=%s]", tdNum, tasteNum,
				degreeNum, degree, taste);
	}
	
	
	
	
	
}
