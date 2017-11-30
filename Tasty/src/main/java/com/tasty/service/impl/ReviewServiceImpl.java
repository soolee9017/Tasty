package com.tasty.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tasty.dao.ReviewDAO;
import com.tasty.dao.TasteDAO;
import com.tasty.service.ReviewService;
import com.tasty.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDao;
	
	
	@Autowired
	private TasteDAO tasteDao;
	
	
	@Override
	public List<Review> selectReviewByAddress(String address) {
		return reviewDao.selectReviewByAddress(address);
	}

	@Override
	public List<Review> selectReviewByEmail(String email) {
		return reviewDao.selectReviewByEmail(email);
	}
	
	

	
	
	//insertReview 메소드 안봐도 됨~ 나중에 다 고칠거임~

	@Override
	@Transactional
	public int insertReview(String listOfMenu, String numOfTaste, String listOfTaste, String listOfDegree, String title) {
		
		   String[] menu = listOfMenu.split(",");
		   String[] numTaste = numOfTaste.split(",");
		   String[] taste = listOfTaste.split(",");
		   String[] degree = listOfDegree.split(",");
		   
		   reviewDao.insertReview(title); 
		   //일단 Review 테이블 중 review_num 이랑 title 만 insert하는 방식으로 test 해볼 것이다. (review 테이블의 다른 칼럼은 무시) 
		   //가장 먼저 review table에 데이터를 넣는다. insertReview 에 해당하는 쿼리문을 실행해야지만 review_num_seq.nextVal이 실행이 되고, 
		   // 그 다음에 insertMenu 쿼리문에서 review_num_seq.currval 을 사용 할 수 있기 떄문이다. 
		   // .nextval 을 한 다음에 currval에 넣어야 하므로
		   
		   
		   int num = 0;
		   for(int i = 0; i<menu.length; i++) {
			   reviewDao.insertMenu(menu[i]);
			   	
			   	
			   
			   for(int j = num; j<num+Integer.parseInt(numTaste[i]) ; j++) {
	
				   Map<String,Integer> map = new HashMap<>();
				   map.put("tasteNum", Integer.parseInt(taste[j]));
				   map.put("degreeNum", Integer.parseInt(degree[j]));
				   tasteDao.insertAllTaste(map);
				   reviewDao.insertMenuTaste();
				   
			   }
			   
			   num= num+Integer.parseInt(numTaste[i]);
			   
			   
		   }
		   
		   
		   
		   return 0;
	}

	@Override
	public int deleteReview(String email) {
		return reviewDao.deleteReview(email);
	}


	
	
	

}




