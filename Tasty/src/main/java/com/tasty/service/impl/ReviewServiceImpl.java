package com.tasty.service.impl;

import java.util.List;

import org.apache.tiles.request.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.tasty.dao.ReviewDAO;
import com.tasty.service.ReviewService;
import com.tasty.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO reviewDao;
	
	@Override
	public List<Review> selectReviewByAddress(String address) {
		return reviewDao.selectReviewByAddress(address);
	}
	
	


}




