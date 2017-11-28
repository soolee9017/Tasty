package com.tasty.security.handler;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

/**
 * 스프링 시큐리티에서 인증 실패시 호출되는 Event Handler (AuthenticationProvider에서 인증 도중 실패하면(예외발생||null리턴) 호출)
 * 구현 후 설정파일에 bean으로 등록
 *  http-form 의 authentication-failure-handler-ref 에 등록한다. 
 */

@Component
public class LoginFailHandler implements AuthenticationFailureHandler{
   
   @Override
   //매개변수 3 : 발생한 Exception객체
   public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException ex)
         throws IOException, ServletException {
      String errorMessage = URLEncoder.encode(ex.getMessage(), "UTF-8");
      response.sendRedirect(request.getContextPath()+"/login_form.do?errorMessage="+errorMessage);
   }
   
}













