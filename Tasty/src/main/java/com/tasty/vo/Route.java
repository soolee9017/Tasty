package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class Route implements Serializable{

	private int routeNum;
	private String routeName;
	private String content;
	private List<TempRoute> tempRouteList;
	
	public Route() {}

	public Route(int routeNum, String routeName, String content) {
		this.routeNum = routeNum;
		this.routeName = routeName;
		this.content = content;
	}

	public Route(int routeNum, String routeName, String content, List<TempRoute> tempRouteList) {
		this.routeNum = routeNum;
		this.routeName = routeName;
		this.content = content;
		this.tempRouteList = tempRouteList;
	}

	public int getRouteNum() {
		return routeNum;
	}

	public void setRouteNum(int routeNum) {
		this.routeNum = routeNum;
	}

	public String getRouteName() {
		return routeName;
	}

	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<TempRoute> getTempRouteList() {
		return tempRouteList;
	}

	public void setTempRouteList(List<TempRoute> tempRouteList) {
		this.tempRouteList = tempRouteList;
	}

	@Override
	public String toString() {
		return String.format("Route [routeNum=%s, routeName=%s, content=%s, tempRouteList=%s]", routeNum, routeName,
				content, tempRouteList);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((routeName == null) ? 0 : routeName.hashCode());
		result = prime * result + routeNum;
		result = prime * result + ((tempRouteList == null) ? 0 : tempRouteList.hashCode());
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
		Route other = (Route) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (routeName == null) {
			if (other.routeName != null)
				return false;
		} else if (!routeName.equals(other.routeName))
			return false;
		if (routeNum != other.routeNum)
			return false;
		if (tempRouteList == null) {
			if (other.tempRouteList != null)
				return false;
		} else if (!tempRouteList.equals(other.tempRouteList))
			return false;
		return true;
	}
	
	
	
	
}
