<%@page import="java.util.List"%>
<%@page import="com.tasty.vo.Member"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page
	import="org.springframework.security.core.context.SecurityContext"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
body{
	background-color:rgb(235,235,235);
}
.leftTile {
	float: left;
	padding-left: 40px;
	width: 40%;
}

.rightTile {
	width: 60%;
	margin-left: 240px;
}
.leftMenuList > div > ul{
	width:100%;
}
.leftMenuList > div > ul > li{
	width:100%;
	height:50px;
	border-bottom:1px #000 solid;
}
.leftMenuList > div > ul > li:hover{
	background-color:rgb(245,245,245);
}
.leftMenuList > div > ul > li > a{
	line-height:50px;
	color:#000;
	text-decoration:none;
	-webkit-transition:1s;
	font-size:15px;
}
.row > div > div{
	border-bottom:1px #000 solid;
	height:60px;
}
.row > div > div > div{
	line-height:60px;
}
</style>
<div class="row"
	style="font-size: 20px; margin-top: 70px; width: 500px; left: 36%; position: relative;">
	<div>
		<div>
			<div>
				<h1>마이페이지</h1>
			</div>
		</div>
		<div>
			<div class="leftTile">사용자 ID</div>
			<div class="rightTile">
				<sec:authentication property="principal.email" />
			</div>
		</div>
		<div>
			<div class="leftTile">이름</div>
			<div class="rightTile">
				<sec:authentication property="principal.name" />
			</div>
		</div>
		<div>
			<div class="leftTile">닉네임</div>
			<div class="rightTile">
				<sec:authentication property="principal.nickname" />
			</div>
		</div>
		<div>
			<div class="leftTile">연락처</div>
			<div class="rightTile">
				<sec:authentication property="principal.phoneNum" />
			</div>
		</div>
		<div>
			<div class="leftTile">성별</div>
			<div class="rightTile">
				<sec:authentication property="principal.gender" />
			</div>
		</div>
		<div>
			<div class="leftTile">선호하는 맛</div>
			<div class="rightTile">
				<%
					List list = ((Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
							.getMemberTasteList();
					pageContext.setAttribute("mtList", list);
				%>
				<c:forEach var='memberTaste' items="${mtList}" varStatus="cnt">
					${memberTaste.taste.tasteName}
					<c:choose>
						<c:when test="${cnt.count == fn:length(mtList)}">
							맛
						</c:when>
						<c:otherwise>
							맛 |
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div class="leftMenuList" style="margin-top: 50px; float: left; width: 250px; position:absolute; left:10%; top:12%;">
	<div>
		<ul>
			<li><a
				href="${initParam.rootPath }/review/getReviewByEmail.do?email=<sec:authentication property="principal.email"/>">내가
					작성한 리뷰 보기</a></li>
			<li><a
				href='${initParam.rootPath}/route/getRouteByEmail.do?email=<sec:authentication property="principal.email"/>'>내가 작성한 루트 보기</a></li>
				
			<li><a
				href='${initParam.rootPath}/mission/getMissionByEmail.do?email=<sec:authentication property="principal.email"/>'>내가 참여중인 미션 보기</a></li>
		
			<li><a href="${initParam.rootPath }/review/getAllTaste3.do">정보수정</a></li>
			<li><a onclick="return confirm('정말 탈퇴하시겠습니까?');"
				href="${initParam.rootPath }/member/withdraw_member.do?email=<sec:authentication property="principal.email"/>">탈퇴</a></li>
		</ul>
	</div>
</div>
