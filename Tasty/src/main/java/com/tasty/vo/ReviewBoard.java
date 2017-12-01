package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewBoard implements Serializable {

	private String rating;
	private String title;
	private String content;
	private String listOfMenu;
	private String numOfTaste;
	private String listOfTaste;
	private String listOfDegree;
	
	private List<MultipartFile> upImage;

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
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

	public String getListOfMenu() {
		return listOfMenu;
	}

	public void setListOfMenu(String listOfMenu) {
		this.listOfMenu = listOfMenu;
	}

	public String getNumOfTaste() {
		return numOfTaste;
	}

	public void setNumOfTaste(String numOfTaste) {
		this.numOfTaste = numOfTaste;
	}

	public String getListOfTaste() {
		return listOfTaste;
	}

	public void setListOfTaste(String listOfTaste) {
		this.listOfTaste = listOfTaste;
	}

	public String getListOfDegree() {
		return listOfDegree;
	}

	public void setListOfDegree(String listOfDegree) {
		this.listOfDegree = listOfDegree;
	}

	public List<MultipartFile> getUpImage() {
		return upImage;
	}

	public void setUpImage(List<MultipartFile> upImage) {
		this.upImage = upImage;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((listOfDegree == null) ? 0 : listOfDegree.hashCode());
		result = prime * result + ((listOfMenu == null) ? 0 : listOfMenu.hashCode());
		result = prime * result + ((listOfTaste == null) ? 0 : listOfTaste.hashCode());
		result = prime * result + ((numOfTaste == null) ? 0 : numOfTaste.hashCode());
		result = prime * result + ((rating == null) ? 0 : rating.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((upImage == null) ? 0 : upImage.hashCode());
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
		ReviewBoard other = (ReviewBoard) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (listOfDegree == null) {
			if (other.listOfDegree != null)
				return false;
		} else if (!listOfDegree.equals(other.listOfDegree))
			return false;
		if (listOfMenu == null) {
			if (other.listOfMenu != null)
				return false;
		} else if (!listOfMenu.equals(other.listOfMenu))
			return false;
		if (listOfTaste == null) {
			if (other.listOfTaste != null)
				return false;
		} else if (!listOfTaste.equals(other.listOfTaste))
			return false;
		if (numOfTaste == null) {
			if (other.numOfTaste != null)
				return false;
		} else if (!numOfTaste.equals(other.numOfTaste))
			return false;
		if (rating == null) {
			if (other.rating != null)
				return false;
		} else if (!rating.equals(other.rating))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (upImage == null) {
			if (other.upImage != null)
				return false;
		} else if (!upImage.equals(other.upImage))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format(
				"ReviewBoard [rating=%s, title=%s, content=%s, listOfMenu=%s, numOfTaste=%s, listOfTaste=%s, listOfDegree=%s, upImage=%s]",
				rating, title, content, listOfMenu, numOfTaste, listOfTaste, listOfDegree, upImage);
	}
	
	
	
	
}
