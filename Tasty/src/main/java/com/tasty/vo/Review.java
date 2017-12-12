package com.tasty.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Review implements Serializable{
	
	private int reviewNum;
	private String address;
	private String storeName;
	private String email;
	private String title;
	private String content;
	private float ratings;
	private int ups;
	private int downs;
	private String posX;
	private String posY;
	private Date writeDate;
	
	private Member member;
	private List<Menu> menuList;
	private List<TempRoute> tempRouteList; // 생성자가 필요 없음 
	private List<ReviewPhoto> reviewPhotoList; //생성자가 필요 없음 
	
	public Review() {}


	public Review(int reviewNum, int ups, int downs) {
		this.reviewNum = reviewNum;
		this.ups = ups;
		this.downs = downs;
	}




	public Review(int reviewNum, String address, String storeName, String email, String title, String content,
			float ratings, String posX, String posY, List<Menu> menuList) {
		this.reviewNum = reviewNum;
		this.address = address;
		this.storeName = storeName;
		this.email = email;
		this.title = title;
		this.content = content;
		this.ratings = ratings;
		this.posX = posX;
		this.posY = posY;
		this.menuList = menuList;
	}



	public Review(int reviewNum, String address, String storeName, String email, String title, String content,
			float ratings, int ups, int downs, String posX, String posY) {
		this.reviewNum = reviewNum;
		this.address = address;
		this.storeName = storeName;
		this.email = email;
		this.title = title;
		this.content = content;
		this.ratings = ratings;
		this.ups = ups;
		this.downs = downs;
		this.posX = posX;
		this.posY = posY;
	}
	
	

	public Review(int reviewNum, String address, String storeName, String email, String title, String content,
			float ratings, int ups, int downs, String posX, String posY, Member member) {
		this.reviewNum = reviewNum;
		this.address = address;
		this.storeName = storeName;
		this.email = email;
		this.title = title;
		this.content = content;
		this.ratings = ratings;
		this.ups = ups;
		this.downs = downs;
		this.posX = posX;
		this.posY = posY;
		this.member = member;
	}

	
	
	


	public Review(int reviewNum, String address, String storeName, String email, String title, String content,
			float ratings, int ups, int downs, String posX, String posY, Member member, List<Menu> menuList,
			List<TempRoute> tempRouteList, List<ReviewPhoto> reviewPhotoList) {
		this.reviewNum = reviewNum;
		this.address = address;
		this.storeName = storeName;
		this.email = email;
		this.title = title;
		this.content = content;
		this.ratings = ratings;
		this.ups = ups;
		this.downs = downs;
		this.posX = posX;
		this.posY = posY;
		this.member = member;
		this.menuList = menuList;
		this.tempRouteList = tempRouteList;
		this.reviewPhotoList = reviewPhotoList;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getRatings() {
		return ratings;
	}

	public void setRatings(float ratings) {
		this.ratings = ratings;
	}

	public int getUps() {
		return ups;
	}

	public void setUps(int ups) {
		this.ups = ups;
	}

	public int getDowns() {
		return downs;
	}

	public void setDowns(int downs) {
		this.downs = downs;
	}

	public String getPosX() {
		return posX;
	}

	public void setPosX(String posX) {
		this.posX = posX;
	}

	public String getPosY() {
		return posY;
	}

	public void setPosY(String posY) {
		this.posY = posY;
	}
	
	
	

	public Date getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}


	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

	

	public List<ReviewPhoto> getReviewPhotoList() {
		return reviewPhotoList;
	}



	public void setReviewPhotoList(List<ReviewPhoto> reviewPhotoList) {
		this.reviewPhotoList = reviewPhotoList;
	}


	
	public List<TempRoute> getTempRouteList() {
		return tempRouteList;
	}



	public void setTempRouteList(List<TempRoute> tempRouteList) {
		this.tempRouteList = tempRouteList;
	}


	@Override
	public String toString() {
		return String.format(
				"Review [reviewNum=%s, address=%s, storeName=%s, email=%s, title=%s, content=%s, ratings=%s, ups=%s, downs=%s, posX=%s, posY=%s, writeDate=%s, member=%s, menuList=%s, tempRouteList=%s, reviewPhotoList=%s]",
				reviewNum, address, storeName, email, title, content, ratings, ups, downs, posX, posY, writeDate,
				member, menuList, tempRouteList, reviewPhotoList);
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + downs;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + ((menuList == null) ? 0 : menuList.hashCode());
		result = prime * result + ((posX == null) ? 0 : posX.hashCode());
		result = prime * result + ((posY == null) ? 0 : posY.hashCode());
		result = prime * result + Float.floatToIntBits(ratings);
		result = prime * result + reviewNum;
		result = prime * result + ((reviewPhotoList == null) ? 0 : reviewPhotoList.hashCode());
		result = prime * result + ((storeName == null) ? 0 : storeName.hashCode());
		result = prime * result + ((tempRouteList == null) ? 0 : tempRouteList.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ups;
		result = prime * result + ((writeDate == null) ? 0 : writeDate.hashCode());
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
		Review other = (Review) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (downs != other.downs)
			return false;
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
		if (menuList == null) {
			if (other.menuList != null)
				return false;
		} else if (!menuList.equals(other.menuList))
			return false;
		if (posX == null) {
			if (other.posX != null)
				return false;
		} else if (!posX.equals(other.posX))
			return false;
		if (posY == null) {
			if (other.posY != null)
				return false;
		} else if (!posY.equals(other.posY))
			return false;
		if (Float.floatToIntBits(ratings) != Float.floatToIntBits(other.ratings))
			return false;
		if (reviewNum != other.reviewNum)
			return false;
		if (reviewPhotoList == null) {
			if (other.reviewPhotoList != null)
				return false;
		} else if (!reviewPhotoList.equals(other.reviewPhotoList))
			return false;
		if (storeName == null) {
			if (other.storeName != null)
				return false;
		} else if (!storeName.equals(other.storeName))
			return false;
		if (tempRouteList == null) {
			if (other.tempRouteList != null)
				return false;
		} else if (!tempRouteList.equals(other.tempRouteList))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (ups != other.ups)
			return false;
		if (writeDate == null) {
			if (other.writeDate != null)
				return false;
		} else if (!writeDate.equals(other.writeDate))
			return false;
		return true;
	}
	



	
	
	
	
}
