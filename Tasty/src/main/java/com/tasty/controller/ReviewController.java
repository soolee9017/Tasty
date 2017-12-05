package com.tasty.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.MemberDAO;
import com.tasty.dao.ReviewDAO;
import com.tasty.service.ReviewService;
import com.tasty.service.TasteService;
import com.tasty.vo.Member;
import com.tasty.vo.Review;
import com.tasty.vo.ReviewUpsDownsCheck;
import com.tasty.vo.Taste;

@Controller
@RequestMapping("/review/")
public class ReviewController {

   @Autowired
   ReviewService reviewService;
   
   @Autowired
   TasteService tasteService;
   
   @Autowired
   ReviewDAO reviewDao;
   
   @Autowired
   MemberDAO memberDao;
   
   @RequestMapping("getAllReviewByAddress")
   @ResponseBody
   public List<Review> getAllReviewByAddress(@RequestParam String address){
      List<Review> list = reviewService.selectAllReviewAndMemberByAddress(address);
      return list;
   }
   
    @RequestMapping("getReviewByAddress")
   @ResponseBody
   public List<Review> getReviewByAddress(Principal principal, @RequestParam String address){
    	
      List<Review> list = reviewService.getListAndMemberByAdd(principal, address);
      return list;
   }
   
  @RequestMapping("registerReview")
   public ModelAndView registerReview(Principal principal,HttpServletRequest request, @RequestParam String listOfMenu, @RequestParam String numOfTaste,
         @RequestParam String listOfTaste,@RequestParam String listOfDegree,@RequestParam String rating, @RequestParam String title,
         @RequestParam String content,@RequestParam List<MultipartFile> upImage) throws Exception {
         
	  int num = reviewService.insertReview(principal,request,listOfMenu, numOfTaste, listOfTaste, listOfDegree, rating, title, content, upImage);
         
         Review review = reviewService.selectReviewByNum(num);
         return new ModelAndView("review/reviewDetail.jsp","review",review);
   }
  
  @RequestMapping("selectReviewByNum")
  public ModelAndView selectReview(@RequestParam String reviewNum) {
	
	 int number=Integer.parseInt(reviewNum);
	  Review review = reviewService.selectReviewByNum(number);
	  return new ModelAndView("review/reviewDetail.jsp","review",review);
}
  
  
  @RequestMapping("updateReviewUps")
  @ResponseBody
  public int updateReviewUps(Principal principal, @RequestParam int reviewNum) {
	  Review review = reviewService.selectReviewByNum(reviewNum); //해당 리뷰번호를 가진 Review를 업데이트 할 것이다.
	  Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	  Member member = (Member)authentication.getPrincipal();
	  
	  if(reviewDao.selectCheck(member.getEmail(), reviewNum)==null) {
		  reviewService.updateReviewUpsDowns(new Review(reviewNum, review.getUps()+1 , review.getDowns())); //select해 온 review번호의 리뷰에 추천수/비추천수 update.
		  reviewDao.insertCheck(new ReviewUpsDownsCheck(member.getEmail(), reviewNum));
		  
		  memberDao.updateMemberUps(review.getEmail());// 해당 리뷰 작성자의 member 데이터의 total_ups를 업데이트 
		  
		  return reviewService.selectReviewByNum(reviewNum).getUps(); //업데이트한 리뷰를 searchClick.jsp에 return.
		  
	  }
	  return -1;
  }
  
  @RequestMapping("updateReviewDowns")
  @ResponseBody
  public int updateReviewDowns(Principal principal, @RequestParam int reviewNum) {
	  Review review = reviewService.selectReviewByNum(reviewNum); //해당 리뷰번호를 가진 Review를 업데이트 할 것이다.
	  Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	  Member member = (Member)authentication.getPrincipal();
	  
	  if(reviewDao.selectCheck(member.getEmail(), reviewNum)==null) {
		  reviewService.updateReviewUpsDowns(new Review(reviewNum, review.getUps() , review.getDowns()+1)); //select해 온 review번호의 리뷰에 추천수/비추천수 update.
		  reviewDao.insertCheck(new ReviewUpsDownsCheck(member.getEmail(), reviewNum));
		  
		  memberDao.updateMemberDowns(review.getEmail()); //해당 리뷰 작성자의 member 데이터의 total_downs 를 업데이트
		  
		  return reviewService.selectReviewByNum(reviewNum).getDowns();
	  }
	  
	  return -1; //업데이트한 리뷰를 searchClick.jsp에 return.
  }
  
  
  @RequestMapping("getAverageRating")
  @ResponseBody
  public String getAverageRating(@RequestParam String address){

	  DecimalFormat df = new DecimalFormat("#######.##");
	  String avg = df.format(reviewService.averageRating(address));
	  
	  float average = reviewService.averageRating(address);
	  
	  return avg;
  }
  
  @RequestMapping("getReviewByEmail")
  public ModelAndView getReviewByEmail(@RequestParam String email){

	 List<Review> list = reviewService.selectReviewByEmail(email);
	 return new ModelAndView("member/mypage_review.jsp","list",list);
  }
  
  
  @RequestMapping("changeReview")
  public ModelAndView changeReview(@RequestParam String reviewNum, ModelMap model){

	  int number=Integer.parseInt(reviewNum);
	  Review review = reviewService.selectReviewByNum(number);
	  
	  List tasteList = tasteService.selectAllTaste();
	  List degreeList= tasteService.selectAllDegree();
	  model.addAttribute("review",review);
	  model.addAttribute("tasteList",tasteList);
	  model.addAttribute("degreeList",degreeList);
	  return new ModelAndView("review/changeReview.jsp");
  }
  
  @RequestMapping("updateReview")
  public ModelAndView updateReview(Principal principal,HttpServletRequest request,
		  @RequestParam String reviewNum,
  @RequestParam String numOfOg,@RequestParam String ogMenuNum,
  @RequestParam String listOfMenu, @RequestParam String numOfTaste,
  @RequestParam String listOfTaste,@RequestParam String listOfDegree,@RequestParam String rating,
  @RequestParam String title,
  @RequestParam String content,@RequestParam List<MultipartFile> upImage) throws Exception{
	
	
	  
	  
	  reviewService.updateReview(principal, request, reviewNum, numOfOg, ogMenuNum, 
			  listOfMenu, numOfTaste, listOfTaste, listOfDegree, rating, title, content, upImage);
	  
	  Review review = reviewService.selectReviewByNum(Integer.parseInt(reviewNum));
	  
	  return new ModelAndView("review/reviewDetail.jsp","review",review);
  }
  
  
  @RequestMapping("deletePhoto")
  @ResponseBody
  public String deletePhoto(@RequestParam String photoNum){

	 reviewService.deletePhoto(Integer.parseInt(photoNum));
	 return "삭제됨";
  }
  
  
}