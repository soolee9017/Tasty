package com.tasty.service.impl;

import java.io.File;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tasty.dao.PhotoDAO;
import com.tasty.dao.ReviewDAO;
import com.tasty.dao.TasteDAO;
import com.tasty.service.ReviewService;
import com.tasty.vo.Member;
import com.tasty.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDao;
	
	
	@Autowired
	private TasteDAO tasteDao;
	
	@Autowired
	private PhotoDAO photoDao;
	
	
	@Override
	public List<Review> selectReviewByAddress(String address) {
		return reviewDao.selectReviewByAddress(address);
	}

	@Override
	public List<Review> selectReviewByEmail(String email) {
		return reviewDao.selectReviewByEmail(email);
	}
	


	@Override
	@Transactional
	public int insertReview(Principal principal,HttpServletRequest request, String listOfMenu, String numOfTaste, 
			String listOfTaste, String listOfDegree, String rating, 
			String title,String content, List<MultipartFile> upImage)
			throws Exception{
		
			HttpSession session = request.getSession();
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			Member member= (Member)authentication.getPrincipal();

			//읭?
			float ratingFloat = Float.parseFloat(rating);
			
			

			Review review = new Review(1,(String)session.getAttribute("eateryJibun"),(String)session.getAttribute("eateryTitle"),
					member.getEmail(),title,content,ratingFloat,0,0,(String)session.getAttribute("lng"),(String)session.getAttribute("lat"));
			
			
		   String[] menu = listOfMenu.split(",");
		   String[] numTaste = numOfTaste.split(",");
		   String[] taste = listOfTaste.split(",");
		   String[] degree = listOfDegree.split(",");
		   String address = (String)session.getAttribute("eateryJibun");
		   
		   reviewDao.insertReview(review); 
		   
		   
		   File file = new File("C:\\test\\review");
		   if(!file.exists()) {
			   file.mkdirs();
		   }
		  
			   for(MultipartFile photo : upImage) {
				   if(photo != null && !photo.isEmpty()) {
				   String fileName = UUID.randomUUID().toString().replace("-", "")+"+"+photo.getOriginalFilename();
				   
				   photo.transferTo(new File("C:\\test\\review",fileName));
				   photoDao.insertPhoto(fileName);
				   photoDao.insertReviewPhoto();
				   }
			   }
			   
			   
		   
		   
		   
		   
		   
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

	@Override
	public Review selectReviewByNum(int number) {
		
		return reviewDao.selectReviewByNum(number);
	}


	
	
	

}




