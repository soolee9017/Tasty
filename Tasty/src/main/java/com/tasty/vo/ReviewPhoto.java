package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class ReviewPhoto implements Serializable {

	private int photoNum;
	private int reviewNum;
	
	private Review review;
	private List<Photo> photoList;
	
	public ReviewPhoto() {}

	public ReviewPhoto(int photoNum, int reviewNum) {
		this.photoNum = photoNum;
		this.reviewNum = reviewNum;
	}

	public ReviewPhoto(int photoNum, int reviewNum, Review review) {
		this.photoNum = photoNum;
		this.reviewNum = reviewNum;
		this.review = review;
	}

	public ReviewPhoto(int photoNum, int reviewNum, List<Photo> photoList) {
		this.photoNum = photoNum;
		this.reviewNum = reviewNum;
		this.photoList = photoList;
	}

	public ReviewPhoto(int photoNum, int reviewNum, Review review, List<Photo> photoList) {
		this.photoNum = photoNum;
		this.reviewNum = reviewNum;
		this.review = review;
		this.photoList = photoList;
	}

	public int getPhotoNum() {
		return photoNum;
	}

	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public List<Photo> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<Photo> photoList) {
		this.photoList = photoList;
	}

	@Override
	public String toString() {
		return String.format("ReviewPhoto [photoNum=%s, reviewNum=%s, review=%s, photoList=%s]", photoNum, reviewNum,
				review, photoList);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((photoList == null) ? 0 : photoList.hashCode());
		result = prime * result + photoNum;
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
		ReviewPhoto other = (ReviewPhoto) obj;
		if (photoList == null) {
			if (other.photoList != null)
				return false;
		} else if (!photoList.equals(other.photoList))
			return false;
		if (photoNum != other.photoNum)
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
	
	
	
}
