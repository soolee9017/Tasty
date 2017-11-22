package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class MenuTaste implements Serializable {
	
	private int menuNum;
	private int tdNum;
	
	private Menu menu;
	private AllTaste allTaste;
	
	public MenuTaste() {}

	public MenuTaste(int menuNum, int tdNum) {
		this.menuNum = menuNum;
		this.tdNum = tdNum;
	}

	public MenuTaste(int menuNum, int tdNum, Menu menu) {
		this.menuNum = menuNum;
		this.tdNum = tdNum;
		this.menu = menu;
	}

	public MenuTaste(int menuNum, int tdNum, AllTaste allTaste) {
		this.menuNum = menuNum;
		this.tdNum = tdNum;
		this.allTaste = allTaste;
	}

	public MenuTaste(int menuNum, int tdNum, Menu menu, AllTaste allTaste) {
		this.menuNum = menuNum;
		this.tdNum = tdNum;
		this.menu = menu;
		this.allTaste = allTaste;
	}

	@Override
	public String toString() {
		return String.format("MenuTaste [menuNum=%s, tdNum=%s, menu=%s, allTaste=%s]", menuNum, tdNum, menu, allTaste);
	}

	public int getMenuNum() {
		return menuNum;
	}

	public void setMenuNum(int menuNum) {
		this.menuNum = menuNum;
	}

	public int getTdNum() {
		return tdNum;
	}

	public void setTdNum(int tdNum) {
		this.tdNum = tdNum;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public AllTaste getAllTaste() {
		return allTaste;
	}

	public void setAllTaste(AllTaste allTaste) {
		this.allTaste = allTaste;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((allTaste == null) ? 0 : allTaste.hashCode());
		result = prime * result + ((menu == null) ? 0 : menu.hashCode());
		result = prime * result + menuNum;
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
		MenuTaste other = (MenuTaste) obj;
		if (allTaste == null) {
			if (other.allTaste != null)
				return false;
		} else if (!allTaste.equals(other.allTaste))
			return false;
		if (menu == null) {
			if (other.menu != null)
				return false;
		} else if (!menu.equals(other.menu))
			return false;
		if (menuNum != other.menuNum)
			return false;
		if (tdNum != other.tdNum)
			return false;
		return true;
	}
	
	

}
