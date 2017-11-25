package com.tasty.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.MemberService;
import com.tasty.service.TasteService;
import com.tasty.service.impl.TasteServiceImpl;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping("registerMember")
	public ModelAndView registerMember(@ModelAttribute Member member) {
		service.addMember(member);
		System.out.println(member);
		return new ModelAndView("member/registerMember.jsp", "email", member.getEmail());
	}
	
	@RequestMapping("registerMemberTaste")
	public ModelAndView registerMemberTaste(@RequestParam String email, @RequestParam String taste1, @RequestParam String taste2, @RequestParam String taste3) {
		TasteService tasteService = new TasteServiceImpl();
		
		List<String> tasteList = tasteService.selectAllTaste();

		for(int i=0; i<tasteList.size(); i++ ) {
			if(tasteList.get(i).equals(taste1)) {
				int tasteNum1 = tasteList.get(i).length();
				service.addMemberTaste(new MemberTaste(email, tasteNum1));
			}else if(tasteList.get(i).equals(taste2)) {
				int tasteNum2 = tasteList.get(i).length();
				service.addMemberTaste(new MemberTaste(email, tasteNum2));
			}else if(tasteList.get(i).equals(taste3)) {
				int tasteNum3 = tasteList.get(i).length();
				service.addMemberTaste(new MemberTaste(email, tasteNum3));
			}
		}
		System.out.println(tasteList);
		return new ModelAndView("member/registerMemberTaste.jsp", "tasteList", tasteList);
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