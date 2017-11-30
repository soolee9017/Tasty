package com.tasty.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.MemberDAO;
import com.tasty.service.MemberService;
import com.tasty.service.TasteService;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;
import com.tasty.vo.Taste;

@Controller
@RequestMapping("/member/")
public class MemberController{
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	MemberService service;
	
	@Autowired
	TasteService tasteService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	@RequestMapping("update_member")
	public ModelAndView updateMemberByEmail(@RequestParam String email, @RequestParam String password, @RequestParam String name, @RequestParam String nickname,
			@RequestParam String phoneNum, @RequestParam String gender, @RequestParam List<String> tastes) {
		Member member = new Member(email, password, name, nickname, phoneNum, gender);
		System.out.println("우엥");
		System.out.println(tastes);
		service.updateMemberByEmail(member);
		service.removeMemberTasteByEmail(email);
		List<Taste> tasteList = (List<Taste>)tasteService.selectAllTaste();
		System.out.println(tasteList);
		for(int i=0; i<tastes.size(); i++) {
			for(int j=0; j<tasteList.size(); j++) {
				if(tastes.get(i).equals(tasteList.get(j).getTasteName())) {
					service.addMemberTaste(new MemberTaste(email, tasteList.get(j).getTasteNum()));
					System.out.println(tasteList.get(j).getTasteNum());
		
	}
			}
		}
		return new ModelAndView("member/mypage.jsp", "member", member);
			}
	
	
	
	@RequestMapping("removeMemberByEmail")
	public ModelAndView removeMemberByEmail(@RequestParam String email) {
		System.out.println(email);
		service.removeMemberByEmail(email);
		return new ModelAndView("redirect:index.do", "result", email);
	}
	
	
	@RequestMapping("withdrawMemberByEmail")
	public String withdrawMemberByEmail(@RequestParam Authentication authentication) throws AuthenticationException{
		System.out.println(authentication.getName());
		dao.withdrawMemberByEmail(authentication.getName());
		
//		service.withdrawMemberByEmail(authentication.getName());
		return "redirect:index.do";
	}
	
/*	@RequestMapping("withdrawMemberByEmail")
	public String withdrawMemberByEmail(@RequestParam String email) {
		System.out.println(email);
		dao.withdrawMemberByEmail(email);
		return "redirect:index.do";
	}
	*/
	
	
	@RequestMapping("getMemberByEmail")
	public ModelAndView getMemberByEmail(@RequestParam String email) {
		Member member = service.selectMemberByEmail(email);
		System.out.println(member);
		return new ModelAndView("member/getMemberByEmail.jsp", "result", member);
		
	}


}






