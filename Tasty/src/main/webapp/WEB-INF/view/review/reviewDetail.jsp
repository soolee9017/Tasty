<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.tasty.vo.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
*{
	text-decoration:none;
	list-style:none;
}
.item{
	width:100%;
	height:600px;
}
.slideImg{
	width:100%;
	height:auto;

}
</style>
</head>
<body style=" background-color:#dcdcdc;">

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
	<h2>${requestScope.review.title}</h2>
	<p style="width:100%;height:1px;background-color:#000;position:relative;"></p>
	<h4>작성날짜:<fmt:formatDate value="${requestScope.review.writeDate}" pattern="yyyy-MM-dd"/></h4>

	<p style="width:100%;height:1px;background-color:#000;position:relative;"></p>
	<h3>${requestScope.review.content}</h3>
	<p style="width:100%;height:1px;background-color:#000;position:relative;"></p>
	
	<div style="height:150px; width:100%; overflow-x:auto; ">
	<ul>
	<c:forEach items="${requestScope.review.menuList }" var="menu">
	<li style="float:left;"><h2 style="color:#CD2E57; width:200px;">${menu.menuName }</h2>
	<c:forEach items="${menu.mtList }" var="menuTaste" varStatus="cnt"> 
		<c:choose>
			<c:when test="${menuTaste.allTaste.taste.tasteName eq '완벽한'}">
				<span style="font-size:20px; color:tomato;">${menuTaste.allTaste.taste.tasteName}</span>맛
			</c:when>
			<c:when test="${cnt.count == fn:length(menu.mtList)}">
				<span style="font-size:20px; color:tomato;">${menuTaste.allTaste.taste.tasteName}</span>맛 <span style="font-size:20px;">${menuTaste.allTaste.degree.degree}</span>단계
			</c:when>
			<c:otherwise>
				<span style="font-size:20px; color:tomato;">${menuTaste.allTaste.taste.tasteName}</span>맛 <span style="font-size:20px;">${menuTaste.allTaste.degree.degree}</span> 단계,
			</c:otherwise>
		</c:choose>
		<br>
	</c:forEach></li>
	</c:forEach>
	</ul>
	</div>




<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:100%; height:600px;">
  <!-- Indicators -->
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
 <c:forEach items="${requestScope.review.reviewPhotoList}" var="reviewPhoto" varStatus="indexs">
  	<c:choose>
  		<c:when test="${indexs.index == 0}">
  			<div class="item active">
    		  <img class="slideImg" src="${initParam.rootPath }/photos/review/${reviewPhoto.photoList[0].photoPath}"
			width="300px" height="300px">
   		 	</div>
  		</c:when>
  		<c:otherwise>
  		<div class="item">
  			<img class="slideImg" src="${initParam.rootPath }/photos/review/${reviewPhoto.photoList[0].photoPath}">
  		</div>
  		</c:otherwise>
  	</c:choose>
</c:forEach>
	
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


<sec:authorize access="isAuthenticated()">
	<%
		String email = ((Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getEmail();
		pageContext.setAttribute("email", email);
	%>


	<c:if test="${requestScope.review.email==email}">
		<a
			href="${initParam.rootPath}/review/changeReview.do?reviewNum=${requestScope.review.reviewNum}&fromWhere=${requestScope.fromWhere}"><button class="btn btn-info">내용
				수정</button></a>
				
		<a href="${initParam.rootPath}/review/deleteReview.do?reviewNum=${requestScope.review.reviewNum}">
		<button class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">리뷰 삭제</button></a>		
	</c:if>
</sec:authorize>


<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="${initParam.rootPath}/review/deleteReview.do?reviewNum=${requestScope.review.reviewNum}">
<button onclick="return confirm('정말 삭제하시겠습니까?');">리뷰 삭제</button></a>
</sec:authorize>



<c:choose>
  		<c:when test="${requestScope.fromWhere == 1}">
  			
<a href='${initParam.rootPath }/review/getReviewByEmail.do?email=<sec:authentication property="principal.email"/>'><button>돌아가기</button></a>

  		</c:when>
  		<c:otherwise>
  		<a href="${initParam.rootPath}/review/backToList.do?storeName=${requestScope.review.storeName}&posX=${requestScope.review.posX}&posY=${requestScope.review.posY}">
<button style="margin-top:20px;" class="btn btn-default">돌아가기</button>
</a>
  		
  		</c:otherwise>
  	</c:choose>



<%-- 
<c:if test="${requestScope.fromWhere == 1}">
<br>
<a href='${initParam.rootPath }/review/getReviewByEmail.do?email=<sec:authentication property="principal.email"/>'><button>돌아가기</button></a>
</c:if>
<br>
<c:if test="${requestScope.fromWhere == 0}">
<br>
<a href="${initParam.rootPath}/review/backToList.do?storeName=${requestScope.review.storeName}&posX=${requestScope.review.posX}&posY=${requestScope.review.posY}">
<button style="margin-top:20px;" class="btn btn-default">돌아가기</button>
</a>
</c:if>
--%>
</div>


</body>
</html>