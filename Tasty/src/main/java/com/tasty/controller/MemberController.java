package com.tasty.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.MemberDAO;
import com.tasty.service.MemberService;
import com.tasty.service.TasteService;
import com.tasty.vo.Member;

@Controller
@RequestMapping("/member/")
public class MemberController{
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	MemberService service;
	
	@Autowired
	TasteService tasteService;
	
	
	
	@RequestMapping("updateMemberByEmail")
	public ModelAndView updateMemberByEmail(@ModelAttribute Member member, HttpServletRequest request) {
		service.updateMemberByEmail(member);
		return new ModelAndView("member/updateMemberByEmail.jsp", "member", member);
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






