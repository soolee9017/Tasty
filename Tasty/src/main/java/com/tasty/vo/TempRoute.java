package com.tasty.vo;

import java.io.Serializable;

public class TempRoute implements Serializable{

	private int routeNum;
	private int reviewNum;
	
	private Review review;
	private Route route;
	
	public TempRoute() {}

	public TempRoute(int routeNum, int reviewNum) {
		this.routeNum = routeNum;
		this.reviewNum = reviewNum;
	}

	public TempRoute(int routeNum, int reviewNum, Review review) {
		this.routeNum = routeNum;
		this.reviewNum = reviewNum;
		this.review = review;
	}

	public TempRoute(int routeNum, int reviewNum, Route route) {
		this.routeNum = routeNum;
		this.reviewNum = reviewNum;
		this.route = route;
	}

	public TempRoute(int routeNum, int reviewNum, Review review, Route route) {
		this.routeNum = routeNum;
		this.reviewNum = reviewNum;
		this.review = review;
		this.route = route;
	}

	public int getRouteNum() {
		return routeNum;
	}

	public void setRouteNum(int routeNum) {
		this.routeNum = routeNum;
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

	public Route getRoute() {
		return route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	@Override
	public String toString() {
		return String.format("TempRoute [routeNum=%s, reviewNum=%s, review=%s, route=%s]", routeNum, reviewNum, review,
				route);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((review == null) ? 0 : review.hashCode());
		result = prime * result + reviewNum;
		result = prime * result + ((route == null) ? 0 : route.hashCode());
		result = prime * result + routeNum;
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
		TempRoute other = (TempRoute) obj;
		if (review == null) {
			if (other.review != null)
				return false;
		} else if (!review.equals(other.review))
			return false;
		if (reviewNum != other.reviewNum)
			return false;
		if (route == null) {
			if (other.route != null)
				return false;
		} else if (!route.equals(other.route))
			return false;
		if (routeNum != other.routeNum)
			return false;
		return true;
	}
	
	
	
	
	
}
