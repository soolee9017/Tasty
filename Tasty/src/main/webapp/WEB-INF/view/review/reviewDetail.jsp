<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.tasty.vo.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${initParam.rootPath}/resource/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" media="all"
	href="${initParam.rootPath}/resource/bootstrap/css/star-rating.css">
<script type="text/javascript"
	src="${initParam.rootPath}/resource/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${initParam.rootPath}/resource/bootstrap/js/star-rating.js"></script>

</head>
<body>

	<header class="row">
		<tiles:insertAttribute name="headers" ignore="true"/>
	</header>
<div style="margin-top:80px; width:1000px; height:500px; left:17%;position:relative; text-align: center;">
	<h2>${requestScope.review.storeName }</h2>
	<h3>${requestScope.review.address }</h3>
	<br>
	
	
	
	<input id="s" name="rating" readonly="" type="text"
		class="rating rating-loading" value="${requestScope.review.ratings}"
		data-size="sm" title="">
	<h4>제목: ${requestScope.review.title}</h4>
	<p style="width:20%;height:1px;background-color:#000;left:40%;position:relative;"></p>
	<h4>작성날짜: ${requestScope.review.writeDate}</h4>
	<p style="width:20%;height:1px;background-color:#000;left:40%;position:relative;"></p>
	<h4>내용: ${requestScope.review.content}</h4>
	<p style="width:20%;height:1px;background-color:#000;left:40%;position:relative;"></p>
	
	

	<c:forEach items="${requestScope.review.menuList }" var="menu">
	${menu.menuName } : 
	
	<c:forEach items="${menu.mtList }" var="menuTaste">
		${menuTaste.allTaste.taste.tasteName}맛 ${menuTaste.allTaste.degree.degree} 단계,
	</c:forEach>
		<br>
	</c:forEach>
	<p style="width:20%;height:1px;background-color:#000;left:40%;position:relative;"></p>


	<c:forEach items="${requestScope.review.reviewPhotoList}"
		var="reviewPhoto">
		<img
			src="${initParam.rootPath }/photos/review/${reviewPhoto.photoList[0].photoPath}"
			width="300px">

	</c:forEach>
	<p style="width:20%;height:1px;background-color:#000;left:40%;position:relative;"></p>
	<br>
	<br>


<sec:authorize access="isAuthenticated()">
	<%
		String email = ((Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getEmail();
		pageContext.setAttribute("email", email);
	%>


	<c:if test="${requestScope.review.email==email}">
		<a
			href="${initParam.rootPath}/review/changeReview.do?reviewNum=${requestScope.review.reviewNum}"><button>내용
				수정</button></a>
	</c:if>
</sec:authorize>

<a href="${initParam.rootPath}/review/backToList.do?storeName=${requestScope.review.storeName}&posX=${requestScope.review.posX}&posY=${requestScope.review.posY}">
<button>목록으로 돌아가기</button>
</a>
</div>


</body>
</html>