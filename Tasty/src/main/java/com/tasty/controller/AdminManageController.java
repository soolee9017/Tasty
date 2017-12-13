package com.tasty.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.MemberService;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;

@Controller
@RequestMapping("/admin/")
public class AdminManageController {

	@Autowired
	private MemberService service;

	/**
	 * 관리자를 등록하는 메소드.
	 * 등록 처리후 join_success.do로 redirect방식으로 이동 (MainController) - 요청파라미터로 등록된 userId 전송
	 * @param user
	 * @return
	 */
	@RequestMapping("register_admin")
	public ModelAndView registerAdmin(@ModelAttribute Member member){
		service.addMember(member, "ROLE_ADMIN");
		//redirect 방식이동시 model값은 요청파라미터로 전송된다.
		return new ModelAndView("redirect:/join_success.do", "email", member.getEmail());
	}

	
	//회원 조회 (전체)
	@RequestMapping("get_member_all")
	public ModelAndView getAllMember(HttpServletRequest request) {
		List<Member> list = service.selectAllMember();

		return new ModelAndView("/admin/getAllMember.jsp", "result", list);
	}
	
	//회원 조회 (Email_admin)
	@RequestMapping("get_member_email")
	public ModelAndView getMemberByEmail(HttpServletRequest request, @RequestParam String email) {
		Member member = service.selectMemberByEmail(email);
		List<MemberTaste> mt = service.selectMemberTasteByEmail(email);
		request.setAttribute("tasteList", mt);
		System.out.println(member);
		return new ModelAndView("/admin/get_member_email.jsp", "result", member);
	}
	
	//인증여부
	@RequestMapping("get_memberCert")
	public ModelAndView getMemberByMemberCert(@RequestParam int memberCert, HttpServletRequest request) {
		List<Member> list = service.selectMemberByMemberCert(memberCert);
		System.out.println("나와주라");
		return new ModelAndView("/admin/get_memberCert.jsp", "result", list);
	}
	
	
	//회원 삭제
	@RequestMapping("remove_member")
	public String removeMemberByEmail(@RequestParam String email, HttpServletRequest request) {
		System.out.println("삭제하러 왔니?");
		service.removeMemberByEmail(email);
		System.out.println("삭제할거야? "+email);
		return "redirect:/admin/member_management.do";
	}
	
	/**
	 * 관리자 등록 중복 확인
	 * @param email
	 * @return
	 */
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




