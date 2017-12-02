package com.tasty.security.provider;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.tasty.dao.MemberDAO;
import com.tasty.vo.Authority;
import com.tasty.vo.Member;

@Component
public class MemberAuthenticationProvider implements AuthenticationProvider{

	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	   public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	      //ID 체크
	      String id = authentication.getName();//사용자가 입력한 ID
	      Member member = dao.selectMemberByEmail(id);
	      if(member == null){ //없는 id => 로그인실패
	         throw new UsernameNotFoundException("ID를 확인하세요");
	      }
	      //패스워드 체크
	      String password = (String)authentication.getCredentials();//사용자가 입력한 패스워드.
	      if(!encoder.matches(password, member.getPassword())){//틀린 패스워드
	         throw new BadCredentialsException("패스워드를 확인하세요");
	      }
	  
	      //인증 성공
	      //권한 조회
	      List<Authority> list = dao.selectAuthorityByEmail(id);
	      if(list.size() ==  0){
	         //모든 인증된 사용자는 권한이 있어야 하는 경우는 권한 개수 체크후 권한이 없으면 
	         //  예외 발생시킨다. (권한이 없는 사용자도 있을 경우 생략한다.)
	         throw new UsernameNotFoundException("로그인 권한이 없습니다.");
	      }
	      //SimpleGrantedAuthority - 권한정보를 문자열로 저장.
	      List<SimpleGrantedAuthority> authList = new ArrayList<>();
	      for(Authority au : list){
	         authList.add(new SimpleGrantedAuthority(au.getAuthority()));
	      }
	      
	      //인증한 사용자 정보(Principal), 패스워드, 인증된 사용자의 권한들 을 넣어 Authentication객체 생성해 리턴
	      return new UsernamePasswordAuthenticationToken(member, null, authList);
	   }
	
	   @Override
	   public boolean supports(Class<?> authentication) {
	      return authentication.isAssignableFrom(UsernamePasswordAuthenticationToken.class);
	   }
}
