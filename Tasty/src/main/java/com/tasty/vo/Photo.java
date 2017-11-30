package com.tasty.vo;

import java.io.Serializable;

public class Photo implements Serializable {

	private int photoNum;
	private String photoPath;
	
	private ReviewPhoto reviewPhoto;
	
	//private MissionCertPhoto
	private MissionCertPhoto missionCertPhoto;
	
	//private MissionPhoto 해야함 
	private MissionPhoto missionPhoto;

	public Photo() {
	}

	public Photo(int photoNum, String photoPath, ReviewPhoto reviewPhoto, MissionCertPhoto missionCertPhoto,
			MissionPhoto missionPhoto) {
		this.photoNum = photoNum;
		this.photoPath = photoPath;
		this.reviewPhoto = reviewPhoto;
		this.missionCertPhoto = missionCertPhoto;
		this.missionPhoto = missionPhoto;
	}

	public Photo(int photoNum, String photoPath, ReviewPhoto reviewPhoto) {
		this.photoNum = photoNum;
		this.photoPath = photoPath;
		this.reviewPhoto = reviewPhoto;
	}

	public Photo(int photoNum, String photoPath, MissionCertPhoto missionCertPhoto) {
		this.photoNum = photoNum;
		this.photoPath = photoPath;
		this.missionCertPhoto = missionCertPhoto;
	}

	public Photo(int photoNum, String photoPath, MissionPhoto missionPhoto) {
		this.photoNum = photoNum;
		this.photoPath = photoPath;
		this.missionPhoto = missionPhoto;
	}

	public int getPhotoNum() {
		return photoNum;
	}

	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public ReviewPhoto getReviewPhoto() {
		return reviewPhoto;
	}

	public void setReviewPhoto(ReviewPhoto reviewPhoto) {
		this.reviewPhoto = reviewPhoto;
	}

	public MissionCertPhoto getMissionCertPhoto() {
		return missionCertPhoto;
	}

	public void setMissionCertPhoto(MissionCertPhoto missionCertPhoto) {
		this.missionCertPhoto = missionCertPhoto;
	}

	public MissionPhoto getMissionPhoto() {
		return missionPhoto;
	}

	public void setMissionPhoto(MissionPhoto missionPhoto) {
		this.missionPhoto = missionPhoto;
	}

	@Override
	public String toString() {
		return "Photo [photoNum=" + photoNum + ", photoPath=" + photoPath + ", reviewPhoto=" + reviewPhoto
				+ ", missionCertPhoto=" + missionCertPhoto + ", missionPhoto=" + missionPhoto + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((missionCertPhoto == null) ? 0 : missionCertPhoto.hashCode());
		result = prime * result + ((missionPhoto == null) ? 0 : missionPhoto.hashCode());
		result = prime * result + photoNum;
		result = prime * result + ((photoPath == null) ? 0 : photoPath.hashCode());
		result = prime * result + ((reviewPhoto == null) ? 0 : reviewPhoto.hashCode());
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
		Photo other = (Photo) obj;
		if (missionCertPhoto == null) {
			if (other.missionCertPhoto != null)
				return false;
		} else if (!missionCertPhoto.equals(other.missionCertPhoto))
			return false;
		if (missionPhoto == null) {
			if (other.missionPhoto != null)
				return false;
		} else if (!missionPhoto.equals(other.missionPhoto))
			return false;
		if (photoNum != other.photoNum)
			return false;
		if (photoPath == null) {
			if (other.photoPath != null)
				return false;
		} else if (!photoPath.equals(other.photoPath))
			return false;
		if (reviewPhoto == null) {
			if (other.reviewPhoto != null)
				return false;
		} else if (!reviewPhoto.equals(other.reviewPhoto))
			return false;
		return true;
	}
	
	
	
}
