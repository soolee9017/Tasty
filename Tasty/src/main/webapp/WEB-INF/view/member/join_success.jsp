<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container" style="font-size: 20px;">
   <div class="row">
      <div class="col-sm-12">
         <h2>가입된 정보</h2>
      </div>
   </div>
   <div class="row">
      <div class="col-sm-2">사용자 ID</div>
      <div class="col-sm-10">${requestScope.member.email }</div>
   </div>
   <div class="row test">
      <div class="col-sm-2">이름</div>
      <div class="col-sm-10">${requestScope.member.name}</div>
   </div>
   <div class="row">
      <div class="col-sm-2">닉네임</div>
      <div class="col-sm-10">${requestScope.member.nickname}</div>
   </div>
      <div class="row">
      <div class="col-sm-2">전화번호</div>
      <div class="col-sm-10">${requestScope.member.phoneNum}</div>
   </div>
      <div class="row">
      <div class="col-sm-2">성별</div>
      <div class="col-sm-10">${requestScope.member.gender}</div>
   </div>
      <div class="row">
      <div class="col-sm-2">선호하는 맛</div>
      <div class="col-sm-10">${requestScope.memberTaste.taste.tasteName}</div>
   </div>
</div>