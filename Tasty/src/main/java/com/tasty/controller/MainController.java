package com.tasty.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.MemberService;
import com.tasty.service.TasteService;
import com.tasty.vo.Member;
import com.tasty.vo.MemberTaste;
import com.tasty.vo.Taste;

@Controller
public class MainController {

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
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("join_member")
	public ModelAndView registerMember(@RequestParam String email, @RequestParam String password, @RequestParam String name, @RequestParam String nickname, @RequestParam String phoneNum, @RequestParam String gender) {
		Member member = new Member(email, password, name, nickname, phoneNum, gender);
		System.out.println(member);
		service.addMember(member, "ROLE_MEMBER");
		return new ModelAndView("redirect:join_success.do", "email", member.getEmail());
	}
	
	@RequestMapping("registerMemberTaste")
	public ModelAndView registerMemberTaste(@RequestParam String email, @RequestParam String taste1, @RequestParam String taste2, @RequestParam String taste3) {
		//MemberService memberService = new MemberServiceImpl();
		List<Taste> tasteList = (List<Taste>)tasteService.selectAllTaste();
		
		//List를 한바퀴 돌면서 번호와 비교
		for(int i=0; i<tasteList.size(); i++ ) { 
			if(tasteList.get(i).getTasteName().equals(taste1)) {
				System.out.println(tasteList.get(i).getTasteNum());
				service.addMemberTaste(new MemberTaste(email, tasteList.get(i).getTasteNum()));
				continue;
			}else if(tasteList.get(i).getTasteName().equals(taste2)) {
				System.out.println(tasteList.get(i).getTasteNum());
				service.addMemberTaste(new MemberTaste(email, tasteList.get(i).getTasteNum()));
				continue;
			}else if(tasteList.get(i).getTasteName().equals(taste3)) {
				System.out.println(tasteList.get(i).getTasteNum());
				service.addMemberTaste(new MemberTaste(email, tasteList.get(i).getTasteNum()));
				continue;
			}
		}
		return new ModelAndView("redirect/join_success.do", "tasteList", tasteList);
	}
	
	   @RequestMapping("join_success")
	   public ModelAndView joinSuccess(@RequestParam String email){
	      Member member = service.selectMemberByEmail(email);
	      return new ModelAndView("member/join_success.tiles", "member", member);
	   }
	
	
}
