<%@page import="java.util.List"%>
<%@page import="com.tasty.vo.Member"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="center-block" style="font-size: 20px; margin-top:70px; width: 800px;">
	<div class="row">
		<div class="col-sm-12">
			<h1>마이페이지</h1>
		</div>
	</div>
	<p style="height:1px; width:800px; background-color:#000;"></p>
	<div class="row">
		<div class="col-sm-6">사용자 ID</div>
		<div class="col-sm-6"><sec:authentication property="principal.email"/></div>
	</div>
	<p style="height:1px; width:800px; background-color:#000;"></p>
	<div class="row">
		<div class="col-sm-6">이름</div>
		<div class="col-sm-6"><sec:authentication property="principal.name"/></div>
	</div>
	<p style="height:1px; width:800px; background-color:#000;"></p>
	<div class="row">
		<div class="col-sm-6">닉네임</div>
		<div class="col-sm-6"><sec:authentication property="principal.nickname"/></div>
	</div>
	<p style="height:1px; width:800px; background-color:#000;"></p>
	<div class="row">
		<div class="col-sm-6">연락처</div>
		<div class="col-sm-6"><sec:authentication property="principal.phoneNum"/></div>
	</div>
	<p style="height:1px; width:800px; background-color:#000;"></p>
	<div class="row">
		<div class="col-sm-6">성별</div>
		<div class="col-sm-6"><sec:authentication property="principal.gender"/></div>
	</div>
	<p style="height:1px; width:800px; background-color:#000;"></p>
	<div class="row">
		<div class="col-sm-6">선호하는 맛</div>
		<div class="col-sm-6">
		<%
			List list = ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getMemberTasteList();
			pageContext.setAttribute("mtList", list);
		%>
		<c:forEach var='memberTaste' items="${mtList}">
				${memberTaste.taste.tasteName}
		</c:forEach> 
		</div>
	</div>
	<p style="height:1px; width:800px; background-color:#000;"></p>
	
	<br><br>

	
	<a href="${initParam.rootPath }/review/getReviewByEmail.do?email=<sec:authentication property="principal.email"/>" class="btn btn-default">내가 작성한 리뷰 보기</a>
	<a href='${initParam.rootPath}/route/getXYByEmail.do?email=<sec:authentication property="principal.email"/>' class="btn btn-default">루트 작성하기</a>
	
	
	<div class="row" style="margin-top:20px">
		<div class="col-sm-12">
			<a href="${initParam.rootPath }/review/getAllTaste3.do" class="btn btn-default">정보수정</a>
			<a href="${initParam.rootPath }/member/withdraw_member.do?email=<sec:authentication property="principal.email"/>" class="btn btn-default">탈퇴</a>
		</div>
	</div>
</div>
