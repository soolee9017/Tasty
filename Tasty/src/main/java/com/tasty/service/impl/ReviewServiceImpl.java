package com.tasty.service.impl;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.tasty.dao.MemberDAO;
import com.tasty.dao.PhotoDAO;
import com.tasty.dao.ReviewDAO;
import com.tasty.dao.TasteDAO;
import com.tasty.service.ReviewService;
import com.tasty.util.PagingBean;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;
import com.tasty.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDao;


	@Autowired
	private TasteDAO tasteDao;

	@Autowired
	private PhotoDAO photoDao;

	@Autowired
	private MemberDAO memberDao;


	@Override
	public List<Review> selectReviewByAddress(String address) {
		return reviewDao.selectReviewByAddress(address);
	}

	@Override
	public Map<String,Object> selectReviewByEmail(String email, int page) {
		
		HashMap<String, Object> map = new HashMap<>();
		PagingBean pb = new PagingBean(reviewDao.selectReviewCount(email),page);
		map.put("pageBean", pb);
		List<Review> list = reviewDao.selectReviewByEmail(email, pb.getBeginItemInPage(), pb.getEndItemInPage());
		map.put("list",list);
		System.out.println(map.get("list"));
		return map;
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

		float ratingFloat = Float.parseFloat(rating);


		Review review = new Review(1,(String)session.getAttribute("eateryJibun"),(String)session.getAttribute("eateryTitle"),
				member.getEmail(),title,content,ratingFloat,0,0,(String)session.getAttribute("lng"),(String)session.getAttribute("lat"));

		String[] menu = listOfMenu.split(",");
		String[] numTaste = numOfTaste.split(",");
		String[] taste = listOfTaste.split(",");
		String[] degree = listOfDegree.split(",");
		String address = (String)session.getAttribute("eateryJibun");

		reviewDao.insertReview(review); 



		File file = new File(request.getServletContext().getRealPath("/photos/review"));

		if(!file.exists()) {
			file.mkdirs();
		}

		for(MultipartFile photo : upImage) {
			if(photo != null && !photo.isEmpty()) {
				String fileName = UUID.randomUUID().toString().replace("-", "")+photo.getOriginalFilename();


				photo.transferTo(new File(request.getServletContext().getRealPath("/photos/review"),fileName));
								 FileCopyUtils.copy(new File(request.getServletContext().getRealPath("/photos/review"),fileName),
									  new File("C:\\JAVA\\GitRepository\\Tasty\\Tasty\\src\\main\\webapp\\photos\\review",fileName));
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

		List<Integer> list = reviewDao.selectReviewNumByEmail(member.getEmail());
		return list.get(0);

	}






	@Override
	@Transactional
	public int updateReview(Principal principal, HttpServletRequest request, String reviewNum, String numOfOg,
			String ogMenuNum, String listOfMenu, String numOfTaste, String listOfTaste, String listOfDegree,
			String rating, String title, String content, List<MultipartFile> upImage, String listOfDelPhoto) throws Exception {

		Map updateMap = new HashMap<>();
		updateMap.put("reviewNum", Integer.parseInt(reviewNum));
		updateMap.put("rating", Float.parseFloat(rating));
		updateMap.put("title",title);
		updateMap.put("content", content);
		
		reviewDao.updateReviewWithMap(updateMap);
		
		String [] listOfDelP = listOfDelPhoto.split(",");
		String[] menu = listOfMenu.split(",");
		String[] numTaste = numOfTaste.split(",");
		String[] taste = listOfTaste.split(",");
		String[] degree = listOfDegree.split(",");
		String [] ogMenuNumber = ogMenuNum.split(",");
		
		//삭제하겠다고 선택한 사진들 전부 삭제  
		for(String a : listOfDelP) {
			photoDao.deleteReviewPhoto(Integer.parseInt(a));
			photoDao.deletePhoto(Integer.parseInt(a));
		}
		
		
		
		// 옛날 메뉴들을 전부 삭제 
		int ogNumber = Integer.parseInt(numOfOg);
		
		for(int i = 0; i<ogNumber; i++){
			
			int menuNum=Integer.parseInt(ogMenuNumber[i]);
		
			List<Integer> TdList = tasteDao.selectTdByMn(menuNum);
			
			tasteDao.deleteMtByMn(menuNum);
			tasteDao.deleteMenuByMn(menuNum);
			for(int a : TdList) {
				tasteDao.deleteAtByTd(a);
			} 
		}
		
		
		//입력된 메뉴들을 새로 DB에 넣기 
		int num = 0;
		for(int i = 0; i<menu.length; i++) {
			Map menuMap = new HashMap<>();
			menuMap.put("reviewNum",  Integer.parseInt(reviewNum));
			menuMap.put("menuName", menu[i]);
			reviewDao.insertMenuWithMn(menuMap);

			for(int j = num; j<num+Integer.parseInt(numTaste[i]) ; j++) {

				Map<String,Integer> map = new HashMap<>();
				map.put("tasteNum", Integer.parseInt(taste[j]));
				map.put("degreeNum", Integer.parseInt(degree[j]));
				tasteDao.insertAllTaste(map);
				reviewDao.insertMenuTaste();

			}

			num= num+Integer.parseInt(numTaste[i]);
		}
		
		// 새로 추가한 사진들을 추가함 
		File file = new File(request.getServletContext().getRealPath("/photos/review"));

		if(!file.exists()) {
			file.mkdirs();
		}
		

		for(MultipartFile photo : upImage) {
			if(photo != null && !photo.isEmpty()) {
				String fileName = UUID.randomUUID().toString().replace("-", "")+photo.getOriginalFilename();


				photo.transferTo(new File(request.getServletContext().getRealPath("/photos/review"),fileName));
								 FileCopyUtils.copy(new File(request.getServletContext().getRealPath("/photos/review"),fileName),
									  new File("C:\\JAVA\\GitRepository\\Tasty\\Tasty\\src\\main\\webapp\\photos\\review",fileName));
				photoDao.insertPhoto(fileName);
				photoDao.insertReviewPhotoWithRn(Integer.parseInt(reviewNum));
			}
		}
		
		
		return 0;
	}

	@Override
	public int deleteReview(String email) {
		return reviewDao.deleteReview(email);
	}

	@Override
	public int updateReviewUpsDowns(Review review) {
		return reviewDao.updateReviewUpsDowns(review);

	}

	@Override	
	public Review selectReviewByNum(int number) {

		return reviewDao.selectReviewByNum(number);
	}

	@Override
	public float averageRating(String address) {
		return reviewDao.averageRating(address);
	}

	@Override
	public List<Review> getListAndMemberByAdd(Principal principal, String address) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member member= (Member)authentication.getPrincipal();

		List<MemberTaste> mtList = memberDao.selectMemberTasteByEmail(member.getEmail());

		List<Review> result = new ArrayList<>();

		for(int i=0; i<mtList.size(); i++) {
			List<Review> reviewList = reviewDao.selectReviewAndMemberByAddress(address, mtList.get(i).getTasteNum());
			result.addAll(reviewList);
		}
		System.out.println("service 실행: "+result);

		return result;
	}

	@Override
	public List<Review> selectAllReviewAndMemberByAddress(String address) {
		return reviewDao.selectAllReviewAndMemberByAddress(address);
	}

	@Override
	public void deletePhoto(int number) {
		
			photoDao.deleteReviewPhoto(number);
			photoDao.deletePhoto(number);
	}








}




