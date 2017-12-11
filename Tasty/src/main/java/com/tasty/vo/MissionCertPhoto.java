package com.tasty.vo;

import java.util.List;

public class MissionCertPhoto {
   private int photoNum;
   private int missionCertNum;
   
   private MissionCert missionCert;
   private Photo photo;
public MissionCertPhoto() {
}
public MissionCertPhoto(int photoNum, int missionCertNum) {
	this.photoNum = photoNum;
	this.missionCertNum = missionCertNum;
}
public MissionCertPhoto(int photoNum, int missionCertNum, MissionCert missionCert) {
	this.photoNum = photoNum;
	this.missionCertNum = missionCertNum;
	this.missionCert = missionCert;
}
public MissionCertPhoto(int photoNum, int missionCertNum, Photo photo) {
	this.photoNum = photoNum;
	this.missionCertNum = missionCertNum;
	this.photo = photo;
}
public MissionCertPhoto(int photoNum, int missionCertNum, MissionCert missionCert, Photo photo) {
	this.photoNum = photoNum;
	this.missionCertNum = missionCertNum;
	this.missionCert = missionCert;
	this.photo = photo;
}
public int getPhotoNum() {
	return photoNum;
}
public void setPhotoNum(int photoNum) {
	this.photoNum = photoNum;
}
public int getMissionCertNum() {
	return missionCertNum;
}
public void setMissionCertNum(int missionCertNum) {
	this.missionCertNum = missionCertNum;
}
public MissionCert getMissionCert() {
	return missionCert;
}
public void setMissionCert(MissionCert missionCert) {
	this.missionCert = missionCert;
}
public Photo getPhoto() {
	return photo;
}
public void setPhoto(Photo photo) {
	this.photo = photo;
}
@Override
public String toString() {
	return "MissionCertPhoto [photoNum=" + photoNum + ", missionCertNum=" + missionCertNum + ", missionCert="
			+ missionCert + ", photo=" + photo + "]";
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((missionCert == null) ? 0 : missionCert.hashCode());
	result = prime * result + missionCertNum;
	result = prime * result + ((photo == null) ? 0 : photo.hashCode());
	result = prime * result + photoNum;
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
	MissionCertPhoto other = (MissionCertPhoto) obj;
	if (missionCert == null) {
		if (other.missionCert != null)
			return false;
	} else if (!missionCert.equals(other.missionCert))
		return false;
	if (missionCertNum != other.missionCertNum)
		return false;
	if (photo == null) {
		if (other.photo != null)
			return false;
	} else if (!photo.equals(other.photo))
		return false;
	if (photoNum != other.photoNum)
		return false;
	return true;
}
   
   
   
   
}