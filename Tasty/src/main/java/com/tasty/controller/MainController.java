package com.tasty.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.MemberDAO;
import com.tasty.service.MemberService;
import com.tasty.service.TasteService;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;
import com.tasty.vo.Taste;

@Controller
public class MainController {

	@Autowired
	private MemberDAO memberDao;

	@Autowired
	private MemberService service;
	
	@Autowired
	TasteService tasteService;
	
	/**
	 * 회원 등록(가입)
	 * 회원은 사진업로드를 하므로 처리한다.
	 * 처리후 join_success.do를 이용해 응답 처리 - redirect방식 이동, 요청파라미터로 등록된 userId 전달
	 * @param user
	 * @return
	 * @throws DuplicatedMemberException 
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("join_member")
	public ModelAndView registerMember(HttpServletRequest request, @RequestParam String email, @RequestParam String password, @RequestParam String name, @RequestParam String nickname,
			@RequestParam String phoneNum, @RequestParam String gender, @RequestParam List<String> tastes) {
		Member member = new Member(email, password, name, nickname, phoneNum, gender);
		System.out.println("controller로 왔멘");
		System.out.println(tastes);
		service.addMember(member, "ROLE_MEMBER");
		List<Taste> tasteList = (List<Taste>)tasteService.selectAllTaste();
		for(int i=0; i<tastes.size(); i++) {
			for(int j=0; j<tasteList.size(); j++) {
				if(tastes.get(i).equals(tasteList.get(j).getTasteName())) {
					service.addMemberTaste(new MemberTaste(email, tasteList.get(j).getTasteNum()));
					System.out.println(tasteList.get(j).getTasteNum());
				}
			}
		}
				
		return new ModelAndView("redirect:join_success.do", "email", member.getEmail());
	}
	
	
/*	@ExceptionHandler(DuplicateKeyException.class)
	public String handleException() {
		return "redirect:join_member.do";
	}
*/	
	@RequestMapping("join_success")
	   public ModelAndView joinSuccess(@RequestParam String email){
	      Member member = service.selectMemberByEmail(email);
	      System.out.println("가입했어욘 → " + member);
	      return new ModelAndView("content/main.tiles");
	   }
	
	
	@RequestMapping("emailCheck")
	public String emailCheck(HttpServletRequest request, @RequestParam String email){
		System.out.println("이메일 : "+email);
		request.setAttribute("email", email);
		return "redirect:email_check.jsp";
	}
	
	@RequestMapping("duplicatedCheck")
	@ResponseBody
	public int duplicatedCheck(@RequestParam String email) {
		System.out.println("확인할 email : "+email );
		if(service.selectMemberByEmail(email) == null) {
			return 1;
		}else {
			return 0;
		}
	}
	
}












