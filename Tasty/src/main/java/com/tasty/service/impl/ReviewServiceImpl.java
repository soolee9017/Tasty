package com.tasty.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasty.dao.ReviewDAO;
import com.tasty.dao.TasteDAO;
import com.tasty.service.ReviewService;
import com.tasty.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	int index = 1;
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
	
	
	@Override
	public int insertReview(Review review) {
		return reviewDao.insertReview(review);
	}
	
	
	//insertReview 메소드 안봐도 됨~ 나중에 다 고칠거임~

	@Override
	public int insertReview(String finalArr, String title) {
		
		
		   String[] menus = finalArr.split(","); 
		   List<String> menuList = new ArrayList<String>();
		      
		      for(String menu : menus) {
		         menuList.add(menu); //menuList 라는 list에 menus 배열에 있는 값들을 넣는다.
		      }
		      
		      // menuList 에는 다음과 같이 담긴다 :list형태 , [메뉴1, 짠, 2, 감칠, 1, /, 메뉴2, 신, 1, /]
		   int listSize = menuList.size();
		   List<String> menus2 = null;
		   List<String> degree = null;
		   List<String> taste = null;
		   menus2.add(menuList.get(0));
		   for(int i = 0; i<listSize; i++) {
			   if(menuList.get(i).equals("/")) {
				  menus2.add(menuList.get(i+1));
				  for(int j = index; i<j; j++) {
					   if(menuList.get(j).equals("짠") || menuList.get(j).equals("단") || menuList.get(j).equals("신") || menuList.get(j).equals("싱거운")
							   || menuList.get(j).equals("매운") || menuList.get(j).equals("감칠") || menuList.get(j).equals("쓴") || menuList.get(j).equals("완벽한")) {
						   taste.add(menuList.get(j));
					   }else {
						   degree.add(menuList.get(j));
					   }
					   
				   }
			   }
			   index += 1;
		   }
		   
		   
		   
		   reviewDao.insertReview(title); 
		   //일단 Review 테이블 중 review_num 이랑 title 만 insert하는 방식으로 test 해볼 것이다. (review 테이블의 다른 칼럼은 무시) 
		   //가장 먼저 review table에 데이터를 넣는다. insertReview 에 해당하는 쿼리문을 실행해야지만 review_num_seq.nextVal이 실행이 되고, 
		   // 그 다음에 insertMenu 쿼리문에서 review_num_seq.currval 을 사용 할 수 있기 떄문이다. 
		   // .nextval 을 한 다음에 currval에 넣어야 하므로
		   
		   int numOfMenu = 0; //메뉴의 개수 
		   for(int i=0; i<listSize ; i++) {
			   if(menuList.get(i).equals("/")) {
				   numOfMenu++; // menuList에는 메뉴의 개수만큼 "/"가 들어있으므로 
			   }
		   }
		   
		   
		   return 0;
	}

	@Override
	public int deleteReview(String email) {
		return reviewDao.deleteReview(email);
	}


	
	
	

}




