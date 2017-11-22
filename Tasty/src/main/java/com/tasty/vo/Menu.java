package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class Menu implements Serializable {

	private int menuNum;
	private int reviewNum;
	private String menuName;
	
	private Review review;
	private List<MenuTaste> mtList;
	
	public Menu() {}

	public Menu(int menuNum, int reviewNum, String menuName) {
		this.menuNum = menuNum;
		this.reviewNum = reviewNum;
		this.menuName = menuName;
	}

	public Menu(int menuNum, int reviewNum, String menuName, Review review) {
		this.menuNum = menuNum;
		this.reviewNum = reviewNum;
		this.menuName = menuName;
		this.review = review;
	}

	public Menu(int menuNum, int reviewNum, String menuName, List<MenuTaste> mtList) {
		this.menuNum = menuNum;
		this.reviewNum = reviewNum;
		this.menuName = menuName;
		this.mtList = mtList;
	}

	public Menu(int menuNum, int reviewNum, String menuName, Review review, List<MenuTaste> mtList) {
		this.menuNum = menuNum;
		this.reviewNum = reviewNum;
		this.menuName = menuName;
		this.review = review;
		this.mtList = mtList;
	}

	public int getMenuNum() {
		return menuNum;
	}

	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public List<MenuTaste> getMtList() {
		return mtList;
	}

	public void setMtList(List<MenuTaste> mtList) {
		this.mtList = mtList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((menuName == null) ? 0 : menuName.hashCode());
		result = prime * result + menuNum;
		result = prime * result + ((mtList == null) ? 0 : mtList.hashCode());
		result = prime * result + ((review == null) ? 0 : review.hashCode());
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
		Menu other = (Menu) obj;
		if (menuName == null) {
			if (other.menuName != null)
				return false;
		} else if (!menuName.equals(other.menuName))
			return false;
		if (menuNum != other.menuNum)
			return false;
		if (mtList == null) {
			if (other.mtList != null)
				return false;
		} else if (!mtList.equals(other.mtList))
			return false;
		if (review == null) {
			if (other.review != null)
				return false;
		} else if (!review.equals(other.review))
			return false;
		if (reviewNum != other.reviewNum)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("Menu [menuNum=%s, reviewNum=%s, menuName=%s, review=%s, mtList=%s]", menuNum, reviewNum,
				menuName, review, mtList);
	}
	
	
	
	
}
