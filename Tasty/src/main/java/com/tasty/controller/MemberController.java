package com.tasty.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tasty.dao.MemberDAO;
import com.tasty.dao.TasteDAO;
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
	
	//회원 정보 수정
	@RequestMapping("update_member")
	public String updateMemberByEmail(@ModelAttribute Member member, @RequestParam String oldPassword, @RequestParam String email, 
			@RequestParam List<String> tastes, HttpServletRequest request, ModelMap model) throws IllegalStateException, IOException{
		
		
		//로그인 사용자의 정보 조회(password 비교를 위해)
		
		 //SecurityContext 는 인증 후 인증된 사용자의 정보를 저장하는 객체.
		 
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();

		//패스워드 체크
		
		if(!passwordEncoder.matches(oldPassword, ((Member)authentication.getPrincipal()).getPassword())){ //넣은 값, 암호화된 값
			//로그인할 때 session 비슷한 곳에 비밀번호를 저장? 했으므로 그것을 가져다 사용하면 되는? //SecurityContext? //형변환.getUserPassword
			//정보수정 폼으로 이동
			model.addAttribute("errorMessage", "패스워드를 확인하세요");
			return "member/update_profile_form.tiles";
		}
	
		//Business Logic 호출
		service.removeMemberTasteByEmail(member.getEmail());
		member.setPassword(passwordEncoder.encode(member.getPassword())); //패스워드 변경
		
		service.updateMemberByEmail(member);
		
		List<Taste> tasteList = (List<Taste>)tasteService.selectAllTaste();

		List<MemberTaste> mtList = new ArrayList<>();
		
		for(int i=0; i<tastes.size(); i++) {
			for(int j=0; j<tasteList.size(); j++) {
				if(tastes.get(i).equals(tasteList.get(j).getTasteName())) {
					service.addMemberTaste(new MemberTaste(email, tasteList.get(j).getTasteNum()));
					System.out.println(tasteList.get(j).getTasteNum());
					Taste taste = new Taste(j,tasteList.get(j).getTasteName());
					MemberTaste mt = new MemberTaste(email, tasteList.get(j).getTasteNum(),taste);
					service.addMemberTaste(mt);
					mtList.add(mt);
				}
			}
		}
				
		
		
		
		
		member.setMemberTasteList(mtList);
		
		
		//권한(Authority) 변경 또는 추가 시
		List<GrantedAuthority> list = new ArrayList<>(authentication.getAuthorities());
		UsernamePasswordAuthenticationToken newAutentication = 
				new UsernamePasswordAuthenticationToken(member, member.getPassword(), list);
		context.setAuthentication(newAutentication);
		
		return "/member/mypage.tiles";
	}




	//회원 탈퇴 (권한 삭제)
	@RequestMapping("withdraw_member")
	public String removeAuthorityByEmail(@RequestParam String email, HttpSession session){
		System.out.println("어서와");
		service.removeAuthorityByEmail(email);
		service.updateMemberCertByEmail(email);
		System.out.println(email+" : 탈퇴 ㄱ?");
		session.invalidate();
		return "redirect:/main.do";
	}
	
	
	
	
	  @RequestMapping("getMemberPosAndTotal")
	  @ResponseBody
	  public int getPosAndTotal(@RequestParam String email){

		  int total = dao.getTotalsOfMember(email);
		  float pos = dao.getPosPercentage(email);
		  
		  return total;
	  }
	  
	  


}






