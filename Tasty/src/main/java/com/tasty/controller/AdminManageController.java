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
		return new ModelAndView("redirect:/mypage.do", "email", member.getEmail());
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
//		request.setAttribute("tasteList", mt);
//		System.out.println("왔니?");
//		System.out.println(member);
//		System.out.println(mt);
		return new ModelAndView("/admin/get_member_email.jsp", "result", member);
	}
	
	//인증여부
	@RequestMapping("get_memberCert")
	public ModelAndView getMemberByMemberCert(@RequestParam int memberCert, HttpServletRequest request) {
		List<Member> list = service.selectMemberByMemberCert(memberCert);
		List<MemberTaste> mt = null;
		String email = null;
		for(int i = 0; i<list.size(); i++) {
			email = list.get(i).getEmail();
		}
		mt = service.selectMemberTasteByEmail(email);
		request.setAttribute("tasteList", mt);
		System.out.println("나와주라");
		return new ModelAndView("/admin/get_memberCert.jsp", "result", list);
	}
	
	/*//멤버테이스트두
	@RequestMapping("get_memberTaste_email")
	public List<MemberTaste> getMemberTasteByEmail(@RequestParam String email){
		List<MemberTaste> memberTasteList = service.selectMemberTasteByEmail(email);
		System.out.println("오셨나요?");
		return memberTasteList;
	}
	*/
	//회원 삭제
	@RequestMapping("remove_member")
	public String removeMemberByEmail(@RequestParam String email, HttpServletRequest request) {
		System.out.println("삭제하러 왔니?");
		service.removeAuthorityByEmail(email);
		service.removeMemberByEmail(email);
		if(email == null) {
			String result = String.format("회원이 없습니다.");
			request.setAttribute("result", result);
		}
		System.out.println("삭제할거야?");
		return "redirect:/admin/member_management.do";
	}
	
}




