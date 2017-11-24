package com.tasty.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.MemberService;
import com.tasty.vo.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping("registerMember")
	public ModelAndView registerMember(@ModelAttribute Member member, HttpServletRequest request) {
		service.addMember(member);
		return new ModelAndView("member/registerMember.jsp", "email", member.getEmail());
		
	}
	
	@RequestMapping("updateMemberByEmail")
	public ModelAndView updateMemberByEmail(@ModelAttribute Member member, HttpServletRequest request) {
		service.updateMemberByEmail(member);
		return new ModelAndView("member/updateMemberByEmail.jsp", "member", member);
	}
	
	@RequestMapping("removeMemberByEmail")
	public ModelAndView removeMemberByEmail(@RequestParam String email) {
		service.removeMemberByEmail(email);
		return new ModelAndView("member/removeMemberByEmail.jsp", "result", email);
	}
	
	@RequestMapping("getMemberByEmail")
	public ModelAndView getMemberByEmail(@RequestParam String email) {
		Member member = service.selectMemberByEmail(email);
		System.out.println(member);
		return new ModelAndView("member/getMemberByEmail.jsp", "result", member);
		
	}
}