package com.tasty.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.MemberService;
import com.tasty.vo.Member;

@Controller
public class MainController {

	@Autowired
	private MemberService service;
	
	/**
	 * 회원 등록(가입)
	 * 회원은 사진업로드를 하므로 처리한다.
	 * 처리후 join_success.do를 이용해 응답 처리 - redirect방식 이동, 요청파라미터로 등록된 userId 전달
	 * @param user
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("join_member")
	public ModelAndView registerMember(@RequestParam String email, @RequestParam String password, @RequestParam String name, @RequestParam String nickname, @RequestParam String phoneNum, @RequestParam String gender) {
		Member member = new Member(email, password, name, nickname, phoneNum, gender);
		service.addMember(member, "ROLE_MEMBER");
		return new ModelAndView("redirect:join_success.do", "email", member.getEmail());
	}
	
	   @RequestMapping("join_success")
	   public ModelAndView joinSuccess(@RequestParam String email){
	      Member member = service.selectMemberByEmail(email);
	      System.out.println(member);
	      return new ModelAndView("member/join_success.tiles", "member", member);
	   }
	
	
}
